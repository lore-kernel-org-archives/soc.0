Return-Path: <SRS0=QCdR=MR=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF61C04FFE
	for <soc@archiver.kernel.org>; Tue, 14 May 2024 07:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16B46C2BD11; Tue, 14 May 2024 07:33:18 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E686C4AF09
	for <soc@kernel.org>; Tue, 14 May 2024 07:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E686C4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-620390308e5so48013447b3.3
        for <soc@kernel.org>; Tue, 14 May 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715671995; x=1716276795; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=UHf6NHRgsulqo2FLP2l6CxWszhLGEjXcKHsakvnpeuarrNepEfKr2vTjgxiPiollCf
         EiXtl+SFlYH1GXPP4OD11OU0xVwWFJq8luw/dEr6UCIbozw+fRQpBGx+Sp5mfYo4CkCo
         OOEnT0AbyNTI7Y/ZOsq9GDxFsmFKE0edyJeL89sNtcaXhzSPw0/RcQRQmQR9qsZ3a2vM
         62+JIJOaN1vsO4PWBl6Ei4p4P2lgx4twD+5KyqXHRVXbw6ehGxe49OBuYn6POHvDCZJd
         AF+JIle5yX4dYIBs8HtkSJRTzxn2MPSyvYasdvoKAEe5oxV9+crqOwSwFJxzKmP3Wnys
         HadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671995; x=1716276795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
        b=SP5rbaK1O7T+08xZrrkqG6RHEkNBC3TD1c+q5V1qTgLQUgBRIvDJ0hBEzpL2cnhoj1
         MaP6HSOHv8FY5YhESqTkFQuzJZHGZtc+8UaW08stTirIKJ3LP48pNkm4j8CZXIsnH3OI
         V6Ki077u4mKW3sP0OwvahMfc9RXeSVFAcHONCTuGDmKmheOhnjxu0kZiOIMGStGlmDmQ
         2apjIVRvN4ScM5Xj8kHehpkGh+RhMK4Xdfls2yjPLmwIj2ey0sX1vKhpSvrYPix5YJZX
         6BUh5NiGhtYuQylhQygbMvgVT/rWyrvvL/Y14DQKoU3bIYxqLKSHnSayFDfYq+9dsnMy
         xamg==
X-Forwarded-Encrypted: i=1; AJvYcCUag+VDRSYvQVIbtoyJQGYD25J0cg38Dp6mViUjrsI8599FjJOir9nioQ3N/NZH2dAfPbDh0wNw15EuLXgINQ==
X-Gm-Message-State: AOJu0YzHUU9Ec/wgJET/AFTnTGZsOm1aXPdRRrfC44ZpzIu9VbiCB5eM
	TjTeD2dVe5wMS76whKKYRTOs7GjO7AFtaVwf0BqUYdBQElFHq+H3crf0dAHZbpRFR1lpPRCjTVa
	6ZEH4jUkTZEJsgZCl/lazbc8TgF2RKeF37xeXzg==
X-Google-Smtp-Source: AGHT+IEj9rSUWA94F6VFaCC7a26gta7P6jlgI2cpDV7q9j/kgYnlADA3j4AJ721URmKt02c8jgw6oM4ErSC0l+EyUGQ=
X-Received: by 2002:a0d:cbd1:0:b0:61b:3356:d28c with SMTP id
 00721157ae682-622aff92355mr116464607b3.2.1715671995199; Tue, 14 May 2024
 00:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com> <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 09:33:03 +0200
Message-ID: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
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

On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > Does this go into the Renesas patch stack?
> >
> > I think the patch stands fine without the rest of the series.
>
> Sure, I can do that.

Please apply it!

> From your positive response to v1, I thought that perhaps you just
> wanted to take the full series yourself?

Sorry, I always prefer submaintainers to pick their stuff, they
know what they are doing and they can test the entire patch
stack properly.

Yours,
Linus Walleij
