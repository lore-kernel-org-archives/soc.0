Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868FC3DA59
	for <soc@archiver.kernel.org>; Fri, 19 Jul 2024 08:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E520C4AF0A; Fri, 19 Jul 2024 08:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC60CC4AF10;
	Fri, 19 Jul 2024 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721379485;
	bh=PhkNPxtnxVFwsy/aD9Qw/KDlI1I98EFeC4LL2xz5OGo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rm3D0H1/aDVoxH2QWsQGseLEvbG0wxdGNmH1A9tsRuS7O755MaTen+vBhnJVHvzd2
	 6i+znaF4DcgmmW+uzp7AMCrxszhs654jdZfOss/jFOME/X3386qsoqJkM5WXvEH2vC
	 Mazriro/6KghpT5m6yAlxijgc06dtqAz6BQN+mGZuHWW7ffCFHc2z0qpQ4Lwy+XkrR
	 hkX29nUQuZ20Bc680s/vtEfL5LI+MJcDDzt5y/xP4xJnC1RxO09kn2knj7mmYDAJX0
	 F0JFPKem5ehBGg+qsylYS6BZpEbTH2c+93cu6L8b+vfPeXucq4cg/8MG6gdBMk7L+W
	 83GiefFGgsYkQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 2/4] platform: cznic: turris-omnia-mcu: Make TRNG code optional
Date: Fri, 19 Jul 2024 10:57:54 +0200
Message-ID: <20240719085756.30598-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719085756.30598-1-kabel@kernel.org>
References: <20240719085756.30598-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the TRNG part of the driver optional, under a boolean config
option.

This makes the driver turris-omnia-mcu available for compilation even if
HW_RANDOM is disabled.

Fixes: ed46f1f7731d ("platform: cznic: turris-omnia-mcu: fix Kconfig dependencies")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig            | 10 ++++++++--
 drivers/platform/cznic/Makefile           |  2 +-
 drivers/platform/cznic/turris-omnia-mcu.h | 10 ++++++++++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index b56c343e21d6..98f17562646e 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -18,7 +18,6 @@ config TURRIS_OMNIA_MCU
 	depends on I2C
 	depends on OF
 	depends on GPIOLIB
-	depends on HW_RANDOM
 	depends on RTC_CLASS
 	select GPIOLIB_IRQCHIP
 	help
@@ -28,7 +27,6 @@ config TURRIS_OMNIA_MCU
 	  - board poweroff into true low power mode (with voltage regulators
 	    disabled) and the ability to configure wake up from this mode (via
 	    rtcwake)
-	  - true random number generator (if available on the MCU)
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
@@ -56,6 +54,14 @@ config TURRIS_OMNIA_MCU_WATCHDOG
 	  Say Y here to add support for watchdog provided by CZ.NIC's Turris
 	  Omnia MCU.
 
+config TURRIS_OMNIA_MCU_TRNG
+	bool "Turris Omnia MCU true random number generator"
+	default y
+	depends on HW_RANDOM
+	help
+	  Say Y here to add support for the true random number generator
+	  provided by CZ.NIC's Turris Omnia MCU.
+
 endif # TURRIS_OMNIA_MCU
 
 endif # CZNIC_PLATFORMS
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 7599b4835056..0c28fa859391 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -4,5 +4,5 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
-turris-omnia-mcu-y		+= turris-omnia-mcu-trng.o
+turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_TRNG)		+= turris-omnia-mcu-trng.o
 turris-omnia-mcu-$(CONFIG_TURRIS_OMNIA_MCU_WATCHDOG)		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index 85bf9ab39356..d07a32cfe238 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -52,9 +52,11 @@ struct omnia_mcu {
 	struct watchdog_device wdt;
 #endif
 
+#ifdef CONFIG_TURRIS_OMNIA_MCU_TRNG
 	/* true random number generator */
 	struct hwrng trng;
 	struct completion trng_entropy_ready;
+#endif
 };
 
 int omnia_cmd_write_read(const struct i2c_client *client,
@@ -190,7 +192,15 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+
+#ifdef CONFIG_TURRIS_OMNIA_MCU_TRNG
 int omnia_mcu_register_trng(struct omnia_mcu *mcu);
+#else
+static inline int omnia_mcu_register_trng(struct omnia_mcu *mcu)
+{
+	return 0;
+}
+#endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_WATCHDOG
 int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
-- 
2.44.2

