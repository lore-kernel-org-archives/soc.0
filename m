Return-Path: <SRS0=jKe8=MQ=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153AC25B78
	for <soc@archiver.kernel.org>; Mon, 13 May 2024 11:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B70AC4AF0C; Mon, 13 May 2024 11:59:22 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF542C113CC;
	Mon, 13 May 2024 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF542C113CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61b68644ab4so39532927b3.0;
        Mon, 13 May 2024 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601558; x=1716206358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=TFr7Rxu/YRcPdROZLhylIjNK2HxVhLQo4SJI+7xzAOXLukbiuSrzVeUrekhpEkLGYm
         kQuYlBPHzFIPwW3KHn6tkwtnrQHwfQ6928nFJF3ArRlAwqrLeR9UrtTghKaUogr9N78o
         22tGi65B2+by8E4YvEay07RRMikTQk+BBQLPo8dIUKfTJKZNBYqvrwSiBV5o5ZcPOOpB
         OZr44k05YQulCYF19GhWSyFC1WKNMe6WNmTJ/tuP8LAx0PHPLqd2cZWG9MIL931Pg3ak
         Ipo7G6lyClMFN1vQCYXb8jr+hHppK8KwYMmT9KmS92nYxrPGlxZZru+GjqUkcF4pg7pU
         GIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUhtmW+MmVZx5ohJd9a50k95HF3Fpnr2hABDtNzPgL+0AizcvyBvpAGEbfqkWGKzCDA7jc6XVr1yQmzl0vwRa6d4NdCvwfCYqxe0WFsKfjTEtYlKjyKxuRZWc3PnfuzBCsuA6H92J/D5gAr6lc+QGFsr7USDRHCY9Lv+SE90lC/6GynOI7zc+5/gN9GGmZj/37bgWM2Rq4rREpF/5hU1IhoOPk=
X-Gm-Message-State: AOJu0YzHzhTOqDGQPLhCxYRV6NaAQoVUSm5o4sK/55ZxLR6PD9qdoccq
	D+UuuwPR+NUURsfobN2tawhUTEA5YXCigXL95koIziuDCgctODVLONB3MoUZ
X-Google-Smtp-Source: AGHT+IHKTkAxRf74XWqKaPOPg6cbcfcM3ubzxyPDh2xZ1J0MW5iSdmwDWZ99VY4S0ejMFX7cyk1Q5A==
X-Received: by 2002:a81:4305:0:b0:61b:349c:811 with SMTP id 00721157ae682-622affc51e7mr93232587b3.10.1715601557836;
        Mon, 13 May 2024 04:59:17 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e233b43sm20725507b3.16.2024.05.13.04.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:16 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de607ab52f4so4487387276.2;
        Mon, 13 May 2024 04:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSZZk/cHZrEaSADIK/Y+j31USZTIIzgPPFG1pUREIf84pNHbgOBQqscp3cNvENGSdEJGeHxwZ6jZFVSQqw4ZH6kuMrJNvDxSEQ3qMSB9OQF9Y1lYRHldjHiU3naVK8kLD9/cI0zBLqlrg/jBrhDI2c2sXTMwvMT8MQ1k+jQbDzdCGdAdeFVTAQ+Ntug4xe1Ehy9IkIfhj3v8x0Ukn5xRPGVBc=
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
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
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c

You missed one trivial conversion, presumably because no error handling
and thus no of_node_put() is involved?

@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct
device_node *np,

 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-       struct device_node *child;
        int count =3D 0;

        if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
                count++;

-       for_each_child_of_node(np, child) {
+       for_each_child_of_node_scoped(np, child) {
                if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
                        count++;
        }

If you prefer not to include this, I will send a small patch myself later.

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
