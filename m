Return-Path: <SRS0=6xmh=BE=gmail.com=eballetbo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62BBC77B75
	for <soc@archiver.kernel.org>; Mon, 15 May 2023 08:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B743C4339E; Mon, 15 May 2023 08:42:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 187CCC433D2;
	Mon, 15 May 2023 08:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 187CCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so11080074a12.2;
        Mon, 15 May 2023 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684140119; x=1686732119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fD0fpSqeYQATHAfxrc40asdZfIrotxKdFwnOOUQo9hA=;
        b=iiP2zX4BRcy2fPNOu0OxN1fusbX6TYkeV1IJiwa4zYhVPths+Vwqo0AvCi+shkIqhf
         qBVd8uDcIbXbtHyMIDx7CjvxhBXlAFhRM3Buj9Jo2Bu15RAhPIsA7JGbhSCFsfaong97
         J+UMD4NAvRqCwayPzWaORcDsxkp/JzwiDJ6/1KXGaD3lsCinNftj/n2jFbdWRwS4dFpJ
         60E8Qk/28/NPiAYp5DELIv7d9S5f04BiqA/be0OGfa0tbC2Ek41dLa4pEQr+5CVyzZUF
         lOSqRNPcZJBdohYPX7H1yf04EpSpc09lrxr9NWq975BMNf+kcHkqGwMrNaryRua16lWc
         xEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684140119; x=1686732119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD0fpSqeYQATHAfxrc40asdZfIrotxKdFwnOOUQo9hA=;
        b=MQ7DCNc1Y6QZMOeoBg8Jr3HRYzg6lErd1nwq+WDm7voRQ/rOR8MJJlUbstl/1EZyXz
         ytZ7gwk/hDi9vvwrQ5keKL4PzRJW9J5ekQfoq9nYxU5Qqu33+yp9Pqqn5fb3UNeUNfPp
         mH016Lwm/Wt9TmGcpdBgrfVA8Rsm+SF7Up4+Y1wSXLGW2PpZeLkb4JnPJxhiP09U/Efq
         Fu2YiBN7230D8zeIQ8c5R1G2XKMZegCJMbfWwr+oLBV8HttnRsvZp+muYJdTbEAyzo4W
         Xknc56oAEPvGH1FsTybQVcyQWy9WrCnLwwe9xOU2U8HOAUtqcBxXE9YUTbBZEIqmS1Ub
         +rug==
X-Gm-Message-State: AC+VfDyqzC6gd6+nJNHiRQjZBvOGq8C+FVlG7xxyQVJ4PqirVXOx25wh
	kWqLOcplzzGSGDV0cQwMeeOK44oz50t7L1T2bSi1urtoaxM=
X-Google-Smtp-Source: ACHHUZ7XXPpX3mJ7rJEv+Y0TAqfS548hzthsIYZYYrXMGfy7iGC11VFTocLjvHY8MV96XpSzHEV6vQWxTsrWW541Cdk=
X-Received: by 2002:a05:6402:2d0:b0:50d:91c8:9e16 with SMTP id
 b16-20020a05640202d000b0050d91c89e16mr22573811edx.12.1684140118752; Mon, 15
 May 2023 01:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org> <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
In-Reply-To: <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 15 May 2023 10:41:45 +0200
Message-ID: <CAFqH_520eLGP8wmD6fYyCvXscsndeGka3moVk3G6VpW3zsEhXQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Joel Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>, 
	Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, 
	Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Javier Martinez Canillas <javier@dowhile0.org>, Michal Simek <michal.simek@xilinx.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Missatge de Rob Herring <robh@kernel.org> del dia dv., 5 de maig 2023
a les 5:29:
>
> The arm dts directory has grown to 1553 boards which makes it a bit
> unwieldy to maintain and use. Past attempts stalled out due to plans to
> move .dts files out of the kernel tree. Doing that is no longer planned
> (any time soon at least), so let's go ahead and group .dts files by
> vendors. This move aligns arm with arm64 .dts file structure.
>
> Doing this enables building subsets of dts files by vendor easily
> without changing kernel configs:
>
> make allyesconfig
> make arch/arm/boot/dts/ti/
>
> There's no change to dtbs_install as the flat structure is maintained on
> install.
>
> The naming of vendor directories is roughly in this order of preference:
> - Matching original and current SoC vendor prefix/name (e.g. ti, qcom)
> - Current vendor prefix/name if still actively sold (SoCs which have
>   been aquired) (e.g. nxp/imx)
> - Existing platform name for older platforms not sold/maintained by any
>   company (e.g. gemini, nspire)
>
> The whole move was scripted with the exception of MAINTAINERS.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For ARM/IGEP boards

Acked-by: Enric Balletbo i Serra <eballetbo@gmail.com>
