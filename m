Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A984C3DA70
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 08:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84972C4AF0D; Fri, 19 Jul 2024 08:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EB0C32782;
	Fri, 19 Jul 2024 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721379483;
	bh=lms4l7QoyZSDO6nXHpFZLWZYY1Jgi4mRN0ve9lRYCGw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+HmeZ2cv0hpTBdH/9aDfHZCxmEYWlk1tqH/qG/oF/W5UrE+LbmbIb9PnUPxLtwFJ
	 qCvOFoJ0WmphbFvDPJYz40cczgAx/n2frZxverCCT7LZ+FbkGVAcAKYjdKsZiUKdqg
	 EeuQdSN/1z52Ww8E8j0PUKDeqMz8FZRIXb+qiZ6FdafiKUZhapoH95bokLLTyGjzsl
	 5OzNM1G8HBVGdbh9jFLdvaZVPMl2PctX5na4Lu1F3IDbyY3vhpfrAx5chFWN7k2iYo
	 6olcOjv7iPknlRrwWloMbU18DECTXN90ITZz8EaBCDnXcj5RxFNFYrcb4z2C7eVsHa
	 UTfTtryAyPV+Q==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 1/4] platform: cznic: turris-omnia-mcu: Make watchdog code optional
Date: Fri, 19 Jul 2024 10:57:53 +0200
Message-ID: <20240719085756.30598-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719085756.30598-1-kabel@kernel.org>
References: <20240719085756.30598-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the watchdog part of the driver optional, under a boolean config
option. Move the dependency to WATCHDOG to this new option, and change
the WATCHDOG_CORE dependency to selection, as is done in most watchdog
drivers.

This makes the turris-omnia-mcu driver available for compilation even if
WATCHDOG is disabled.

Fixes: ed46f1f7731d ("platform: cznic: turris-omnia-mcu: fix Kconfig dependencies")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig            | 17 ++++++++++++++---
 drivers/platform/cznic/Makefile           |  2 +-
 drivers/platform/cznic/turris-omnia-mcu.h | 10 ++++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index cb0d4d686d8a..b56c343e21d6 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -17,11 +17,9 @@ config TURRIS_OMNIA_MCU
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
 	depends on OF
-	depends on WATCHDOG
 	depends on GPIOLIB
 	depends on HW_RANDOM
 	depends on RTC_CLASS
-	depends on WATCHDOG_CORE
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to add support for the features implemented by the
@@ -31,7 +29,6 @@ config TURRIS_OMNIA_MCU
 	    disabled) and the ability to configure wake up from this mode (via
 	    rtcwake)
 	  - true random number generator (if available on the MCU)
-	  - MCU watchdog
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
@@ -44,7 +41,21 @@ config TURRIS_OMNIA_MCU
 	      to be able to program SOC's OTP on board revisions 32+
 	    - to get input from the LED output pins of the WAN ethernet PHY, LAN
 	      switch and MiniPCIe ports
+	  Other features can be enabled by subsequent config options.
 	  To compile this driver as a module, choose M here; the module will be
 	  called turris-omnia-mcu.
 
+if TURRIS_OMNIA_MCU
+
+config TURRIS_OMNIA_MCU_WATCHDOG
+	bool "Turris Omnia MCU watchdog"
+	default y
+	depends on WATCHDOG
+	select WATCHDOG_CORE
+	help
+	  Say Y here to add support for watchdog provided by CZ.NIC's Turris
+	  Omnia MCU.
+
+endif # TURRIS_OMNIA_MCU
+
 endif # CZNIC_PLATFORMS
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index eae4c6b341ff..7599b4835056 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -5,4 +5,4 @@ turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-trng.o
-turris-omnia-mcu-y		+= turris-omnia-mcu-watchdog.o
+turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_WATCHDOG)		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index 2ca56ae13aa9..85bf9ab39356 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -47,8 +47,10 @@ struct omnia_mcu {
 	u32 rtc_alarm;
 	bool front_button_poweron;
 
+#ifdef CONFIG_TURRIS_OMNIA_MCU_WATCHDOG
 	/* MCU watchdog */
 	struct watchdog_device wdt;
+#endif
 
 	/* true random number generator */
 	struct hwrng trng;
@@ -189,6 +191,14 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
 int omnia_mcu_register_trng(struct omnia_mcu *mcu);
+
+#ifdef CONFIG_TURRIS_OMNIA_MCU_WATCHDOG
 int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
+#else
+static inline int omnia_mcu_register_watchdog(struct omnia_mcu *mcu)
+{
+	return 0;
+}
+#endif
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.44.2

