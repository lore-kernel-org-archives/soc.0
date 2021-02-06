Return-Path: <SRS0=NRVF=HI=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5DFC433DB
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 008AE64EAC; Sat,  6 Feb 2021 13:13:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A01864E42;
	Sat,  6 Feb 2021 13:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A01864E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm1-f45.google.com with SMTP id i5so216957wmq.2;
        Sat, 06 Feb 2021 05:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TcWqlo7340ClwaNrU2G13HH3PdkJ5tma+WdPpB6m4uk=;
        b=D4BFdrKN+GHtJVllqc0riGsHOdrZjfWf0Y4at4WNVQ+H9ZJLB9MGJnIoxmeFcptkiL
         wA3jvieQVZzYDOo2ClwSMLZ/9Y9Ov3qS1fbx2o4P3RUnbwZeigRzt9vIooXU6jKbJAnj
         FNCMFB6GcfC8qB+M8jbOVtg+ZsN7Mqjkg/nFll+2TAPD5mWLGBWPhWrjLN57N+rSRI1l
         9M2V+J8ZHILWSAW7xag6vQYwZ3PfOyrx72vFj1sdtlfTPMdaL74wU8EApUTeEIlp354q
         ksyGVu3YL5Gk1uAk5fcYK39RZkarFlCYFJ1oYGfK7cVqrIMRxS0Igtnro0tePW1CZvGw
         ZBxg==
X-Gm-Message-State: AOAM532ByMOzzVa/Lm+4LWHTZ5jGIPvEGU9AQmafeD+PBUmbdi4Aktmd
	lCA1OtgkhTNMn2MfDJPS8jb8wHu44ig=
X-Google-Smtp-Source: ABdhPJxmmMbmWj5ntspZOudiviLyA/AkKCV1/oa2n4cSkwvyp024Ie1So4/dPvxLTHW2DQ2K5hFNrQ==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr7476875wme.15.1612617182491;
        Sat, 06 Feb 2021 05:13:02 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
        by smtp.googlemail.com with ESMTPSA id 67sm11724509wmz.46.2021.02.06.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 05:13:01 -0800 (PST)
Date: Sat, 6 Feb 2021 14:12:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ben Dooks <ben-linux@fluff.org>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210206131258.du6tmx7lda35rg5l@kozik-lap>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------

Thanks, applied.

Best regards,
Krzysztof

