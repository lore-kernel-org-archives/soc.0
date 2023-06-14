Return-Path: <SRS0=v+3n=CC=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6FAEB64D9
	for <soc@archiver.kernel.org>; Wed, 14 Jun 2023 11:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6A73C433C9; Wed, 14 Jun 2023 11:15:58 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id EFFACC433C0
	for <soc@kernel.org>; Wed, 14 Jun 2023 11:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFFACC433C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 933328027;
	Wed, 14 Jun 2023 11:15:55 +0000 (UTC)
Date: Wed, 14 Jun 2023 14:15:54 +0300
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
	Peter Vasil <petervasil@gmail.com>
Subject: Re: [PATCH] ARM: omap2: Fix copy/paste bug
Message-ID: <20230614111554.GJ14287@atomide.com>
References: <20230614093032.403982-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614093032.403982-1-linus.walleij@linaro.org>

* Linus Walleij <linus.walleij@linaro.org> [230614 12:30]:
> I mistyped one of the SD/MMC GPIO lines on the Nokia n810 which
> was supposed to be "vio" as "vsd".
> 
> Fix it up.
> 
> Reported-by: Peter Vasil <petervasil@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC maintainers: please apply this directly where the rest of the
> OMAP clean-ups are.

Reviewed-by: Tony Lindgren <tony@atomide.com>

>  arch/arm/mach-omap2/board-n8x0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
> index 564bf80a2621..8e3b5068d4ab 100644
> --- a/arch/arm/mach-omap2/board-n8x0.c
> +++ b/arch/arm/mach-omap2/board-n8x0.c
> @@ -158,7 +158,7 @@ static struct gpiod_lookup_table nokia810_mmc_gpio_table = {
>  				"vsd", 1, GPIO_ACTIVE_HIGH),
>  		/* Slot index 1, VIO power, GPIO 9 */
>  		GPIO_LOOKUP_IDX("gpio-0-15", 9,
> -				"vsd", 1, GPIO_ACTIVE_HIGH),
> +				"vio", 1, GPIO_ACTIVE_HIGH),
>  		{ }
>  	},
>  };
> -- 
> 2.34.1
> 
