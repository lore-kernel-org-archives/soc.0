Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4D5C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 21:04:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA21A23B70; Tue,  8 Dec 2020 21:04:28 +0000 (UTC)
X-Gm-Message-State: AOAM530EJFn/yWOiNRP7DsqmXDsY3C0Vz5tU9vVTDcvsRta91Up3mctT
	oznQ9odrpqgeM+0qMy6ouT+E/YG0jXX50sih1FI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607461468;
	bh=pC5uMEwfR8I7zJOufVHiMnxXyaaTii8pTwxwwzk6hbI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LqSXf0rLtaFg7OiJDPLvxyLr8icmHXe4yuXKIY4h+YZ2yI6o6C2+Cp6lzzcE53RP+
	 qbcZNzsrzFDyKkmxH3At8U+KCXIslXO6P2j3/s4ufeGSW+N6hWr0seQipFRcNAoQlr
	 P56APB2iQc/CsazNMHtgUJ/hy0/Vvnj2uonhwn+o3qqEHAyMe9/B2iYWYdcNoLgUe3
	 eq6fJk9hg8VV7KU6RH6T6+JjtBp5PZIG3B5ZYJ0ym7XHZgQXOxkudvrnnTb9lAaTfq
	 4sFfjCrSGex3bf8XGqRI1E4MbgGXDOjkxmUmRa31TG8dWM//mTEfBnw+5clvucs/s2
	 gDg3LXbFQcKHw==
X-Google-Smtp-Source: ABdhPJz24xLDQ1sYVHXzKiGgnnVEI0nBoYMIK+EbZwUc+kqiRM7M10D2HVBVPIdLAc7qYdhjqVmYniHI185FcY2oAeo=
X-Received: by 2002:aca:44d:: with SMTP id 74mr1652369oie.4.1607461467934;
 Tue, 08 Dec 2020 13:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de> <20201208170021.GA6168@alpha.franken.de>
In-Reply-To: <20201208170021.GA6168@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Dec 2020 22:04:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2FyP7TOc-fm=YQE9FX_tOiAk9_k2bn3XK5MW19D++Ymw@mail.gmail.com>
Message-ID: <CAK8P3a2FyP7TOc-fm=YQE9FX_tOiAk9_k2bn3XK5MW19D++Ymw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
List-Id: <soc.lore.kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Emil Velikov <emil.l.velikov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Parisc List <linux-parisc@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Tony Lindgren <tony@atomide.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, SoC Team <soc@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Will Deacon <will@kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jernej Skrabec <jernej.skrabec@siol.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Helge Deller <deller@gmx.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 6:00 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Tue, Dec 08, 2020 at 05:34:46PM +0100, Arnd Bergmann wrote:
> > [3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
> >       commit: 2257682282531de45929c6006152f6e2ee881b42
>
> this one is already in mips-next.

Ok, dropped from my tree,

       Arnd
