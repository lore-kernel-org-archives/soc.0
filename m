Return-Path: <nathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625C2C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 18:52:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 226C064F10; Thu,  4 Feb 2021 18:52:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C97164E3F;
	Thu,  4 Feb 2021 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612464778;
	bh=ME2uLeKBwzaOYsDBwxCVsWJsikR41aFOw6Bk5flaMjY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=gY4WQlNAZZQzMSeYfsMfdoQm2rGJmR/uj9Gpm5o2HdDC0dlitZGsTTyi8wL+AFtWf
	 rfFYuDUCpdRjYA7z0/XUdjzbNG6NOQwkTOVBPk5HlNcgo9bpr0pF37ygwxYzVmZrIW
	 x1Xre/xmZ63L2ccmpVR0A3RgduNN0E0LNVsNCbXbtesApbMvSNAEX/p9Mfuh8koffT
	 Kimt6zvP44R3ONbx8WkAshzwiQapOB4Jv/s0+Re5eJvfvooZj2TE3TT89mKch8EFyk
	 EqOnP+KwuGm0c0mlay764RjNZdnmwocJUKZGiYwBecDoixpZwujZ2tURIVkm6RwQTn
	 47jgnnWh8RgYw==
Date: Thu, 4 Feb 2021 11:52:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ben Dooks <ben-linux@fluff.org>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210204185255.GB2991903@localhost>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>

On Thu, Feb 04, 2021 at 05:23:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with the clang integrated assembler produces a couple of
> errors for the s3c24xx fiq support:
> 
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
> s3c24xx_spi_fiq_txrx:
> ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
> 
> There are apparently two problems: one with extraneous or duplicate
> labels, and one with old-style opcode mnemonics. Stefan Agner has
> previously fixed other problems like this, but missed this particular
> file.
> 
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> index b54cbd012241..5d238d9a798e 100644
> --- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> +++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> @@ -35,7 +35,6 @@
>  	@ and an offset to the irq acknowledgment word
>  
>  ENTRY(s3c24xx_spi_fiq_rx)
> -s3c24xx_spi_fix_rx:
>  	.word	fiq_rx_end - fiq_rx_start
>  	.word	fiq_rx_irq_ack - fiq_rx_start
>  fiq_rx_start:
> @@ -49,7 +48,7 @@ fiq_rx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	@@ set IRQ controller so that next op will trigger IRQ
>  	mov	fiq_rtmp, #0
> @@ -61,7 +60,6 @@ fiq_rx_irq_ack:
>  fiq_rx_end:
>  
>  ENTRY(s3c24xx_spi_fiq_txrx)
> -s3c24xx_spi_fiq_txrx:
>  	.word	fiq_txrx_end - fiq_txrx_start
>  	.word	fiq_txrx_irq_ack - fiq_txrx_start
>  fiq_txrx_start:
> @@ -76,7 +74,7 @@ fiq_txrx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	mov	fiq_rtmp, #0
>  	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> @@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
>  fiq_txrx_end:
>  
>  ENTRY(s3c24xx_spi_fiq_tx)
> -s3c24xx_spi_fix_tx:
>  	.word	fiq_tx_end - fiq_tx_start
>  	.word	fiq_tx_irq_ack - fiq_tx_start
>  fiq_tx_start:
> @@ -101,7 +98,7 @@ fiq_tx_start:
>  	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>  
>  	subs	fiq_rcount, fiq_rcount, #1
> -	subnes	pc, lr, #4		@@ return, still have work to do
> +	subsne	pc, lr, #4		@@ return, still have work to do
>  
>  	mov	fiq_rtmp, #0
>  	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> -- 
> 2.29.2
> 
