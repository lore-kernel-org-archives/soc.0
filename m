Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3285EE49A3
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8D5AC433C8; Wed, 23 Aug 2023 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FF6C433D9;
	Wed, 23 Aug 2023 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807020;
	bh=zsZxwuIRe7dmdKxyJS3H2O07ibaGfvBbb5lgTvc+8ic=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiBNinSKCrQ5x3RZuoJ0fKn+ASmK4SKfvUjtCb0lR4CW6LQFJYXZKLJ665vnjoN7t
	 G0My6okih2yQ6vd2JLjEIYgSAAbsis/EuYoHUwMo7mAflHuLdur8PCpgebLZVaXie0
	 2l58AB3MY6Qy3RphEJJp4oTlrsalSgV9Ke5H8R4tKq3uLp3mtcdhNXeOjGN9QZxfKn
	 wSAXb0oFxDln7lidwcSTaltvHQhVeg4ohfWtBXr1qNAw3zikF+qmCLRecDnO3/cRzB
	 VnWxCvLNGuCUa+S2mn8duxRSGuLwjlDSSgXXh4ImZt8LylPjBVgKDLj17IxrZWIurH
	 yL3/mFahyd34A==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 2/4] platform/cznic: Add support for Turris Omnia MCU
Date: Wed, 23 Aug 2023 18:10:10 +0200
Message-ID: <20230823161012.6986-3-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823161012.6986-1-kabel@kernel.org>
References: <20230823161012.6986-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new platform driver that exposes the features provided by the
microcontroller on the Turris Omnia board.

These features include:
- Board poweroff into true low power mode - the MCU can disable almost
  all voltage regulators. The board can be enabled by pressing the front
  button.
- The ability to configure board wakeup at a specified time after the
  board was powered down. This ability is exposed to the userspace as a
  RTC driver, so that user can use the rtcwake command to configure it.
- MCU watchdog.
- GPIO pins and interrupts. The MCU has GPIOs connected to USB port
  voltage regulators and their fault pins (thus singaling USB port
  over-current conditions). Other GPIOs include the front button (which
  is also debounced by the MCU), MiniPCIe / mSATA card presence in
  MiniPCIe port 0, resets to various peripherals and finally LED output
  pins from WAN ethernet PHY, LAN switch and MiniPCIe ports.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  77 ++
 MAINTAINERS                                   |   3 +
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/cznic/Kconfig                |  48 +
 drivers/platform/cznic/Makefile               |   7 +
 .../platform/cznic/turris-omnia-mcu-base.c    | 275 +++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 967 ++++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 245 +++++
 .../cznic/turris-omnia-mcu-watchdog.c         | 126 +++
 drivers/platform/cznic/turris-omnia-mcu.h     | 161 +++
 include/linux/turris-omnia-mcu-interface.h    | 194 ++++
 12 files changed, 2106 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
new file mode 100644
index 000000000000..d668b8e999e6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -0,0 +1,77 @@
+What:		/sys/bus/i2c/devices/<mcu_device>/front_button_mode
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RW) The front button on the Turris Omnia router can be
+		configured either to change the intensity of all the LEDs on the
+		front panel, or to send the press event to the CPU as an
+		interrupt.
+
+		This file switches between these two modes:
+		- "mcu" makes the button press event be handled by the MCU to
+		  change the LEDs panel intensity.
+		- "cpu" makes the button press event be handled by the CPU.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/front_button_poweron
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RW) Newer versions of the microcontroller firmware of the
+		Turris Omnia router support powering off the router into true
+		low power mode. The router can be powered on by pressing the
+		front button.
+
+		This file configures whether front button power on is enabled.
+
+		This file is present only if the power off feature is supported
+		by the firmware.
+
+		Format: %i.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Newer versions of the microcontroller firmware report the
+		features they support. These can be read from this file. If the
+		MCU firmware is too old, this file reads 0x0.
+
+		Format: 0x%x.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_application
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the application
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/fw_version_hash_bootloader
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the version hash (commit hash) of the bootloader
+		part of the microcontroller firmware.
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/mcu_type
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the microcontroller type (STM32, GD32, MKL).
+
+		Format: %s.
+
+What:		/sys/bus/i2c/devices/<mcu_device>/reset_selector
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RO) Contains the selected factory reset level, determined by
+		how long the rear reset button was held by the user during board
+		reset.
+
+		Format: %i.
diff --git a/MAINTAINERS b/MAINTAINERS
index 00db4f1d165f..25567686a2cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,7 @@ M:	Marek Behún <kabel@kernel.org>
 S:	Maintained
 W:	https://www.turris.cz/
 F:	Documentation/ABI/testing/debugfs-moxtet
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
 F:	Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
@@ -2088,10 +2089,12 @@ F:	drivers/firmware/turris-mox-rwtm.c
 F:	drivers/gpio/gpio-moxtet.c
 F:	drivers/leds/leds-turris-omnia.c
 F:	drivers/mailbox/armada-37xx-rwtm-mailbox.c
+F:	drivers/platform/cznic/
 F:	drivers/watchdog/armada_37xx_wdt.c
 F:	include/dt-bindings/bus/moxtet.h
 F:	include/linux/armada-37xx-rwtm-mailbox.h
 F:	include/linux/moxtet.h
+F:	include/linux/turris-omnia-mcu-interface.h
 
 ARM/FARADAY FA526 PORT
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 868b20361769..fef907a94001 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -7,6 +7,8 @@ source "drivers/platform/goldfish/Kconfig"
 
 source "drivers/platform/chrome/Kconfig"
 
+source "drivers/platform/cznic/Kconfig"
+
 source "drivers/platform/mellanox/Kconfig"
 
 source "drivers/platform/olpc/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 41640172975a..cc66b5020a34 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
new file mode 100644
index 000000000000..cefa7d022584
--- /dev/null
+++ b/drivers/platform/cznic/Kconfig
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.rst.
+#
+
+menuconfig CZNIC_PLATFORMS
+	bool "Platform support for CZ.NIC's Turris hardware"
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	help
+	  Say Y here to be able to choose driver support for CZ.NIC's Turris
+	  devices. This option alone does not add any kernel code.
+
+if CZNIC_PLATFORMS
+
+config TURRIS_OMNIA_MCU
+	tristate "Turris Omnia MCU driver"
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	depends on I2C
+	depends on OF
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select RTC_CLASS
+	select WATCHDOG_CORE
+	help
+	  Say Y here to add support for the features implemented by the
+	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
+	  The features include:
+	  - board poweroff into true low power mode (with voltage regulators
+	    disabled) and the ability to configure wake up from this mode (via
+	    rtcwake)
+	  - MCU watchdog
+	  - GPIO pins
+	    - to get front button press events (the front button can be
+	      configured either to generate press events to the CPU or to change
+	      front LEDs panel brightness)
+	    - to enable / disable USB port voltage regulators and to detect
+	      USB overcurrent
+	    - to detect MiniPCIe / mSATA card presence in MiniPCIe port 0
+	    - to configure resets of various peripherals on board revisions 32+
+	    - to enable / disable the VHV voltage regulator to the SOC in order
+	      to be able to program SOC's OTP on board revisions 32+
+	    - to get input from the LED output pins of the WAN ethernet PHY, LAN
+	      switch and MiniPCIe ports
+	  To compile this driver as a module, choose M here; the module will be
+	  called turris-omnia-mcu.
+
+endif # CZNIC_PLATFORMS
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
new file mode 100644
index 000000000000..a43997a12d74
--- /dev/null
+++ b/drivers/platform/cznic/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
+turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
new file mode 100644
index 000000000000..b62bf1a53385
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/hex.h>
+#include <linux/module.h>
+
+#include "turris-omnia-mcu.h"
+
+static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
+				  u8 *version)
+{
+	u8 reply[20];
+	int err;
+
+	err = omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSION_BOOT :
+						       CMD_GET_FW_VERSION_APP,
+			     reply, sizeof(reply));
+	if (err)
+		return err;
+
+	version[40] = '\0';
+	bin2hex(version, reply, 20);
+
+	return 0;
+}
+
+static ssize_t fw_version_hash_show(struct device *dev, char *buf,
+				    bool bootloader)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+	u8 version[41];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%s\n", version);
+}
+
+static ssize_t fw_version_hash_application_show(struct device *dev,
+						struct device_attribute *a,
+						char *buf)
+{
+	return fw_version_hash_show(dev, buf, false);
+}
+static DEVICE_ATTR_RO(fw_version_hash_application);
+
+static ssize_t fw_version_hash_bootloader_show(struct device *dev,
+					       struct device_attribute *a,
+					       char *buf)
+{
+	return fw_version_hash_show(dev, buf, true);
+}
+static DEVICE_ATTR_RO(fw_version_hash_bootloader);
+
+static ssize_t fw_features_show(struct device *dev, struct device_attribute *a,
+				char *buf)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+
+	return sysfs_emit(buf, "%#x\n", mcu->features);
+}
+static DEVICE_ATTR_RO(fw_features);
+
+static ssize_t mcu_type_show(struct device *dev, struct device_attribute *a,
+			     char *buf)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+
+	return sysfs_emit(buf, "%s\n", mcu->type);
+}
+static DEVICE_ATTR_RO(mcu_type);
+
+static ssize_t reset_selector_show(struct device *dev,
+				   struct device_attribute *a, char *buf)
+{
+	int ret = omnia_cmd_read_u8(to_i2c_client(dev), CMD_GET_RESET);
+
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", ret);
+}
+static DEVICE_ATTR_RO(reset_selector);
+
+static struct attribute *omnia_mcu_attrs[] = {
+	&dev_attr_fw_version_hash_application.attr,
+	&dev_attr_fw_version_hash_bootloader.attr,
+	&dev_attr_fw_features.attr,
+	&dev_attr_mcu_type.attr,
+	&dev_attr_reset_selector.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(omnia_mcu);
+
+static void omnia_mcu_print_version_hash(struct omnia_mcu *mcu, bool bootloader)
+{
+	const char *type = bootloader ? "bootloader" : "application";
+	struct device *dev = &mcu->client->dev;
+	u8 version[41];
+	int err;
+
+	err = omnia_get_version_hash(mcu, bootloader, version);
+	if (err) {
+		dev_err(dev, "Cannot read MCU %s firmware version: %d\n", type,
+			err);
+		return;
+	}
+
+	dev_info(dev, "MCU %s firmware version hash: %s\n", type, version);
+}
+
+static const char *omnia_status_to_mcu_type(uint16_t status)
+{
+	switch (status & STS_MCU_TYPE_MASK) {
+	case STS_MCU_TYPE_STM32:
+		return "STM32";
+	case STS_MCU_TYPE_GD32:
+		return "GD32";
+	case STS_MCU_TYPE_MKL:
+		return "MKL";
+	default:
+		return "unknown";
+	}
+}
+
+static void omnia_info_missing_feature(struct device *dev, const char *feature)
+{
+	dev_info(dev,
+		 "Your board's MCU firmware does not support the %s feature.\n",
+		 feature);
+}
+
+static int omnia_mcu_read_features(struct omnia_mcu *mcu)
+{
+	static const struct {
+		uint16_t mask;
+		const char *name;
+	} features[] = {
+		{ FEAT_EXT_CMDS,		"extended control and status" },
+		{ FEAT_WDT_PING,		"watchdog pinging" },
+		{ FEAT_LED_STATE_EXT_MASK,	"peripheral LED pins reading" },
+		{ FEAT_NEW_INT_API,		"new interrupt API" },
+		{ FEAT_POWEROFF_WAKEUP,		"poweroff and wakeup" },
+	};
+	struct device *dev = &mcu->client->dev;
+	bool suggest_fw_upgrade = false;
+	int status;
+
+	status = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
+	if (status < 0)
+		return status;
+
+	/* check whether MCU firmware supports the CMD_GET_FEAUTRES command */
+	if (status & STS_FEATURES_SUPPORTED) {
+		int val = omnia_cmd_read_u16(mcu->client, CMD_GET_FEATURES);
+
+		if (val < 0)
+			return val;
+
+		mcu->features = val;
+	} else {
+		omnia_info_missing_feature(dev, "feature reading");
+		suggest_fw_upgrade = true;
+	}
+
+	mcu->type = omnia_status_to_mcu_type(status);
+	dev_info(dev, "MCU type %s%s\n", mcu->type,
+		 (mcu->features & FEAT_PERIPH_MCU) ?
+			", with peripheral resets wired" : "");
+
+	omnia_mcu_print_version_hash(mcu, true);
+
+	if (mcu->features & FEAT_BOOTLOADER)
+		dev_warn(dev,
+			 "MCU is running bootloader firmware. Was firmware upgrade interrupted?\n");
+	else
+		omnia_mcu_print_version_hash(mcu, false);
+
+	for (int i = 0; i < ARRAY_SIZE(features); ++i) {
+		if (!(mcu->features & features[i].mask)) {
+			omnia_info_missing_feature(dev, features[i].name);
+			suggest_fw_upgrade = true;
+		}
+	}
+
+	if (suggest_fw_upgrade)
+		dev_info(dev,
+			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
+
+	return 0;
+}
+
+static int omnia_mcu_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct omnia_mcu *mcu;
+	int ret;
+
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->client = client;
+	i2c_set_clientdata(client, mcu);
+
+	mutex_init(&mcu->lock);
+
+	ret = omnia_mcu_read_features(mcu);
+	if (ret) {
+		dev_err(dev, "Cannot determine MCU supported features: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (!client->irq) {
+		dev_err(dev, "IRQ resource not found\n");
+		return -ENODATA;
+	}
+
+	ret = omnia_mcu_register_gpiochip(mcu);
+	if (ret)
+		return ret;
+
+	ret = omnia_mcu_register_sys_off_and_wakeup(mcu);
+	if (ret)
+		return ret;
+
+	ret = omnia_mcu_register_watchdog(mcu);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void omnia_mcu_remove(struct i2c_client *client)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	omnia_mcu_unregister_gpiochip(mcu);
+}
+
+static const struct of_device_id of_omnia_mcu_match[] = {
+	{ .compatible = "cznic,turris-omnia-mcu", },
+	{},
+};
+
+static const struct i2c_device_id omnia_mcu_id[] = {
+	{ "turris-omnia-mcu", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, omnia_mcu_id);
+
+static struct i2c_driver omnia_mcu_driver = {
+	.probe		= omnia_mcu_probe,
+	.remove		= omnia_mcu_remove,
+	.id_table	= omnia_mcu_id,
+	.driver		= {
+		.name	= "turris-omnia-mcu",
+		.of_match_table = of_omnia_mcu_match,
+		.dev_groups = omnia_mcu_groups,
+	},
+};
+
+module_i2c_driver(omnia_mcu_driver);
+
+MODULE_AUTHOR("Marek Behun <kabel@kernel.org>");
+MODULE_DESCRIPTION("CZ.NIC's Turris Omnia MCU");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
new file mode 100644
index 000000000000..3ee823837106
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -0,0 +1,967 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU GPIO and IRQ driver
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#include "turris-omnia-mcu.h"
+
+static const char * const omnia_mcu_gpio_names[64] = {
+	/* GPIOs with value read from the 16-bit wide status */
+	[4]  = "gpio%u.MiniPCIe0 Card Detect",
+	[5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
+	[6]  = "gpio%u.Front USB3 port over-current",
+	[7]  = "gpio%u.Rear USB3 port over-current",
+	[8]  = "gpio%u.Front USB3 port power",
+	[9]  = "gpio%u.Rear USB3 port power",
+	[12] = "gpio%u.Front Button",
+
+	/* GPIOs with value read from the 32-bit wide extended status */
+	[16] = "gpio%u.SFP nDET",
+	[28] = "gpio%u.MiniPCIe0 LED",
+	[29] = "gpio%u.MiniPCIe1 LED",
+	[30] = "gpio%u.MiniPCIe2 LED",
+	[31] = "gpio%u.MiniPCIe0 PAN LED",
+	[32] = "gpio%u.MiniPCIe1 PAN LED",
+	[33] = "gpio%u.MiniPCIe2 PAN LED",
+	[34] = "gpio%u.WAN PHY LED0",
+	[35] = "gpio%u.WAN PHY LED1",
+	[36] = "gpio%u.LAN switch p0 LED0",
+	[37] = "gpio%u.LAN switch p0 LED1",
+	[38] = "gpio%u.LAN switch p1 LED0",
+	[39] = "gpio%u.LAN switch p1 LED1",
+	[40] = "gpio%u.LAN switch p2 LED0",
+	[41] = "gpio%u.LAN switch p2 LED1",
+	[42] = "gpio%u.LAN switch p3 LED0",
+	[43] = "gpio%u.LAN switch p3 LED1",
+	[44] = "gpio%u.LAN switch p4 LED0",
+	[45] = "gpio%u.LAN switch p4 LED1",
+	[46] = "gpio%u.LAN switch p5 LED0",
+	[47] = "gpio%u.LAN switch p5 LED1",
+
+	/* GPIOs with value read from the 16-bit wide extended control status */
+	[48] = "gpio%u.eMMC nRESET",
+	[49] = "gpio%u.LAN switch nRESET",
+	[50] = "gpio%u.WAN PHY nRESET",
+	[51] = "gpio%u.MiniPCIe0 nPERST",
+	[52] = "gpio%u.MiniPCIe1 nPERST",
+	[53] = "gpio%u.MiniPCIe2 nPERST",
+	[54] = "gpio%u.WAN PHY SFP mux",
+};
+
+#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat_mask) \
+	{								\
+		.cmd = _cmd,						\
+		.ctl_cmd = _ctl_cmd,					\
+		.bit = _bit,						\
+		.ctl_bit = _ctl_bit,					\
+		.int_bit = _int_bit,					\
+		.feat = _feat,						\
+		.feat_mask = _feat_mask,				\
+	}
+#define _DEF_GPIO_STS(_name) \
+	_DEF_GPIO(CMD_GET_STATUS_WORD, 0, STS_ ## _name, 0, INT_ ## _name, 0, 0)
+#define _DEF_GPIO_CTL(_name) \
+	_DEF_GPIO(CMD_GET_STATUS_WORD, CMD_GENERAL_CONTROL, STS_ ## _name, \
+		  CTL_ ## _name, 0, 0, 0)
+#define _DEF_GPIO_EXT_STS(_name, _feat) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_ ## _feat | FEAT_EXT_CMDS, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS)
+#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_LED_STATE_ ## _ledext, \
+		  FEAT_LED_STATE_EXT_MASK)
+#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_LED_STATE_EXT_MASK, 0)
+#define _DEF_GPIO_EXT_CTL(_name, _feat) \
+	_DEF_GPIO(CMD_GET_EXT_CONTROL_STATUS, CMD_EXT_CONTROL, \
+		  EXT_CTL_ ## _name, EXT_CTL_ ## _name, 0, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS)
+#define _DEF_INT(_name) \
+	_DEF_GPIO(0, 0, 0, 0, INT_ ## _name, 0, 0)
+
+static const struct omnia_gpio {
+	u8 cmd, ctl_cmd;
+	u32 bit, ctl_bit;
+	u32 int_bit;
+	u16 feat, feat_mask;
+} omnia_gpios[64] = {
+	/* GPIOs with value read from the 16-bit wide status */
+	[4]  = _DEF_GPIO_STS(CARD_DET),
+	[5]  = _DEF_GPIO_STS(MSATA_IND),
+	[6]  = _DEF_GPIO_STS(USB30_OVC),
+	[7]  = _DEF_GPIO_STS(USB31_OVC),
+	[8]  = _DEF_GPIO_CTL(USB30_PWRON),
+	[9]  = _DEF_GPIO_CTL(USB31_PWRON),
+
+	/* brightness changed interrupt, no GPIO */
+	[11] = _DEF_INT(BRIGHTNESS_CHANGED),
+
+	[12] = _DEF_GPIO_STS(BUTTON_PRESSED),
+
+	/* GPIOs with value read from the 32-bit wide extended status */
+	[16] = _DEF_GPIO_EXT_STS(SFP_nDET, PERIPH_MCU),
+	[28] = _DEF_GPIO_EXT_STS_LEDALL(WLAN0_MSATA_LED),
+	[29] = _DEF_GPIO_EXT_STS_LEDALL(WLAN1_LED),
+	[30] = _DEF_GPIO_EXT_STS_LEDALL(WLAN2_LED),
+	[31] = _DEF_GPIO_EXT_STS_LED(WPAN0_LED, EXT),
+	[32] = _DEF_GPIO_EXT_STS_LED(WPAN1_LED, EXT),
+	[33] = _DEF_GPIO_EXT_STS_LED(WPAN2_LED, EXT),
+	[34] = _DEF_GPIO_EXT_STS_LEDALL(WAN_LED0),
+	[35] = _DEF_GPIO_EXT_STS_LED(WAN_LED1, EXT_V32),
+	[36] = _DEF_GPIO_EXT_STS_LEDALL(LAN0_LED0),
+	[37] = _DEF_GPIO_EXT_STS_LEDALL(LAN0_LED1),
+	[38] = _DEF_GPIO_EXT_STS_LEDALL(LAN1_LED0),
+	[39] = _DEF_GPIO_EXT_STS_LEDALL(LAN1_LED1),
+	[40] = _DEF_GPIO_EXT_STS_LEDALL(LAN2_LED0),
+	[41] = _DEF_GPIO_EXT_STS_LEDALL(LAN2_LED1),
+	[42] = _DEF_GPIO_EXT_STS_LEDALL(LAN3_LED0),
+	[43] = _DEF_GPIO_EXT_STS_LEDALL(LAN3_LED1),
+	[44] = _DEF_GPIO_EXT_STS_LEDALL(LAN4_LED0),
+	[45] = _DEF_GPIO_EXT_STS_LEDALL(LAN4_LED1),
+	[46] = _DEF_GPIO_EXT_STS_LEDALL(LAN5_LED0),
+	[47] = _DEF_GPIO_EXT_STS_LEDALL(LAN5_LED1),
+
+	/* GPIOs with value read from the 16-bit wide extended control status */
+	[48] = _DEF_GPIO_EXT_CTL(nRES_MMC, PERIPH_MCU),
+	[49] = _DEF_GPIO_EXT_CTL(nRES_LAN, PERIPH_MCU),
+	[50] = _DEF_GPIO_EXT_CTL(nRES_PHY, PERIPH_MCU),
+	[51] = _DEF_GPIO_EXT_CTL(nPERST0, PERIPH_MCU),
+	[52] = _DEF_GPIO_EXT_CTL(nPERST1, PERIPH_MCU),
+	[53] = _DEF_GPIO_EXT_CTL(nPERST2, PERIPH_MCU),
+	[54] = _DEF_GPIO_EXT_CTL(PHY_SFP, PERIPH_MCU),
+};
+
+/* mapping from interrupts to indexes of GPIOs in the omnia_gpios array */
+static const unsigned int omnia_int_to_gpio_idx[32] = {
+	[ilog2(INT_CARD_DET)]		= 4,
+	[ilog2(INT_MSATA_IND)]		= 5,
+	[ilog2(INT_USB30_OVC)]		= 6,
+	[ilog2(INT_USB31_OVC)]		= 7,
+	[ilog2(INT_BUTTON_PRESSED)]	= 12,
+	[ilog2(INT_SFP_nDET)]		= 16,
+	[ilog2(INT_BRIGHTNESS_CHANGED)]	= 11,
+	[ilog2(INT_WLAN0_MSATA_LED)]	= 28,
+	[ilog2(INT_WLAN1_LED)]		= 29,
+	[ilog2(INT_WLAN2_LED)]		= 30,
+	[ilog2(INT_WPAN0_LED)]		= 31,
+	[ilog2(INT_WPAN1_LED)]		= 32,
+	[ilog2(INT_WPAN2_LED)]		= 33,
+	[ilog2(INT_WAN_LED0)]		= 34,
+	[ilog2(INT_WAN_LED1)]		= 35,
+	[ilog2(INT_LAN0_LED0)]		= 36,
+	[ilog2(INT_LAN0_LED1)]		= 37,
+	[ilog2(INT_LAN1_LED0)]		= 38,
+	[ilog2(INT_LAN1_LED1)]		= 39,
+	[ilog2(INT_LAN2_LED0)]		= 40,
+	[ilog2(INT_LAN2_LED1)]		= 41,
+	[ilog2(INT_LAN3_LED0)]		= 42,
+	[ilog2(INT_LAN3_LED1)]		= 43,
+	[ilog2(INT_LAN4_LED0)]		= 44,
+	[ilog2(INT_LAN4_LED1)]		= 45,
+	[ilog2(INT_LAN5_LED0)]		= 46,
+	[ilog2(INT_LAN5_LED1)]		= 47,
+};
+
+/* index of PHY_SFP GPIO in the omnia_gpios array */
+enum {
+	OMNIA_GPIO_PHY_SFP_OFFSET = 54,
+};
+
+static int omnia_ctl_cmd_unlocked(struct omnia_mcu *mcu, u8 cmd, u16 val,
+				  u16 mask)
+{
+	size_t len;
+	u8 buf[5];
+
+	buf[0] = cmd;
+
+	switch (cmd) {
+	case CMD_GENERAL_CONTROL:
+		buf[1] = val;
+		buf[2] = mask;
+		len = 3;
+		break;
+
+	case CMD_EXT_CONTROL:
+		put_unaligned_le16(val, &buf[1]);
+		put_unaligned_le16(mask, &buf[3]);
+		len = 5;
+		break;
+
+	default:
+		unreachable();
+	}
+
+	return omnia_cmd_write(mcu->client, buf, len);
+}
+
+static int omnia_ctl_cmd(struct omnia_mcu *mcu, u8 cmd, u16 val, u16 mask)
+{
+	int err;
+
+	mutex_lock(&mcu->lock);
+	err = omnia_ctl_cmd_unlocked(mcu, cmd, val, mask);
+	mutex_unlock(&mcu->lock);
+
+	return err;
+}
+
+static int omnia_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	if (!omnia_gpios[offset].cmd)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int omnia_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET) {
+		int val;
+
+		mutex_lock(&mcu->lock);
+		val = omnia_cmd_read_bit(mcu->client,
+					 CMD_GET_EXT_CONTROL_STATUS,
+					 EXT_CTL_PHY_SFP_AUTO);
+		mutex_unlock(&mcu->lock);
+
+		if (val < 0)
+			return val;
+
+		if (val)
+			return GPIO_LINE_DIRECTION_IN;
+		else
+			return GPIO_LINE_DIRECTION_OUT;
+	}
+
+	if (omnia_gpios[offset].ctl_cmd)
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
+static int omnia_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET)
+		return omnia_ctl_cmd(mcu, CMD_EXT_CONTROL, EXT_CTL_PHY_SFP_AUTO,
+				     EXT_CTL_PHY_SFP_AUTO);
+
+	if (gpio->ctl_cmd)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int omnia_gpio_direction_output(struct gpio_chip *gc,
+				       unsigned int offset, int value)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	uint16_t val, mask;
+
+	mask = gpio->ctl_bit;
+	val = value ? mask : 0;
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET)
+		mask |= EXT_CTL_PHY_SFP_AUTO;
+
+	if (gpio->ctl_cmd)
+		return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	else
+		return -EOPNOTSUPP;
+}
+
+static int omnia_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	int ret;
+
+	/*
+	 * If firmware does not support the new interrupt API, we are informed
+	 * of every change of the status word by an interrupt from MCU and save
+	 * its value in the interrupt service routine. Simply return the saved
+	 * value.
+	 */
+	if (gpio->cmd == CMD_GET_STATUS_WORD &&
+	    !(mcu->features & FEAT_NEW_INT_API))
+		return !!(mcu->last_status & gpio->bit);
+
+	mutex_lock(&mcu->lock);
+
+	/*
+	 * If firmware does support the new interrupt API, we may have cached
+	 * the value of a GPIO in the interrupt service routine. If not, read
+	 * the relevant bit now.
+	 */
+	if (gpio->int_bit && (mcu->is_cached & gpio->int_bit))
+		ret = !!(mcu->cached & gpio->int_bit);
+	else
+		ret = omnia_cmd_read_bit(mcu->client, gpio->cmd, gpio->bit);
+
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+
+static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u32 sts_bits, ext_sts_bits, ext_ctl_bits;
+	int err, i;
+
+	sts_bits = 0;
+	ext_sts_bits = 0;
+	ext_ctl_bits = 0;
+
+	/* determine which bits to read from the 3 possible commands */
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
+			sts_bits |= omnia_gpios[i].bit;
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
+			ext_sts_bits |= omnia_gpios[i].bit;
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
+			ext_ctl_bits |= omnia_gpios[i].bit;
+	}
+
+	mutex_lock(&mcu->lock);
+
+	if (mcu->features & FEAT_NEW_INT_API) {
+		/* read relevant bits from status */
+		err = omnia_cmd_read_bits(mcu->client, CMD_GET_STATUS_WORD,
+					  sts_bits, &sts_bits);
+		if (err)
+			goto err_unlock;
+	} else {
+		/*
+		 * Use status word value cached in the interrupt service routine
+		 * if firmware does not support the new interrupt API.
+		 */
+		sts_bits = mcu->last_status;
+	}
+
+	/* read relevant bits from extended status */
+	err = omnia_cmd_read_bits(mcu->client, CMD_GET_EXT_STATUS_DWORD,
+				  ext_sts_bits, &ext_sts_bits);
+	if (err)
+		goto err_unlock;
+
+	/* read relevant bits from extended control */
+	err = omnia_cmd_read_bits(mcu->client, CMD_GET_EXT_CONTROL_STATUS,
+				  ext_ctl_bits, &ext_ctl_bits);
+	if (err)
+		goto err_unlock;
+
+	mutex_unlock(&mcu->lock);
+
+	/* assign relevant bits in result */
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
+			assign_bit(i, bits, sts_bits & omnia_gpios[i].bit);
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
+			assign_bit(i, bits, ext_sts_bits & omnia_gpios[i].bit);
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
+			assign_bit(i, bits, ext_ctl_bits & omnia_gpios[i].bit);
+	}
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&mcu->lock);
+	return err;
+}
+
+static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u16 val, mask;
+	int err = 0;
+
+	if (!gpio->ctl_cmd)
+		return;
+
+	mask = gpio->ctl_bit;
+	val = value ? mask : 0;
+
+	err = omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	if (err)
+		dev_err(&mcu->client->dev, "Cannot set GPIO %u: %d\n",
+			offset, err);
+}
+
+static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				    unsigned long *bits)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u16 ext_ctl, ext_ctl_mask;
+	u8 ctl, ctl_mask;
+	int err = 0, i;
+
+	ctl = 0;
+	ctl_mask = 0;
+	ext_ctl = 0;
+	ext_ctl_mask = 0;
+
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].ctl_cmd == CMD_GENERAL_CONTROL) {
+			ctl_mask |= omnia_gpios[i].ctl_bit;
+			if (test_bit(i, bits))
+				ctl |= omnia_gpios[i].ctl_bit;
+		} else if (omnia_gpios[i].ctl_cmd == CMD_EXT_CONTROL) {
+			ext_ctl_mask |= omnia_gpios[i].ctl_bit;
+			if (test_bit(i, bits))
+				ext_ctl |= omnia_gpios[i].ctl_bit;
+		}
+	}
+
+	mutex_lock(&mcu->lock);
+
+	if (ctl_mask)
+		err = omnia_ctl_cmd_unlocked(mcu, CMD_GENERAL_CONTROL, ctl,
+					     ctl_mask);
+
+	if (!err && ext_ctl_mask)
+		err = omnia_ctl_cmd_unlocked(mcu, CMD_EXT_CONTROL, ext_ctl,
+					     ext_ctl_mask);
+
+	mutex_unlock(&mcu->lock);
+
+	if (err)
+		dev_err(&mcu->client->dev, "Cannot set GPIOs: %d\n", err);
+}
+
+static bool omnia_gpio_available(struct omnia_mcu *mcu,
+				 const struct omnia_gpio *gpio)
+{
+	if (gpio->feat_mask)
+		return (mcu->features & gpio->feat_mask) == gpio->feat;
+	else if (gpio->feat)
+		return mcu->features & gpio->feat;
+	else
+		return true;
+}
+
+static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	bitmap_zero(valid_mask, ngpios);
+
+	for (int i = 0; i < ngpios; ++i) {
+		const struct omnia_gpio *gpio = &omnia_gpios[i];
+
+		if (!gpio->cmd && !gpio->int_bit)
+			continue;
+
+		if (omnia_gpio_available(mcu, gpio))
+			set_bit(i, valid_mask);
+	}
+
+	return 0;
+}
+
+static void omnia_irq_shutdown(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	mcu->rising &= ~bit;
+	mcu->falling &= ~bit;
+}
+
+static void omnia_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	if (!omnia_gpios[hwirq].cmd)
+		mcu->rising &= ~bit;
+	mcu->mask &= ~bit;
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void omnia_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	gpiochip_enable_irq(gc, hwirq);
+	mcu->mask |= bit;
+	if (!omnia_gpios[hwirq].cmd)
+		mcu->rising |= bit;
+}
+
+static int omnia_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
+		dev_err(&mcu->client->dev, "irq %u: unsupported type %u\n",
+			d->irq, type);
+		return -EINVAL;
+	}
+
+	if (type & IRQ_TYPE_EDGE_RISING)
+		mcu->rising |= bit;
+	else
+		mcu->rising &= ~bit;
+
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		mcu->falling |= bit;
+	else
+		mcu->falling &= ~bit;
+
+	return 0;
+}
+
+static void omnia_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	/* nothing to do if MCU firmware does not support new interrupt API */
+	if (!(mcu->features & FEAT_NEW_INT_API))
+		return;
+
+	mutex_lock(&mcu->lock);
+}
+
+static void omnia_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u32 rising, falling;
+	u8 cmd[9];
+	int err;
+
+	/* nothing to do if MCU firmware does not support new interrupt API */
+	if (!(mcu->features & FEAT_NEW_INT_API))
+		return;
+
+	cmd[0] = CMD_SET_INT_MASK;
+
+	rising = mcu->rising & mcu->mask;
+	falling = mcu->falling & mcu->mask;
+
+	cmd[1] = rising;
+	cmd[2] = falling;
+	cmd[3] = rising >> 8;
+	cmd[4] = falling >> 8;
+	cmd[5] = rising >> 16;
+	cmd[6] = falling >> 16;
+	cmd[7] = rising >> 24;
+	cmd[8] = falling >> 24;
+
+	dev_dbg(&mcu->client->dev,
+		"set int mask %02x %02x %02x %02x %02x %02x %02x %02x\n",
+		cmd[1], cmd[2], cmd[3], cmd[4], cmd[5], cmd[6], cmd[7], cmd[8]);
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err)
+		dev_err(&mcu->client->dev, "Cannot set mask: %d\n", err);
+
+	/*
+	 * Remember which GPIOs have both rising and falling interrupts enabled.
+	 * For those we will cache their value so that .get() method is faster.
+	 * We also need to forget cached values of GPIOs that aren't cached
+	 * anymore.
+	 */
+	if (!err) {
+		mcu->both = rising & falling;
+		mcu->is_cached &= mcu->both;
+	}
+
+	mutex_unlock(&mcu->lock);
+}
+
+static const struct irq_chip omnia_mcu_irq_chip = {
+	.name			= "Turris Omnia MCU interrupts",
+	.irq_shutdown		= omnia_irq_shutdown,
+	.irq_mask		= omnia_irq_mask,
+	.irq_unmask		= omnia_irq_unmask,
+	.irq_set_type		= omnia_irq_set_type,
+	.irq_bus_lock		= omnia_irq_bus_lock,
+	.irq_bus_sync_unlock	= omnia_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void omnia_irq_init_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	bitmap_zero(valid_mask, ngpios);
+
+	for (int i = 0; i < ngpios; ++i) {
+		const struct omnia_gpio *gpio = &omnia_gpios[i];
+
+		if (!gpio->int_bit)
+			continue;
+
+		if (omnia_gpio_available(mcu, gpio))
+			set_bit(i, valid_mask);
+	}
+}
+
+static int omnia_irq_init_hw(struct gpio_chip *gc)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u8 cmd[9] = {};
+
+	cmd[0] = CMD_SET_INT_MASK;
+
+	return omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+}
+
+static bool omnia_irq_read_pending_new(struct omnia_mcu *mcu,
+				       unsigned long *pending)
+{
+	u32 rising, falling;
+	u8 reply[8] = {};
+	size_t len;
+	int err;
+
+	/*
+	 * Determine how many bytes we need to read from the reply to the
+	 * CMD_GET_INT_AND_CLEAR command in order to retrieve all unmasked
+	 * interrupts.
+	 */
+	len = max(((ilog2(mcu->rising & mcu->mask) >> 3) << 1) + 1,
+		  ((ilog2(mcu->falling & mcu->mask) >> 3) << 1) + 2);
+
+	mutex_lock(&mcu->lock);
+
+	err = omnia_cmd_read(mcu->client, CMD_GET_INT_AND_CLEAR, reply,
+			     len);
+	if (err) {
+		mutex_unlock(&mcu->lock);
+		dev_err(&mcu->client->dev, "Cannot read pending IRQs: %d\n",
+			err);
+		return false;
+	}
+
+	rising = reply[0] | (reply[2] << 8) | (reply[4] << 16) |
+		 (reply[6] << 24);
+	falling = reply[1] | (reply[3] << 8) | (reply[5] << 16) |
+		  (reply[7] << 24);
+
+	rising &= mcu->mask;
+	falling &= mcu->mask;
+	*pending = rising | falling;
+
+	/* cache values for GPIOs that have both edges enabled */
+	mcu->is_cached &= ~(rising & falling);
+	mcu->is_cached |= mcu->both & (rising ^ falling);
+	mcu->cached = (mcu->cached | rising) & ~falling;
+
+	mutex_unlock(&mcu->lock);
+
+	return true;
+}
+
+static int omnia_read_status_word_old_fw(struct omnia_mcu *mcu, u16 *status)
+{
+	int ret = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Old firmware has a bug wherein it never resets the USB port
+	 * overcurrent bits back to zero. Ignore them.
+	 */
+	*status = ret & ~(STS_USB30_OVC | STS_USB31_OVC);
+
+	return 0;
+}
+
+static void button_release_emul_fn(struct work_struct *work)
+{
+	struct omnia_mcu *mcu = container_of(to_delayed_work(work),
+					     struct omnia_mcu,
+					     button_release_emul_work);
+
+	mcu->button_pressed_emul = false;
+	generic_handle_irq_safe(mcu->client->irq);
+}
+
+static void fill_int_from_sts(u32 *rising, u32 *falling, u16 rising_sts,
+			      u16 falling_sts, u16 sts_bit, u32 int_bit)
+{
+	if (rising_sts & sts_bit)
+		*rising |= int_bit;
+	if (falling_sts & sts_bit)
+		*falling |= int_bit;
+}
+
+static bool omnia_irq_read_pending_old(struct omnia_mcu *mcu,
+				       unsigned long *pending)
+{
+	u16 status, rising_sts, falling_sts;
+	u32 rising, falling;
+	int ret;
+
+	mutex_lock(&mcu->lock);
+
+	ret = omnia_read_status_word_old_fw(mcu, &status);
+	if (ret < 0) {
+		mutex_unlock(&mcu->lock);
+		dev_err(&mcu->client->dev, "Cannot read pending IRQs: %d\n",
+			ret);
+		return false;
+	}
+
+	/*
+	 * The old firmware triggers an interrupt whenever status word changes,
+	 * but does not inform about which bits rose or fell. We need to compute
+	 * this here by comparing with the last status word value.
+	 *
+	 * The STS_BUTTON_PRESSED bit needs special handling, because the old
+	 * firmware clears the STS_BUTTON_PRESSED bit on successful completion
+	 * of the CMD_GET_STATUS_WORD command, resulting in another interrupt:
+	 * - first we get an interrupt, we read the status word where
+	 *   STS_BUTTON_PRESSED is present,
+	 * - MCU clears the STS_BUTTON_PRESSED bit because we read the status
+	 *   word,
+	 * - we get another interrupt because the status word changed again
+	 *   (STS_BUTTON_PRESSED was cleared).
+	 *
+	 * The gpiolib-cdev, gpiolib-sysfs and gpio-keys input driver all call
+	 * the gpiochip's .get() method after an edge event on a requested GPIO
+	 * occurs.
+	 *
+	 * We ensure that the .get() method reads 1 for the button GPIO for some
+	 * time.
+	 */
+
+	if (status & STS_BUTTON_PRESSED) {
+		mcu->button_pressed_emul = true;
+		mod_delayed_work(system_wq, &mcu->button_release_emul_work,
+				 msecs_to_jiffies(50));
+	} else if (mcu->button_pressed_emul) {
+		status |= STS_BUTTON_PRESSED;
+	}
+
+	rising_sts = ~mcu->last_status & status;
+	falling_sts = mcu->last_status & ~status;
+
+	mcu->last_status = status;
+
+	/*
+	 * Fill in the relevant interrupt bits from status bits for CARD_DET,
+	 * MSATA_IND and BUTTON_PRESSED.
+	 */
+	rising = 0;
+	falling = 0;
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_CARD_DET, INT_CARD_DET);
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_MSATA_IND, INT_MSATA_IND);
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_BUTTON_PRESSED, INT_BUTTON_PRESSED);
+
+	/* Use only bits that are enabled */
+	rising &= mcu->rising & mcu->mask;
+	falling &= mcu->falling & mcu->mask;
+	*pending = rising | falling;
+
+	mutex_unlock(&mcu->lock);
+
+	return true;
+}
+
+static bool omnia_irq_read_pending(struct omnia_mcu *mcu,
+				   unsigned long *pending)
+{
+	if (mcu->features & FEAT_NEW_INT_API)
+		return omnia_irq_read_pending_new(mcu, pending);
+	else
+		return omnia_irq_read_pending_old(mcu, pending);
+}
+
+static irqreturn_t omnia_irq_thread_handler(int irq, void *dev_id)
+{
+	struct omnia_mcu *mcu = dev_id;
+	irqreturn_t res = IRQ_NONE;
+	unsigned long pending;
+	int i;
+
+	if (!omnia_irq_read_pending(mcu, &pending))
+		return IRQ_NONE;
+
+	for_each_set_bit(i, &pending, 32) {
+		unsigned int nested_irq =
+			irq_find_mapping(mcu->gc.irq.domain,
+					 omnia_int_to_gpio_idx[i]);
+
+		handle_nested_irq(nested_irq);
+
+		res = IRQ_HANDLED;
+	}
+
+	return res;
+}
+
+static ssize_t front_button_mode_show(struct device *dev,
+				      struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+	int val;
+
+	if (mcu->features & FEAT_NEW_INT_API)
+		val = omnia_cmd_read_bit(mcu->client, CMD_GET_STATUS_WORD,
+					 STS_BUTTON_MODE);
+	else
+		val = !!(mcu->last_status & STS_BUTTON_MODE);
+
+	if (val < 0)
+		return val;
+
+	return sysfs_emit(buf, "%s\n", val ? "cpu" : "mcu");
+}
+
+static ssize_t front_button_mode_store(struct device *dev,
+				       struct device_attribute *a,
+				       const char *buf, size_t count)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+	u8 mask, val;
+	int err;
+
+	mask = CTL_BUTTON_MODE;
+
+	if (sysfs_streq(buf, "mcu"))
+		val = 0;
+	else if (sysfs_streq(buf, "cpu"))
+		val = mask;
+	else
+		return -EINVAL;
+
+	err = omnia_ctl_cmd_unlocked(mcu, CMD_GENERAL_CONTROL, val, mask);
+	if (err)
+		return err;
+
+	return count;
+}
+static DEVICE_ATTR_RW(front_button_mode);
+
+static struct attribute *omnia_mcu_gpio_attrs[] = {
+	&dev_attr_front_button_mode.attr,
+	NULL,
+};
+
+static const struct attribute_group omnia_mcu_gpio_group = {
+	.attrs = omnia_mcu_gpio_attrs,
+};
+
+int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
+{
+	bool new_api = mcu->features & FEAT_NEW_INT_API;
+	struct device *dev = &mcu->client->dev;
+	unsigned long irqflags;
+	int err;
+
+	mcu->gc.request = omnia_gpio_request;
+	mcu->gc.get_direction = omnia_gpio_get_direction;
+	mcu->gc.direction_input = omnia_gpio_direction_input;
+	mcu->gc.direction_output = omnia_gpio_direction_output;
+	mcu->gc.get = omnia_gpio_get;
+	mcu->gc.get_multiple = omnia_gpio_get_multiple;
+	mcu->gc.set = omnia_gpio_set;
+	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
+	mcu->gc.can_sleep = true;
+	mcu->gc.names = omnia_mcu_gpio_names;
+	mcu->gc.base = -1;
+	mcu->gc.ngpio = ARRAY_SIZE(omnia_gpios);
+	mcu->gc.label = "Turris Omnia MCU GPIOs";
+	mcu->gc.parent = dev;
+	mcu->gc.owner = THIS_MODULE;
+
+	gpio_irq_chip_set_chip(&mcu->gc.irq, &omnia_mcu_irq_chip);
+	/* This will let us handle the parent IRQ in the driver */
+	mcu->gc.irq.parent_handler = NULL;
+	mcu->gc.irq.num_parents = 0;
+	mcu->gc.irq.parents = NULL;
+	mcu->gc.irq.default_type = IRQ_TYPE_NONE;
+	mcu->gc.irq.handler = handle_bad_irq;
+	mcu->gc.irq.threaded = true;
+	if (new_api)
+		mcu->gc.irq.init_hw = omnia_irq_init_hw;
+	mcu->gc.irq.init_valid_mask = omnia_irq_init_valid_mask;
+
+	err = devm_gpiochip_add_data(dev, &mcu->gc, mcu);
+	if (err) {
+		dev_err(dev, "Cannot add GPIO chip: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * Before requesting the interrupt, if firmware does not support the new
+	 * interrupt API, we need to cache the value of the status word, so that
+	 * when it changes, we may compare the new value with the cached one in
+	 * the interrupt handler.
+	 */
+	if (!new_api) {
+		err = omnia_read_status_word_old_fw(mcu, &mcu->last_status);
+		if (err < 0) {
+			dev_err(dev, "Cannot read status word: %d\n", err);
+			return err;
+		}
+
+		INIT_DELAYED_WORK(&mcu->button_release_emul_work,
+				  button_release_emul_fn);
+	}
+
+	irqflags = IRQF_ONESHOT;
+	if (new_api)
+		irqflags |= IRQF_TRIGGER_LOW;
+	else
+		irqflags |= IRQF_TRIGGER_FALLING;
+
+	err = devm_request_threaded_irq(dev, mcu->client->irq, NULL,
+					omnia_irq_thread_handler, irqflags,
+					"turris-omnia-mcu", mcu);
+	if (err) {
+		dev_err(dev, "Cannot request IRQ: %d\n", err);
+		return err;
+	}
+
+	err = devm_device_add_group(dev, &omnia_mcu_gpio_group);
+	if (err)
+		dev_err(dev, "Cannot add GPIO sysfs attribute group: %d\n",
+			err);
+
+	return err;
+}
+
+void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu)
+{
+	if (!(mcu->features & FEAT_NEW_INT_API))
+		cancel_delayed_work_sync(&mcu->button_release_emul_work);
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
new file mode 100644
index 000000000000..07ae92d819e3
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU system off and RTC wakeup driver
+ *
+ * This is not a true RTC driver (in the sense that it does not provide a
+ * real-time clock), rather the MCU implements a wakeup from powered off state
+ * at a specified time relative to MCU boot, and we expose this feature via RTC
+ * alarm, so that it can be used via the rtcwake command, which is the standard
+ * Linux command for this.
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/crc32.h>
+#include <linux/delay.h>
+#include <linux/reboot.h>
+
+#include "turris-omnia-mcu.h"
+
+static int omnia_get_uptime_wakeup(const struct i2c_client *client, u32 *uptime,
+				   u32 *wakeup)
+{
+	u32 reply[2];
+	int err;
+
+	err = omnia_cmd_read(client, CMD_GET_UPTIME_AND_WAKEUP, reply,
+			     sizeof(reply));
+	if (err)
+		return err;
+
+	if (uptime)
+		*uptime = le32_to_cpu(reply[0]);
+
+	if (wakeup)
+		*wakeup = le32_to_cpu(reply[1]);
+
+	return 0;
+}
+
+static int omnia_read_time(struct device *dev, struct rtc_time *tm)
+{
+	u32 uptime;
+	int err;
+
+	err = omnia_get_uptime_wakeup(to_i2c_client(dev), &uptime, NULL);
+	if (err)
+		return err;
+
+	rtc_time64_to_tm(uptime, tm);
+
+	return 0;
+}
+
+static int omnia_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+	u32 wakeup;
+	int err;
+
+	err = omnia_get_uptime_wakeup(client, NULL, &wakeup);
+	if (err)
+		return err;
+
+	alrm->enabled = !!wakeup;
+	rtc_time64_to_tm(wakeup ?: mcu->rtc_alarm, &alrm->time);
+
+	return 0;
+}
+
+static int omnia_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	mcu->rtc_alarm = rtc_tm_to_time64(&alrm->time);
+
+	if (alrm->enabled)
+		return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
+					   mcu->rtc_alarm);
+	else
+		return 0;
+}
+
+static int omnia_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
+				   enabled ? mcu->rtc_alarm : 0);
+}
+
+static const struct rtc_class_ops omnia_rtc_ops = {
+	.read_time		= omnia_read_time,
+	.read_alarm		= omnia_read_alarm,
+	.set_alarm		= omnia_set_alarm,
+	.alarm_irq_enable	= omnia_alarm_irq_enable,
+};
+
+static int omnia_power_off(struct sys_off_data *data)
+{
+	struct omnia_mcu *mcu = data->cb_data;
+	u8 cmd[9];
+	u32 tmp;
+	u16 arg;
+	int err;
+
+	if (mcu->front_button_poweron)
+		arg = CMD_POWER_OFF_POWERON_BUTTON;
+	else
+		arg = 0;
+
+	cmd[0] = CMD_POWER_OFF;
+	put_unaligned_le16(CMD_POWER_OFF_MAGIC, &cmd[1]);
+	put_unaligned_le16(arg, &cmd[3]);
+
+	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
+	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
+			   &cmd[5]);
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err)
+		dev_err(&mcu->client->dev,
+			"Unable to send the poweroff command: %d\n", err);
+
+	return NOTIFY_DONE;
+}
+
+static int omnia_restart(struct sys_off_data *data)
+{
+	struct omnia_mcu *mcu = data->cb_data;
+	u8 cmd[3];
+	int err;
+
+	cmd[0] = CMD_GENERAL_CONTROL;
+
+	if (reboot_mode == REBOOT_HARD)
+		cmd[1] = cmd[2] = CTL_HARD_RST;
+	else
+		cmd[1] = cmd[2] = CTL_LIGHT_RST;
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err)
+		dev_err(&mcu->client->dev,
+			"Unable to send the restart command: %d\n", err);
+
+	/*
+	 * MCU needs a little bit to process the I2C command, otherwise it will
+	 * do a light reset based on SOC SYSRES_OUT pin.
+	 */
+	mdelay(1);
+
+	return NOTIFY_DONE;
+}
+
+static ssize_t front_button_poweron_show(struct device *dev,
+					 struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+
+	return sysfs_emit(buf, "%d\n", mcu->front_button_poweron);
+}
+
+static ssize_t front_button_poweron_store(struct device *dev,
+					  struct device_attribute *a,
+					  const char *buf, size_t count)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
+	bool val;
+
+	if (kstrtobool(buf, &val) < 0)
+		return -EINVAL;
+
+	mcu->front_button_poweron = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(front_button_poweron);
+
+static struct attribute *omnia_mcu_poweroff_attrs[] = {
+	&dev_attr_front_button_poweron.attr,
+	NULL,
+};
+
+static const struct attribute_group omnia_mcu_poweroff_group = {
+	.attrs = omnia_mcu_poweroff_attrs,
+};
+
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu)
+{
+	struct device *dev = &mcu->client->dev;
+	int err;
+
+	/* MCU restart is always available */
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    omnia_restart, mcu);
+	if (err) {
+		dev_err(dev, "Cannot register system restart handler: %d\n",
+			err);
+		return err;
+	}
+
+	/*
+	 * poweroff and wakeup are available only if POWEROFF_WAKEUP feature is
+	 * present
+	 */
+	if (!(mcu->features & FEAT_POWEROFF_WAKEUP))
+		return 0;
+
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    omnia_power_off, mcu);
+	if (err) {
+		dev_err(dev, "Cannot register system power off handler: %d\n",
+			err);
+		return err;
+	}
+
+	mcu->rtcdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(mcu->rtcdev)) {
+		err = PTR_ERR(mcu->rtcdev);
+		dev_err(dev, "Cannot allocate RTC device: %d\n", err);
+		return err;
+	}
+
+	mcu->rtcdev->ops = &omnia_rtc_ops;
+	mcu->rtcdev->range_max = U32_MAX;
+
+	err = devm_rtc_register_device(mcu->rtcdev);
+	if (err) {
+		dev_err(dev, "Cannot register RTC device: %d\n", err);
+		return err;
+	}
+
+	mcu->front_button_poweron = true;
+
+	err = devm_device_add_group(dev, &omnia_mcu_poweroff_group);
+	if (err)
+		dev_err(dev, "Cannot add poweroff sysfs attribute group: %d\n",
+			err);
+
+	return err;
+}
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
new file mode 100644
index 000000000000..b7fcfeca013a
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU driver
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
+#define __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
+
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/log2.h>
+#include <linux/mutex.h>
+#include <linux/rtc.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/watchdog.h>
+#include <linux/workqueue.h>
+
+struct omnia_mcu {
+	struct i2c_client *client;
+	const char *type;
+	u16 features;
+
+	/* GPIO chip */
+	struct gpio_chip gc;
+	struct mutex lock;
+	u32 mask, rising, falling, both, cached, is_cached;
+	/* Old MCU firmware handling needs the following */
+	u16 last_status;
+	struct delayed_work button_release_emul_work;
+	bool button_pressed_emul;
+
+	/* RTC device for configuring wake-up */
+	struct rtc_device *rtcdev;
+	u32 rtc_alarm;
+	bool front_button_poweron;
+
+	/* MCU watchdog */
+	struct watchdog_device wdt;
+};
+
+static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
+				  size_t len)
+{
+	int ret = i2c_master_send(client, cmd, len);
+
+	return ret < 0 ? ret : 0;
+}
+
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
+static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
+				      u32 val)
+{
+	u8 buf[5];
+
+	buf[0] = cmd;
+	put_unaligned_le32(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
+				 size_t len)
+{
+	struct i2c_msg msgs[2];
+	int ret;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &cmd;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = reply;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (likely(ret == ARRAY_SIZE(msgs)))
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
+				      u32 bits, u32 *reply)
+{
+	int err;
+
+	if (!bits) {
+		*reply = 0;
+		return 0;
+	}
+
+	err = omnia_cmd_read(client, cmd, reply, (ilog2(bits) >> 3) + 1);
+
+	if (!err)
+		*reply = le32_to_cpu(*reply) & bits;
+
+	return err;
+}
+
+static inline int omnia_cmd_read_bit(const struct i2c_client *client, u8 cmd,
+				     u32 bit)
+{
+	u32 reply;
+	int err;
+
+	err = omnia_cmd_read_bits(client, cmd, bit, &reply);
+	if (err)
+		return err;
+
+	return !!reply;
+}
+
+static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd)
+{
+	u16 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+
+	return err ?: le16_to_cpu(reply);
+}
+
+static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
+{
+	u8 reply;
+	int err;
+
+	err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
+
+	return err ?: reply;
+}
+
+int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
+int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
+
+#endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */
diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
new file mode 100644
index 000000000000..888dc74c5ec0
--- /dev/null
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CZ.NIC's Turris Omnia MCU I2C interface commands definitions
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#ifndef __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H
+#define __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H
+
+#include <linux/bits.h>
+
+enum commands_e {
+	CMD_GET_STATUS_WORD		= 0x01, /* slave sends status word back */
+	CMD_GENERAL_CONTROL		= 0x02,
+	CMD_LED_MODE			= 0x03, /* default/user */
+	CMD_LED_STATE			= 0x04, /* LED on/off */
+	CMD_LED_COLOR			= 0x05, /* LED number + RED + GREEN + BLUE */
+	CMD_USER_VOLTAGE		= 0x06,
+	CMD_SET_BRIGHTNESS		= 0x07,
+	CMD_GET_BRIGHTNESS		= 0x08,
+	CMD_GET_RESET			= 0x09,
+	CMD_GET_FW_VERSION_APP		= 0x0A, /* 20B git hash number */
+	CMD_SET_WATCHDOG_STATE		= 0x0B, /* 0 - disable
+						 * 1 - enable / ping
+						 * after boot watchdog is started
+						 * with 2 minutes timeout
+						 */
+
+	/* CMD_WATCHDOG_STATUS		= 0x0C, not implemented anymore */
+
+	CMD_GET_WATCHDOG_STATE		= 0x0D,
+	CMD_GET_FW_VERSION_BOOT		= 0x0E, /* 20B git hash number */
+	CMD_GET_FW_CHECKSUM		= 0x0F, /* 4B length, 4B checksum */
+
+	/* available if FEATURES_SUPPORTED bit set in status word */
+	CMD_GET_FEATURES		= 0x10,
+
+	/* available if EXT_CMD bit set in features */
+	CMD_GET_EXT_STATUS_DWORD	= 0x11,
+	CMD_EXT_CONTROL			= 0x12,
+	CMD_GET_EXT_CONTROL_STATUS	= 0x13,
+
+	/* available if NEW_INT_API bit set in features */
+	CMD_GET_INT_AND_CLEAR		= 0x14,
+	CMD_GET_INT_MASK		= 0x15,
+	CMD_SET_INT_MASK		= 0x16,
+
+	/* available if FLASHING bit set in features */
+	CMD_FLASH			= 0x19,
+
+	/* available if WDT_PING bit set in features */
+	CMD_SET_WDT_TIMEOUT		= 0x20,
+	CMD_GET_WDT_TIMELEFT		= 0x21,
+
+	/* available if POWEROFF_WAKEUP bit set in features */
+	CMD_SET_WAKEUP			= 0x22,
+	CMD_GET_UPTIME_AND_WAKEUP	= 0x23,
+	CMD_POWER_OFF			= 0x24,
+
+	/* available only at address 0x2b (led-controller) */
+	/* available only if LED_GAMMA_CORRECTION bit set in features */
+	CMD_SET_GAMMA_CORRECTION	= 0x30,
+	CMD_GET_GAMMA_CORRECTION	= 0x31,
+};
+
+enum flashing_commands_e {
+	FLASH_CMD_UNLOCK		= 0x01,
+	FLASH_CMD_SIZE_AND_CSUM		= 0x02,
+	FLASH_CMD_PROGRAM		= 0x03,
+	FLASH_CMD_RESET			= 0x04,
+};
+
+enum sts_word_e {
+	STS_MCU_TYPE_MASK			= GENMASK(1, 0),
+	STS_MCU_TYPE_STM32			= 0 << 0,
+	STS_MCU_TYPE_GD32			= 1 << 0,
+	STS_MCU_TYPE_MKL			= 2 << 0,
+	STS_FEATURES_SUPPORTED			= BIT(2),
+	STS_USER_REGULATOR_NOT_SUPPORTED	= BIT(3),
+	STS_CARD_DET				= BIT(4),
+	STS_MSATA_IND				= BIT(5),
+	STS_USB30_OVC				= BIT(6),
+	STS_USB31_OVC				= BIT(7),
+	STS_USB30_PWRON				= BIT(8),
+	STS_USB31_PWRON				= BIT(9),
+	STS_ENABLE_4V5				= BIT(10),
+	STS_BUTTON_MODE				= BIT(11),
+	STS_BUTTON_PRESSED			= BIT(12),
+	STS_BUTTON_COUNTER_MASK			= GENMASK(15, 13)
+};
+
+enum ctl_byte_e {
+	CTL_LIGHT_RST		= BIT(0),
+	CTL_HARD_RST		= BIT(1),
+	/*CTL_RESERVED		= BIT(2),*/
+	CTL_USB30_PWRON		= BIT(3),
+	CTL_USB31_PWRON		= BIT(4),
+	CTL_ENABLE_4V5		= BIT(5),
+	CTL_BUTTON_MODE		= BIT(6),
+	CTL_BOOTLOADER		= BIT(7)
+};
+
+enum features_e {
+	FEAT_PERIPH_MCU			= BIT(0),
+	FEAT_EXT_CMDS			= BIT(1),
+	FEAT_WDT_PING			= BIT(2),
+	FEAT_LED_STATE_EXT_MASK		= GENMASK(4, 3),
+	FEAT_LED_STATE_EXT		= 1 << 3,
+	FEAT_LED_STATE_EXT_V32		= 2 << 3,
+	FEAT_LED_GAMMA_CORRECTION	= BIT(5),
+	FEAT_NEW_INT_API		= BIT(6),
+	FEAT_BOOTLOADER			= BIT(7),
+	FEAT_FLASHING			= BIT(8),
+	FEAT_NEW_MESSAGE_API		= BIT(9),
+	FEAT_BRIGHTNESS_INT		= BIT(10),
+	FEAT_POWEROFF_WAKEUP		= BIT(11),
+};
+
+enum ext_sts_dword_e {
+	EXT_STS_SFP_nDET		= BIT(0),
+	EXT_STS_LED_STATES_MASK		= GENMASK(31, 12),
+	EXT_STS_WLAN0_MSATA_LED		= BIT(12),
+	EXT_STS_WLAN1_LED		= BIT(13),
+	EXT_STS_WLAN2_LED		= BIT(14),
+	EXT_STS_WPAN0_LED		= BIT(15),
+	EXT_STS_WPAN1_LED		= BIT(16),
+	EXT_STS_WPAN2_LED		= BIT(17),
+	EXT_STS_WAN_LED0		= BIT(18),
+	EXT_STS_WAN_LED1		= BIT(19),
+	EXT_STS_LAN0_LED0		= BIT(20),
+	EXT_STS_LAN0_LED1		= BIT(21),
+	EXT_STS_LAN1_LED0		= BIT(22),
+	EXT_STS_LAN1_LED1		= BIT(23),
+	EXT_STS_LAN2_LED0		= BIT(24),
+	EXT_STS_LAN2_LED1		= BIT(25),
+	EXT_STS_LAN3_LED0		= BIT(26),
+	EXT_STS_LAN3_LED1		= BIT(27),
+	EXT_STS_LAN4_LED0		= BIT(28),
+	EXT_STS_LAN4_LED1		= BIT(29),
+	EXT_STS_LAN5_LED0		= BIT(30),
+	EXT_STS_LAN5_LED1		= BIT(31),
+};
+
+enum ext_ctl_e {
+	EXT_CTL_nRES_MMC		= BIT(0),
+	EXT_CTL_nRES_LAN		= BIT(1),
+	EXT_CTL_nRES_PHY		= BIT(2),
+	EXT_CTL_nPERST0			= BIT(3),
+	EXT_CTL_nPERST1			= BIT(4),
+	EXT_CTL_nPERST2			= BIT(5),
+	EXT_CTL_PHY_SFP			= BIT(6),
+	EXT_CTL_PHY_SFP_AUTO		= BIT(7),
+	EXT_CTL_nVHV_CTRL		= BIT(8),
+};
+
+enum int_e {
+	INT_CARD_DET		= BIT(0),
+	INT_MSATA_IND		= BIT(1),
+	INT_USB30_OVC		= BIT(2),
+	INT_USB31_OVC		= BIT(3),
+	INT_BUTTON_PRESSED	= BIT(4),
+	INT_SFP_nDET		= BIT(5),
+	INT_BRIGHTNESS_CHANGED	= BIT(6),
+
+	INT_LED_STATES_MASK	= GENMASK(31, 12),
+	INT_WLAN0_MSATA_LED	= BIT(12),
+	INT_WLAN1_LED		= BIT(13),
+	INT_WLAN2_LED		= BIT(14),
+	INT_WPAN0_LED		= BIT(15),
+	INT_WPAN1_LED		= BIT(16),
+	INT_WPAN2_LED		= BIT(17),
+	INT_WAN_LED0		= BIT(18),
+	INT_WAN_LED1		= BIT(19),
+	INT_LAN0_LED0		= BIT(20),
+	INT_LAN0_LED1		= BIT(21),
+	INT_LAN1_LED0		= BIT(22),
+	INT_LAN1_LED1		= BIT(23),
+	INT_LAN2_LED0		= BIT(24),
+	INT_LAN2_LED1		= BIT(25),
+	INT_LAN3_LED0		= BIT(26),
+	INT_LAN3_LED1		= BIT(27),
+	INT_LAN4_LED0		= BIT(28),
+	INT_LAN4_LED1		= BIT(29),
+	INT_LAN5_LED0		= BIT(30),
+	INT_LAN5_LED1		= BIT(31),
+};
+
+enum cmd_poweroff_e {
+	CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
+	CMD_POWER_OFF_MAGIC		= 0xdead,
+};
+
+#endif /* __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H */
-- 
2.41.0

