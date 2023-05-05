Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CF0C77B75
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AFFAC4331D; Fri,  5 May 2023 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4918BC433AE;
	Fri,  5 May 2023 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683297521;
	bh=YP9LukujvPIzsE3v3lt0iker9oq1415NqkbRBh4teOI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gD/P7JI+k51XctY64AH0P+kb6ZyjuXmf6m55/7R1xub2dXrv30emxLESBVYyRB0wM
	 UewElHsfWBS7lA7IZs2RS+TaUcSgaky3SE2pp9ZzHilVrUGXYkxfsVWUduY40KBDvY
	 /bvMvNhmCKF7Z0YBrVxn5PzTdVej8sgqahP6CFNneqCwAwUppONSWs45xSHan65jwK
	 k8Kbev2wQFEwTLavqU0qMiFIhnpAM0IeTAsbafMhHiEq20qJlmzF4Wwo4cFjo9ZMHn
	 SaaI2sLpJPIyf/x4GBM7+QsJgAhpz7UoN6VULW82ZfPblXkhBH5kKlWeAP/g8VGq2+
	 bXRBPvT/Yg10Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so21397431fa.2;
        Fri, 05 May 2023 07:38:41 -0700 (PDT)
X-Gm-Message-State: AC+VfDwwPmQaYsyfLDvHbdFwi98SG86yAXcbZyY9HCZ7So+PxTv/FX6f
	MORpmATqxsN4NEHnpWfyB77C4jkTwmMY/CaRMg==
X-Google-Smtp-Source: ACHHUZ7gHN7xyy5qjB/9eqTF3xdAK6WGQvUy+jDcIhw/jL1osy5V2mYjmNXhRDfIuuwNKJjbnpk69Ill7Ymj7tkeTc8=
X-Received: by 2002:a2e:7c1a:0:b0:2a7:6d19:b569 with SMTP id
 x26-20020a2e7c1a000000b002a76d19b569mr583367ljc.53.1683297519170; Fri, 05 May
 2023 07:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
 <20230504-arm-dts-mv-v1-4-2c8e51a2b6c4@kernel.org> <20230505135847.7e433a18@donnerap.cambridge.arm.com>
In-Reply-To: <20230505135847.7e433a18@donnerap.cambridge.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 May 2023 09:38:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+q9-tHsBuGKPE4d_Aw881S19gTUakPhsvA0uyTZ==J9Q@mail.gmail.com>
Message-ID: <CAL_Jsq+q9-tHsBuGKPE4d_Aw881S19gTUakPhsvA0uyTZ==J9Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: Move .dts files to vendor sub-directories
To: Andre Przywara <andre.przywara@arm.com>
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
	Baruch Siach <baruch@tkos.co.il>, Wei Xu <xuwei5@hisilicon.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, 
	Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 7:59=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Thu, 04 May 2023 22:29:29 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> Hi,
>
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/a=
llwinner/Makefile
> > new file mode 100644
> > index 000000000000..a9f068e90c8e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -0,0 +1,159 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_MACH_SUN4I) +=3D \
> > +     sun4i-a10-a1000.dtb \
> > +     sun4i-a10-ba10-tvbox.dtb \
> > +     sun4i-a10-chuwi-v7-cw0825.dtb \
> > +     sun4i-a10-cubieboard.dtb \
> > +     sun4i-a10-dserve-dsrv9703c.dtb \
> > +     sun4i-a10-gemei-g9.dtb \
> > +     sun4i-a10-hackberry.dtb \
> > +     sun4i-a10-hyundai-a7hd.dtb \
> > +     sun4i-a10-inet1.dtb \
> > +     sun4i-a10-inet97fv2.dtb \
> > +     sun4i-a10-inet9f-rev03.dtb \
> > +     sun4i-a10-itead-iteaduino-plus.dtb \
> > +     sun4i-a10-jesurun-q5.dtb \
> > +     sun4i-a10-marsboard.dtb \
> > +     sun4i-a10-mini-xplus.dtb \
> > +     sun4i-a10-mk802.dtb \
> > +     sun4i-a10-mk802ii.dtb \
> > +     sun4i-a10-olinuxino-lime.dtb \
> > +     sun4i-a10-pcduino.dtb \
> > +     sun4i-a10-pcduino2.dtb \
> > +     sun4i-a10-pov-protab2-ips9.dtb \
> > +     sun4i-a10-topwise-a721.dtb
> > +dtb-$(CONFIG_MACH_SUN5I) +=3D \
> > +     sun5i-a10s-auxtek-t003.dtb \
> > +     sun5i-a10s-auxtek-t004.dtb \
> > +     sun5i-a10s-mk802.dtb \
> > +     sun5i-a10s-olinuxino-micro.dtb \
> > +     sun5i-a10s-r7-tv-dongle.dtb \
> > +     sun5i-a10s-wobo-i5.dtb \
> > +     sun5i-a13-difrnce-dit4350.dtb \
> > +     sun5i-a13-empire-electronix-d709.dtb \
> > +     sun5i-a13-empire-electronix-m712.dtb \
> > +     sun5i-a13-hsg-h702.dtb \
> > +     sun5i-a13-inet-98v-rev2.dtb \
> > +     sun5i-a13-licheepi-one.dtb \
> > +     sun5i-a13-olinuxino.dtb \
> > +     sun5i-a13-olinuxino-micro.dtb \
> > +     sun5i-a13-pocketbook-touch-lux-3.dtb \
> > +     sun5i-a13-q8-tablet.dtb \
> > +     sun5i-a13-utoo-p66.dtb \
> > +     sun5i-gr8-chip-pro.dtb \
> > +     sun5i-gr8-evb.dtb \
> > +     sun5i-r8-chip.dtb
> > +dtb-$(CONFIG_MACH_SUN6I) +=3D \
> > +     sun6i-a31-app4-evb1.dtb \
> > +     sun6i-a31-colombus.dtb \
> > +     sun6i-a31-hummingbird.dtb \
> > +     sun6i-a31-i7.dtb \
> > +     sun6i-a31-m9.dtb \
> > +     sun6i-a31-mele-a1000g-quad.dtb \
> > +     sun6i-a31s-colorfly-e708-q1.dtb \
> > +     sun6i-a31s-cs908.dtb \
> > +     sun6i-a31s-inet-q972.dtb \
> > +     sun6i-a31s-primo81.dtb \
> > +     sun6i-a31s-sina31s.dtb \
> > +     sun6i-a31s-sinovoip-bpi-m2.dtb \
> > +     sun6i-a31s-yones-toptech-bs1078-v2.dtb
> > +dtb-$(CONFIG_MACH_SUN7I) +=3D \
> > +     sun7i-a20-bananapi.dtb \
> > +     sun7i-a20-bananapi-m1-plus.dtb \
> > +     sun7i-a20-bananapro.dtb \
> > +     sun7i-a20-cubieboard2.dtb \
> > +     sun7i-a20-cubietruck.dtb \
> > +     sun7i-a20-haoyu-marsboard.dtb \
> > +     sun7i-a20-hummingbird.dtb \
> > +     sun7i-a20-itead-ibox.dtb \
> > +     sun7i-a20-i12-tvbox.dtb \
> > +     sun7i-a20-icnova-swac.dtb \
> > +     sun7i-a20-lamobo-r1.dtb \
> > +     sun7i-a20-linutronix-testbox-v2.dtb \
> > +     sun7i-a20-m3.dtb \
> > +     sun7i-a20-mk808c.dtb \
> > +     sun7i-a20-olimex-som-evb.dtb \
> > +     sun7i-a20-olimex-som-evb-emmc.dtb \
> > +     sun7i-a20-olimex-som204-evb.dtb \
> > +     sun7i-a20-olimex-som204-evb-emmc.dtb \
> > +     sun7i-a20-olinuxino-lime.dtb \
> > +     sun7i-a20-olinuxino-lime-emmc.dtb \
> > +     sun7i-a20-olinuxino-lime2.dtb \
> > +     sun7i-a20-olinuxino-lime2-emmc.dtb \
> > +     sun7i-a20-olinuxino-micro.dtb \
> > +     sun7i-a20-olinuxino-micro-emmc.dtb \
> > +     sun7i-a20-orangepi.dtb \
> > +     sun7i-a20-orangepi-mini.dtb \
> > +     sun7i-a20-pcduino3.dtb \
> > +     sun7i-a20-pcduino3-nano.dtb \
> > +     sun7i-a20-wexler-tab7200.dtb \
> > +     sun7i-a20-wits-pro-a20-dkt.dtb
> > +dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > +     sun8i-a23-evb.dtb \
> > +     sun8i-a23-gt90h-v4.dtb \
> > +     sun8i-a23-inet86dz.dtb \
> > +     sun8i-a23-ippo-q8h-v5.dtb \
> > +     sun8i-a23-ippo-q8h-v1.2.dtb \
> > +     sun8i-a23-polaroid-mid2407pxe03.dtb \
> > +     sun8i-a23-polaroid-mid2809pxe04.dtb \
> > +     sun8i-a23-q8-tablet.dtb \
> > +     sun8i-a33-et-q8-v1.6.dtb \
> > +     sun8i-a33-ga10h-v1.1.dtb \
> > +     sun8i-a33-inet-d978-rev2.dtb \
> > +     sun8i-a33-ippo-q8h-v1.2.dtb \
> > +     sun8i-a33-olinuxino.dtb \
> > +     sun8i-a33-q8-tablet.dtb \
> > +     sun8i-a33-sinlinx-sina33.dtb \
> > +     sun8i-a83t-allwinner-h8homlet-v2.dtb \
> > +     sun8i-a83t-bananapi-m3.dtb \
> > +     sun8i-a83t-cubietruck-plus.dtb \
> > +     sun8i-a83t-tbs-a711.dtb \
> > +     sun8i-h2-plus-bananapi-m2-zero.dtb \
> > +     sun8i-h2-plus-libretech-all-h3-cc.dtb \
> > +     sun8i-h2-plus-orangepi-r1.dtb \
> > +     sun8i-h2-plus-orangepi-zero.dtb \
> > +     sun8i-h3-bananapi-m2-plus.dtb \
> > +     sun8i-h3-bananapi-m2-plus-v1.2.dtb \
> > +     sun8i-h3-beelink-x2.dtb \
> > +     sun8i-h3-libretech-all-h3-cc.dtb \
> > +     sun8i-h3-mapleboard-mp130.dtb \
> > +     sun8i-h3-nanopi-duo2.dtb \
> > +     sun8i-h3-nanopi-m1.dtb\
> > +     \
>
> Some minor mishap here, but doesn't affect the functionality. Could be
> even fixed with a follow up patch, to avoid touching this patch again.

Nice catch. I can fix that up.

Rob
