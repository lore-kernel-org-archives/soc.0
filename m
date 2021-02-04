Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7F2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8369964E3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8369964E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F8ySDRsqcRzSkcWckBqr729OMlNNqNjz/OQPw5A+EXo=; b=SupXu94vZ4mW1ggY9GXJfexxI
	rYPrBb/6dWYWR9v+3frT/sc+/fAIqe898/uKS/OG4WmPzGTkv978vbI+jxyyekaWHOiKDeEelI2GB
	gIsqv1GCEVUd9frC4nvxMo0yQ++YjMGXKLJjqgOcXj/BZXPwG4479WNPM+AJ1/jeRp12z4jbjrDvd
	zAKGLsWSDik01IDmPEbdFOLpI78zd+9ju4d7pGIHlRuK1OnteGfCDErVH+5PvQ18nCvCy/9fvYx2K
	UViKDy1Wxtgbhu8+O2qRPnYVhCwhCEY0BRs9aVBfc2O6GDUzxDgzscpEtzC5EkmUd61hZAZaJIkt3
	wPpGtjqvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jkU-0005ZJ-7y; Thu, 04 Feb 2021 18:53:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jkR-0005YH-J4
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 18:53:00 +0000
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
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210204185255.GB2991903@localhost>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_135259_810650_E662BB30 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 soc@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204185255.qJOZok0JXuIvN83bIbT8_JbwOuXKWG1sSWupRu4YR5k@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
