Return-Path: <SRS0=wi9A=35=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4509AC4332F
	for <soc@archiver.kernel.org>; Tue, 29 Nov 2022 19:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D8ADC433C1; Tue, 29 Nov 2022 19:18:06 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49CDEC433D7;
	Tue, 29 Nov 2022 19:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49CDEC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id c14so6439953qvq.0;
        Tue, 29 Nov 2022 11:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/RMkG9rKTHxZ0H7E69DH9MKjm5NgMF9CTX2M/+e50g=;
        b=qRzcDjoS1dfnFPyEun3UPyRlj0QePUE2UbtOenL2tcvECfCWS73bJQtHrXxiAkaX86
         228Atrbpr7Wf9U8/bjSl4ihB5p3UNuvJcclLX3VCwKtb9rlHeyiX3VgvzAebQ//PFBHX
         PasXkyvviX8yqe4zgEvUbddFuzknL3jt8zpvYyjiMobolHFJRgUKC2VRPpmJN7ZsJdzz
         cq50aQqmsRsDE35imwLLi2M+jTKDu0uQy8QGq7Qn6Q/vvqFZkJlWXBlzciKiRf/Awwu7
         YqKA/g0f2gG8B9JfWmKGK+nPIBj+jYX2dWgdxiOhmXXKtmAPbH7tVuEZZL7haQdR4uyY
         kYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/RMkG9rKTHxZ0H7E69DH9MKjm5NgMF9CTX2M/+e50g=;
        b=EAFTbl8KGw4gOtwE5mKSsRlKL5GfAaZpOXcfdq2TRrluLHWYKTLSMDXGMslJMGrpSJ
         XcKLw7e7v6CUYTrDEBXh86nTVStIG1VLbJRBfW2mOpraGdN3dMldqIh64c9FpC4pqyLL
         s5M8w9ewzm2izUhNFKJ2Cb7yOwBgWDo5ltQdWOzndH5Yv2+pecU+lX0at7MnllDWp7O7
         ObhHYeF925wrWzuIM+6HPYUWBgR9BOlDp8QpMzuZROB4bPiJ9D1fOmApTzKrXNLk8ZxV
         gRzizc8VsviY4FtleS5ceVcBxnS+25NRmHpEJZADwP8rkpsGGvjCvuicCy8BQr47vsqo
         d4ww==
X-Gm-Message-State: ANoB5plVYzEmBkkwglNubuTAxKaIDVFiK5sLYGUmDHwcaPTU5ljNRtFU
	UGvvZug+mxsXrhCBAAFAg7Rfgxblr5Y=
X-Google-Smtp-Source: AA0mqf5qgJsi6GJ3Xr3DoGK/TN04YRGlcgPANVdbyFMIvbSqwDOAc48ye4cGsuHQvH8e7GG5LT7Dpw==
X-Received: by 2002:ad4:52e8:0:b0:4c6:adf6:e74b with SMTP id p8-20020ad452e8000000b004c6adf6e74bmr40447928qvu.63.1669749483792;
        Tue, 29 Nov 2022 11:18:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a25d200b006eeb3165565sm11230709qko.80.2022.11.29.11.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 11:18:03 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Yuan Can <yuancan@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 6.2
Date: Tue, 29 Nov 2022 11:17:55 -0800
Message-Id: <20221129191755.542584-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129191755.542584-1-f.fainelli@gmail.com>
References: <20221129191755.542584-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/drivers

for you to fetch changes up to a5be5ce0e25439fae3cd42e3d775979547926812:

  firmware/nvram: bcm47xx: support init from IO memory (2022-11-09 10:27:10 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs driver changes for 6.2, please
pull the following:

- Yuan uses dev_err_probe() in the Raspberry Pi firmware provider to
  simplify the error handling code

- Rafal adds support for initialiazing the BCM47xx NVMEM/NVRAM firmware
  provider out of memory-mapped flash devices.

----------------------------------------------------------------
Rafał Miłecki (1):
      firmware/nvram: bcm47xx: support init from IO memory

Yuan Can (1):
      firmware: raspberrypi: Use dev_err_probe() to simplify code

 drivers/firmware/broadcom/bcm47xx_nvram.c | 18 ++++++++++++++++++
 drivers/firmware/raspberrypi.c            |  9 +++------
 drivers/nvmem/brcm_nvram.c                |  3 +++
 include/linux/bcm47xx_nvram.h             |  6 ++++++
 4 files changed, 30 insertions(+), 6 deletions(-)
