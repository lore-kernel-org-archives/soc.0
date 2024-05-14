Return-Path: <SRS0=jIp7=MR=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE49C04FFE
	for <soc@archiver.kernel.org>; Tue, 14 May 2024 06:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1073C4AF09; Tue, 14 May 2024 06:36:02 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EB44C2BD10;
	Tue, 14 May 2024 06:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EB44C2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61df903aa05so59670477b3.3;
        Mon, 13 May 2024 23:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715668559; x=1716273359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyXm2XZJp7cQccvVHsZwFRorrc4lUY+2faX/WPeRScc=;
        b=wzBxjLPR+Iyn0NbPVW9US18SXN1z+ZS4xoDbqH4JjYym0JtIIxqvgn1Bjqsawh6rOf
         3EgI6y+cpRFJOGAl2WijM4slMOYX4WvZMobTY6I8/hA5Vj/dhCuuaCRMoZ7+bf2TTxLe
         NgtONyEPwx9YKuAtde+r7FtfIAuVt+NfF/8dQ4ppkEbSEoDLzTznW4KUcYcDFH0E+gw1
         /PY18BrmnxSypTEFSWxcJSkOQZlSBGinC8mffifC1O27vZmX8/1sBtbkkfcOzv12e95g
         SupWvyo9Gdgkgxt6a/2wGQOuZbRtkJAYxwKbsP8W8zhJep1NrhvaQnFeEU9DDxio3QQp
         hqFA==
X-Forwarded-Encrypted: i=1; AJvYcCWaF+DhOjWLYo1OCw0sQ2rmbX/Y66c2XYquj3i8wyH9swA2FQzsT2TvRIaRgHAYFP6ogrZyAsZY2IJCXwrxivku9p7R/Xb3laVclxuaZy372NNYXHgjrpSr3B1xqNYjojiUzdp/YEKgQdzbEtuIobLhe7Gn8pwIITFtNzIn+z6kQyrODRso8iYTzyHhf+ERRQrvPlTaZ9fc2uIUrAo+d2A1Lpw=
X-Gm-Message-State: AOJu0YxqPPPpI4zmCrKM022LJBryxTKc7UoPQqdqZs3wPUmPw1WEqAmu
	t1HuepjaKoCw8IAe6PFLfzQQJQPKRht9AiaeJpbjtcBlSTm+otZQLI+NxEoN
X-Google-Smtp-Source: AGHT+IEIvFJwcFjFMcKQwbKeLmHb0oyKJbezcmdpyJmHbpnKJAnxQL48voGGFcNrcZHT0R++C3aM3w==
X-Received: by 2002:a0d:eacb:0:b0:618:8d66:8363 with SMTP id 00721157ae682-622afff94c0mr150985167b3.41.1715668558946;
        Mon, 13 May 2024 23:35:58 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3472c2sm24131647b3.81.2024.05.13.23.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 23:35:57 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de60a51fe21so5197876276.0;
        Mon, 13 May 2024 23:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0uU+C85nqlnbMf6j791KVFcCNWBdUVwpty+T7DgfgzhGXCDRsMGu9qHqaioFkuFEZPt1h8VA1DoZJ++fFpIMW68e9loKJ7tJZVU6+re8xL9um+kOjT1RIrUHGfj+OUfhBNoQRU8u936tB5fYlXxg47nKI4VDtQz5rwFSvdHT+KvgQpgEMnYZ5oF6kvqUYqpf2PL3Poo7R5epQY4XcbTWgPVU=
X-Received: by 2002:a5b:f48:0:b0:de5:567b:88f with SMTP id 3f1490d57ef6-dee4f31a205mr14563293276.10.1715668557234;
 Mon, 13 May 2024 23:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
In-Reply-To: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 08:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, May 13, 2024 at 10:51=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use scope based of_node_put() cleanup to simplify code.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Does this go into the Renesas patch stack?
>
> I think the patch stands fine without the rest of the series.

Sure, I can do that.
From your positive response to v1, I thought that perhaps you just
wanted to take the full series yourself?

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
