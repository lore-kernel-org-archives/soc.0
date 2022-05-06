Return-Path: <SRS0=JNw5=VO=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32795C433FE
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 07:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E582EC385B1; Fri,  6 May 2022 07:03:33 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31E04C385AA
	for <soc@kernel.org>; Fri,  6 May 2022 07:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31E04C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id m23so8200540ljb.8
        for <soc@kernel.org>; Fri, 06 May 2022 00:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=HgHALsyDDul+mc+1DSzMYml4J86Z9SHNWaoFWG5JUw8=;
        b=pCPde4mTdjwSTR8g1zQ4ksFClzTrlYZt7XTkR4bRFZM644CK08GuCtBjolZqqtxGKO
         Q4vYjkuM0GsP7TWXdkKKgbGziS8V8dNZ3KVNpdETSePgZsYIIW1EmLDENZtZc+IYL3HQ
         p5fVlyRK2rwtTFpt5me25KVbOdUH+xTVdOPIB8gH6cmWGnL4tgBc/POeAHlxG1BRvVHm
         C+I1IcAcUzTtcKqwznJNyFvimheXp2ECR4T6AsMW828Za3Y6/fK1A4Yzknm3rNRy/HmJ
         F/NPQzou+k2ZdWTK5BJ7ZssS0BrgupEb6w6cbHLo07DRH0Tg+gtqIM+WaU6Si1r+86iS
         PT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HgHALsyDDul+mc+1DSzMYml4J86Z9SHNWaoFWG5JUw8=;
        b=zVUwOu4pc9ToUv1q/r3PRpvqj+MvR+cC7r2H+J1929E9ORVNEICACjI2lRqmoy8B9M
         ooRIGMxXw/EL83V8CaclfPqwWI9g33s2QDZqekPJyJZTvryylTq0O8dBybIB2NUZ5JfC
         hJvQJlMrrjzNRVtn8HBahkggGAu3nuy3hUd71g1GJjq1gKTKlgMxCLOTUF4JJlrJzML3
         tCppweF4G937h4fx8s9qoySjJ8sW/8IxmLSDrWQ8DHgeGDuFnPfaSEQ7E+bXgMv9NsQM
         cppzwdc6ThMtVM97uRQu7mYfyw6b66Hx/DM9ZP8PL8Lx2/ZoSxWplug+o9wAzWG4OlXA
         I4nA==
X-Gm-Message-State: AOAM530Phf3kZn1CTNMGkG52NT30I7d282uPyVwFATZNnJUFxBL9BLaC
	uCrawqvmpkKcl2pOysfhHV8fS6uagOIx+w==
X-Google-Smtp-Source: ABdhPJznUTr5ulzv3av1M+Wo2Zqt4M8NBLFPNb7kWBPw7T1LHaYWJFyPAFDg9gC5MayiDt0O4yFFjA==
X-Received: by 2002:a2e:b8c3:0:b0:250:6889:6782 with SMTP id s3-20020a2eb8c3000000b0025068896782mr1173664ljp.531.1651820611192;
        Fri, 06 May 2022 00:03:31 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id o13-20020a056512050d00b0047255d211ffsm12960lfb.302.2022.05.06.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 00:03:30 -0700 (PDT)
Date: Fri, 6 May 2022 09:03:28 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE Cleanup for v5.19
Message-ID: <20220506070328.GA1344495@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these small cleanup patches which removes two unused and
outdated TEE_IOCTL_SHM_* flags and two unused pa2va and va2pa functions for
tee_shm's. 

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-cleanup-for-v5.19

for you to fetch changes up to d8fc1c7c4c9b705ce5f5bba772ad66a0137c685d:

  tee: remove flags TEE_IOCTL_SHM_MAPPED and TEE_IOCTL_SHM_DMA_BUF (2022-04-26 10:17:03 +0200)

----------------------------------------------------------------
TEE cleanup

Removes the old and unused TEE_IOCTL_SHM_* flags
Removes unused the unused tee_shm_va2pa() and tee_shm_pa2va() functions

----------------------------------------------------------------
Andrew Davis (2):
      tee: remove tee_shm_va2pa() and tee_shm_pa2va()
      tee: remove flags TEE_IOCTL_SHM_MAPPED and TEE_IOCTL_SHM_DMA_BUF

 drivers/tee/tee_core.c   |  2 --
 drivers/tee/tee_shm.c    | 50 ------------------------------------------------
 include/linux/tee_drv.h  | 18 -----------------
 include/uapi/linux/tee.h |  4 ----
 4 files changed, 74 deletions(-)
