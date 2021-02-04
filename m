Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5783C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:12:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67ACD64E27
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67ACD64E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iInZ45Cc17e+jsfpQ+gpSJ3wY6y0HY3tPGBOUz1jHiE=; b=2h59RzL489bXBQTYZBckormHk
	jp4VKlyM6FijGvTZQMnoReGXlknGnpHFGK8iXZ1pgi05O4pe1czMGOaPAhY1wYZgnHFyQkG7AYxv5
	P/jZ0sUyxMCcHQtMFf0c/1RoYYq+tQD8Vp3tQ+YMaxC8JJ2e31O7d9ukadhiCv67mKPjUw8EER1EA
	DXdx4NhEoqDu1r9unqExcd7tZPbDPQh7l2d0MIFqJuzbML2ZTxCkNXGhDSoPzrqb9kaKytTOpMUmu
	AW/czyXEiZPwZ0zso8MYRXnco3nQEqDwqQLjZqEj0qSH8uZxSkf9qAFql6BLMkXpwGfm+3okaDM5/
	1YOEvxCbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7j6T-0007hm-0u; Thu, 04 Feb 2021 18:11:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7j6Q-0007gm-6f
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 18:11:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id z9so2270277pjl.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 10:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RtK9mH1gkT4tly0aUjleqbTCqo0H1GWRGkm+wgQLcKQ=;
 b=VzWx0dK0F/0P0JbZEaZ7yNuVnXXvvlUt6ZWlIUVzcsmzxQwK0QWShtSdZaJu0SAXdC
 qWQJBu7pYT8MOSGQqxyJ2S6cqveiHyEIfFl0YqmvohE0/IRuuafPGXHtRtswtVSP24As
 v3KylExv9pXuIP1YcK9XeVzoFn9ILZl2JMUb1viSplB3gBRf1sWfjAui3Sn7yGqI5Zso
 NAYvod40+nciWJ+9lcotHZQPdlsyqrzFAcHZU3gRiYrku1qg/3wAxpvtREXsNv4d/Iee
 Sb0MApJzgAMp9CUhnXOhsBd1OgJMoJgOExqhaoHmv4kh30yQHQ2snSw0+3Aq+2R16SYE
 icKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtK9mH1gkT4tly0aUjleqbTCqo0H1GWRGkm+wgQLcKQ=;
 b=QKMzMj59xH6gO06QSgIrR+ftMUUBYqSMTGLwfoSLoSRHkZ1m606lDK4ytONJm7lKGU
 6Vqa5NfHflokqOWTQdLh8zrxLkUa0d2qP2VG+UrDxfkca5TX1SNvrkMycmaBxB39yISg
 Sui/nqX0VYFBHxsj5XMwEA9ZnAtYH0+agBAKwfB6EIIcf0/rnPoyl9aX03glTXbcx4h4
 9+wRenS71m9RomD0YBEyQi4RYYDpJJrwYecjbNFf9N3geVRPTZDaMVNZsfJuXmTxCHO0
 qu6KwyA1qQ15QbK1v0wZ5SwsS3huRY+SwLdP9ZKatHtIKJJiHu5csMNlD1qDi2NytI3/
 GexA==
X-Gm-Message-State: AOAM530SadOe3NsLkYoCA47YIVxyjMp5ZHwFWADx9uso6Nz1rW4XP2E7
 7OFQNtghqy8pbBLrlV+SnyFkllnwodNqf4q29tYIuQ==
X-Google-Smtp-Source: ABdhPJwM9n11EzR6QjrdGwIT7tXe7o6IvZV4XBcsjcTX9FIJNuwD9dfLJji0WYIC63nh1Z206CveXNSVwbNVcyALRBI=
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr190576pjn.25.1612462294295; 
 Thu, 04 Feb 2021 10:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204162416.3030114-1-arnd@kernel.org>
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Feb 2021 10:11:23 -0800
Message-ID: <CAKwvOd=1Cs75KdVU5Fa9W+wYmjo=5fFNBb6m6PnHUp=eoM-H5g@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_131138_368873_A4F9CFC5 
X-CRM114-Status: GOOD (  21.09  )
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
 Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Ben Dooks <ben-linux@fluff.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204181123.Yj-OJzjNeKMcszuByKUYP0EI9naA19lAvZEt0Iju5o0@z>

On Thu, Feb 4, 2021 at 8:24 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
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

Thanks for the patch.  Pre-UAL syntax

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> index b54cbd012241..5d238d9a798e 100644
> --- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> +++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
> @@ -35,7 +35,6 @@
>         @ and an offset to the irq acknowledgment word
>
>  ENTRY(s3c24xx_spi_fiq_rx)
> -s3c24xx_spi_fix_rx:
>         .word   fiq_rx_end - fiq_rx_start
>         .word   fiq_rx_irq_ack - fiq_rx_start
>  fiq_rx_start:
> @@ -49,7 +48,7 @@ fiq_rx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         @@ set IRQ controller so that next op will trigger IRQ
>         mov     fiq_rtmp, #0
> @@ -61,7 +60,6 @@ fiq_rx_irq_ack:
>  fiq_rx_end:
>
>  ENTRY(s3c24xx_spi_fiq_txrx)
> -s3c24xx_spi_fiq_txrx:
>         .word   fiq_txrx_end - fiq_txrx_start
>         .word   fiq_txrx_irq_ack - fiq_txrx_start
>  fiq_txrx_start:
> @@ -76,7 +74,7 @@ fiq_txrx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         mov     fiq_rtmp, #0
>         str     fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> @@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
>  fiq_txrx_end:
>
>  ENTRY(s3c24xx_spi_fiq_tx)
> -s3c24xx_spi_fix_tx:
>         .word   fiq_tx_end - fiq_tx_start
>         .word   fiq_tx_irq_ack - fiq_tx_start
>  fiq_tx_start:
> @@ -101,7 +98,7 @@ fiq_tx_start:
>         strb    fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
>
>         subs    fiq_rcount, fiq_rcount, #1
> -       subnes  pc, lr, #4              @@ return, still have work to do
> +       subsne  pc, lr, #4              @@ return, still have work to do
>
>         mov     fiq_rtmp, #0
>         str     fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
