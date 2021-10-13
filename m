Return-Path: <SRS0=pkbg=PB=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79951C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 12:28:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 60476610C8; Wed, 13 Oct 2021 12:28:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453CA610E7
	for <soc@kernel.org>; Wed, 13 Oct 2021 12:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 453CA610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id u21so7884678lff.8
        for <soc@kernel.org>; Wed, 13 Oct 2021 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YQxIXPosPmgxsSw+KN3L87guIjR+Zb/COJnPCTaxmBs=;
        b=Rifnnp3/msmOFFAH4gZiR/fVd2rDLGv96hGaf9c2Ia/LzmL8p8R2juMSa2fLTURRjq
         1B1/byT90AAiATYiDuE5eQ2O0+ZOX1wsRXw6vulbNWoo/jlaLnsswdT23NGtKwsWFqv/
         2KcybND8Du2UfsllhRI5e5GEc3Pb7a45xVZoCJ154HJocNmYVuyKNeGywwg23GqqV2z9
         U5UWgr0dDYh9/3mhJbaZ8OXkj62HMWpLq1/mxK0CB8tGDnpO5j6P4yjZ/AjKb5ktIgOV
         G5YZdnPY7HMqaIc0M7Xv3A5TtmR+wJueI315eQOJzBRfEn2BLyKsQ961AAbOxX5rdM7g
         X0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YQxIXPosPmgxsSw+KN3L87guIjR+Zb/COJnPCTaxmBs=;
        b=Kf0YxaP4Uw1DKXrmEgB/katPIpoDA6pKEeiKwv5fQ8FVwEwd+RtjJZCro7cTI9MoQU
         fEkPxuuHe7vUr1gVle8gKPwjrOnMFzeu8hkHp4DR2GplW1OQUZKK0L+0/kutHxIXnBE/
         sAXCn1ESdPLaM0ye3jXXim7RP3Ht3hVpiUxXOzfmuIUSY0rhCkLKcz3GHCuIFtVGloS6
         TlqmWceO/4qsoSXDavMnedlkm2MyLg5Qs8UqS8iJ3NZfw/Zc71lO2KTh4LoGmKWeSrEc
         1s3XjElFwuSAYwS+2oiu0hNYDPpYSDMql+XQAYBlEbT0nwdPL9u8DYCOsc+o9v/TZNIg
         XFfw==
X-Gm-Message-State: AOAM532DPG/y/rhBw2LY6r586ai5rZKbXPFMjdtqXYByDHOivbK0IWHP
	GwHmvnEyAASxnZ246TJxKen5MlR2/zp2Pw==
X-Google-Smtp-Source: ABdhPJy3d9acfipfn6BL8sZ9BbGREmBgKOtPq+gewmCh9iMMxd2GpJWrn4fMfwdkZAQ+9h/hkeVUOQ==
X-Received: by 2002:a19:7516:: with SMTP id y22mr11435277lfe.197.1634128136481;
        Wed, 13 Oct 2021 05:28:56 -0700 (PDT)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e14sm1317545lfs.287.2021.10.13.05.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 05:28:56 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:28:54 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [GIT PULL] another OP-TEE fix for v5.15
Message-ID: <20211013122854.GA1542549@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this OP-TEE driver fix to unregister OP-TEE client devices
from the TEE bus when the OP-TEE driver is unloaded.

Note that this is based on the previous already merged OP-TEE driver
fix.

Thanks,
Jens

The following changes since commit 88a3856c0a8c03188db7913f4d49379432fe1f93:

  tee/optee/shm_pool: fix application of sizeof to pointer (2021-09-14 07:54:56 +0200)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix2-for-v5.15

for you to fetch changes up to 7f565d0ead264329749c0da488de9c8dfa2f18ce:

  tee: optee: Fix missing devices unregister during optee_remove (2021-10-12 13:24:39 +0200)

----------------------------------------------------------------
Fix missing devices unregister during optee_remove

Unregisters OP-TEE client devices (UUIDs of some known Trusted
Applications) from the TEE bus when the OP-TEE driver is unloaded.

----------------------------------------------------------------
Sumit Garg (1):
      tee: optee: Fix missing devices unregister during optee_remove

 drivers/tee/optee/core.c          |  3 +++
 drivers/tee/optee/device.c        | 22 ++++++++++++++++++++++
 drivers/tee/optee/optee_private.h |  1 +
 3 files changed, 26 insertions(+)
