Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F396CD54B1
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 10:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11F8CC433C8; Tue, 19 Sep 2023 10:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF71AC433C9;
	Tue, 19 Sep 2023 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695119910;
	bh=0E7m/rdyupbcYdm43C+vVa5WgzuGiichffXS8y7cCYg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ad2cheSHmbPe91/2vq9UvwwwNhockRKHZr6QZ9cIsulMJlNxX17AJCkK99g7IhD9x
	 LHTjh3WWmgb2kH3Fip2fCYzBxBAXy1tEFFbYh7Gj4AUOppKQp6ZuBukBuDtwDymU8k
	 TNRj8bCKbaEOwiU1VWN3tVQfHAgv32is3ceOgxNs679Wb4AKsdfKVL9K0Rzsx1/A5a
	 nc+582zuRhLBBZbMKWhXj1FgvIvGl73KOR+l+T8qpUd6v4D6aVxHq9T18nFZQ8hmSu
	 VjRIxsuNTw6iIwNxZ9jzDw9ONM+00pi7g4PUQY3Z0cGZ7oaclW4x39HsiCmFIgyBfG
	 +xnngzhMU2dgw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
Date: Tue, 19 Sep 2023 12:38:11 +0200
Message-ID: <20230919103815.16818-4-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919103815.16818-1-kabel@kernel.org>
References: <20230919103815.16818-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for GPIOs connected to the MCU on the Turris Omnia board.

This include:
- front button pin
- enable pins for USB regulators
- MiniPCIe / mSATA card presence pins in MiniPCIe port 0
- LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
- on board revisions 32+ also various peripheral resets and another
  voltage regulator enable pin

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  16 +
 drivers/platform/cznic/Kconfig                |  15 +
 drivers/platform/cznic/Makefile               |   1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  12 +
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 973 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  56 +
 6 files changed, 1073 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index 69a4db7e20c0..c0efdf1b3803 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -1,3 +1,19 @@
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
 What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
 Date:		August 2023
 KernelVersion:	6.6
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index f8560ff9c1af..3a8c3edcd7e6 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -17,9 +17,24 @@ config TURRIS_OMNIA_MCU
 	tristate "Turris Omnia MCU driver"
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
+	  The features include:
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
 	  To compile this driver as a module, choose M here; the module will be
 	  called turris-omnia-mcu.
 
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 4d0a9586538c..a6177f5b4fff 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 2d3c3f9c68fc..2954151468e5 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -222,9 +222,20 @@ static int omnia_mcu_probe(struct i2c_client *client)
 		return -ENODATA;
 	}
 
+	ret = omnia_mcu_register_gpiochip(mcu);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
+static void omnia_mcu_remove(struct i2c_client *client)
+{
+	struct omnia_mcu *mcu = i2c_get_clientdata(client);
+
+	omnia_mcu_unregister_gpiochip(mcu);
+}
+
 static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu", },
 	{},
@@ -238,6 +249,7 @@ MODULE_DEVICE_TABLE(i2c, omnia_mcu_id);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
+	.remove		= omnia_mcu_remove,
 	.id_table	= omnia_mcu_id,
 	.driver		= {
 		.name	= "turris-omnia-mcu",
diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
new file mode 100644
index 000000000000..e8d5eeb4eb31
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -0,0 +1,973 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU GPIO and IRQ driver
+ *
+ * 2023 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <asm/unaligned.h>
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
+	mutex_init(&mcu->lock);
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
+
+	mutex_destroy(&mcu->lock);
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index a045b114e293..b5802240aa8d 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -9,15 +9,36 @@
 #define __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
 
 #include <asm/byteorder.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
+#include <linux/log2.h>
+#include <linux/mutex.h>
 #include <linux/turris-omnia-mcu-interface.h>
+#include <linux/workqueue.h>
 
 struct omnia_mcu {
 	struct i2c_client *client;
 	const char *type;
 	u16 features;
+
+	/* GPIO chip */
+	struct gpio_chip gc;
+	struct mutex lock;
+	u32 mask, rising, falling, both, cached, is_cached;
+	/* Old MCU firmware handling needs the following */
+	u16 last_status;
+	struct delayed_work button_release_emul_work;
+	bool button_pressed_emul;
 };
 
+static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
+				  size_t len)
+{
+	int ret = i2c_master_send(client, cmd, len);
+
+	return ret < 0 ? ret : 0;
+}
+
 static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
 				 unsigned int len)
 {
@@ -42,6 +63,38 @@ static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *
 		return -EIO;
 }
 
+/* Returns 0 on success */
+static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
+				      u32 bits, u32 *reply)
+{
+	int ret;
+
+	if (!bits) {
+		*reply = 0;
+		return 0;
+	}
+
+	ret = omnia_cmd_read(client, cmd, reply, (ilog2(bits) >> 3) + 1);
+
+	if (ret >= 0)
+		*reply = le32_to_cpu(*reply) & bits;
+
+	return ret < 0 ? ret : 0;
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
 static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd)
 {
 	u16 reply;
@@ -62,4 +115,7 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 	return ret < 0 ? ret : reply;
 }
 
+int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
+
 #endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */
-- 
2.41.0

