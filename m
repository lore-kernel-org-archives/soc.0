Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279CBC64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02A4FC433D2; Fri, 24 Feb 2023 09:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BBDC433EF;
	Fri, 24 Feb 2023 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677231171;
	bh=OMYj01eEaMTdkQ3k2qqCPx6PNg7Ew0SVmAFu7akxKk8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=sxAJwyujGg3NPKKvJ2YljnCjw+wN8B7MF6JxaDBrvPi5zopgj236OqAPaJKT56w3M
	 8nm+BmXnaTc1IS03TxL7rooHyMnE61FRX0tpVOxOJOAITJb3XZsHeoNIZBDTb3+k2S
	 pc8VfqFXCOAeKUIPzoQjOOg44rmTqJF1E9zyaVfCmciJ3rvedSBIpeetRqs7X9YONW
	 lE/0+6F2AGW5UGBuDR6P+lKoZ4a9nBUDUt4+89GfQ2O3Mak+jdkoql4GRHXO71MaR8
	 zkg9rGxKAMe139q3TSQdIY7boMs4hoVQytTnPfW/lp0+e7KvO2OgDB40jy+ZxzAZPb
	 CrgQSw5TtIQbQ==
Date: Fri, 24 Feb 2023 09:32:47 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 6/8] leds: turris-omnia: support HW controlled
 mode via private trigger
Message-ID: <Y/iEP5c41FydwZJU@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-7-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-7-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> From: Marek Behún <kabel@kernel.org>
> 
> Add support for enabling MCU controlled mode of the Turris Omnia LEDs
> via a LED private trigger called "omnia-mcu".
> 
> When in MCU controlled mode, the user can still set LED color, but the
> blinking is done by MCU, which does different things for various LEDs:
> - WAN LED is blinked according to the LED[0] pin of the WAN PHY
> - LAN LEDs are blinked according to the LED[0] output of corresponding
>   port of the LAN switch
> - PCIe LEDs are blinked according to the logical OR of the MiniPCIe port
>   LED pins
> 
> For a long time I wanted to actually do this differently: I wanted to
> make the netdev trigger to transparently offload the blinking to the HW
> if user set compatible settings for the netdev trigger.
> There was some work on this, and hopefully we will be able to complete
> it sometime, but since there are various complications, it will probably
> not be soon.
> 
> In the meantime let's support HW controlled mode via this private LED
> trigger. If, in the future, we manage to complete the netdev trigger
> offloading, we can still keep this private trigger for backwards
> compatibility, if needed.
> 
> We also set "omnia-mcu" to cdev->default_trigger, so that the MCU keeps
> control until the user first wants to take over it. If a different
> default trigger is specified in device-tree via the
> `linux,default-trigger` property, LED class will overwrite
> cdev->default_trigger, and so the DT property will be respected.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Fixes: 40624346b7ae ("ARM: dts: turris-omnia: enable LED controller node")
> Reviewed-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/leds/Kconfig             |  1 +
>  drivers/leds/leds-turris-omnia.c | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6f78764e20aa..f957b86411de 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -172,6 +172,7 @@ config LEDS_TURRIS_OMNIA
>  	depends on I2C
>  	depends on MACH_ARMADA_38X || COMPILE_TEST
>  	depends on OF
> +	select LEDS_TRIGGERS
>  	help
>  	  This option enables basic support for the LEDs found on the front
>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index c7c9851c894a..bb7af9e59ad6 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -41,6 +41,39 @@ struct omnia_leds {
>  	struct omnia_led leds[];
>  };
>  
> +static struct led_hw_trigger_type omnia_hw_trigger_type;

Really not a fan of anything global if it can be worked around.

> +static int omnia_hwtrig_activate(struct led_classdev *cdev)
> +{
> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);

Out of interest, who is the parent?

> +	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));
> +
> +	/* put the LED into MCU controlled mode */
> +	return i2c_smbus_write_byte_data(leds->client, CMD_LED_MODE,
> +					 CMD_LED_MODE_LED(led->reg));

Wrap at 100 chars everywhere.

> +}
> +
> +static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
> +{
> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));

Place lcdev_to_mccdev() in to_omnia_led().

> +	int ret;
> +
> +	/* put the LED into software mode */

"Put"

> +	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_MODE,
> +					CMD_LED_MODE_LED(led->reg) |
> +					CMD_LED_MODE_USER);
> +	if (ret < 0)
> +		dev_err(cdev->dev, "Cannot put to software mode: %i\n", ret);
> +}
> +
> +static struct led_trigger omnia_hw_trigger = {
> +	.name		= "omnia-mcu",
> +	.activate	= omnia_hwtrig_activate,
> +	.deactivate	= omnia_hwtrig_deactivate,
> +	.trigger_type	= &omnia_hw_trigger_type,
> +};
> +
>  static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>  					     enum led_brightness brightness)
>  {
> @@ -112,6 +145,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	cdev = &led->mc_cdev.led_cdev;
>  	cdev->max_brightness = 255;
>  	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
> +	cdev->trigger_type = &omnia_hw_trigger_type;
> +	cdev->default_trigger = omnia_hw_trigger.name;
>  
>  	/* put the LED into software mode */
>  	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> @@ -228,6 +263,12 @@ static int omnia_leds_probe(struct i2c_client *client,
>  
>  	mutex_init(&leds->lock);
>  
> +	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
> +		return ret;
> +	}
> +
>  	led = &leds->leds[0];
>  	for_each_available_child_of_node(np, child) {
>  		ret = omnia_led_register(client, led, child);
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
