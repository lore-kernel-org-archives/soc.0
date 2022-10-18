Return-Path: <SRS0=mOJy=2T=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB28C4332F
	for <soc@archiver.kernel.org>; Tue, 18 Oct 2022 13:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB575C43144; Tue, 18 Oct 2022 13:05:00 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 213B8C433C1;
	Tue, 18 Oct 2022 13:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 213B8C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id x13so8520685qkg.11;
        Tue, 18 Oct 2022 06:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3o3vYAk1VZiDmjBJfHdrW7jPj/9+r6RZmm9abHN1X0=;
        b=oYT9L35PRxKowZS42rXbusJMTXJBcvYSoLl/4J/LZJvxn6x2YcUymX6fb5Gu5x+LSu
         rfIyazcoE2knVOERRINTV7BCnYmhAj9oCmiHTMcXBvgVhy7K6tVvy1JXW7KC+QAe75eo
         ccrgLZZ/CGq7dGymv4wF7tpIEsOV0JJfHMLyg30Te+nvbY7JSjYmEcVIY3M7+vUMcNC/
         wZ5QkeMIlkSQVsYf1VX0NHplZTsSHHOMSqK+ezWNa5ZMazCv4q3rozjCm3KL5n8wJRBU
         gUhLDHCwMWvCQXFsN3K7j04H828DLT/qHZFUcQByO/P0Sq03QAAbNbGJU1ZF6MXlWYZm
         Uqrg==
X-Gm-Message-State: ACrzQf0VHqzHfB+nVubalfBunHBjeHqX/k8zqk3bVaoJFykLzvCkR+A3
	6t0x3km0c7MtfAo6s2g9DHasZoFZX3s81Kdz
X-Google-Smtp-Source: AMsMyM40zpgU61NOFlYRwArVqg2uussXCekmJa39NXQJp5KxagqzWTV6wW9jBe7UCNHzrRZ4Y702oQ==
X-Received: by 2002:ae9:ec19:0:b0:6ea:d0cd:a4ed with SMTP id h25-20020ae9ec19000000b006ead0cda4edmr1699771qkg.472.1666098297876;
        Tue, 18 Oct 2022 06:04:57 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a29ca00b006e07228ed53sm2505736qkp.18.2022.10.18.06.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:04:57 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 81so16879153ybf.7;
        Tue, 18 Oct 2022 06:04:56 -0700 (PDT)
X-Received: by 2002:a25:26c1:0:b0:6c3:bdae:c6d6 with SMTP id
 m184-20020a2526c1000000b006c3bdaec6d6mr2457054ybm.36.1666098296216; Tue, 18
 Oct 2022 06:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com> <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
 <Y0UyOWALxSFai2w6@smile.fi.intel.com>
In-Reply-To: <Y0UyOWALxSFai2w6@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 15:04:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Message-ID: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Basavaraj Natikar <bnatikar@amd.com>, Marc Zyngier <maz@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Oct 11, 2022 at 11:07 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Oct 11, 2022 at 10:46:30AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wr=
ote:
> > > On 10/11/2022 1:44 AM, Andy Shevchenko wrote:
>
> > > > +++ b/drivers/pinctrl/core.h
>
> > > > -#include <linux/pinctrl/pinconf.h>
> > >
> > > Removing pinconf.h from the core.h may cause build failure in other f=
iles
> > > because where-ever core.h is included to use =E2=80=9Cstruct pinconf_=
ops=E2=80=9D, there
> > > is a need to include pinconf.h.
> >
> > I can confirm adding
> >
> >     #include <linux/pinctrl/pinconf.h>
> >
> > to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-s=
ingle.c
> > fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
> > renesas_defconfig.
>
> I will add this, thank you for reporting.

Same for drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
