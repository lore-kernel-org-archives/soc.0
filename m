Return-Path: <SRS0=Ze+4=SK=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A211C28CF5
	for <soc@archiver.kernel.org>; Wed, 26 Jan 2022 10:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED5BEC340EB; Wed, 26 Jan 2022 10:26:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AC55C340E3
	for <soc@kernel.org>; Wed, 26 Jan 2022 10:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AC55C340E3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id z4so6949947lft.3
        for <soc@kernel.org>; Wed, 26 Jan 2022 02:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HEgFNH76xYMaSR7A2MkkbqWMIl28k6seEq+TKkML2sM=;
        b=dxA+Dkm3fOcJkppAUExYCXbixzx+RAlZ4Y2LD+IeBPxNVHLmtMRgUqpWEL4Ol2Wsr2
         NHYq7LqeUhJXDPbDOaSPyh4zyvZA5Qd0M9SKlH377it32Yt9QGVgOxwTMybwMztvlFs0
         kQd4FMYgI2GIBVnQSgiKTHOnRHLy4FSH3g3FQ8oVMuHln/+ZeqbgDgxCsthz+vdXwsGW
         q3tIh9ceODLSnO6rizEJjBp/ukBtZgw+ujtbIl2osJBYJtw3YnPJ7q7Tuv9dkepDJvjk
         58aeZwvmnRJVPKSFVyl/Q9nY4z8l3DfVQddse4alXZwXE62s0ds6q/GSyfKNE99FJbA/
         BErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HEgFNH76xYMaSR7A2MkkbqWMIl28k6seEq+TKkML2sM=;
        b=M4OeHiwNhDzvbRZssXNogB4SjFUpo/NwYcHOGPOr2cV4831MJpvXJal5Z8OmE83xCn
         9L2DS4ERijDLn8Gto+SG4cl18TFCM3htvy2gr4KY7prSn1CNVXXWVi6x1AS/4e7T6Bgx
         QhLiyHc9qzaUms+sJYWx762TAOVcYLzwTtcMgB5AE04emvLC2Ypp86gjatT3m3SikdVI
         GV18LD2H8Xtr+VRcXc8K0L6KmPuLGr1fh5vlKioUqLUTI+TOFObcC8IReMH2gw9p1bPQ
         U0ghjKQdMYoeLNIHDjqxunPh2Hn6m5TzKoAVbQFQ2kUFjBswth9IADVN14QEN4lK/eAm
         gA5A==
X-Gm-Message-State: AOAM5329sp/D3zW1jC/JenY+DbeHLtbsFb/e4gm+toyEPv7CjbGy/kz9
	lwWUYxuas4tccr2wSOQXAQyHtg==
X-Google-Smtp-Source: ABdhPJyY4ILa/Qs8mLAGnK2T49f1WoeCEw5LbgiiByVoD1jJvbR2HbWoxDajXqLAOKdwqjyeziHGFQ==
X-Received: by 2002:a05:6512:a84:: with SMTP id m4mr9601532lfu.146.1643192771289;
        Wed, 26 Jan 2022 02:26:11 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id d14sm1782516lfv.253.2022.01.26.02.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 02:26:10 -0800 (PST)
Date: Wed, 26 Jan 2022 11:26:09 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fixes for v5.17
Message-ID: <20220126102609.GA1516258@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these OP-TEE driver fixes all concerning the recent changes
regarding FF-A and asynchronous notifications.

Thanks,
Jens
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fixes-for-v5.17

for you to fetch changes up to 4064c461148ab129dfe5eaeea129b4af6cf4b9b7:

  optee: add error checks in optee_ffa_do_call_with_arg() (2022-01-24 13:00:59 +0100)

----------------------------------------------------------------
OP-TE fixes for v5.17

- Adds error checking in optee_ffa_do_call_with_arg()
- Reintroduces an accidentally lost fix for a memref size check
- Uses bitmap_free() to free memory obtained with bitmap_zalloc()

----------------------------------------------------------------
Christophe JAILLET (1):
      optee: Use bitmap_free() to free bitmap

Jens Wiklander (1):
      optee: add error checks in optee_ffa_do_call_with_arg()

Jerome Forissier (1):
      tee: optee: do not check memref size on return from Secure World

 drivers/tee/optee/ffa_abi.c | 15 ++++++++++++---
 drivers/tee/optee/notif.c   |  2 +-
 drivers/tee/optee/smc_abi.c | 10 ----------
 3 files changed, 13 insertions(+), 14 deletions(-)
