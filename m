Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF19CD54B1
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 10:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37518C433CB; Tue, 19 Sep 2023 10:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788A9C433CD;
	Tue, 19 Sep 2023 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695119914;
	bh=1FP7EheJHFdRKcOefqv+YBraqRuvIAyCgljheItg8G0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gij6iSQTCF1pDPBFPv+8W7Mx1sc1wjUYsS+AWDBNO5CZ+1Sl1eiZh7ZY6dfIfXFTG
	 nHgrpoDTa4A1Pej9uIkVEfJz6k74AC7tBE27RNdYskBI4VFZC7RzWqqlR/l3UfSkTd
	 ruBzb8EBYlQdYIbUYxXb+ss+D6n1nIfIzI2v1wlOPgMzPlRP4io1uuulASlWILeQUE
	 d/DeB1YKIAOkoQbAZ3GOoCwxW7C71sNeCzZHpXcAR1nMqrdrMqsOD8wPGbdx/aixZO
	 q/OJypCIv7BEp9I9k+VwpzaeYTmnlTXNRYyteJKmuCRZyKCfSZxtkKpPSMJ+kkVM68
	 7B1iXdG4k512Q==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 5/7] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
Date: Tue, 19 Sep 2023 12:38:13 +0200
Message-ID: <20230919103815.16818-6-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919103815.16818-1-kabel@kernel.org>
References: <20230919103815.16818-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the watchdog mechanism provided by the MCU.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig                |   2 +
 drivers/platform/cznic/Makefile               |   1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
 .../cznic/turris-omnia-mcu-watchdog.c         | 126 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
 5 files changed, 157 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 0a752aa654fa..e2649cdecc38 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select RTC_CLASS
+	select WATCHDOG_CORE
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
@@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
 	  - board poweroff into true low power mode (with voltage regulators
 	    disabled) and the ability to configure wake up from this mode (via
 	    rtcwake)
+	  - MCU watchdog
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 6f1470d1f673..a43997a12d74 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index b507f81ebe0a..708265203cc1 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -230,6 +230,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	ret = omnia_mcu_register_watchdog(mcu);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
new file mode 100644
index 000000000000..2238b2167c45
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU watchdog driver
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#include "turris-omnia-mcu.h"
+
+#define WATCHDOG_TIMEOUT		120
+
+static unsigned int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static int omnia_wdt_start(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	/*
+	 * The MCU also implements LED controller, and the LED driver may in
+	 * some cases require more I2C bandwidth. In order to prevent stealing
+	 * that bandwidth from the LED driver, configure minimum time between
+	 * pings to 10% of the configured timeout (for 120 second timeout we
+	 * will be pinging at most every 12 seconds).
+	 */
+	mcu->wdt.min_hw_heartbeat_ms = 100 * mcu->wdt.timeout;
+
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_stop(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 0);
+}
+
+static int omnia_wdt_ping(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_set_timeout(struct watchdog_device *wdt,
+				 unsigned int timeout)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u16(mcu->client, CMD_SET_WDT_TIMEOUT,
+				   timeout * 10);
+}
+
+static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+	int ret;
+
+	ret = omnia_cmd_read_u16(mcu->client, CMD_GET_WDT_TIMELEFT);
+	if (ret < 0) {
+		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
+			ret);
+		return 0;
+	}
+
+	return ret / 10;
+}
+
+static const struct watchdog_info omnia_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "Turris Omnia MCU Watchdog",
+};
+
+static const struct watchdog_ops omnia_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= omnia_wdt_start,
+	.stop		= omnia_wdt_stop,
+	.ping		= omnia_wdt_ping,
+	.set_timeout	= omnia_wdt_set_timeout,
+	.get_timeleft	= omnia_wdt_get_timeleft,
+};
+
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu)
+{
+	struct device *dev = &mcu->client->dev;
+	int ret;
+
+	if (!(mcu->features & FEAT_WDT_PING))
+		return 0;
+
+	mcu->wdt.info = &omnia_wdt_info;
+	mcu->wdt.ops = &omnia_wdt_ops;
+	mcu->wdt.parent = dev;
+	mcu->wdt.min_timeout = 1;
+	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */
+
+	mcu->wdt.timeout = WATCHDOG_TIMEOUT;
+	watchdog_init_timeout(&mcu->wdt, timeout, dev);
+
+	watchdog_set_drvdata(&mcu->wdt, mcu);
+
+	omnia_wdt_set_timeout(&mcu->wdt, mcu->wdt.timeout);
+
+	ret = omnia_cmd_read_u8(mcu->client, CMD_GET_WATCHDOG_STATE);
+	if (ret < 0) {
+		dev_err(dev, "Cannot get MCU watchdog state: %d\n", ret);
+		return ret;
+	}
+
+	if (ret)
+		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
+
+	watchdog_set_nowayout(&mcu->wdt, nowayout);
+	watchdog_stop_on_reboot(&mcu->wdt);
+	ret = devm_watchdog_register_device(dev, &mcu->wdt);
+	if (ret)
+		dev_err(dev, "Cannot register MCU watchdog: %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index c40ac07be5f5..89fe39f4255f 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -16,6 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/rtc.h>
 #include <linux/turris-omnia-mcu-interface.h>
+#include <linux/watchdog.h>
 #include <linux/workqueue.h>
 
 struct omnia_mcu {
@@ -36,6 +37,9 @@ struct omnia_mcu {
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
+
+	/* MCU watchdog */
+	struct watchdog_device wdt;
 };
 
 static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
@@ -46,6 +50,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
 	return ret < 0 ? ret : 0;
 }
 
+static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
+				     u8 val)
+{
+	u8 buf[2] = { cmd, val };
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
+				      u16 val)
+{
+	u8 buf[3];
+
+	buf[0] = cmd;
+	put_unaligned_le16(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
 static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
 				      u32 val)
 {
@@ -136,5 +159,6 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
 
 #endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */
-- 
2.41.0

