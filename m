Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9BEC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 23:22:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D7960200
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 23:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D7960200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gufcY2high/umnbbewQPZpY5gijgmAf5bXgwrthz2Z8=; b=hf3KHbfJXio8YCL4udIR1FNoG1
	2P026NBtXMEHVrDANrfkm2nK6rYevX7g1i1b1+ELDl8xhnXSmqNNiVOG66AJEeRFnsB/BnS/+VQk1
	vl4qaIkTfrmFc69wrq0Ayd4t0q2Hb+9ze6dP4QZfjye5NiCldVTu99A3lYdkwaUjPJNN1GLCAcEm/
	hT0VbfYoIQ6IhewDGWgaLdD5a34LpbtF8tblA0Xb9fL0MoJ7YAXX2D3tsYJX/8fURJNf+wUbuFjP6
	+fO3/caCYPzD+jMHs2ZspL7BGxBdwFFItVkPfMBaQs6qDK2aVbyP4eEfQ98B2qsu6ED0xdzwAg4x9
	Xzkq65wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGrqX-0003sw-To; Mon, 01 Mar 2021 23:21:01 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGrqU-0003sU-Oi
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 23:21:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id q23so21585341lji.8
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Mar 2021 15:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LVmImkXhdF8b7IyEbAftanQY9XJqBkgbJmzCGT5ATkA=;
 b=R0IvFNn1ba2I96r7yvogckNXutet/yzP5SCj/BorUQKQQGx4IOS8iO6IUuq19bI3cV
 18dcxBqRc9Mq7ZqJgk2o+6BVbBntrwoE9m333dOS8Lv/ZYaF77m3M8VqRzTfLei/CmiA
 FTVbG4c/ei4vd5L1+t3R4y0SicAOQUMLTsfIkNHdu4XP6NWp/k/BpEpSNNbq0XIfREos
 6FnyJ00QaZ5+WL1iT6fHHE7z+CWMbTRtpdMuSg2rQoQzMArSQlXIyW9VBtFnoanf/x6r
 1XUMBGBpyyZRHidiFv3/7LLpEL0N99DWaDyk7R94ENqyG5ZhjplvyQ6Ku7JLS2nFcf8D
 CnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LVmImkXhdF8b7IyEbAftanQY9XJqBkgbJmzCGT5ATkA=;
 b=OXNq+lMCgfJTEDqyepAgFRccYeMmRRG4ylj3Wneq1BsYqtkfFI5dnZJ9zJwHBxOKuJ
 T/ImlTrMaImWAcWaji4x3Xdtl7JGdF+3A0p+tV4as+4PQp3e8gz63MHm/5ajWIz9Me56
 7Qp7oENL4J8TSbufhCm6sgd4iv/ZfMoWAoe2tf3MOtc0rFnLZFJVSPKCj1yKTbrutj6l
 geIJWkhWS09hWuJ4eVM4UmC39koDL6aC6rSC3HOeVKGxilGHrHdsRH0856l9ACBNHbCE
 fd++r47nIQtsiag/rNR3NA4WpKx9aOsiXAVZ3Xqs4TNyKgdkJQgG0UcKOH5PjabkCBqS
 YL0A==
X-Gm-Message-State: AOAM532jeMUOU0hUjPXX9wp7JGDoY3j/QKn4BnHjmPMn7kp9a4RPlDj/
 CiCfa/G/5P2joYPnh/o/gzQGUQ==
X-Google-Smtp-Source: ABdhPJyZsR28gjuiz9aG/my6WBT/wp5t7x99EoudK3t21CaepBplhF49+VVGs7QpL57zG1bJxq1cSQ==
X-Received: by 2002:a2e:b4b7:: with SMTP id q23mr7139818ljm.88.1614640856911; 
 Mon, 01 Mar 2021 15:20:56 -0800 (PST)
Received: from localhost.localdomain
 (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
 by smtp.gmail.com with ESMTPSA id s5sm283660lfd.284.2021.03.01.15.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:20:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] ARM: configs: ux500: Update for new drivers
Date: Tue,  2 Mar 2021 00:20:50 +0100
Message-ID: <20210301232050.1457397-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_182059_127375_73F6E81C 
X-CRM114-Status: GOOD (  12.46  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210301232050.RT7srX1D_QuAaDOSxOvXxoJw-NLP_DjPsRV15_qU1vc@z>

Some new driver support for the Ux500 devices landed in
v5.12-rc1 so update the defconfig to use them:

- TM2 touchkey, used on the Golden and Janice.
- SPI GPIO, used for the Janice display control.
- NTC thermistor, used for the HREF temperature
  sensors.
- V4L2 flash control that gives support for LED
  torch to userspaces such as Phosh.
- The LEDs Flash class and RT8515 Flash/torch LED
  driver used in all the Samsung mobiles.
- FSA9480 extcon, used by Janice.
- BMC150 accelerometer, used by Janice.
- IIO rescaler, used for thermistors and ALS
  on Janice.
- MPU3050 gyroscope driver used by Janice.
- Yamaha YAS530 magnetometer driver used by Janice.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for the -rcs.
---
 arch/arm/configs/u8500_defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index bcedfe1422aa..dbb1ef601762 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -55,6 +55,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_NOMADIK=y
 CONFIG_KEYBOARD_STMPE=y
 CONFIG_KEYBOARD_TC3589X=y
+CONFIG_KEYBOARD_TM2_TOUCHKEY=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
@@ -74,10 +75,12 @@ CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
 CONFIG_SPI_PL022=y
 CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_TC3589X=y
 CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_NTC_THERMISTOR=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_WATCHDOG=y
@@ -85,6 +88,10 @@ CONFIG_MFD_STMPE=y
 CONFIG_MFD_TC3589X=y
 CONFIG_REGULATOR_AB8500=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_V4L2_FLASH_LED_CLASS=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_NOVATEK_NT35510=y
 CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=y
@@ -112,10 +119,12 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=y
 CONFIG_LEDS_LM3530=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_LP55XX_COMMON=y
 CONFIG_LEDS_LP5521=y
+CONFIG_LEDS_RT8515=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AB8500=y
@@ -124,16 +133,21 @@ CONFIG_DMADEVICES=y
 CONFIG_STE_DMA40=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HSEM_U8500=y
+CONFIG_EXTCON_FSA9480=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
 CONFIG_BMA180=y
+CONFIG_BMC150_ACCEL=y
 CONFIG_IIO_ST_ACCEL_3AXIS=y
+CONFIG_IIO_RESCALE=y
+CONFIG_MPU3050_I2C=y
 CONFIG_IIO_ST_GYRO_3AXIS=y
 CONFIG_INV_MPU6050_I2C=y
 CONFIG_BH1780=y
 CONFIG_GP2AP002=y
 CONFIG_AK8974=y
 CONFIG_IIO_ST_MAGN_3AXIS=y
+CONFIG_YAMAHA_YAS530=y
 CONFIG_IIO_HRTIMER_TRIGGER=y
 CONFIG_IIO_ST_PRESS=y
 CONFIG_EXT2_FS=y
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
