Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE122C61DA4
	for <soc@archiver.kernel.org>; Thu,  9 Mar 2023 20:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83FA0C4339B; Thu,  9 Mar 2023 20:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4F8C433D2;
	Thu,  9 Mar 2023 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678392459;
	bh=1L1xG6S7A6aeUCR22+s918uwYrIz4JfAzuDYi06JIO4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FUH0uEsi3Wn+kqrhs5Q1roWXhEFZ5GQCFD7RBiKb919gmX1/fjiwGR/ml+RSdb1eg
	 PDyXJFzKLfyDGK/98PlQ11C28G9KPidNTzwJfpO07E7kAPdWCne6jqYuqpfj1J4Fcd
	 F7Zp/BZkbSxEL4+lUPi3DrWZoq61yyKQ30+YQTPH/aFkMmgi0ztFtvsDh7lzW1Fy6A
	 bFq3UyTkeZd2dJSFCcgqnqexeWSK3ztEQn5KboftGfC0GvG6wJv+T9o7T53uPv16Gm
	 jwIxrO9DiFxeC94zT8f0ydwdklGRsvu/kO29euzSKw6ZxvnwIeET452WwmK3tsqGLq
	 tcBf3kOkZ/J6w==
Received: by pali.im (Postfix)
	id 695C5CD5; Thu,  9 Mar 2023 21:07:34 +0100 (CET)
Date: Thu, 9 Mar 2023 21:07:34 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 8/8] leds: turris-omnia: change max brightness
 from 255 to 1
Message-ID: <20230309200734.k4ofzkqstolpnqb2@pali>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-9-pali@kernel.org>
 <Y/iEk+K2fUsfPZD7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/iEk+K2fUsfPZD7@google.com>
User-Agent: NeoMutt/20180716

On Friday 24 February 2023 09:34:11 Lee Jones wrote:
> On Mon, 26 Dec 2022, Pali Rohár wrote:
> 
> > From: Marek Behún <kabel@kernel.org>
> > 
> > Using binary brightness makes more sense for this controller, because
> > internally in the MCU it works that way: the LED has a color, and a
> > state whether it is ON or OFF.
> > 
> > The resulting brightness computation with led_mc_calc_color_components()
> > will now always result in either (0, 0, 0) or the multi_intensity value.
> > 
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
> > Reviewed-by: Pali Rohár <pali@kernel.org>
> > ---
> >  drivers/leds/leds-turris-omnia.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> > index 71340dec492a..04f01ae46c27 100644
> > --- a/drivers/leds/leds-turris-omnia.c
> > +++ b/drivers/leds/leds-turris-omnia.c
> > @@ -146,7 +146,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
> >  	init_data.fwnode = &np->fwnode;
> >  
> >  	cdev = &led->mc_cdev.led_cdev;
> > -	cdev->max_brightness = 255;
> > +	cdev->max_brightness = 1;
> 
> Should this now be LED_ON?

Somebody said that LED_ON is deprecated.

> >  	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
> >  	cdev->trigger_type = &omnia_hw_trigger_type;
> >  	cdev->default_trigger = omnia_hw_trigger.name;
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Lee Jones [李琼斯]
