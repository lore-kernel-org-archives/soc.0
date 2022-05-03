Return-Path: <SRS0=1zmO=VL=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC040C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 19:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1EDAC385B1; Tue,  3 May 2022 19:24:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7B76C385A4
	for <soc@kernel.org>; Tue,  3 May 2022 19:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7B76C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id bq30so31990155lfb.3
        for <soc@kernel.org>; Tue, 03 May 2022 12:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=vrL7XkKPM/fDDKM+WseGESNouqMD+FfUqKoaeNFxXOw=;
        b=Dp00YkgtaZu2WUEsLn/6bjt0WcQ9OyI9QSdv+2xdpO/KTEwya/GCDunJZX662Pm5WU
         R574B4lcT84ubJnuEb9dPM6n31Q0E2vDF7/nQNLYRvjw7Y9WFAEoXwHkJvA+wHGMSIrb
         X6m3wiXAZpV/d952SBywOU3RQwy8h0D0jOFzEJyK3mThWTg+E6Zzg6QpuMMRiMGpp+4c
         X+s+PiquhHvBPL18zv2JdIDPgOMAUV+fhOu0cTm+Avlp4jjKInIItRIJX668vh7iMO8D
         MrPqYnqZ7zfAtZCOllx+qZbMGVpbOV/V196EVmqiGZmKhMrnp6dayk9Eup7Ec3HWUV/4
         wQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=vrL7XkKPM/fDDKM+WseGESNouqMD+FfUqKoaeNFxXOw=;
        b=5cnWk/3cSCF/QFWrtDzq0Q9+EG3HtUaYXXt5mVYPFX+nNojloCyI3cyx6T12NCplYX
         rk2C3ItQZmVba83VPdjRRUtoIHZitG7aPJfSwrC11ZAddXsWsoGBix9IWESolR+LjrnL
         FdkirwQU9zsxe+bgvJ8Evsy/9/vAAENAZUvef9ZbhsKYB7PUMblLfg4opFTN6uOeiukM
         qmttBaPWm6/rNaMU7HYN70UmPAgq5JM03CdaztHEc85IHkqqSgGhu9lPO374uhZhJNE2
         DjRUp/V3BOJlOLzxUrOtKP0SdUwr1675gRmLI5ikNhntxbWvHt++IQeE8gE+/kRyzgwJ
         rcDA==
X-Gm-Message-State: AOAM533LQC3BfYCFdfdyV/r18RpvzEjNZ0h531OipAGGbYq0IJK9DPsM
	kzMBRsLbtbkYpWHY6Y36xikeX7hfdkXFBg==
X-Google-Smtp-Source: ABdhPJzl+SP+Qq6Vb84FcavGx4G1zqVZXoM0Gq0gRozZpj1lLnjxirqsQYmykGZ2bQGH1qveAwR5cw==
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id bt39-20020a056512262700b0044af55cded9mr12527806lfb.373.1651605860854;
        Tue, 03 May 2022 12:24:20 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id t23-20020ac243b7000000b0047255d211cfsm1014656lfl.254.2022.05.03.12.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 12:24:20 -0700 (PDT)
Date: Tue, 3 May 2022 21:24:18 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] TEE SHM vmalloc for v5.19
Message-ID: <20220503192418.GA3285658@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch which enables tee_shm_register_kernel_buf() to
accept vmalloc()ed buffers.

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-shm-vmalloc-for-v5.19

for you to fetch changes up to 3e47235eaee09488c7e467b9aaccb7c93c862c6b:

  tee: make tee_shm_register_kernel_buf vmalloc supported (2022-04-05 08:04:16 +0200)

----------------------------------------------------------------
TEE accept vmalloc()ed buffers for tee_shm_register_kernel_buf()

----------------------------------------------------------------
Phil Chang (1):
      tee: make tee_shm_register_kernel_buf vmalloc supported

 drivers/tee/optee/call.c |  2 +-
 drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 11 deletions(-)
