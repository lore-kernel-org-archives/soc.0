Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537FC64ED8
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3113EC4339C; Fri, 24 Feb 2023 09:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC225C433D2;
	Fri, 24 Feb 2023 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677231200;
	bh=taH3kUpjBEKbu3yuGkvYhs8ieg/3oA2f1IwU7NEXgf8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kZTimjNOPc46v9KwQtdC4lwDgfrbnFacn6ST1LCU2u+GX2w+gFPCRjVz8DqRkPe/N
	 ki0lmSzG9AxXkSl0rk5BvLciqtrIrhljBVg9RzMae9OT2i2112I9S2Vual9YPRchc6
	 do1Varp94eq1XGAUS2D8NR+f/x79YmB7BbkFfuCsd5D34T8ilanDfL8dVkZWhwTT+m
	 olagTKHLGHrE4u5NXCisXKkCELm9y7m8q/UHb8l7NryJxun3M3xg3VxxJFEueVNPYv
	 ej4UJQqGNJ2fZkNFzTT9PrrYTaXD2Mr8jB1VqHFBKEBATlerHepH0CZl6NRnX+eJoM
	 8ISxGtKNzISJg==
Date: Fri, 24 Feb 2023 09:33:15 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 7/8] leds: turris-omnia: initialize
 multi-intensity to full
Message-ID: <Y/iEW150knuPcJz9@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-8-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-8-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> From: Marek Behún <kabel@kernel.org>
> 
> The default color of each LED before driver probe (255, 255, 255).
> Initialize multi_intensity to this value, so that it corresponds to the
> reality.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
> Reviewed-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Lee Jones <lee@kernel.org>

> ---
>  drivers/leds/leds-turris-omnia.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index bb7af9e59ad6..71340dec492a 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -131,10 +131,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	}
>  
>  	led->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	led->subled_info[0].intensity = 255;
>  	led->subled_info[0].channel = 0;
>  	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	led->subled_info[1].intensity = 255;
>  	led->subled_info[1].channel = 1;
>  	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +	led->subled_info[2].intensity = 255;
>  	led->subled_info[2].channel = 2;
>  
>  	led->mc_cdev.subled_info = led->subled_info;
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
