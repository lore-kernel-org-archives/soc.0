Return-Path: <SRS0=G/Fq=NC=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7421C25B75
	for <soc@archiver.kernel.org>; Fri, 31 May 2024 07:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6DF0C4AF0A; Fri, 31 May 2024 07:06:46 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10721C2BD10;
	Fri, 31 May 2024 07:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10721C2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa67a3e702so1336878276.1;
        Fri, 31 May 2024 00:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139204; x=1717744004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
        b=D4OFb9fiC82v11yAs/yw3VkoaAEBS3rOq4BOdYw2YU2MVHcRuFPZ/2q1utiKZD/yOD
         ps0XUevx1GY9IG+t4sw7jYcdUjTWhM0eqG3406CqzkNR29v2DPfGuuWs0Dzk3Q9SWHoi
         IVBKs3A3wukxYziohZbo8gF2tCbCzJPhD9HxzvyTLyZtt2ZnAyq7amADP2KF9uk47dWd
         COn+4Tz/2Sfffc2LgBXV7KMUX1uhy28eWckWijFCitbCYKcsnNiTioWdCfNSjDlUrrKq
         0rOuXSR0x0bxLTF5bnu8ZX2ugIs3qQHsD8DmBDu8zqz9Wl38UUpMCMMFNudxYl2Tl8nP
         a1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNcB0kb4/2ZQdvoQ6L8OaJxcK7EDCfOeBlI6Fzp1K+kst/XTjL5hpkCsx2Ec45K2wNiBuavCol0wb5WJvHqb05sjFsc3dWaTbb0eovD34w72u0IqFau7urYh+Z7pMvGaLWu4jqPywwScY5M0zTGaLwXnjLFS2CrMvhwUX7x0j/nunjekB3xnJL1uaOiLiq88Dlj0mBZsRhejcjvcAalyGYUk4=
X-Gm-Message-State: AOJu0YwCfdCD3zhtfveLV/QGTNPDoJbJtxzr0RO0tLu0iOpvCkQqxnJr
	W2SK87UTRQY5r4EQp7Nc1ecvzs6kLt9UAMKGLJhSA/FM06q2OrBsv4pMUkCM
X-Google-Smtp-Source: AGHT+IFEYDYG8Uw89K1bVaTY4TagU+N7MgHC8JTwaVhVzjihlsTE4y28k2BIggvKMiZtLOxTivKZ/A==
X-Received: by 2002:a25:fc0f:0:b0:df4:45c1:f465 with SMTP id 3f1490d57ef6-dfa73dc164fmr1051890276.62.1717139203514;
        Fri, 31 May 2024 00:06:43 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa6f1198a0sm249191276.52.2024.05.31.00.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:06:43 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-627ebbe7720so16190067b3.0;
        Fri, 31 May 2024 00:06:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjTOU5R//KoNIvcGtWqc4jeT+rmRw3qgbfQhS8PwzjhLttl9HOsHTGTjdFZdS56muFEtws/20CO87DPQmVnwudlcRcsIaVL21zzqMrAwIFzEfdyBFiOxVgivaa2xmJP+C5qcz6ZoN7p50xtt79pBQTFo7yxNZaGcHbCgBlPKeX51WKpahyQ7BNuftwSQG6UCu0ylqz+bClMwXupIvBke98Im0=
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com> <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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

Hi Peng,

On Fri, May 31, 2024 at 5:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
> > On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > > Use scope based of_node_put() to simplify code. It reduces the chance
> > > of forgetting of_node_put(), and also simplifies error handling path.
> > > I not able to test the changes on all the hardwares, so driver owners=
,
> > > please help review when you have time.
> > >
> > > This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> > > thanks.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Andy's question about code generation on a related patch made me wonder=
,
> > too.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to cost=
 ca.
> > 48 bytes of additional code, regardless of whether there were explicit
> > cleanups before or not.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups", a=
nd all
> > but the conversions in *_dt_node_to_map() cost 48 bytes each.
>
> I am not sure this is an issue or else. What would you suggest me to do?
> If you think extra 48bytes consumption is not good here, feel free to dro=
p the
> patch.

I suggest doing nothing about this.  I just wanted people to be aware
of the impact.  I guess it's just part of the slow but steady increase
of kernel size (ca. 20-30 KiB/release)... ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
