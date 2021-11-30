Return-Path: <SRS0=b0lh=QR=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C66BC433F5
	for <soc@archiver.kernel.org>; Tue, 30 Nov 2021 07:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40B7CC53FC7; Tue, 30 Nov 2021 07:03:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 953B6C53FC1
	for <soc@kernel.org>; Tue, 30 Nov 2021 07:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 953B6C53FC1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id p8so25733529ljo.5
        for <soc@kernel.org>; Mon, 29 Nov 2021 23:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=szhL5QTmS2bN5B3PECUs+b+yXZvUR0mps5IDDhm4xs0=;
        b=rmRO2GBGwGWqJc2t/xlmcDeT314JfFtgEqSSS/MxMRT1FLq1E8nMMUB4sXxT5UluCC
         AUaENTk9kBFgb+i5ihy2XZZ2UgCQWb2I0BA4U+Wg4WlSkBPrViWibRx9xz9fVeueKHbk
         cqD9S37qSboUk5WQfB2Co47e5G9q0hY4nlfRubmXOsm6TSuCHfl/IQ5U9Yir43RbOjdU
         Vpyh3YKtEbXVz74ymcbBFSYffCDHezaTp6iq87qb/Z49jO14BgDS9p93P1TziDOG47CR
         HDCNSAkqJxbd4i+6jjHI2H4NwDbU3uw6LzHkEkImAoxWqjQIaUaiM6BO/tmD7JTgxJqh
         EQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=szhL5QTmS2bN5B3PECUs+b+yXZvUR0mps5IDDhm4xs0=;
        b=vSID6G2+biiHriQ8vN9a/8Bs4KWea6MOzcCT50d6tlEx2apyEKbeP3/RuH5QqwvZgT
         w+mshI2mcSa8yM8vwhSkA+Vsb2fvfPCz9fQmblgzBkF9FDkz7ts/nSNwLsVsfrrqMIiW
         EvRHQcjNXhdMHQ8NfdQGGpJK48nTT6wySyDXuQUAk+ECh28nPQu9zDMZBX/AXo3j1wnC
         glasGImP2WZRyNfz5yfltOEafRXzNhbJalu332MsSJXedbLjWz7XdfK5sQCOj1E/y37j
         apzvndQJ/whN34BmTZFF76PRLm21/aAqyh4Oi8xgFmyO89wmpWrQIVqkgBH9Eu1TFY8n
         rEzg==
X-Gm-Message-State: AOAM530P0WiDwhYCAj6b9YeL0wGSjzfptLBZCJimacBepf+cf5WcEsaS
	ZepPtN98G2v/05kGY8k4LTu2Rg==
X-Google-Smtp-Source: ABdhPJzfiq1GEnhN+ppW5GH1nCQCECE1ASmCX4M4QJp/08lycIuUonrIkxeVqWNwlPZaBOiYq17sSA==
X-Received: by 2002:a05:651c:c3:: with SMTP id 3mr52346139ljr.170.1638255833674;
        Mon, 29 Nov 2021 23:03:53 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e6sm1615747lfn.172.2021.11.29.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 23:03:53 -0800 (PST)
Date: Tue, 30 Nov 2021 08:03:51 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Rijo Thomas <Rijo-john.Thomas@amd.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [GIT PULL] AMD-TEE fix for v5.16
Message-ID: <20211130070351.GA2308099@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this AMDTEE driver fix which takes care of a bug where
IS_ERR() was used instead of a NULL check for the return value from
__get_free_pages().

Note that this isn't a usual Arm driver update. This targets AMD instead,
but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/amdtee-fix-for-v5.16

for you to fetch changes up to 9d7482771fac8d8e38e763263f2ca0ca12dd22c6:

  tee: amdtee: fix an IS_ERR() vs NULL bug (2021-11-29 09:55:49 +0100)

----------------------------------------------------------------
AMD-TEE fix IS_ERR() bug

----------------------------------------------------------------
Dan Carpenter (1):
      tee: amdtee: fix an IS_ERR() vs NULL bug

 drivers/tee/amdtee/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
