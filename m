Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD77C3DA70
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 08:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2128C4AF0D; Fri, 19 Jul 2024 08:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF5EC32782;
	Fri, 19 Jul 2024 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721379489;
	bh=twOO+k/TOzc+/oxphTm4UcJXjEYPFrfnmkz23wEWhco=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3tJQNocIgmVQaOD1/PHE0uqVaE5qHLATIhHd+UO3j3epZKY0ycIBy/uUdaosEGwf
	 PsKnpeaEZDXtTmH8S6Hj9bm3bVYVqjPbYwfMPRP7exFRJ40/R8TWM+ioN2gbmfbeiT
	 9XC9wzHBZ1EWeAjzGnMoXa4ywSm0Jx+TP+/6KkehuX7K8Ax+cTXAl01BcDv/WvZzRd
	 kp+2d9EjYI8nIjU+P5ZRA3Bjjwq+F+bmuNnKpfyQua8kY0m93jDH4XYQU+AUyAaD23
	 6CQAfpxPQJHL0tHY83/4jZfhufA69OoIEh1oNxRE0V5nXeVXBAkP5wLUod1NBBP/f1
	 gBrpKyiABVl1Q==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 4/4] platform: cznic: turris-omnia-mcu: Make GPIO code optional
Date: Fri, 19 Jul 2024 10:57:56 +0200
Message-ID: <20240719085756.30598-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719085756.30598-1-kabel@kernel.org>
References: <20240719085756.30598-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the GPIO part of the driver optional, under a boolean config
option. Move the dependency to GPIOLIB and OF and the selection of
GPIOLIB_IRQCHIP to this new option.

This makes the turris-omnia-mcu driver available for compilation even if
GPIOLIB or OF are disabled.

Fixes: ed46f1f7731d ("platform: cznic: turris-omnia-mcu: fix Kconfig dependencies")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig                | 42 +++++++++++--------
 drivers/platform/cznic/Makefile               |  2 +-
 .../platform/cznic/turris-omnia-mcu-base.c    |  2 +
 drivers/platform/cznic/turris-omnia-mcu.h     |  9 ++++
 4 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index f02856226dd7..a111eca8ff57 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -16,31 +16,38 @@ config TURRIS_OMNIA_MCU
 	tristate "Turris Omnia MCU driver"
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
-	depends on OF
-	depends on GPIOLIB
-	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
-	  The features include:
-	  - GPIO pins
-	    - to get front button press events (the front button can be
-	      configured either to generate press events to the CPU or to change
-	      front LEDs panel brightness)
-	    - to enable / disable USB port voltage regulators and to detect
-	      USB overcurrent
-	    - to detect MiniPCIe / mSATA card presence in MiniPCIe port 0
-	    - to configure resets of various peripherals on board revisions 32+
-	    - to enable / disable the VHV voltage regulator to the SOC in order
-	      to be able to program SOC's OTP on board revisions 32+
-	    - to get input from the LED output pins of the WAN ethernet PHY, LAN
-	      switch and MiniPCIe ports
-	  Other features can be enabled by subsequent config options.
+	  This option only enables the core part of the driver. Specific
+	  features can be enabled by subsequent config options.
 	  To compile this driver as a module, choose M here; the module will be
 	  called turris-omnia-mcu.
 
 if TURRIS_OMNIA_MCU
 
+config TURRIS_OMNIA_MCU_GPIO
+	bool "Turris Omnia MCU GPIOs"
+	default y
+	depends on GPIOLIB
+	depends on OF
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to add support for controlling MCU GPIO pins and receiving
+	  MCU interrupts on CZ.NIC's Turris Omnia.
+	  This enables you to
+	  - get front button press events (the front button can be configured
+	    either to generate press events to the CPU or to change front LEDs
+	    panel brightness),
+	  - enable / disable USB port voltage regulators and to detect USB
+	    overcurrent,
+	  - detect MiniPCIe / mSATA card presence in MiniPCIe port 0,
+	  - configure resets of various peripherals on board revisions 32+,
+	  - enable / disable the VHV voltage regulator to the SOC in order to be
+	    able to program SOC's OTP on board revisions 32+,
+	  - get input from the LED output pins of the WAN ethernet PHY, LAN
+	    switch and MiniPCIe ports.
+
 config TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 	bool "Turris Omnia MCU system off and RTC wakeup"
 	default y
@@ -62,6 +69,7 @@ config TURRIS_OMNIA_MCU_WATCHDOG
 config TURRIS_OMNIA_MCU_TRNG
 	bool "Turris Omnia MCU true random number generator"
 	default y
+	depends on TURRIS_OMNIA_MCU_GPIO
 	depends on HW_RANDOM
 	help
 	  Say Y here to add support for the true random number generator
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 380530ba74f7..ce6d997f34d6 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
-turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
+turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_GPIO)		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP)	+= turris-omnia-mcu-sys-off-wakeup.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_TRNG)		+= turris-omnia-mcu-trng.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_WATCHDOG)		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 7b514e60273d..58f9afae2867 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -197,7 +197,9 @@ static const struct attribute_group omnia_mcu_base_group = {
 
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
+#ifdef CONFIG_TURRIS_OMNIA_MCU_GPIO
 	&omnia_mcu_gpio_group,
+#endif
 #ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 	&omnia_mcu_poweroff_group,
 #endif
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index 75fa2111546f..fed0d357fea3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -33,6 +33,7 @@ struct omnia_mcu {
 	u8 board_first_mac[ETH_ALEN];
 	u8 board_revision;
 
+#ifdef CONFIG_TURRIS_OMNIA_MCU_GPIO
 	/* GPIO chip */
 	struct gpio_chip gc;
 	struct mutex lock;
@@ -41,6 +42,7 @@ struct omnia_mcu {
 	struct delayed_work button_release_emul_work;
 	unsigned long last_status;
 	bool button_pressed_emul;
+#endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 	/* RTC device for configuring wake-up */
@@ -188,9 +190,16 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
 	return omnia_cmd_read(client, cmd, reply, sizeof(*reply));
 }
 
+#ifdef CONFIG_TURRIS_OMNIA_MCU_GPIO
 extern const u8 omnia_int_to_gpio_idx[32];
 extern const struct attribute_group omnia_mcu_gpio_group;
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+#else
+static inline int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
+{
+	return 0;
+}
+#endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 extern const struct attribute_group omnia_mcu_poweroff_group;
-- 
2.44.2

