Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671CAC433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 18:49:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 23D7D64F65; Thu,  4 Feb 2021 18:49:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E115864DE1;
	Thu,  4 Feb 2021 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612464551;
	bh=IcwQcDV5+EUQSUvrMmADnhqk1v5csJ+qaKYm9qdzwLY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kcikoCRPwBGwiJ2JodGmHP6KOv+1C1vaUrTs+ZvLf9Qrp/Q+e8uLCT+Li4Jg786Ml
	 iTXTmx85X9qMLD2M8gPvPRKRhHKQYzQCAHzBDDlnE6+gWarsXn6hQNL2vC5gnOQhtl
	 NVCMdThZw95WPEEx2L01/VjZvu63m4ChS8qyBMkQ4EZ5P3P9a2W1lmYinBN6MZDPG0
	 sXcbHcYgUoJ6//h+BELiuCeAZAf6m3EH1p+WmWBA0Yy9W4pUnipchgZU17WmRm08MZ
	 /IaZGmeovqeW32Mj95biA8iRg4bZnrRvqHlt2p8HMHWn3c99TRQ8pvf/sdlz9VHOqu
	 PfjNwHCrxPsCg==
Date: Thu, 4 Feb 2021 11:49:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
	clang-built-linux@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Message-ID: <20210204184907.GA2991903@localhost>
References: <20210204160129.2249394-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>

On Thu, Feb 04, 2021 at 05:01:20PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compiling with the clang integrated assembler warns about
> a recently added instruction:
> 
> <instantiation>:14:13: error: unknown token in expression
>  ldr tmp1, =#0x00020010UL
> arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
>  at91_plla_enable
> 
> Remove the extra '#' character that is not used for the 'ldr'
> instruction when doing an indirect load of a constant.
> 
> Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-at91/pm_suspend.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index 909856c8a8c6..0d467cc40129 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
>  	str	tmp1, [pmc, #AT91_PMC_PLL_UPDT]
>  
>  	/* step 2. */
> -	ldr	tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
> +	ldr	tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
>  	str	tmp1, [pmc, #AT91_PMC_PLL_ACR]
>  
>  	/* step 3. */
> -- 
> 2.29.2
> 
