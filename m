Return-Path: <SRS0=xJnX=KA=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE8AC433B4
	for <soc@archiver.kernel.org>; Wed,  5 May 2021 11:08:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE70C613D6; Wed,  5 May 2021 11:08:53 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACFC6613C3
	for <soc@kernel.org>; Wed,  5 May 2021 11:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACFC6613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lf1-f47.google.com with SMTP id j10so1945273lfb.12
        for <soc@kernel.org>; Wed, 05 May 2021 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=G5vc6WFcuA4Ved0s3f7uwaDCkdixE7ycKFQEB/WCSC4=;
        b=Cci3Sa0VqW6/hPfN1FJvFUfq7mP3GN3WqAc313s02iQLWFHDceYE83Mgo/6wGm/MAR
         8alY6SlTFMrJHrzHXUbvNtrHZY4Xn2787DMlWsypRItb4sBZG9I0TQkS7WBOiEBaAMtn
         Bp4MmV1sXTm8crDATtE6zXTPi42mIwFFzfdetBUDc+7917zwsvPv/xwrcxYhpWTScO3l
         5DlaZJSaMjo2gxmVYulYa8Xi7r4W0E3zBi9KWK/5rKCnKplZEwW0nCA/mML4x5XhloSY
         GEyiCi3O2iK4lajuim4tKVm+silaKKRo9Os6wpjHegw6yV5L4FThxps+Bb1Owlsb6zII
         6I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=G5vc6WFcuA4Ved0s3f7uwaDCkdixE7ycKFQEB/WCSC4=;
        b=BUOvY1FSO1x/fUiw68zOaHY/dRicmu4ZRcboTnfdZ2P4PyZ1FI8H2FUWMCSX1Mmwp/
         NkYftdPZ+zO7wo3qk/Mrhjd801MR2oa8YX9ESZBG/XW6QGMWFZq5NdNtFhrqEIxvEmpo
         9XBTLChHgq/pqX439PK8mijmpStNm6pcIs7yCuUL7P78YUmQLmz/PS3klk61aXrsg3/6
         OlST7xRNC0zmDEq4EkydTnTwUlfYh8Wo7Fy6CKkQgFqFTVQs3EAXN/hARAULmX31LzOC
         Qgf7v908iGMNkA4oqWTpR+GrSZLNJKWERMAf07AgvDdvpqxFI7ILDxkdYyuMOOfv7k9v
         TurA==
X-Gm-Message-State: AOAM532v9BVjBHFMOb+dETyFOY/u/hJYkrT6qlNdlrZ2gp/D2DgpnuUf
	ld2mCVvJZpvnSVcyu41VTDutyA==
X-Google-Smtp-Source: ABdhPJzZ0u06G2GPbeSnqfz+Akzps6QZxvjdetUSSSdcBG0Ab+DLj5ImBZLje+dgx3KC9QqXvcUGwg==
X-Received: by 2002:a19:c17:: with SMTP id 23mr20632058lfm.602.1620212931893;
        Wed, 05 May 2021 04:08:51 -0700 (PDT)
Received: from jade (h-85-3.A175.priv.bahnhof.se. [79.136.85.3])
        by smtp.gmail.com with ESMTPSA id a20sm1973943ljd.105.2021.05.05.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 04:08:51 -0700 (PDT)
Date: Wed, 5 May 2021 13:08:50 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Rijo Thomas <Rijo-john.Thomas@amd.com>
Subject: [GIT PULL] AMD-TEE fix for v5.13
Message-ID: <20210505110850.GA3434209@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this AMDTEE driver fix which adds reference counting to
loaded TAs which is needed for proper life cycle management of TAs.

Note that this isn't a usual Arm driver update. This targets AMD instead,
but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit 9f4ad9e425a1d3b6a34617b8ea226d56a119a717:

  Linux 5.12 (2021-04-25 13:49:08 -0700)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/amdtee-fixes-for-v5.13

for you to fetch changes up to 9f015b3765bf593b3ed5d3b588e409dc0ffa9f85:

  tee: amdtee: unload TA only when its refcount becomes 0 (2021-05-05 13:00:11 +0200)

----------------------------------------------------------------
AMD-TEE reference count loaded TAs

----------------------------------------------------------------
Rijo Thomas (1):
      tee: amdtee: unload TA only when its refcount becomes 0

 drivers/tee/amdtee/amdtee_private.h | 13 +++++
 drivers/tee/amdtee/call.c           | 94 +++++++++++++++++++++++++++++++++----
 drivers/tee/amdtee/core.c           | 15 +++---
 3 files changed, 106 insertions(+), 16 deletions(-)
