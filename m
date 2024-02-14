Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC3DC48BC1
	for <soc@archiver.kernel.org>; Wed, 14 Feb 2024 15:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D6C6C41630; Wed, 14 Feb 2024 15:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E891C4166A;
	Wed, 14 Feb 2024 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707924674;
	bh=4JlFA01oQWdtvRaP+CnWQqdwr1cP142uEyw13TLrbN8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BbAvOXB5vIyCHJxfBGRZkF55H5Pm85mt9meeS818833QzNmxRWNy1jfCKvGhcaxFb
	 kWwVGYoFgOMZW8NFMwoyhE6tm7xsAcpDgjpp/vzS/M6wHY+zujPbj9A+SlHuNPYesq
	 OTuPVxXTOhnbnVG6qOTg3wTLati28IOQT+SXCH44NkOkvlDDYjBD7Pgn8gYdfJ/8e1
	 5pXQmcaF+d4hJdpdu62SOZW86EM96ZLUcxsORZe1HTn2cTKnWDhPbVgdLOrKD/RDAk
	 aRn0+NKRInbtEaU/E3//KMTjDY9knM3QbiUHNd0ysqOdN8tLeV2/vkJB/6Sb9PqLWE
	 Er1+7vx1nXpOg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d0e5212559so53926631fa.0;
        Wed, 14 Feb 2024 07:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8qevybXM9O9aVlqQfoQEtnrIu8gp048GkOCdFMqWFsgv7dXZOpJC/5OXrS1C+auNvm8cMkzAPnAUV7VcZlvKI87fI3p30BDCeXyJBG7QcU0Fj2jta31JCtdE4AuQlikaQ1DyjEr/59qPMeaT/YDxGtaYfb/h2J0tL3WZQroGrNBPVvfwFeh07WFDNX2rAFD5MMJG3bNnx1ayawXhY2vD0jNBcswolqMVtLY2O9ESoiwb8aKrBH/lamvdlrBDk
X-Gm-Message-State: AOJu0Yz8dKNWsmaEw0i5pE9KslImFEPpmA5HHIMiZqw4O9Nou8gyZk4O
	DgDNXWU3/XIu4KwP1rNZqXxbJRp8hpTxDxYJCChhvnM0yTn5UPVJ/+qXCYArudu+MmCITd2rIN3
	lDHgRJbK+aLSHB/fC0EK3JEnL6A==
X-Google-Smtp-Source: AGHT+IH8/isML9jhNTe8vUWU49jrNm4p0HUKpD8NeE7Izp0zgWowWPvoVR9vvZmOadC5fdJrnpVWN3J0XGbdjt6xmGE=
X-Received: by 2002:a2e:b888:0:b0:2d0:dfad:2863 with SMTP id
 r8-20020a2eb888000000b002d0dfad2863mr2522106ljp.46.1707924672118; Wed, 14 Feb
 2024 07:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 15:30:57 +0000
X-Gmail-Original-Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 9:01=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
>
> > *There's a few Renesas warnings still Geert said he would fix.
>
> Thanks, fix sent
> https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.170792=
2460.git.geert+renesas@glider.be
>
> >       dtc: Enable dtc interrupt_provider check
>
> >  scripts/Makefile.lib                                  |  3 +--
>
> Just wondering, can the remaining disabler be removed, too?
>
> Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

I was too. Shockingly, that too will require some fixes. Though I
remember when configuring the warnings for bindings, trying to make
them stricter. So there must have been some case where
no-interrupt_provider was needed. It may have been related to how we
parse interrupts in examples, but that changed back when switching to
validate dtbs directly.

Rob
