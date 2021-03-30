Return-Path: <SRS0=skuN=I4=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3B8C433C1
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 11:00:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2A1436196C; Tue, 30 Mar 2021 11:00:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A917061928
	for <soc@kernel.org>; Tue, 30 Mar 2021 11:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A917061928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lf1-f48.google.com with SMTP id w28so2162343lfn.2
        for <soc@kernel.org>; Tue, 30 Mar 2021 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0APZS7qW26TQ2G+AjsqWhc2vH9zR/hdxgKlxQBPo6jY=;
        b=i2knyJ1sOyCrZOtRxP2K/kzwfl6hxexD9Rgft0GYDLtQQutWd5WSAfzSWkjSA6ynsb
         wxxEQ+lZtRH70LuUs8tWdz+WJRK4dZdQaey9OlXNMY1Eli0Ybq0tyfuXo4SpxDv0OQHB
         hQoEwmisCyJeEvffAZPnX2REsyje4r4D55QmZSpSX8w08Cf9qdGmsjMWWTj3YapnU6VJ
         0jryFctoc2KLsDvoClWWgRa+4jGf4vDsTVZzpQ19PgEObPyd3/d4//osE+L47O/fs5xt
         3qg6GZ4jxGNsZrPE7zW01VJAFlw8jbiaKsdVjwXuVC1LpKM6e8IHG17GH1Ak8QkRVBIC
         xVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0APZS7qW26TQ2G+AjsqWhc2vH9zR/hdxgKlxQBPo6jY=;
        b=k5SOC0dbhsgQuPW//B8gThWEnIp0WMw2aMazEJjPplUUk+nYVi3erBfrbKyfnHdB30
         PyppU2FcqOB2WWWHkzG4sGDGPu3B6h78mlAAttpLH0hYhi7s1MaP5XUgiHoTajRtfOcP
         JIJJrSkNBEi6S0fV589sOEBPDEydc++9L3jJdk4KdnxnUq/RZxlK2P+HvcLW7S9t2o5C
         9EndAv7W5mRyOy73kzF7wSI+HtToluGPtLST2dGcLycrbeTebWzSZpDgcEwVKJ7SnhqB
         SxUFy8FnDfYI9unhM/6uZm8jF3F/ai/Ah2EBBuYvyp7oUUBoNIAnH2yLf14xgqCEXrTm
         QiHA==
X-Gm-Message-State: AOAM530/i7BSQXlxBJ0YQT3ROkIg53Xq3JyfowoO+VaKPEjP7hoaduQg
	ptrlTIyn+K1gFsoU3yaRSsxPOoG0fulBDgOd
X-Google-Smtp-Source: ABdhPJzgc2H73wOp9fwexyN8u+OrDRs+gsXXnZr5n49qEctr+PRLJjclKcSQoNWMtMy0TGrk3YOglg==
X-Received: by 2002:ac2:4ac4:: with SMTP id m4mr18924716lfp.404.1617102042945;
        Tue, 30 Mar 2021 04:00:42 -0700 (PDT)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id h4sm1324240lfv.22.2021.03.30.04.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:00:39 -0700 (PDT)
Date: Tue, 30 Mar 2021 13:00:37 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jerome Forissier <jerome@forissier.org>
Subject: [GIT PULL] OP-TEE memref size check for v5.13
Message-ID: <20210330110037.GA1166563@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch for the OP-TEE driver to remove the invalid
size check of outgoing memref parameters. This code path is only
activated for a certain configuration of OP-TEE in secure world
(CFG_CORE_DYN_SHM=n) so this problem isn't always visible.

Thanks,
Jens

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-memref-size-for-v5.13

for you to fetch changes up to c650b8dc7a7910eb25af0aac1720f778b29e679d:

  tee: optee: do not check memref size on return from Secure World (2021-03-30 10:44:50 +0200)

----------------------------------------------------------------
OP-TEE skip check of returned memref size

----------------------------------------------------------------
Jerome Forissier (1):
      tee: optee: do not check memref size on return from Secure World

 drivers/tee/optee/core.c | 10 ----------
 1 file changed, 10 deletions(-)
