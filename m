Return-Path: <SRS0=sf25=MQ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885EC25B75
	for <soc@archiver.kernel.org>; Mon, 13 May 2024 20:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F8A3C2BD11; Mon, 13 May 2024 20:51:37 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D5E7C4AF07
	for <soc@kernel.org>; Mon, 13 May 2024 20:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D5E7C4AF07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61804067da0so48259687b3.0
        for <soc@kernel.org>; Mon, 13 May 2024 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715633494; x=1716238294; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=D3XpviYx1E+APg6gAEIrCAGqWR2sEMxku0LtaGv0unmYole2GELaOH72CLX/2LTM0A
         pV6/D9qqqxPc7/fHooMiAGzd0ZeD9gm/wpDeCRJ97CBI+9X4D2DQfKdkFbrkdysh//Id
         sLPR+TCD/d401sPzXbWuXn6gtqH4J0Q9lULQZdQ2wJ5/rGB+kWjtXK2dZkxAYeL/ajpB
         v5HTjwYJPmLHQSpH4m7w+sazfFuleto5+BFvyyXeLzcDcOb63q3t9n6+RdOavqS9TS07
         Hl+xh8+Aq8j1vB1EdtvrREdR12XYwqqUZnXk6T9laY1tSSbg1E7qL+VbXHgm1AYXRB3v
         WSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715633494; x=1716238294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=Fw7EcG4h7BCv0dT3i++rW/FTYohkgPQBU5/TVtQZEvexQTDZiVSPF8BJ4K4L0jYaNO
         eMv7P+pFMKKa+XjvEHFfmnBJjEy/SyQ/oXBhvmqhIMLQXvOqWfxaXbfjbBoxDOHsfa8w
         OegF8JbVNHhO+H/RVEEZ1EKkBIWnc4l8M0hwu7pedxuuOAvvE9sAuQktrtZhiGn/Rdrr
         uu6DCd7FctTCTweTVv+AhailzR4MPtOqSw06BQ5ex4RsiQGIPysv1RF5VKyoC2DcPFGr
         hL4H4Z2bhjljDhXHIgqKu0J6/B+9isJR9SRX7uC+7FzHv4nwsUPIM26dZ8x/ojjy4DrY
         MQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX/wymV3MtHy/Tx6Kg8wCIkzbsCQhm7+E2Gd1uhy07AF31qD3zlyvbezSp6fIwecSlW7f9P4XxA9//FQ8pYg==
X-Gm-Message-State: AOJu0YxIEd3e7bY5s7rAzSUPRULGlHCMng6c+KqFPsGMSR9JM5Jwo/md
	ID6DfUzqrg5EPQEGw/UrGSdWDy2juv9RPq6IBZOYIE62ITDhLF28ZLd9C/Tf6hr/DVv5Gd9knTD
	pm6C8h0zNKnuHpBQ26mDGqEwSpFGnQJxbhzLQ0A==
X-Google-Smtp-Source: AGHT+IHIMCINiS4Rm3W7vEHXnxoinnBVVMUXT21CaUFl/K9jprbEih1fz56tIA0O4ev2Ijok+dKJMkYRTsYw4QOpIww=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr145019207b3.8.1715633492884; Mon, 13 May 2024
 13:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:51:21 +0200
Message-ID: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use scope based of_node_put() cleanup to simplify code.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Does this go into the Renesas patch stack?

I think the patch stands fine without the rest of the series.

Yours,
Linus Walleij
