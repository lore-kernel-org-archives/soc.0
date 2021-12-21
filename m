Return-Path: <SRS0=tOqj=RG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6675C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 12:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86871C36AEA; Tue, 21 Dec 2021 12:30:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E16DC36AE8;
	Tue, 21 Dec 2021 12:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E16DC36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MPGNn-1mpQ4H1pEr-00PfSw; Tue, 21 Dec 2021 13:30:28 +0100
Received: by mail-wm1-f49.google.com with SMTP id bg2-20020a05600c3c8200b0034565c2be15so1599962wmb.0;
        Tue, 21 Dec 2021 04:30:28 -0800 (PST)
X-Gm-Message-State: AOAM532xRSUX5O0UELBR976VWDTw2U2S2D1w/JpEk01xOptZNEzuO6/e
	0bcexdCZboBXr8RhqzJ09Mv05HpTC0fz8l+HysA=
X-Google-Smtp-Source: ABdhPJz5I5V9tkkz/xNeJ2SBTmCr8b1TLLSAA2/foopZ/Cq28p7udPHLd/q+bVkZqxA+WUBIwycTD2bGxSFtmwpgeH0=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr2539746wma.98.1640089828060;
 Tue, 21 Dec 2021 04:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20211220165004.17005-1-krzysztof.kozlowski@canonical.com> <20211220165004.17005-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211220165004.17005-2-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 13:30:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0AAMh4FhRbZ_iZCoMP8F7+Fn4+naB-PZWTV9RSMO4bwQ@mail.gmail.com>
Message-ID: <CAK8P3a0AAMh4FhRbZ_iZCoMP8F7+Fn4+naB-PZWTV9RSMO4bwQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 6/6] arm64: exynos: Enable Exynos Multi-Core Timer driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:okj02PdMpvUVUcyvGH1dytlK5/DEbTCcHjlIokeemhMiXUkuj7H
 c3SHw1QUN5VdbF2vlSAxF+DgEDcFAA1bG3yWKVG96HGSUV6j1pAwZ6qPvRArrHSr8hVo+g2
 eiUT0cHuvs4534gdY2Wqkzbx03BbT1jloy8994v0Xabtjka1I2pq77OHt0jYAKS7s8w7OB5
 Kvyk6nCiy1HUtaScGpj7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hxiakHoezrc=:T/VIWkGYVW2PP4kg6IlyzB
 2/i9BKDR7S4iSQdjte06gNK3+5cCisAGtZxRfNR5tWVjNm3n8x58utz05j6f7RPYMeIYHlWO+
 0U/vuL/LGplzR2AN0wPjdkIapjOtSg8DxXEl++oyHNAQscDBmR9JRAKoTZJntS4gn1iHgfaTb
 ShOCR/Xqi1WhyXe3EHJ+0jDjOx9RyKVUVR2IZoEjr5pkF+1mUG4X63q7Xc0id5XOTTmxOu1/g
 hWFYHdXLt8JmuttnqEwRXosY/op8BCyXOjIU0JMA078Knuts3sdbPyucB3Do1yTGbRZ6kp9BW
 PFmM9IJipnGhj7UwG4uYy6BsnquEzDZnmXY+iU+IDrXC/frw8eE0JJZR9jK4S9+/JYU70Sxwx
 uKdhDrFE8jHVhsqmE50nxShN6iYOqr6uDo/3xVcezPTF+BHItE7FQOcghBnxqiwO5PAbWf7ch
 zU6w88dVE9F9zwLnrVAXientDzqEGnOysxY9tOVWHAWAyvn1MGBGf8Wuhw65w+rhAx/kHsvSb
 u6TmzVMNXLMwnt5Ad47/7rHsZR+XJ/UaMBOvYwymXN4b6fU6pRUQ1CPLqrQU5nkZU3PfEIpuk
 N9rja8Ye8Lz3uTdy/oStgLjxSbaMLb1sAsgvO9bVo+Qz1c9wexlhPCn2g5y3wWaqbo+bB9aeW
 hGw1Km4gSkvTj+xQfhDU8im/JmmBBHdJWJHhQ/05PxkQ6xN24+Z3U1mg6Tu8a/KZU1ng=

On Mon, Dec 20, 2021 at 5:50 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 1aa8b7073218..91f5e9568122 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -89,6 +89,7 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>         bool "ARMv8 based Samsung Exynos SoC family"
>         select COMMON_CLK_SAMSUNG
> +       select CLKSRC_EXYNOS_MCT
>         select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>         select EXYNOS_PMU
>         select PINCTRL


I applied this, but I don't think this is the best way to do it. As
you describe, the
driver is optional, and we probably shouldn't force-enable it here just because
we build a kernel that may run on a platform that may want to use this.

I understand the clocksource maintainers prefer the 'select' method, but I think
this one shows why that doesn't always work well. This is probably even an
example of a clocksource driver that could be a loadable module if someone
did the work to make this possible.

        Arnd
