Return-Path: <SRS0=DAyx=A5=gmail.com=lukas.bulwahn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E74C77B73
	for <soc@archiver.kernel.org>; Mon,  8 May 2023 04:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1F27C433EF; Mon,  8 May 2023 04:04:43 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE058C433D2
	for <soc@kernel.org>; Mon,  8 May 2023 04:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE058C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso7443272a12.0
        for <soc@kernel.org>; Sun, 07 May 2023 21:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683518681; x=1686110681;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EHAT0FpwV3AmMbV3FwWi0IRotmMH++8ZC/lSzkodBA=;
        b=geMSnh2vDesRtQzP5cZ6uRXFnNtww8hlBA5Kugl8KRxENtX4dpqiYLyiabSZXjdEy/
         ePuWKENTV+KkKm2iRoxfYfUSxoIxVmjrH8Gm5BDDonPp3mWBCOmMS9AJF1zpecHhqSCD
         oXg5GMaEtLifWEbN8Mg9SzthetubwvBBOkLF8nM8Zb4xgqu5gTGFDJjTkxveeXbUWN35
         elKFwv2kbqzDLfAjr4fBBUD+3coxi1uQlmriHN5eC7ntDZAw6u2CzCgZsAhp3RgX9vA6
         fnpJTaHPV4VaK9RTG/TPmjAhZi9fJX+zfjhTMc2soBA7TMzM9b5QyRPYami7MCmuG1Ij
         6CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683518681; x=1686110681;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EHAT0FpwV3AmMbV3FwWi0IRotmMH++8ZC/lSzkodBA=;
        b=e8GYmL9jgkGImQLF3D79+5s2gI6SL+poGe+wbWz8fekjlbVtmehYqNBuTmmMPPuDKq
         N2TmGmqgWQ5L/KkHYAPb4KDUxg7rV7vdsJFBHp4heOT1SqON3NfdxuUPrWKKO6HzX5k4
         DN9gdFTRAcP4Y/UYgRlUYT41csaCdVNO2s+kXH/Yrcglau0zegMLx5F1Ug6nYK109a7i
         Eh69aMzORRE0JkvrLSZXwl8Vx7fku7yqu8YoNTiMfDrVsjTw6M2Brs3GXNwCm+M6plMG
         UGD5UTalL3D2d79J0G/xmtESiUhEnivGnDlwOYOdWPH/Vrg0UpZPdER2K+shrA7bfxHz
         vnMA==
X-Gm-Message-State: AC+VfDzRzFJw8aZTAQ8JMpYAtKLDAl4uwytxwRwrKRmLtkVgdz3TXYwk
	UVhKQtQXpVApwC/OQLiqtC4=
X-Google-Smtp-Source: ACHHUZ7S7/kq9jz38RlRxFDhe5+6ko5+I6KvU/mC4gq9bmtvxlog+Hpmw1DjqBpVwlOOqJKu63i2Kw==
X-Received: by 2002:aa7:d5d5:0:b0:508:4f66:e70d with SMTP id d21-20020aa7d5d5000000b005084f66e70dmr6512173eds.36.1683518680757;
        Sun, 07 May 2023 21:04:40 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:8906:f99a:ce33:2033])
        by smtp.gmail.com with ESMTPSA id f12-20020a05640214cc00b005068fe6f3d8sm5645242edx.87.2023.05.07.21.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 21:04:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Date: Mon,  8 May 2023 06:04:33 +0200
Message-Id: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1

Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
no effect and any further purpose.

Remove the obsolete config S3C64XX_SETUP_IDE.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-s3c/Kconfig.s3c64xx | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 01a7a8eec6e8..8f40af063ad6 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -69,11 +69,6 @@ config S3C64XX_SETUP_I2C1
 	help
 	  Common setup code for i2c bus 1.
 
-config S3C64XX_SETUP_IDE
-	bool
-	help
-	  Common setup code for S3C64XX IDE.
-
 config S3C64XX_SETUP_FB_24BPP
 	bool
 	help
@@ -110,7 +105,6 @@ config MACH_WLF_CRAGG_6410
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_I2C1
-	select S3C64XX_SETUP_IDE
 	select S3C64XX_SETUP_KEYPAD
 	select S3C64XX_SETUP_SDHCI
 	select S3C64XX_SETUP_SPI
-- 
2.17.1

