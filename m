Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA77C61DA4
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 14:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECF47C433D2; Thu, 23 Feb 2023 14:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A086FC433EF;
	Thu, 23 Feb 2023 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677162349;
	bh=x89cIWspbHX8YAZ2KOBM6mNbr8U5tJaoLzNjelhG5HY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=b80PhFCnlJGDaGHIY+6oUKqT1G++UJeLRcTInkUjDNu6oQcQ15204H6ocgVVeOUIS
	 UG6zVzcx5YfNEhDll9jfoP8nZX3/sKZIg8EL3Esz+5ECbaDZOvHLQABK8XoJNCymmJ
	 46NRFp6MPvOo0tooQkYqAGAgomk99QnK2AZew7RAcf5AshwqYyqdT8e66WTCZ5QWki
	 KS62sm4GKnkFpbT4pnvLG6i7JjOoEkzI31H2Ce/6YTg5YYaM1FA6N+YsNS7wdvLjXg
	 mHAYGrfDh+JAfPmeA+4oYOyyraopRQ45uCiLkvRGUPWfHDmMhfv6GSwuJaoc0FXdP7
	 EqhqiTvnyKm/A==
Date: Thu, 23 Feb 2023 14:25:45 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/8] leds: syscon: Implement support for
 active-low property
Message-ID: <Y/d3aS4pQP1xhSBo@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-3-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-3-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> This new active-low property specify that LED has inverted logic
> (0 - enable LED, 1 - disable LED).
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/leds/leds-syscon.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index 7eddb8ecb44e..5e605d8438e9 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -29,6 +29,7 @@ struct syscon_led {
>  	struct regmap *map;
>  	u32 offset;
>  	u32 mask;
> +	bool active_low;
>  	bool state;
>  };
>  
> @@ -41,10 +42,10 @@ static void syscon_led_set(struct led_classdev *led_cdev,
>  	int ret;
>  
>  	if (value == LED_OFF) {
> -		val = 0;
> +		val = sled->active_low ? sled->mask : 0;
>  		sled->state = false;
>  	} else {
> -		val = sled->mask;
> +		val = sled->active_low ? 0 : sled->mask;
>  		sled->state = true;
>  	}
>  
> @@ -85,6 +86,8 @@ static int syscon_led_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	if (of_property_read_u32(np, "mask", &sled->mask))
>  		return -EINVAL;
> +	if (of_find_property(np, "active-low", NULL))
> +		sled->active_low = true;
>  
>  	state = of_get_property(np, "default-state", NULL);
>  	if (state) {
> @@ -95,17 +98,20 @@ static int syscon_led_probe(struct platform_device *pdev)
>  			if (ret < 0)
>  				return ret;
>  			sled->state = !!(val & sled->mask);
> +			if (sled->active_low)
> +				sled->state = !sled->state;
>  		} else if (!strcmp(state, "on")) {
>  			sled->state = true;
>  			ret = regmap_update_bits(map, sled->offset,
>  						 sled->mask,
> -						 sled->mask);
> +						 sled->active_low ? 0 : sled->mask);
>  			if (ret < 0)
>  				return ret;
>  		} else {
>  			sled->state = false;
>  			ret = regmap_update_bits(map, sled->offset,
> -						 sled->mask, 0);
> +						 sled->mask,
> +						 sled->active_low ? sled->mask : 0);
>  			if (ret < 0)
>  				return ret;
>  		}
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
