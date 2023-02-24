Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834EFC64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 682D8C433D2; Fri, 24 Feb 2023 09:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A6C433EF;
	Fri, 24 Feb 2023 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677231256;
	bh=MWYvrv57zWRYy9ZeHEHV3husWCgHe5SxsWug1JsKRxQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hxZFYzukCmiJVaPI+OxfABaaZzSRedE2NxNG7md9eLwG3BhCC2pjdjoho9qeOMWwW
	 ymC45FIKVMsC+O9MRVNCm4f3PHRyoH4RJcQDmrsZStHdn+giNYaH0+GIsAf+VY+1m1
	 pSqSB2rXwqm1WpVTN44btorJOdeyJ8FJ5C1JEwkS7Lxj4wRjROQI6y9T+mJygLdo2q
	 3I4ICki/OoA+FRYcZzy1mpODUhlrevdscvgk9ekoEyokW3P7WqddWVwGZYWDn7+Q8p
	 3tSq1GRLNwoK/WR7AtcFjysQ1VZG9XJkWTuN3uZ5ubL05414gArocNF/IulSrSaiE/
	 bAxX6ssDQ8zgw==
Date: Fri, 24 Feb 2023 09:34:11 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 8/8] leds: turris-omnia: change max brightness
 from 255 to 1
Message-ID: <Y/iEk+K2fUsfPZD7@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-9-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-9-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> From: Marek Behún <kabel@kernel.org>
> 
> Using binary brightness makes more sense for this controller, because
> internally in the MCU it works that way: the LED has a color, and a
> state whether it is ON or OFF.
> 
> The resulting brightness computation with led_mc_calc_color_components()
> will now always result in either (0, 0, 0) or the multi_intensity value.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
> Reviewed-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 71340dec492a..04f01ae46c27 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -146,7 +146,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	init_data.fwnode = &np->fwnode;
>  
>  	cdev = &led->mc_cdev.led_cdev;
> -	cdev->max_brightness = 255;
> +	cdev->max_brightness = 1;

Should this now be LED_ON?

>  	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
>  	cdev->trigger_type = &omnia_hw_trigger_type;
>  	cdev->default_trigger = omnia_hw_trigger.name;
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
