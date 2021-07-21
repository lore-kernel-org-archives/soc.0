Return-Path: <SRS0=y4xS=MN=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E82C6377A
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 20:25:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2F16061221; Wed, 21 Jul 2021 20:25:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5DE60698
	for <soc@kernel.org>; Wed, 21 Jul 2021 20:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5DE60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f42.google.com with SMTP id i5so5093286lfe.2
        for <soc@kernel.org>; Wed, 21 Jul 2021 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjXDOWyd73wlu1QIRqgI71CqpEzm7Ck3HKRbigN51sg=;
        b=kQ6TYLiVfqICNhW3OwZxp8Qfd7xGJUzTJ1xFrBLx5DD2I2xKISmzOkio1Y72PHh0B6
         Vu31dkKMQK56+NS8E2axT060bnbg8hN2uDHiYpRDnoA5Ge0mTiVIL30vY3OMxRJXPr7x
         siTcNehJaQOMOjVXDVAGpHOUf6KCLhER79LafdIb4rV90jtBPOkPy6dStSKOGYECGzWm
         HcHeLqJy/y/MJZ21LtTR62ZAkSgL9KdhpEfsLC4XcPlP3lzLOKyo0Q/PBTP6cDDQAkQ9
         QjpJlWl+DIx5eQpnGHf7N8XSiJKFd6JSFcLTqHiX4Cdh04M/rqRYXDHePDNakG7+eZE3
         p6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjXDOWyd73wlu1QIRqgI71CqpEzm7Ck3HKRbigN51sg=;
        b=pCmYABab3VsVXi2RWVrEzYgCHl8X/TZX+3jIRVyobeO3zeaFTofjV3MYFNJQDi+j9i
         gBbYY/+lZZ/KPjUVlp2i/NuspC67sBRK0AWspbiiRWPNeLLKKTRqdmZzj3Obn5rPtN6j
         wrJ0iy159gDxgqGlCjqP1eHW4M+wVyDtW7e+0FbvO1nz9RhlLBw2o3W1Qksz+rZAAJem
         hT82cM4iiuiskgS7SKIpoiOpNhPy+rU6J20cwAenHAM6ZPpGIdg7pXWpUmCPjayzggup
         zt/bqxcRcOTnokt0s7pZZPFJF6OaEjj1GMqeAvj2vzjx2gxIUuRYPFKZory5PL1N4An/
         KWIg==
X-Gm-Message-State: AOAM5311GwPw4V8RZaPtn+fXuvEoHgkQyAD+qPntqL+kRxxBK6ldfkmC
	mztnjAkJbfxNM0H6ZNhxmplue9yx/BkiVhXuJqahyw==
X-Google-Smtp-Source: ABdhPJz+Ibpdq9t9/cUreWhO5XZT1p+ryHZn3jXNVmSjN+McdT77o4jR3PjGVJNH4azveTk6PTf1wq1eqskPw47GurI=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr25904144lfh.649.1626899111566;
 Wed, 21 Jul 2021 13:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210721151620.2373500-1-arnd@kernel.org>
In-Reply-To: <20210721151620.2373500-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 22:25:00 +0200
Message-ID: <CACRpkdbpb-mVHQackyJM=yP=TS2c=6zM+ZXfbHZPWfR6cR+xUw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ixp4xx: goramo_mlr depends on old PCI driver
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 21, 2021 at 5:16 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When this driver is disabled, the board file fails to build,
> so add a dependency:
>
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_preinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:472:9: error: implicit declaration of function 'ixp4xx_pci_preinit'; did you mean 'iop3xx_pci_preinit'? [-Werror=implicit-function-declaration]
>   472 |         ixp4xx_pci_preinit();
>       |         ^~~~~~~~~~~~~~~~~~
>       |         iop3xx_pci_preinit
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_postinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:481:22: error: implicit declaration of function 'ixp4xx_pci_read' [-Werror=implicit-function-declaration]
>   481 |                 if (!ixp4xx_pci_read(addr, NP_CMD_CONFIGREAD, &value)) {
>       |                      ^~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c:231:35: error: 'IXP4XX_UART1_BASE_PHYS' undeclared here (not in a function)
>   231 |                 .start          = IXP4XX_UART1_BASE_PHYS,
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
> arch/arm/mach-ixp4xx/goramo_mlr.c:376:9: error: implicit declaration of function 'ixp4xx_sys_init' [-Werror=implicit-function-declaration]
>   376 |         ixp4xx_sys_init();
>       |         ^~~~~~~~~~~~~~~
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: soc@kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Ooops
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
