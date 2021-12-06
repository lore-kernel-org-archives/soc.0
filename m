Return-Path: <SRS0=vfwn=QX=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB4C433F5
	for <soc@archiver.kernel.org>; Mon,  6 Dec 2021 01:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADCB3C341C6; Mon,  6 Dec 2021 01:14:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07EBCC00446
	for <soc@kernel.org>; Mon,  6 Dec 2021 01:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07EBCC00446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id t26so21319172lfk.9
        for <soc@kernel.org>; Sun, 05 Dec 2021 17:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YSz4ckOGq//RG0FhZvUSYWUPqP5B38mDB246/uyjGXI=;
        b=OhmT/v+yWNBgRTaoiUwAa6PR82lh61BC4qrfJY4w/C3tLreUvcRGf3OY2lFcljg4ro
         CXNkmjzs8mfYO54RctLW8q6oHwsbIBm+isMQxumStvsGbXh3C8m/T0O0gPl5GM0nGOO/
         tGlKuzl7j0NYa4zIvJK5aPEq7q1FZjBQroG/RQoq24nsbIYM3m8PQ3aeyyKmyPqsIfYz
         MJd76ow1CZN98cAxAar2nT28mPwYpd4I90PZyURcP9f7n2igaGIEinjnvmxL9w3ysWTE
         QX/NLksLDTvZCStFERVBi8bTtTVZltyxeaQGxEUnb2wtJEIoH7p+hFNIb7rzE9S0J9O+
         1OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YSz4ckOGq//RG0FhZvUSYWUPqP5B38mDB246/uyjGXI=;
        b=wLGlCcTGU/4/nBLG2jBIpbbILhFGgasMhfGYxrWx9n8pQOm9fU3Ggb821uUX0LqGVa
         uyj66xmsaj/lSi5bw14JTzyFbJH7eG/cLilhoinzqWba4U0HUPEE3X4EMtiMDAglMDio
         yYET+1aLqndRlNlijTcI6ThrIfSTfGOZ42JTMahFfTgBXO3+5mbHplkJ7/rspklRCAQx
         yFo2F9dc0sjsdW2E66IEXYDOIAR4BOjojUAlkkw1qqYRK1Oo/VF37ScomjjcMgXpaA0U
         pHNn4wrXxHRdJCX93UVyESjB7sCjTaqHPuBWxQF5hJUiaQ3DidEcpR0BdHzgaTnzfhnX
         OMmw==
X-Gm-Message-State: AOAM533GzTDGF6Zx4W+xPg9RwOUu8kiCnezEaarX347Ngru9pvjqUohI
	6gD4A8PzJ363+EZer/it/c1LmA==
X-Google-Smtp-Source: ABdhPJw8oD8RtUnSLrHMfx0/GiCfUYicHympBFgvSncYaia2cN3Gf/vHsYMExfNvtHZ8SO7FiRsEyg==
X-Received: by 2002:a05:6512:3d1d:: with SMTP id d29mr32483237lfv.685.1638753243161;
        Sun, 05 Dec 2021 17:14:03 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id br4sm1204455lfb.217.2021.12.05.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 17:14:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] ARM: configs: gemini: Activate crypto driver
Date: Mon,  6 Dec 2021 02:11:58 +0100
Message-Id: <20211206011158.4180141-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables the SL3516 crypto driver on the Gemini platforms
where it is available, by default in the defconfig. Clean
up some noise around the crypto options while we're at it.

Cc: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this directly where applicable.
---
 arch/arm/configs/gemini_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index e6ff844821cf..a7acfee11ffc 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -63,7 +63,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
 CONFIG_SERIAL_8250_RUNTIME_UARTS=1
 CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
@@ -99,5 +98,5 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_ROMFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_CRYPTO_DEV_SL3516=y
 CONFIG_DEBUG_FS=y
-- 
2.31.1

