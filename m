Return-Path: <SRS0=NQ0K=NB=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1514DC25B74
	for <soc@archiver.kernel.org>; Thu, 30 May 2024 12:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6F6DC32789; Thu, 30 May 2024 12:04:02 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87E05C3277B;
	Thu, 30 May 2024 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87E05C3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d1d65a471aso379946b6e.1;
        Thu, 30 May 2024 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070640; x=1717675440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=S3gGKKE3jJpCnKKaJ1txjMO5Kw1BvDKLV1Pp/a9CUSDaQVgGZMGhhlZvS9JevD/A8i
         c5YGnePBiJq93aHYS1lYsGpIC2KQK9CyqfKv4fdIEm2tiqjQXlIq0RHuIzRBAyvnjC/c
         8ADCA5jtXSpJ2RCjI3cquy1kDXRklaWPWSokcJSAa7aZONeF+lzI5bqq82/9Fi09MIOR
         /2a/leNzCqjOfbU8dpeZm/NrNXPXfEEd2f6EJ2buDMy4VzVRFnl7ay3VtS9W8Cnqltci
         GzkYCEVJ1W5Ea2qtkC65Y7RkiCrm5PhSfrnSnw72jFFERoQ47ebgQqSzkgaCugVHGP88
         /PMw==
X-Forwarded-Encrypted: i=1; AJvYcCWKWyVWEcFtzC1COyT6wCCKd9CZlp1MyyXSwJAYK1TNxFDI9JEfDYR0W42bTvhy7kECTBLL8IAQJ+F9a4EPGK4rmsFpYyrcddKKTgS95JBJ8atQoXWr34scHQglLEDWDwZ4T6x1ANm96Xbfvi/7Km5MwjILie9IkYNVAbE+4+N8FQxYlATCY6/F4DKAQ1vu+E/r7pjmWxs5Q9ld4PBywnmH6Jc=
X-Gm-Message-State: AOJu0Yz6aZPta87Ni4FJXdxh/r3BWHAZJqpnuHMkRinqj05eQi+FSbA2
	kos6l1V1xSmUFpCEdCKlBdr4CouvW3KsYfv3EW72VIn8gJ31furzksq3mtm6
X-Google-Smtp-Source: AGHT+IHWq7ft1AXOEXWaEyw/aRa8uewDxe9uYnuaJItaZQGh1BXERQvv4XpdX9Sk9joVcWcIBzx7rA==
X-Received: by 2002:a05:6808:304:b0:3d1:d35c:1a85 with SMTP id 5614622812f47-3d1dcd34434mr1682812b6e.54.1717070640090;
        Thu, 30 May 2024 05:04:00 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fee0da798sm3654411cf.22.2024.05.30.05.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 05:03:59 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ab9ce752e0so4119526d6.0;
        Thu, 30 May 2024 05:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF/w6IgdxVkU3FzT1i7+QRGISefkYShL2/i7wDq3KQgPXQ9S3FXEhWsv12aFQalN3tjykfnfYo+dKyr8cgIS0qbX2GlBrpIjWl9jRNVrMCB10KgO0cORKGL1Wisp52Fke7H++CmREbcoiYn7kxh+Rk6KE/Q7dizyMmhIgXIpC+YKVURSAR25Fql/GW+NCjyQE678GZaYAup3yBnOP+eApsL5g=
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
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
	Peng Fan <peng.fan@nxp.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
>
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Andy's question about code generation on a related patch made me
wonder, too.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code, regardless of whether there were
explicit cleanups before or not.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

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
