Return-Path: <SRS0=pQk7=H4=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C84FC433DB
	for <soc@archiver.kernel.org>; Fri, 26 Feb 2021 19:23:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CD90D64F27; Fri, 26 Feb 2021 19:23:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B28A64F14;
	Fri, 26 Feb 2021 19:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B28A64F14
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexander.sverdlin@gmail.com
Received: by mail-wr1-f50.google.com with SMTP id f12so5824273wrx.8;
        Fri, 26 Feb 2021 11:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OsztXS2pxF0mqVb9NZgLRR6d9O9wIrx2e3naQfnixyw=;
        b=mvJeaORv08NO8JFv6YX3OR8eF2mGEPxZfE4KvPhccDkBqlM+vFrbJ8EUbyPW+S4KFL
         IKg5IoaxhhzeHbhRwG7qmM1yla9/TV2WIFUHoLqAiLUPw9Eo1/xpVgYtQ5kMGqSMYMPo
         nCdzHOFFywol73/GqgJw3G1tqgQY2i6vmjlASg+WIWtL2gWbVucVYF9DYeHH2oUDF5mt
         YGhIgGCDR9xuuQYwjVngxJH5HrHTgat5f/CcwODnA3wAd/9GrQjArsY/xpDU9soy0/Np
         TlQyg2IS+HctwnnB+Pt5gfP5E+BMoXR2TwsYCLKkp5bWoXCoTi11PrEkafAmHa7dV1Zc
         x/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OsztXS2pxF0mqVb9NZgLRR6d9O9wIrx2e3naQfnixyw=;
        b=meSF0AGbMIGR3gO6+fnm32z8YfZHb9CXpMElkiy2FS0cNqH9qEshnV9SFDpnMQ/GDS
         ZieFXok636AEGW6ZyKx7gbh5Xw7Jw7v8gU4BBAiubNJBLR6WQeUexR8msz/DJEZxnJC2
         L/yJVkSbqr0NqrVQ5glvxnD/kmyQzRAI1zdozVep73kHghgMlNifNblCzW6xow8KtV2q
         1uyvGK3JjI6K2i+g0WdgtSUGwYgaIJEyHWM7npUUbvADREOAVVgPw7jOUVtnAJ/7311E
         97kJv4KNNtFUblByp9qwxONKyQkMXr1OA3Y72WeVo5gf4KdZBGrPxkfw/ILksVRMme41
         YPCw==
X-Gm-Message-State: AOAM531oex617q1xPQNJRIWDdrSDy6Pz+Es8oxXWwg9j8bKEFp/WjIiQ
	J4Y3tj7OQDEXnxJbmoQaGaeyl4Tlwdk=
X-Google-Smtp-Source: ABdhPJwSLG2nJ/s2aJyqjLoRzlpNT/jkEbmhfYg2OHWfEm5RLYiq3iP9n9FdRbVdUHCVfr8UUSz6LQ==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr4729579wrh.76.1614367405841;
        Fri, 26 Feb 2021 11:23:25 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id t23sm13630703wmn.13.2021.02.26.11.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:23:25 -0800 (PST)
Message-ID: <141f3098744ea8d1cc39abcdce89c0e513bfbc70.camel@gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Hartley Sweeten
	 <hsweeten@visionengravers.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King
 <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 clang-built-linux@googlegroups.com
Date: Fri, 26 Feb 2021 20:23:24 +0100
In-Reply-To: <20210226164345.3889993-1-arnd@kernel.org>
References: <20210226164345.3889993-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

On Fri, 2021-02-26 at 17:43 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Randconfig builds with ep93xx fail with the clang integrated
> assembler that does not understand the maverick crunch extensions:
> 
> arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
>  cfstr64 mvdx0, [r1, #0] @ save 64b registers
> 
> It is unclear if anyone is still using support for crunch: gcc-4.8 dropped
> it in 2012 when it was already too broken to be used reliabled. glibc
> support existed as an external patch but was never merged upstream.
> We could consider removing the last bits of the kernel support as well.

This was my impression already in 2006, that Cirrus is not going to work
on Crunch support. From my PoV it's OK to remove the support in the
kernel completely.

> Turn off the integrated assembler for this file for now.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-ep93xx/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefile
> index 86768495f61d..f686577ba059 100644
> --- a/arch/arm/mach-ep93xx/Makefile
> +++ b/arch/arm/mach-ep93xx/Makefile
> @@ -7,7 +7,7 @@ obj-y                   := core.o clock.o timer-ep93xx.o
>  obj-$(CONFIG_EP93XX_DMA)       += dma.o
>  
>  obj-$(CONFIG_CRUNCH)           += crunch.o crunch-bits.o
> -AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312
> +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)
>  
>  obj-$(CONFIG_MACH_ADSSPHERE)   += adssphere.o
>  obj-$(CONFIG_MACH_EDB93XX)     += edb93xx.o

-- 
Alexander Sverdlin.


