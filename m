Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA0C48260
	for <soc@archiver.kernel.org>; Tue, 13 Feb 2024 20:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1B04C43142; Tue, 13 Feb 2024 20:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CE8C433F1;
	Tue, 13 Feb 2024 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707857779;
	bh=D4LSaj+s1Zug+tnZej27exr9mIRN2BETmj/yUE3GRW0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DkhDRDlt3UmgskQe0ga858Y95NGviEg+ntGSz18SIS5E/CCYNqXWLQVZT9E/Q0uGq
	 g8ruPA4A2mAzu+HC/1By2ZLHWUZoRHjiiVOhtG8VWx7I+4amzxgHOgU6h4pRkrOrz1
	 l2pAA7gGRzRhazWmfrgYCGu1OK+OOF9gamyFuwSVoJSlmME0288P1/9Fpm1IdjM/C0
	 EQ+oscb+VpsKICN4caiMphQHK2Lalau2fEpPngGF+WB/rB67PHYTXr8YzJav7hwuai
	 vJ/LkbdWtLecXsvg5HWDYkDIO2uqeSWX5aYjfGCF5yTnosQPNQB1ViL/MoEwMwq6vC
	 AK8y8uqD8zdXQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d09bdddfc9so63878671fa.2;
        Tue, 13 Feb 2024 12:56:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUggVTCi0dLUBPT9gT13naNCTeGWo8JlBx8vBqybkp05a1gCn3DcBkhtE2FDeC0ca4PHkjx52RjuyF4LrTp4PEDQ6oaI+SHimABV0qRDKtUGn+2XAYBGlYXs0Udh4/W2TBoirgdlYeRl4oRW7npBJ6aFlTh6B+fVKHDy+l8Hq5yZlIaYGghTQPhJwezmPfX1jKriy5MO06Ge6D6O2bvN/mDUB/TfiL72cSy
X-Gm-Message-State: AOJu0YwK+Eny7kGvfrFpgrnnzIuypUcB3hCCPpIUJvm0aFR3eiPcDjvK
	IOJeRyY//zmdw4Hj0A2PI2SqH6eAhoBISDpUnR6776mKcQrD/5Kt/IUFdsM5YnRl1gc2RNiykYG
	r7gSA4TRz5FfFadACppk9+tsseA==
X-Google-Smtp-Source: AGHT+IHaVnixOZOBNn0WypWTPscuLN4ELDvcVIU+BZ+gCn9OLEVbEJc+WSHECitxZrPyjoAQls55JHpdFFIbqmURVBc=
X-Received: by 2002:a2e:9bc7:0:b0:2d1:107b:3bbd with SMTP id
 w7-20020a2e9bc7000000b002d1107b3bbdmr506655ljj.9.1707857776326; Tue, 13 Feb
 2024 12:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-wafer-garnish-88287bc5d4a5@spud>
In-Reply-To: <20240213-wafer-garnish-88287bc5d4a5@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 20:56:03 +0000
X-Gmail-Original-Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Conor Dooley <conor@kernel.org>
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
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 2:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
> >
> > SoC maintainers, Can you please take this series directly.
> >
> > Rob
> >
> > *There's a few Renesas warnings still Geert said he would fix.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Rob Herring (6):
> >       arm64: dts: freescale: Disable interrupt_map check
> >       arm: dts: Fix dtc interrupt_provider warnings
> >       arm64: dts: Fix dtc interrupt_provider warnings
> >       arm: dts: Fix dtc interrupt_map warnings
> >       arm64: dts: qcom: Fix interrupt-map cell sizes
> >       dtc: Enable dtc interrupt_provider check
>
> Only fixing it for arm, Sadge.

I was assuming you had things in order. ;)

> Co-incidentally I noticed there was one for riscv while looking at
> Krzysztof's underscore in node name patch earlier, so I'd already
> written a patch to fix it :)

See, I was right.

Actually, I did remember to check right after I sent this and noticed the s=
ame.

For powerpc, no one else can be bothered to care, so neither do I. I
think powerpc has been spewing dtc warnings by default for some time
now.

Rob
