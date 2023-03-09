Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6FCC64EC4
	for <soc@archiver.kernel.org>; Thu,  9 Mar 2023 20:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1682AC433EF; Thu,  9 Mar 2023 20:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5134C433D2;
	Thu,  9 Mar 2023 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394130;
	bh=R/I2lsM1eQKy21CT04bs2JBmt6ZytzQdTMlcF34vD58=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=WDMPpMwKBplGOcEZgQ3FHG/72ztR90v3CjQOvqWXWezSGn/crqDdGQQSSi5aj683+
	 TpcsGDyhS9ZLMmwLaO5fgs7XDh1ax9+XvDnkKgJ5B3r1qrXuBgTs9AfCYVZjFuvQVk
	 Ra3fpIVVWhgLw1jSSFiju6qTIifANTDGtBqMhZXEYhjX2TNDMELwL6A2wXE4/cvgqa
	 KXE62IQa75KHxoy8zuopE/BuQQMONRdF2P8qTu9sz3QIpD0Unfxtc+LmbKoh+nv4fU
	 54G8GZr+1Sbw3lzPn/bxIjTAMYjzhToSScRLBuCxHwpdZvfwontzLlchS/oBrtzI3i
	 /XwBRO6Z80phQ==
Received: by pali.im (Postfix)
	id ED7F4CD5; Thu,  9 Mar 2023 21:35:26 +0100 (CET)
Date: Thu, 9 Mar 2023 21:35:26 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 5/8] leds: Add support for Turris 1.x LEDs
Message-ID: <20230309203526.5hcfa2w47vqzmny6@pali>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-6-pali@kernel.org>
 <Y/iDVlodp9sBkX9D@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/iDVlodp9sBkX9D@google.com>
User-Agent: NeoMutt/20180716

On Friday 24 February 2023 09:28:54 Lee Jones wrote:
> On Mon, 26 Dec 2022, Pali Rohár wrote:
> 
> > This adds support for the RGB LEDs found on the front panel of the
> > Turris 1.x routers. There are 8 RGB LEDs that are controlled by
> > CZ.NIC CPLD firmware running on Lattice FPGA.
> > 
> > CPLD firmware provides HW triggering mode for all LEDs except WiFi LED
> > which is automatically enabled after power on reset. LAN LEDs share HW
> > registers for RGB colors settings, so it is not possible to set different
> > colors for individual LAN LEDs.
> > 
> > CZ.NIC CPLD firmware is open source and available at:
> > https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> > 
> > This driver uses the multicolor LED framework and HW led triggers.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Reviewed-by: Marek Behún <kabel@kernel.org>
> > ---
> >  .../testing/sysfs-class-led-driver-turris1x   |  31 ++
> >  drivers/leds/Kconfig                          |   9 +
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
> >  4 files changed, 515 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> >  create mode 100644 drivers/leds/leds-turris-1x.c
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris1x b/Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> > new file mode 100644
> > index 000000000000..272695ae400b
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris1x
> > @@ -0,0 +1,31 @@
> > +What:		/sys/class/leds/<led>/device/brightness
> > +Date:		July 2022
> > +KernelVersion:	6.3
> 
> Date doesn't match the kernel version.
> 
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) On the back size of the Turris 1.x routers there is also
> 
> "side"
> 
> Drop "also"
> 
> > +		a button which can be used to control the intensity of all the
> > +		LEDs at once, so that if they are too bright, user can dim them.
> 
> "the user"
> 
> > +		The CPLD firmware cycles between 8 levels of this global
> 
> Drop "this"
> 
> > +		brightness, but this setting can have any integer value between
> > +		0 and 255. It is therefore convenient to be able to change this
> > +		setting from software.
> > +
> > +		Format: %u
> > +
> > +What:		/sys/class/leds/<led>/device/brightness_level
> > +Date:		July 2022
> > +KernelVersion:	6.3
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) Current brightness level value (0-7).
> > +
> > +		Format: %u
> > +
> > +What:		/sys/class/leds/<led>/device/brightness_values
> 
> brightness_level_values?
> 
> > +Date:		July 2022
> > +KernelVersion:	6.3
> > +Contact:	Pali Rohár <pali@kernel.org>
> > +Description:	(RW) Values of all 8 levels between which CPLD firmware cycles
> > +		when brightness button is pressed.
> > +
> > +		Format: %u %u %u %u %u %u %u %u
> 
> One value per file please.
> 
> As Greg says, userspace should not have to 'parse' sysfs file output.
> 
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 499d0f215a8b..6f78764e20aa 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -157,6 +157,15 @@ config LEDS_EL15203000
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called leds-el15203000.
> >  
> > +config LEDS_TURRIS_1X
> > +	tristate "LED support for CZ.NIC's Turris 1.x"
> 
> Worth specifying that this is a router here?
> 
> > +	depends on LEDS_CLASS_MULTICOLOR
> > +	depends on OF
> > +	select LEDS_TRIGGERS
> > +	help
> > +	  This option enables support for LEDs found on the front side of
> > +	  CZ.NIC's Turris 1.x routers.
> > +
> >  config LEDS_TURRIS_OMNIA
> >  	tristate "LED support for CZ.NIC's Turris Omnia"
> >  	depends on LEDS_CLASS_MULTICOLOR
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 4fd2f92cd198..de08083dbbca 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -82,6 +82,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
> >  obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
> >  obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
> >  obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> > +obj-$(CONFIG_LEDS_TURRIS_1X)		+= leds-turris-1x.o
> >  obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
> >  obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
> >  obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
> > diff --git a/drivers/leds/leds-turris-1x.c b/drivers/leds/leds-turris-1x.c
> > new file mode 100644
> > index 000000000000..cf7567b64306
> > --- /dev/null
> > +++ b/drivers/leds/leds-turris-1x.c
> > @@ -0,0 +1,474 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// (C) 2022 Pali Rohár <pali@kernel.org>
> > +//
> > +// CZ.NIC's Turris 1.x LEDs driver, controlled by CPLD firmware:
> > +// https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include "leds.h"
> > +
> > +/* LED registers starts at byte 0x13 in CPLD memory map */
> > +#define TURRIS1X_LED_REG_OFF(reg) ((reg)-0x13)
> 
> Spaces around the "-" please.
> 
> Why not just give the registers their correct value?
> 
> Or are they already adjusted in the datasheet?

Yes, they are adjusted to firmware source code (and also to available
documentation written from the source code).

> > +/* LEDs 1-5 share common register for setting brightness */
> > +#define TURRIS1X_LED_BRIGHTNESS_OFF(idx)	({ const u8 _idx = (idx) & 7; \
> > +						   (_idx == 0) ? 0 : \
> > +						   (_idx <= 5) ? 1 : \
> > +						   (_idx - 4); })
> > +
> > +#define TURRIS1X_LED_BRIGHTNESS_REG(idx, color)	TURRIS1X_LED_REG_OFF(0x13 + \
> > +						  3 * TURRIS1X_LED_BRIGHTNESS_OFF(idx) + \
> > +						  ((color) & 3))
> 
> These 2 MACROs are making my head hurt.  Please find a cleaner way to
> represent this logic, even at the expense of a few extra lines / defines.

I'm not sure what is the cleaner way. For me the cleaner way is to put
it on one line without breaking it.

> > +#define TURRIS1X_LED_GLOBAL_LEVEL_REG		TURRIS1X_LED_REG_OFF(0x20)
> > +#define TURRIS1X_LED_GET_GLOBAL_BRIGHTNESS_REG	TURRIS1X_LED_REG_OFF(0x21)
> > +#define TURRIS1X_LED_SW_OVERRIDE_REG		TURRIS1X_LED_REG_OFF(0x22)
> > +#define TURRIS1X_LED_SW_DISABLE_REG		TURRIS1X_LED_REG_OFF(0x23)
> > +#define TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(lvl)	TURRIS1X_LED_REG_OFF(0x28 + ((lvl) & 7))
> > +
> > +struct turris1x_led {
> > +	struct led_classdev_mc mc_cdev;
> > +	struct mc_subled subled_info[3];
> 
> Please define the '3' then use that definition throughout instead of
> ARRAY_SIZE().
> 
> > +	u32 reg;
> > +	bool registered;
> > +};
> > +
> > +#define to_turris1x_led(l)	container_of(l, struct turris1x_led, mc_cdev)
> 
> Since cdev is always available at the call-site, you can save yourself a
> few lines and some in-function complexity with:
> 
> #define to_turris1x_led(cdev)   container_of(lcdev_to_mccdev(cdev), struct turris1x_led, mc_cdev)
> 
> > +struct turris1x_leds {
> > +	void __iomem *regs;
> > +	struct mutex lock;
> > +	struct turris1x_led leds[8];
> 
> As above s/3/8/.
> 
> > +};
> > +
> > +static struct led_hw_trigger_type turris1x_hw_trigger_type;
> 
> Why do you need a global copy of this?  What's preventing you from
> allocating and freeing memory for it like we usually do?

This is how other drivers implemented triggers.

> > +static int turris1x_hwtrig_activate(struct led_classdev *cdev)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > +	struct turris1x_led *led = to_turris1x_led(lcdev_to_mccdev(cdev));
> > +	u8 val;
> > +
> > +	/* Disable software control of LED */
> 
> "Disable LED software control"
> 
> or
> 
> "of the LED"
> 
> Same in *_deactivate()
> 
> > +	mutex_lock(&leds->lock);
> > +	val = readb(leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	val &= ~BIT(led->reg);
> > +	writeb(val, leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	mutex_unlock(&leds->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static void turris1x_hwtrig_deactivate(struct led_classdev *cdev)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > +	struct turris1x_led *led = to_turris1x_led(lcdev_to_mccdev(cdev));
> > +	u8 val;
> > +
> > +	/* Enable software control of LED */
> > +	mutex_lock(&leds->lock);
> > +	val = readb(leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	val |= BIT(led->reg);
> > +	writeb(val, leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	mutex_unlock(&leds->lock);
> > +}
> > +
> > +static struct led_trigger turris1x_hw_trigger = {
> > +	.name		= "turris1x-cpld",
> > +	.activate	= turris1x_hwtrig_activate,
> > +	.deactivate	= turris1x_hwtrig_deactivate,
> > +	.trigger_type	= &turris1x_hw_trigger_type,
> > +};
> > +
> > +static enum led_brightness turris1x_led_brightness_get(struct led_classdev *cdev)
> > +{
> > +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> 
> With the suggested change above, you can rid this line.
> 
> > +	struct turris1x_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > +	struct turris1x_led *led = to_turris1x_led(mc_cdev);
> > +
> > +	if (!(readb(leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG) & BIT(led->reg)))
> > +		return 1;
> 
> That's not an enum.  That's an int.
> 
> "LED_ON"

In was there before but during review I was told to change LED_ON to 1.
So it should be changed back to LED_ON?

> > +	else if (!(readb(leds->regs + TURRIS1X_LED_SW_DISABLE_REG) & BIT(led->reg)))
> > +		return 1;
> > +	else
> > +		return 0;
> 
> "LED_OFF"
> 
> > +}
> > +
> > +static void turris1x_led_brightness_set(struct led_classdev *cdev,
> > +					enum led_brightness brightness)
> > +{
> > +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> > +	struct turris1x_leds *leds = dev_get_drvdata(cdev->dev->parent);
> > +	struct turris1x_led *led = to_turris1x_led(mc_cdev);
> > +	int i, j;
> > +	u8 val;
> > +
> > +	mutex_lock(&leds->lock);
> > +
> > +	/* Set new brightness value for each color when LED is enabled */
> > +	if (brightness) {
> 
> if (!brightness)
> 	goto skip_brightness;
> 
> > +		led_mc_calc_color_components(mc_cdev, brightness);
> 
> '\n'
> 
> > +		for (i = 0; i < ARRAY_SIZE(led->subled_info); i++)
> > +			writeb(mc_cdev->subled_info[i].brightness,
> > +			       leds->regs + TURRIS1X_LED_BRIGHTNESS_REG(led->reg, i));
> 
> Seeing as you always add leds->regs to this, why not incorporate it into
> the macro and save yourself these long lines that need to be wrapped.
> 
> Also consider using holding variables to achieve the same goal.
> 
> Think about the readability and maintainability of your code.
> 
> > +
> > +		/*
> > +		 * LEDs 1-5 (LAN) share common color settings in same sets
> > +		 * of HW registers and therefore it is not possible to set
> > +		 * different colors. So when chaning color of one LED then
> > +		 * reflect color change for all of them.
> > +		 */
> 
> Spell check.
> 
> > +		if (led->reg >= 1 && led->reg <= 5) {
> > +			for (j = 0; j < ARRAY_SIZE(leds->leds); j++) {
> > +				if (leds->leds[j].reg < 1 ||
> > +				    leds->leds[j].reg > 5 ||
> > +				    leds->leds[j].reg == led->reg)
> > +					continue;
> 
> '\n'
> 
> > +				for (i = 0; i < ARRAY_SIZE(led->subled_info); i++)
> > +					leds->leds[j].mc_cdev.subled_info[i].intensity =
> > +						mc_cdev->subled_info[i].intensity;
> 
> What's the difference between the two 'mc_cdev's here?
> 
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Enable / disable LED for software control */
> > +	val = readb(leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> > +	if (brightness && (val & BIT(led->reg)))
> > +		writeb(val & ~BIT(led->reg),
> > +		       leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> 
> Single line.
> 
> > +	else if (!brightness && !(val & BIT(led->reg)))
> > +		writeb(val | BIT(led->reg),
> > +		       leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> 
> Single line.
> 
> > +	mutex_unlock(&leds->lock);
> > +}
> > +
> > +static int turris1x_led_register(struct device *dev, struct turris1x_leds *leds,
> > +				 struct device_node *np, u8 val_sw_override,
> > +				 u8 val_sw_disable)
> > +{
> > +	struct led_init_data init_data = {};
> > +	struct led_classdev *cdev;
> > +	struct turris1x_led *led;
> > +	int ret, color;
> > +	u32 reg;
> > +	int i;
> > +
> > +	const unsigned int colors[ARRAY_SIZE(led->subled_info)] = {
> > +		LED_COLOR_ID_RED, LED_COLOR_ID_GREEN, LED_COLOR_ID_BLUE
> > +	};
> > +
> > +	ret = of_property_read_u32(np, "reg", &reg);
> > +	if (ret || reg >= ARRAY_SIZE(leds->leds)) {
> > +		dev_err(dev,
> > +			"Node %pOF: must contain 'reg' property with values between 0 and %u\n",
> 
> IMHO this is too verbose.  This is a message for an engineer who will
> know how to use grep and perform basic debugging.
> 
> "Invalid or missing 'reg' property" should clean this line up.
> 
> > +			np, (unsigned int)ARRAY_SIZE(leds->leds) - 1);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = of_property_read_u32(np, "color", &color);
> > +	if (ret || color != LED_COLOR_ID_RGB) {
> > +		dev_err(dev,
> > +			"Node %pOF: must contain 'color' property with value LED_COLOR_ID_RGB\n",
> 
> As above.  Keep it simple and brief.
> 
> > +			np);
> > +		return -EINVAL;
> > +	}
> > +
> > +	led = &leds->leds[reg];
> > +
> > +	if (led->registered) {
> > +		dev_err(dev, "Node %pOF: duplicate 'reg' property %u\n",
> > +			     np, reg);
> 
> "LED %d already registered", reg
> 
> Line wrap at 100 chars please.
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	led->registered = true;
> > +	led->reg = reg;
> > +
> > +	/* Set initial colors to what are currently in use */
> 
> "to those currently"
> 
> > +	for (i = 0; i < ARRAY_SIZE(led->subled_info); i++) {
> > +		led->subled_info[i].intensity =
> > +			readb(leds->regs + TURRIS1X_LED_BRIGHTNESS_REG(reg, i));
> > +		led->subled_info[i].color_index = colors[i];
> > +		led->subled_info[i].channel = i;
> 
> For my own understanding, what's the difference between reg and channel?

reg is the register which represents particular "LED" as seen by the
user on the box and channel is color of that LED. Every "LED" has
3 colors which can be configured separately.

> > +	}
> > +
> > +	led->mc_cdev.subled_info = led->subled_info;
> 
> Why do we need 2 copies of the same info?
> 
> > +	led->mc_cdev.num_colors = ARRAY_SIZE(led->subled_info);
> 
> This is always 3 - use a define instead.
> 
> > +	init_data.fwnode = &np->fwnode;
> > +
> > +	cdev = &led->mc_cdev.led_cdev;
> > +	cdev->max_brightness = 1;
> > +	cdev->brightness_get = turris1x_led_brightness_get;
> > +	cdev->brightness_set = turris1x_led_brightness_set;
> > +
> > +	/* All LEDs except LED 6 (WiFi) can be controller by hardware trigger */
> > +	if (reg != 6)
> > +		cdev->trigger_type = &turris1x_hw_trigger_type;
> > +
> > +	/* Disable hardware trigger for LED 6 (WiFi) - allow software control */
> > +	if (reg == 6 && !(val_sw_override & BIT(6))) {
> > +		if (!(val_sw_disable & BIT(6))) {
> 
> Wouldn't it make things much easier if we just did it anyway (see below)?

I just wanted to avoid accessing registers of the external memory
device when not needed.

> > +			val_sw_disable |= BIT(6);
> > +			writeb(val_sw_disable,
> > +			       leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> 
> Wrap at 100 everywhere please.
> 
> > +		}
> > +		val_sw_override |= BIT(6);
> > +		writeb(val_sw_override,
> > +		       leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	}
> 
> 	if (reg == 6 && !(val_sw_override & BIT(6))) {
> 		writeb(val_sw_disable, leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> 		writeb(val_sw_override, leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> 		val_sw_disable |= BIT(6);
> 		val_sw_override |= BIT(6);
> 	}
> 
> > +	if (!(val_sw_override & BIT(reg)))
> > +		cdev->default_trigger = turris1x_hw_trigger.name;
> > +
> > +	if (!(val_sw_override & BIT(reg)) || !(val_sw_disable & BIT(reg)))
> > +		cdev->brightness = 1;
> > +
> > +	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
> > +							&init_data);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot register LED %pOF: %i\n", np, ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
> > +			       char *buf)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	unsigned int brightness;
> > +
> > +	/*
> > +	 * Current brightness value is available in read-only register
> > +	 * TURRIS1X_LED_GET_GLOBAL_BRIGHTNESS_REG. Equivalent code is:
> > +	 * level = readb(leds->regs + TURRIS1X_LED_GLOBAL_LEVEL_REG) & 7;
> > +	 * brightness = readb(leds->regs + TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(level));
> > +	 */
> > +	brightness = readb(leds->regs + TURRIS1X_LED_GET_GLOBAL_BRIGHTNESS_REG);
> > +
> > +	return sprintf(buf, "%u\n", brightness);
> > +}
> > +
> > +static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
> > +				const char *buf, size_t count)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	int best_error, error, level, value;
> > +	unsigned long brightness;
> > +	u8 best_level;
> > +
> > +	if (kstrtoul(buf, 10, &brightness))
> > +		return -EINVAL;
> > +
> > +	if (brightness > 255)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Brightness can be set only to one of 8 predefined value levels
> > +	 * available in TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(level) registers.
> > +	 * Choose level which has nearest value to the specified brightness.
> > +	 */
> > +	best_level = 0;
> > +	best_error = INT_MAX;
> > +	for (level = 0; level < 8; level++) {
> > +		value = readb(leds->regs +
> > +			      TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(level));
> > +		error = abs(value - (int)brightness);
> > +		if (best_error > error) {
> > +			best_error = error;
> > +			best_level = level;
> > +		}
> > +	}
> > +
> > +	writeb(best_level, leds->regs + TURRIS1X_LED_GLOBAL_LEVEL_REG);
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(brightness);
> > +
> > +static ssize_t brightness_level_show(struct device *dev,
> > +				     struct device_attribute *a, char *buf)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	unsigned int level;
> > +
> > +	level = readb(leds->regs + TURRIS1X_LED_GLOBAL_LEVEL_REG) & 7;
> > +
> > +	return sprintf(buf, "%u\n", level);
> > +}
> > +
> > +static ssize_t brightness_level_store(struct device *dev,
> > +				      struct device_attribute *a,
> > +				      const char *buf, size_t count)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	unsigned long level;
> > +
> > +	if (kstrtoul(buf, 10, &level))
> > +		return -EINVAL;
> > +
> > +	if (level > 7)
> > +		return -EINVAL;
> > +
> > +	writeb(level, leds->regs + TURRIS1X_LED_GLOBAL_LEVEL_REG);
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(brightness_level);
> > +
> > +static ssize_t brightness_values_show(struct device *dev,
> > +				      struct device_attribute *a, char *buf)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	unsigned int vals[8];
> > +	int i;
> > +
> > +	for (i = 0; i < 8; i++)
> > +		vals[i] = readb(leds->regs +
> > +				TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(i));
> > +
> > +	return sprintf(buf, "%u %u %u %u %u %u %u %u\n", vals[0], vals[1],
> > +		       vals[2], vals[3], vals[4], vals[5], vals[6], vals[7]);
> > +}
> > +
> > +static ssize_t brightness_values_store(struct device *dev,
> > +				       struct device_attribute *a,
> > +				       const char *buf, size_t count)
> > +{
> > +	struct turris1x_leds *leds = dev_get_drvdata(dev);
> > +	unsigned int vals[8];
> > +	int nchars;
> > +	int i;
> > +
> > +	if (sscanf(buf, "%u %u %u %u %u %u %u %u%n", &vals[0], &vals[1],
> > +		   &vals[2], &vals[3], &vals[4], &vals[5], &vals[6], &vals[7],
> > +		   &nchars) != 8 || nchars + 1 < count)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < 8; i++)
> > +		writeb(vals[i],
> > +		       leds->regs + TURRIS1X_LED_GLOBAL_BRIGHTNESS_REG(i));
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_RW(brightness_values);
> > +
> > +static struct attribute *turris1x_leds_controller_attrs[] = {
> > +	&dev_attr_brightness.attr,
> > +	&dev_attr_brightness_level.attr,
> > +	&dev_attr_brightness_values.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(turris1x_leds_controller);
> > +
> > +static int turris1x_leds_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev_of_node(dev);
> > +	struct device_node *child;
> > +	struct turris1x_leds *leds;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	u8 val_sw_override;
> > +	u8 val_sw_disable;
> > +	int ret;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENODEV;
> > +
> > +	regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> 
> devm_platform_get_and_ioremap_resource()
> 
> > +	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
> 
> Call this ddata everywhere.
> 
> leds->leds is not overly forthcoming.
> 
> > +	if (!leds)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, leds);
> > +
> > +	leds->regs = regs;
> > +	mutex_init(&leds->lock);
> > +
> > +	ret = devm_led_trigger_register(dev, &turris1x_hw_trigger);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	val_sw_override = readb(leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +	val_sw_disable = readb(leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> > +
> > +	for_each_available_child_of_node(np, child) {
> > +		ret = turris1x_led_register(dev, leds, child,
> > +					    val_sw_override, val_sw_disable);
> > +		if (ret) {
> > +			of_node_put(child);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	ret = devm_device_add_groups(dev, turris1x_leds_controller_groups);
> > +	if (ret) {
> > +		dev_err(dev, "Could not add attribute group!\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void turris1x_leds_shutdown(struct platform_device *pdev)
> > +{
> > +	struct turris1x_leds *leds = platform_get_drvdata(pdev);
> > +	int i, j;
> > +	u8 val;
> > +
> > +	/*
> > +	 * LED registers are persisent across board resets.
> > +	 * So reset LEDs to default state before kernel reboots.
> > +	 */
> 
> Do you really want to rely on the process before us to have done the
> same?

Yes.

> Wouldn't it be better to reset on boot-up rather than shutdown?

No.

During board reset, firmware shows specific LED pattern which show to
user that board is being reset. As stated above LED registers are
persistent across board resets, so to see visualize this pattern
correctly, it is needed to reset LED registers to default state before
reboot.

U-Boot bootloader resets registers to defaults but obviously it is too
late (as board reset at this stage finished). Also bootloader sets
specific LED pattern if booting into the "recovery" / "reflashing" mode
and we want to preserve this settings. This is already in  the probe
phase implemented.

> > +	/* Disable software control of all LEDs except LED 6 (WiFi) */
> > +	writeb(BIT(6), leds->regs + TURRIS1X_LED_SW_OVERRIDE_REG);
> > +
> > +	/* Turn off LED 6 (WiFi) as there is no hardware trigger for it */
> > +	val = readb(leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> > +	writeb(val | BIT(6), leds->regs + TURRIS1X_LED_SW_DISABLE_REG);
> > +
> > +	/* Reset colors of all LEDs to default values */
> > +	for (i = 0; i < ARRAY_SIZE(leds->leds); i++) {
> > +		/* Skip LAN2-LAN5 LEDs which share color register with LAN1 */
> > +		if (i >= 2 && i <= 5)
> > +			continue;
> > +		for (j = 0; j < ARRAY_SIZE(leds->leds[i].subled_info); j++)
> > +			writeb(0xff,
> > +			       leds->regs + TURRIS1X_LED_BRIGHTNESS_REG(i, j));
> > +	}
> > +}
> > +
> > +static const struct of_device_id of_turris1x_leds_match[] = {
> > +	{ .compatible = "cznic,turris1x-leds" },
> > +	{},
> > +};
> > +
> > +static struct platform_driver turris1x_leds_driver = {
> > +	.probe = turris1x_leds_probe,
> > +	.shutdown = turris1x_leds_shutdown,
> > +	.driver = {
> > +		.name = "turris1x_leds",
> > +		.of_match_table = of_turris1x_leds_match,
> > +	},
> > +};
> > +module_platform_driver(turris1x_leds_driver);
> > +
> > +MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
> > +MODULE_DESCRIPTION("CZ.NIC's Turris 1.x LEDs");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:turris1x_leds");
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Lee Jones [李琼斯]
