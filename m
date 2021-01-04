Return-Path: <SRS0=MJ2f=GH=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D49C433DB
	for <soc@archiver.kernel.org>; Mon,  4 Jan 2021 16:28:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C833224D2; Mon,  4 Jan 2021 16:28:46 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B4462245C
	for <soc@kernel.org>; Mon,  4 Jan 2021 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B4462245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-il1-f180.google.com with SMTP id x15so25840990ilq.1
        for <soc@kernel.org>; Mon, 04 Jan 2021 08:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6BE0bLFnBbRxZQebjCFcYcAXRZ2Cug808cMEhBnkBjQ=;
        b=UFT0EWS6N/k3n+VsZY1C5JZBGMj3kSztMPUsp0GtKpBNavsAxG/tsEIUksd1ab2+Cz
         65fPm3LJO9Qo74NkRk1gI6aMAq20tHuRphvuqh/xSBy/PKavagVylmEtVUQBHQx/+JT7
         SBXGv8evnrowyAV6oQFVrvQhZE6/KwB4y0IgOqR9wUHI/lHrG5VzMggIwkYeCCcl3t2C
         KMifCYj/whERqC7Wal+eTovKefLh1txerEf2x8a90gNjNVSIeYTqxwrg00xu0U8WeGZ6
         zN1zIIdc7dAS9MCcfOE+eSqA4at9v+hVi1ACcDUnf+2iKjh4sjIkS4ErqYi2wJtQygqy
         6pQg==
X-Gm-Message-State: AOAM533XzQsMlnESQAUSCfLs+0RkSW0R1eJLuQr9wNEj6oBH6fyg+KwW
	eNNlalPdnLZh3Nl0r/YUc9dh32Np4A==
X-Google-Smtp-Source: ABdhPJzRl+1dDFvpecCYtgp1pt4LNgqtUQWMaq4z26IKHkGBVToNJOC7zkPShcm4TERSM4BP/cFMJg==
X-Received: by 2002:a05:6e02:ecc:: with SMTP id i12mr68736490ilk.0.1609777725189;
        Mon, 04 Jan 2021 08:28:45 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o7sm42568788iov.1.2021.01.04.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:28:44 -0800 (PST)
Received: (nullmailer pid 2106078 invoked by uid 1000);
	Mon, 04 Jan 2021 16:28:43 -0000
Date: Mon, 4 Jan 2021 09:28:43 -0700
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 0/4] Remove PicoXcell
Message-ID: <20210104162843.GA1875909@robh.at.kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>

On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> These patches can go via the respective maintainers' trees.

Arnd, Olof,

Can you apply patches 1 and 2. The others have been applied.

Rob

> 
> Rob
> 
> Rob Herring (4):
>   ARM: dts: Remove PicoXcell platforms
>   ARM: Remove PicoXcell platform support
>   crypto: Remove PicoXcell driver
>   dt-bindings: Remove PicoXcell bindings
> 
>  .../devicetree/bindings/arm/picoxcell.txt     |   24 -
>  .../bindings/crypto/picochip-spacc.txt        |   21 -
>  .../devicetree/bindings/net/macb.txt          |    2 -
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
>  MAINTAINERS                                   |    9 -
>  arch/arm/Kconfig                              |    2 -
>  arch/arm/Kconfig.debug                        |   13 +-
>  arch/arm/Makefile                             |    1 -
>  arch/arm/boot/dts/Makefile                    |    3 -
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
>  arch/arm/mach-picoxcell/Kconfig               |    9 -
>  arch/arm/mach-picoxcell/Makefile              |    2 -
>  arch/arm/mach-picoxcell/common.c              |   81 -
>  drivers/crypto/Kconfig                        |   18 -
>  drivers/crypto/Makefile                       |    1 -
>  drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
>  drivers/crypto/picoxcell_crypto_regs.h        |  115 --
>  20 files changed, 1 insertion(+), 2869 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
>  delete mode 100644 arch/arm/mach-picoxcell/Kconfig
>  delete mode 100644 arch/arm/mach-picoxcell/Makefile
>  delete mode 100644 arch/arm/mach-picoxcell/common.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h
> 
> --
> 2.25.1
