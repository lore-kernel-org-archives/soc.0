Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF07AC3DA5D
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 08:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98476C4AF0D; Fri, 19 Jul 2024 08:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F44C4AF0C;
	Fri, 19 Jul 2024 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721379487;
	bh=V1svAPqHYByTb92fFINrHc+U+LqrM7rEtxvlr12HQzg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DtszODgr6YAaCsqw3ItMfjFbL13zluugEDSgpFq7qugLbjf1ZyQ4VBCIEDl8MSNFq
	 6POvzcYZ9VCCEYfQQHCSeYGvBpSzikf0e4gZmXeLR0fxxdfKiQpr4UtODjNe94/9aS
	 xRb5CSyBtAe4aJ8eFWMAPOfTCNz51a5NHkKPk7JFhI89GoPhcGAdvlwslXjVjnaCf3
	 7n5mI8Nl8ZL0k2hDuscJDmO5e/I/m7GS2pPmDad6RSfvletpPm/C0iUilWZR2M4eE5
	 nPZf7OJ7IwlN9RSmZ9VvMSxvT/uzXzvQU1FA1C6l7/QJBnxr4+InpoMsaKz7xdSBO6
	 iLzwki+Azy07g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 3/4] platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code optional
Date: Fri, 19 Jul 2024 10:57:55 +0200
Message-ID: <20240719085756.30598-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719085756.30598-1-kabel@kernel.org>
References: <20240719085756.30598-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the system poweroff and RTC wakeup part of the driver optional,
under a boolean config option. Move the dependency to RTC_CLASS to this
new option.

This makes the turris-omnia-mcu driver available for compilation even if
RTC_CLASS is disabled.

Fixes: ed46f1f7731d ("platform: cznic: turris-omnia-mcu: fix Kconfig dependencies")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig                 | 13 +++++++++----
 drivers/platform/cznic/Makefile                |  2 +-
 drivers/platform/cznic/turris-omnia-mcu-base.c |  2 ++
 drivers/platform/cznic/turris-omnia-mcu.h      | 13 +++++++++++--
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 98f17562646e..f02856226dd7 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -18,15 +18,11 @@ config TURRIS_OMNIA_MCU
 	depends on I2C
 	depends on OF
 	depends on GPIOLIB
-	depends on RTC_CLASS
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
 	  The features include:
-	  - board poweroff into true low power mode (with voltage regulators
-	    disabled) and the ability to configure wake up from this mode (via
-	    rtcwake)
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
@@ -45,6 +41,15 @@ config TURRIS_OMNIA_MCU
 
 if TURRIS_OMNIA_MCU
 
+config TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
+	bool "Turris Omnia MCU system off and RTC wakeup"
+	default y
+	depends on RTC_CLASS
+	help
+	  Say Y here to add support for CZ.NIC's Turris Omnia board poweroff
+	  into true low power mode (with voltage regulators disabled) and the
+	  ability to configure wake up from this mode (via rtcwake).
+
 config TURRIS_OMNIA_MCU_WATCHDOG
 	bool "Turris Omnia MCU watchdog"
 	default y
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 0c28fa859391..380530ba74f7 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -3,6 +3,6 @@
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
-turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP)	+= turris-omnia-mcu-sys-off-wakeup.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_TRNG)		+= turris-omnia-mcu-trng.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_WATCHDOG)		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index c68a7a84a951..7b514e60273d 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -198,7 +198,9 @@ static const struct attribute_group omnia_mcu_base_group = {
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
 	&omnia_mcu_gpio_group,
+#ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 	&omnia_mcu_poweroff_group,
+#endif
 	NULL
 };
 
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index d07a32cfe238..75fa2111546f 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -42,10 +42,12 @@ struct omnia_mcu {
 	unsigned long last_status;
 	bool button_pressed_emul;
 
+#ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
 	/* RTC device for configuring wake-up */
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
+#endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_WATCHDOG
 	/* MCU watchdog */
@@ -188,10 +190,17 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd,
 
 extern const u8 omnia_int_to_gpio_idx[32];
 extern const struct attribute_group omnia_mcu_gpio_group;
-extern const struct attribute_group omnia_mcu_poweroff_group;
-
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+
+#ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
+extern const struct attribute_group omnia_mcu_poweroff_group;
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+#else
+static inline int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu)
+{
+	return 0;
+}
+#endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_TRNG
 int omnia_mcu_register_trng(struct omnia_mcu *mcu);
-- 
2.44.2

