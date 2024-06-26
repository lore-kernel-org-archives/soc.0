Return-Path: <SRS0=MU0i=N4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C1EC30653
	for <soc@archiver.kernel.org>; Wed, 26 Jun 2024 10:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1CA8C2BD10; Wed, 26 Jun 2024 10:40:53 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AF13C32786
	for <soc@kernel.org>; Wed, 26 Jun 2024 10:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AF13C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so5946315276.0
        for <soc@kernel.org>; Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398451; x=1720003251; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=Fv8rZDxpBGtIsqM3QStGQVutpe5KOrD+F22w7HotB1QPPihoZSHfnraaZykwmvDBkW
         sUDzvzFsEkgpyilwdLSx3fTwOrVdWmZGNs9YXfdYJ37Aes2WzjQ49LXV1gkJzlf0mmwO
         FtTOcfmtjo17+abemcXBsLIJzLgKwh85TZZk8+CQdTWQYq7BIlh7RyhuJaBwz/4HcwG4
         npELTh9XQZFT714htgubzNSk6BB7FgFAH6FZSYou+3EkzsVExogDkKciD4SAWLo5Ms+a
         YjeiQY6lkez5t4RVyMK5E6KjSGs/k2BfcEaAWp23BYeYT0KIQ/+HGBAu+YhquBTXcQl9
         No4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398451; x=1720003251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=ZidgrtCxGpjG6rKI8e4XuL9DxgQt+zOhs/UUWAQvy9SHJgv9u10r3/BzgOsPSBNYqu
         2pwq5aZ8q4Z/C+DAZ+z/ZT/8GUlKKp7axi/cLDrYSvag2b0eIADNT/YgBZh+WpKicl8F
         TWmeFERvcsFWtF3KxkjTK3sQXW2CgB14VOknx8qBa/nLX85rxUAm/cjQ20Mn6mQOsqL5
         xojx48BbcGm9hPdUvstjgqFs/yCzVTWLjRuGlsS8PO1A3T8F8EJq16V1STifKtXTMyfJ
         nuOUsarg31wd47hwKgd4FcyqwfuLnJDHpJn7AdUU0TGNqfVk22kXz+vXhyMQ+cLwPHAk
         QGwA==
X-Forwarded-Encrypted: i=1; AJvYcCU5erqRozUDsRSOXtdMqYKU7gqol1vjwz+f/yNGYEa4zYR7Ay5k+3QX0kqw0HHFlT/xIMzUVIoeULsEorDa8w==
X-Gm-Message-State: AOJu0Yx89zG7BwOHHowS7Z3eTzA9G7uA7JObDvSAj/QcQw4B4GSYBJor
	OJb2Pvj3ktFlZrR0UrNk9gtDUVupVkImcmjTPiFh9FNloCV61hWBhR8+yO7+50skABMvOHVwcmn
	G/xe0In/DRubrEx6MbzLH1BCnVoaCtmjxk1320g==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com> <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> > Use scope based of_node_put() cleanup to simplify code.
> >
> >
>
> Applied, thanks!
>
> [20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
>         https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e8=
49e4ce0b7c29b110

OK I dropped it from my queue!

Yours,
Linus Walleij
