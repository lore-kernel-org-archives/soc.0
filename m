Return-Path: <SRS0=MU0i=N4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B052C30653
	for <soc@archiver.kernel.org>; Wed, 26 Jun 2024 10:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D60BC4AF0D; Wed, 26 Jun 2024 10:02:24 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 239A0C32786
	for <soc@kernel.org>; Wed, 26 Jun 2024 10:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 239A0C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso4932211e87.3
        for <soc@kernel.org>; Wed, 26 Jun 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396141; x=1720000941; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=slCnaUfybOoU2WvWYxoF313SpbPVg8zCze0/ZCi3WTgBoObfULc0KCRBUMsUg7xQqh
         yeeV2iYg6DlzBJrwyS38PnYuBAVqDU7ymSo2Yq2R45Bj9xG81Vk4FiIa1OnbY0pRzuP1
         uyR/kSHLiyifFE6h8G4WNxsHz92kJO9gijvLzpWce3ppqMjd15WzdMvIgrx2WlyPnrC6
         eGsAbScmFjrzvJLIZnSnLMvnvGhhmM+rCTML/J9wbBAPAeesbznCtcrk5U4RQTWC9RYl
         XJvVmtc4+5PkM3G5tBddY5uLYUgaLdqpsazSV6Nk4cM91ikcMPeVlPxu7wYIrJJKrmWl
         2f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396141; x=1720000941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=O3JDLAJGBB1TreQ3s4JtjejRdTAVhtCk3+nEJwdRJwl/eyXzKkcKIKTAhYuAyyp9a4
         eqUsUdN3eXx87roEmzoBp5kUbNR6Q1OQZP1MS3618jSBsuRRVhxyiJsm2LoSkDPwikh5
         2exOI62JjZLnA3HrrDOynpIwRAt/Wb3f2mqcf8SdZckac3RfSNpxAwLl8mjuDRdGWgkw
         b2OCy2ZzjzIaBvoKmoEATs6FIiCLpHtHVPnfOJ+KtCkx2Gm7dWx5W2yZNr9jJeNm2Vat
         aLIBDSyF3Ybe2xoEYOUTSYMP7ZiJjx29CTzkL03jo9RF+iVB0M+ASoInux6e/sfhshQv
         rPxw==
X-Forwarded-Encrypted: i=1; AJvYcCUNGpOVX1g8Cvl2hNDt4/xy8vWJhLkAf8J/ztCrz/iOsSctDGvnTtRr5AA/ho2Bj20CQrCGq4HrWjjpVxF2/g==
X-Gm-Message-State: AOJu0YwDQ5FL7w0VaUMdQCy8iOXafrDY+6clLSPGGVjFnVhwP4uKOmp4
	QPClSKyjGu3hb+giM6bkWuqnv+KAItKKvoUmzOXk32znt8PIFgTQNy7meSgM5F5zyX5rUk7qpup
	u484C3NAoqpynaKMs8bK0WrQvLLzG67GYXbFLUA==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 1:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
>
> st/stm32/renesas patches are picked. Would you handle the remaining
> ones?

Hm right, I applied all that apply cleanly:
971c8b4c08e7 (HEAD -> devel) pinctrl: samsung: Use scope based
of_node_put() cleanups
3a882554a3bb pinctrl: k210: Use scope based of_node_put() cleanups
7f500f2011c0 pinctrl: freescale: mxs: Fix refcount of child
d7f5120a944a pinctrl: pinconf-generic: Use scope based of_node_put() cleanu=
ps
240c5f238d59 pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
3a0278cfb448 pinctrl: mediatek: Use scope based of_node_put() cleanups
c957ae7e7e68 pinctrl: nomadik: Use scope based of_node_put() cleanups
3dcc01b36f18 pinctrl: s32cc: Use scope based of_node_put() cleanups
7c2aabb56f92 pinctrl: at91: Use scope based of_node_put() cleanups
56c42f6c7b2c pinctrl: rockchip: Use scope based of_node_put() cleanups
8c5dc2a5b3a7 pinctrl: spear: Use scope based of_node_put() cleanups
794e5dc533b0 pinctrl: sprd: Use scope based of_node_put() cleanups
8fa99c00351c pinctrl: starfive: Use scope based of_node_put() cleanups
11eefc0ac884 pinctrl: tegra: Use scope based of_node_put() cleanups

Can you look into rebasing the remaining ones?

I am a bit unsure about Samsung, Krzysztof usually pick these, but no big
deal I guess, if he objects I can just take it out again.

Yours,
Linus Walleij
