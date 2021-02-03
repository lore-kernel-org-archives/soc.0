Return-Path: <SRS0=0kbu=HF=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD879C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7ABB264F7C; Wed,  3 Feb 2021 12:07:47 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFEF664F77
	for <soc@kernel.org>; Wed,  3 Feb 2021 12:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFEF664F77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lj1-f182.google.com with SMTP id e18so27952677lja.12
        for <soc@kernel.org>; Wed, 03 Feb 2021 04:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=k8SC04zhe46BAeBAdwY60XqdkZ6XgYx/7aKDZO/PFl4=;
        b=BoPzZRF8SSfs4Z15ztBzd67Z5x2sMZh/mMzxYrbAuuNWUs+PvrkTRdIsKdv0OlRjS1
         qeH6/xocFPc1rFA8y/CNRWEMgyYVevIdljOfeYq1z2WWlMW261yqalpDfSrpdaCXNFZ7
         v2QOQVlvPextTTRC/8HGF9jeokPn/VchzkagwkSV7xRdtKk6Ggpu6htu2o3q9UAb/iHP
         GPE1BfmWJMcLzdTyugZXYJLHpAShPAH0kkqU+TNeZRGMK0UNN37oycr4PERkS1o+cC4S
         xhWcNqhYMSlHRkYt4/mm0AsWP4z6Muh754tNKNecyNeQrqd1r2WzFS5D9CyHXz5CIDkH
         Sdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=k8SC04zhe46BAeBAdwY60XqdkZ6XgYx/7aKDZO/PFl4=;
        b=gZolKrCLwRrgaf211kGvPuFliw+Lc7/NWvF0NkttavUZPvos5DUTMmso2mtgFWxLkW
         J6uhhClvBIewB4cMlOD5WNHIGvwkIZbI2VnT4Yl0cmog3O64mvnmBB+cEjj7efJ5OwgQ
         8xPbRwEl6DuvrSuu/dDJOnsmL69ZF8oVM7NXd6tnAuFq1ILRl0PQr7C2nU++hAkbWr/Y
         ce52G3o+Pp562ulDD/UMJGeU7nn9juwjiNakVZR13WrjObPzWz19hr+OZx3TOEEWndxw
         ALI4gSPJbM9aSBdsGMrT4bzejhKOMnS3zLC7C2jexLxL45aGmT4bug0iZ+6BjL6ViiPd
         4M5w==
X-Gm-Message-State: AOAM532e9z9ikS0HKkEF0BLQRIPb7qS5OFB0+LL6STHOwSl0h4AF9QJh
	Moy9K0NpZAK125zvWuRYD/Oumw==
X-Google-Smtp-Source: ABdhPJwIlOOYtdIyE88BPsfaFbyDb4ITgksGHQng78HRe9TYrxbQ8xRnRodUUqlHuLT2fzTkh2C8uA==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr1601390ljh.403.1612354065230;
        Wed, 03 Feb 2021 04:07:45 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id u12sm223794lff.250.2021.02.03.04.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 04:07:44 -0800 (PST)
Date: Wed, 3 Feb 2021 13:07:42 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Elvira Khabirova <e.khabirova@omprussia.ru>
Subject: [GIT PULL] TEE housekeeping for v5.12
Message-ID: <20210203120742.GA3624453@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches fixing some comment typos and also a larger
patch syncing some internal OP-TEE driver headers with OP-TEE OS.

Thanks,
Jens

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.linaro.org:/people/jens.wiklander/linux-tee.git tags/tee-housekeeping-for-v5.12

for you to fetch changes up to 617d8e8b347edcee6da38df0aeb671fc9c9ba19c:

  optee: sync OP-TEE headers (2021-02-02 14:50:41 +0100)

----------------------------------------------------------------
TEE subsystem housekeeping

- Fixes some comment typos in header files
- Updates to use flexible-array member instead of zero-length array
- Syncs internal OP-TEE headers with the ones from OP-TEE OS

----------------------------------------------------------------
Bjorn Helgaas (1):
      tee: optee: fix 'physical' typos

Elvira Khabirova (1):
      tee: fix some comment typos in header files

Jens Wiklander (1):
      optee: sync OP-TEE headers

Tian Tao (1):
      drivers: optee: use flexible-array member instead of zero-length array

 drivers/tee/optee/optee_msg.h     | 158 +++-----------------------------------
 drivers/tee/optee/optee_rpc_cmd.h | 103 +++++++++++++++++++++++++
 drivers/tee/optee/optee_smc.h     |  72 +++++++++++------
 drivers/tee/optee/rpc.c           |  39 +++++-----
 include/linux/tee_drv.h           |   2 +-
 include/uapi/linux/tee.h          |   2 +-
 6 files changed, 183 insertions(+), 193 deletions(-)
 create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
