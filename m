Return-Path: <SRS0=y4xS=MN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D76C6377C
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 20:24:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5624F61263; Wed, 21 Jul 2021 20:24:19 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D75B6124B
	for <soc@kernel.org>; Wed, 21 Jul 2021 20:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D75B6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f46.google.com with SMTP id b26so5077247lfo.4
        for <soc@kernel.org>; Wed, 21 Jul 2021 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1fSEVFqUHw4YbE91AcPQyxQQAoQKEf3Quu62fEWYpM=;
        b=eNPhHfJRAQmHqXGo9tKdmBMr74Yzifs4VEpKtVWbGpAw3a/ia6SnGPHN++Kg8qNYti
         C2LVca0Zr+CXXv9RqN+9hrUMF8Dy5GlxC9gO2+cGGRoLca9eyCTkOiQkPm+LMc6HAe9K
         LxdQgK7NHnJd5T1mUubdTOkVkknGaQKzOzFIzFfZV6bZFL/L47auyl/st/0JMNR4b5Wn
         qy8/dPed+bfqT0AnW/VcqDSrlSFJ+mxn1G/89uIDBwPD1ADuA/q45pw1K0bH2X2TN+Tv
         MJA+qsN0kRCWuq9Pm1AadJdT/Rce3ppBKvd+S0Ib7jw9IABUZiwoyQ3HC69WF1Jn8Yp8
         Y1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1fSEVFqUHw4YbE91AcPQyxQQAoQKEf3Quu62fEWYpM=;
        b=Nq3AvO5c7PRW4SyZbHxmuD8LmlVNxQEEY9iECZA4b8OT8lLbZ51srrE8kFWSsUBgHY
         VKtI7Fkarp75rWBVZJCgRg7czTYkhAnWGqn5MiAoPDFGdq3ZCqBhHI8mLm0YIDkO83No
         uhE1NZMq/Z7bU+rzLaMdCQGXVcoqAFvp0TJ8PPwSIsbb/FoMZiCfyD+xiw82lO7rWScM
         e/YviftwhdNbNCDT4rohSY1d6gGxYMZF1utgq7m2wajzXL+wyZ+9O6Sax0xw12l0zPPT
         49983ALkQgw3rB/9Bgu9b2WKPCo5ANEgstiCFo5jMWTdgq1c6UC8lESlr/3//cso/I+9
         YVKA==
X-Gm-Message-State: AOAM530ZEw6oibG/cXfU3nrTh2juQtBEGN23NJv04dDBnXvy7fboa1V5
	9M2pNqBuJDx6QnBmkExWYxYNA9jD0CdoHGQ+Q+MXEA==
X-Google-Smtp-Source: ABdhPJyGeXguhortkkfg6BjqS34WA20M1SIfJqsW4mpXW18zkOgpVQv39lVckpNO2cFGBH/aqAfnxROqkwH5q24AkQI=
X-Received: by 2002:a05:6512:169e:: with SMTP id bu30mr6326301lfb.291.1626899057636;
 Wed, 21 Jul 2021 13:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151546.2325937-1-arnd@kernel.org>
In-Reply-To: <20210721151546.2325937-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 22:24:06 +0200
Message-ID: <CACRpkdbuXkvOkMNizqmRPwuYz-YU8j-yidtXsOAmEd4z3B0hVA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ixp4xx: fix building both pci drivers
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 5:15 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When both the old and the new PCI drivers are enabled
> in the same kernel, there are a couple of namespace
> conflicts that cause a build failure:
>
> drivers/pci/controller/pci-ixp4xx.c:38: error: "IXP4XX_PCI_CSR" redefined [-Werror]
>    38 | #define IXP4XX_PCI_CSR                  0x1c
>       |
> In file included from arch/arm/mach-ixp4xx/include/mach/hardware.h:23,
>                  from arch/arm/mach-ixp4xx/include/mach/io.h:15,
>                  from arch/arm/include/asm/io.h:198,
>                  from include/linux/io.h:13,
>                  from drivers/pci/controller/pci-ixp4xx.c:20:
> arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h:221: note: this is the location of the previous definition
>   221 | #define IXP4XX_PCI_CSR(x) ((volatile u32 *)(IXP4XX_PCI_CFG_BASE_VIRT+(x)))
>       |
> drivers/pci/controller/pci-ixp4xx.c:148:12: error: 'ixp4xx_pci_read' redeclared as different kind of symbol
>   148 | static int ixp4xx_pci_read(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
>       |            ^~~~~~~~~~~~~~~
>
> Rename both the ixp4xx_pci_read/ixp4xx_pci_write functions and the
> IXP4XX_PCI_CSR macro. In each case, I went with the version that
> has fewer callers to keep the change small.
>
> Fixes: f7821b493458 ("PCI: ixp4xx: Add a new driver for IXP4xx")
> Cc: soc@kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I tried very hard to make it impossible to build both drivers at the
same time :(

Oh well I guess I failed. Kconfig ... say no more.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
