Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84943C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:50:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4FA64DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F4FA64DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Feq9SfkD46wC1yzaqVoONdyyFIs+BN7AXYWZQVpgIfw=; b=rz0jydJkCrhyAJeVaBEsOpm1g
	jrFmpmOwgyHU6dDweoQ8fj/oMvKAfR7oPI2uAZYfq91XduyRkYQcniyD3KsvByNuLCc0tB3jNzYGP
	bDEe2eUO3vx7WzVm2HBdOwwKED7t1kfA9eFh5roGdNGo2fJS0b3h4THhmoToN5jGgEbO8/D53I0aH
	tcYdaeoN/a9p0OIsfnEBdAGfSb6PXYqQ4aEKyu3WefuiU9trXZ7/K+XY3FM9UALbQrpB3+Fy1Fd4m
	KQ5oSTxKtalpnoh8qED1jz3kZnTo+qogeEd6auacK/U8reR4ZbCUO5UMC66Wasfymb3j03AFBAtgX
	GKTAYBqWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jgp-0004ey-JQ; Thu, 04 Feb 2021 18:49:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jgl-0004dW-VA
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 18:49:13 +0000
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
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Message-ID: <20210204184907.GA2991903@localhost>
References: <20210204160129.2249394-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_134912_161679_83C9123A 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com,
 soc@kernel.org, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, Stephen Boyd <sboyd@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204184907.hmIl9EluU2WgKII4W0OxkjqxnEFOE9X0OTC_rhwtDf4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
