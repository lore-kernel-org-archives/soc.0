Return-Path: <SRS0=4hsp=MG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C2DC4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 07:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9105C4AF1A; Fri,  3 May 2024 07:20:12 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0B7BC4AF1B
	for <soc@kernel.org>; Fri,  3 May 2024 07:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0B7BC4AF1B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de60d05adafso4555601276.2
        for <soc@kernel.org>; Fri, 03 May 2024 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720810; x=1715325610; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=cEW2L15T/91kpOruKRjtwqd8VjFDTyqL3HLYioxt59bUzR5HDSwAlt4I+/LuVuRX54
         wcKSyVH8uW50yjopu3nqaCk8ErELlr5+sVazBXiGBQbX5B7Y3xZjVZNzIJE9gSmZ7itz
         GNPy+mMSn6G4z7prRBiSXPL77RFJgPU+DMwPGx5c6wBxaEd+hfnw3LAbCzkJPv6NrzFA
         P+iy6qaPZTofzuRwI7oMiEpCty1VpqHt88dLEs62DhF845MluimRzXvMUrAOb9nSkYjw
         8ReeP9k1tIem1oF4/VdyeEmZrcDFnsQ5mnRXtQtK7jlpiKm8N0FY1gF6FwxaOF6m5hwl
         efHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720810; x=1715325610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=a7cl2+BackdMTgPmHdMxVuS60XE+OzofUJSplobzuKBZKzVqsNSlAZz+lTNbYkM4wX
         /D8gVJsNBIVem9t1pF9aHdJhWKHRP5mIq1xTcdlc+Qz4wyqsF31PcJD7F/QnCxcTc153
         bR69UMqe/8O2bPQblo2HoPO4LJno2vckynDAGBayIUStADUpT3A38j2lO8m7pxiqUykl
         V2t+dq0nFCodc1TCmQrSwCe59aKN31ViY0+pIZcQP3tGh8y5z7M4nDT1U/+uFZhBiZzR
         KDq8T5BCPXmZ7wrEoEmxsgd1fD9EQFRxfemxvTAO3jOZqDpqc+/UFq6XEpNq+c0E9pMd
         5SwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsXt69uiNc7CFAAr+G2JGAKjg+kavoZ3R8DbeKxNgd7b+Bk/DY+ExhGmV47xKvCC6kDICpmKaIw2HzUQweJA==
X-Gm-Message-State: AOJu0YzBFYMSL0meJ6qCRN4CzZPCx28zG0d8h1nXUNli20OVWUPT5tD8
	b7DCVK1ujNXVkXS1eeemL77YmxYNKej58nuI3DDeFq6CvlW3KZpcsdDoTZ48t9f144OFp74VC0a
	PXcRiV9YuhIqXKqbg6d289lN2eh/YvF//qCNGIQ==
X-Google-Smtp-Source: AGHT+IG2e9YB/XnLTQbvqj0kK4ATPxoJ7R6aIP282PPsbZXF297lXvACY/w/LCEjCFtAwBrhBmRU/mc6jno/5QoxHeQ=
X-Received: by 2002:a05:6902:2203:b0:dc2:2b0d:613e with SMTP id
 dm3-20020a056902220300b00dc22b0d613emr2388159ybb.10.1714720809843; Fri, 03
 May 2024 00:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:19:58 +0200
Message-ID: <CACRpkdaRpJw=kHtya2iww7vvm+Bt6-oPMmz-6VzfhZniSoMP3w@mail.gmail.com>
Subject: Re: [PATCH 00/21] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

thanks for doing this! I am very much in favor of using
scoped management of resources where it makes it easier to
do the right thing.

I agree with Krzysztof's comment that we should avoid scoping
in cases where there is a clear path grab/use/release so the
code is easy to read already as it is. Let's drop those.

I saw there was some patch that was even a fix, perhaps I
should pick that one separately for fixes, but probably it is
non-urgent.

I suppose we will just apply v2 after people had some time to
look at it!

Yours,
Linus Walleij
