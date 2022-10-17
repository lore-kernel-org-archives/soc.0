Return-Path: <SRS0=0s7l=2S=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33738C4332F
	for <soc@archiver.kernel.org>; Mon, 17 Oct 2022 12:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDC70C43147; Mon, 17 Oct 2022 12:16:29 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFD4BC433D7;
	Mon, 17 Oct 2022 12:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFD4BC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id hh9so7500047qtb.13;
        Mon, 17 Oct 2022 05:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=G4XBw7OtjlEVYhvq3ujakfFtUjrlMIkd5uVVPI4L3fSHgn9r2dYLTBKR1DSk55qy8/
         vjDDH2t4lQErUrsZ81N0WmnCPAq1TAG4psbIGjoQRhntN5Cmq1aF/T5qp0/euyInLZPZ
         /K8bnHyxQYrmvZCrh75klmy5Bz15Y/XvsM73Xs3LGuMo2izmCHPf5UYpUMbW37BEsOEV
         sVucDgXlyB1YZt4pqPGa9U7E85eMuIK9JN+tGTbAMfTNB3gqhaNnxWOxBOHdWu8HWlhw
         4OAFcfWlF4Cka/k2IMLMYdJ1w8Emhfeq9FKglqB57GbZ26ff4iD6Qp74edFo/4+10u7I
         pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=qdh2r9HLrfvFWgPOvoFYy+NndfRlfX2ni7ohMwGw08Ypt5UFRbZahtdG3ssGtW6tTz
         krtyebQ7CQiRMAtOJ/nredW1o1Kaw0iB6D5+m8h3oFHi2F1EsOXlyRcyP139BLP2Agzz
         iHuD1XZurCNaOgOrZSqoHgdApcI0hBGvKlN9slxWhUFYM43L+xijyh+ivuhrNo9XNIkb
         tiR8nYbrUimouwNVnhoYSQ4i029/tkV4qsJ0/nDgJzjkBquh5s8ldIMILG6P6d0wDrEh
         VJHxjWzDQNxhlGhJP+N8/RSjkH/G7hQyrdkTcYtrMFJQRVpM9gGe1GVNXUTvkwO7Vwur
         H0gw==
X-Gm-Message-State: ACrzQf0hdsQPEIpJiOfbk1UUvElFX2/ZZUNQ41IFa0fmxOvzcWj/wkan
	DAioJzDb9rJBMT1KWqtzKIg/NY6lYVEAxfMygaw=
X-Google-Smtp-Source: AMsMyM5ONAbRwJ0mRV8lFkFN/+yOIGgrHcLBILWbhUW8XaqfnSolfxdkiScuiVdMZUaqcXP+J2a9nYR4SqM8sa8eRyQ=
X-Received: by 2002:a05:622a:1045:b0:39c:e2e1:dc59 with SMTP id
 f5-20020a05622a104500b0039ce2e1dc59mr7379719qte.195.1666008987610; Mon, 17
 Oct 2022 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com> <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Oct 2022 15:15:51 +0300
Message-ID: <CAHp75VftkwPB-+jhCrhCdPRN0hLm5DLADMyAO45eBTRFfxiNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] gpiolib: tegra186: Add missed header(s)
To: Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner <tglx@linutronix.de>, 
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
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
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

On Mon, Oct 17, 2022 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Oct 17, 2022 at 10:52 AM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>>=C2=B7On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Do not imply that some of the generic headers may be always included.
> > > Instead, include explicitly what we are direct user of.
> > >
> > > While at it, sort headers alphabetically.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Andy: are you going to send it together with the corresponding pinctrl
> changes in a separate PR?

Yes, this is the plan, but I want first to push it to Linux Next (via
my tree) for a couple of days, so we will be sure there are no
compilation issues.

--=20
With Best Regards,
Andy Shevchenko
