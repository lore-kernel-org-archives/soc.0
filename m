Return-Path: <SRS0=C383=H7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6727AC433E0
	for <soc@archiver.kernel.org>; Mon,  1 Mar 2021 23:20:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02C4760232; Mon,  1 Mar 2021 23:20:59 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E73360235
	for <soc@kernel.org>; Mon,  1 Mar 2021 23:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E73360235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f175.google.com with SMTP id p15so12666852ljc.13
        for <soc@kernel.org>; Mon, 01 Mar 2021 15:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
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
        b=M8Moyr3iJojkESs1/sulbEtQNOAinlyxyP4LdcplKOaproSLpJurIO/Dfa+TG8eeK7
         wDRUOosF7WxZDVwMhIsBWgNcTUkVOZPqqNYhjAY0/YeI+QJ/lhalR2zJHI8sbJnht9nw
         riUa2qAOYelBAaEh7UCM5OY6OZ1ury+HaWAHlMPIKi5QeDwy/gec5aRiy1n5PCnUd2B+
         UQQ4BuRKh2jLE45OhxeWlzK178SI1f770P++aMYKesCaE4/LDoeZO0l801HFZK5c2M6u
         xKSA4xx46tIdVM23kVwJGRv2E1yk4s3TQyr/fXNuIczU21pwaouif5OuVymfLD53f2NF
         t1Ww==
X-Gm-Message-State: AOAM531J3G7y79DRuaKvPPCfuE1p50uFsZmvwBGG3HrU87VhIcvaGTD4
	55ir/tqTxBOHEW04jqRu3ggNlQ==
X-Google-Smtp-Source: ABdhPJyZsR28gjuiz9aG/my6WBT/wp5t7x99EoudK3t21CaepBplhF49+VVGs7QpL57zG1bJxq1cSQ==
X-Received: by 2002:a2e:b4b7:: with SMTP id q23mr7139818ljm.88.1614640856911;
        Mon, 01 Mar 2021 15:20:56 -0800 (PST)
Received: from localhost.localdomain (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
        by smtp.gmail.com with ESMTPSA id s5sm283660lfd.284.2021.03.01.15.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:20:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] ARM: configs: ux500: Update for new drivers
Date: Tue,  2 Mar 2021 00:20:50 +0100
Message-Id: <20210301232050.1457397-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

