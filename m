Return-Path: <SRS0=Iw6S=DG=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FAEB64DD
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 19:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99493C433D9; Thu, 20 Jul 2023 19:42:25 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60413C433C8
	for <soc@kernel.org>; Thu, 20 Jul 2023 19:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60413C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cc7863e7b82so1066764276.0
        for <soc@kernel.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=Is+h2NeaSzJfFfsZ98ro8BWc2npdTi8/mAPrWVvtpsxb716Whq2DsR1nkUJ5zX14Xz
         79qaflwC3BG2VYXCeK0ijBZtmZDQ1AwFmwaxjZDd/vn/AKdit/VHpHHNt7ZvyrLIlMK1
         rAvvaKIi1pdCGIE6T6PamxnnJ1xdepfGuegPYvjWZ/2v5uqSbyOmvOqKrH1HZMZxxQ9u
         TipBUYHRAcaq7G2V/lDcSoviQy3dB4LjRa8c+TMTdx5eHkXHMxyv/6aRPA0MgnDthZDb
         /qNXdFoMB9q33L3QYVfMXu7JSq0qiwBR5arRe8VeAjZhX1/RRVS46BZipMLM8QxKUS/8
         /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=Tj6MdqcYoZPdpMsaeSDmGw8eKDG20fhHILs2NA3UW7SD8s2f5hdvwym7MZOh5SqpNG
         GrJBIT7yHuVVKl2mxNbc3HuhU4MAacgWeK+bNvyzxN305E4hPacxG8Q5EmtfjT8gydcO
         /RWLgNy42qnUcwYXs/Zo7pGaBjGkLfmWcTT9hAayKNg8ZgmRxNkDXT4Tje7KXjZYg69B
         n4kOW+NJUWlV+dElGal0vrwF2LD+4Cf8R2TjscFEdOCHXzuyzU2YOkvTduoFh2So7MPR
         9nr55fcor0/FcD6Qsw1DzjSft0+W6Add1UgkJmhwb7mwbVHJxf7dINVlEkKnl9CWcySe
         nd9g==
X-Gm-Message-State: ABy/qLa/s/dUUTh5C+2fQNqMt99MhVzcovw18Ydrhz4tT5UY4JMY6kE2
	uvH3GAglr3NixP1IkFvvOMVFtZxU6dzARu/ICpNfWw==
X-Google-Smtp-Source: APBJJlE7cBabIqsDgOVse9OOZ6aTjmPoq/DJCfwfg6nCOEVEXRqRJUSYnSIJLuoYJ0UvKAptp1crbwCoFVPdkqeY7hY=
X-Received: by 2002:a25:c50b:0:b0:cdd:6635:a1f8 with SMTP id
 v11-20020a25c50b000000b00cdd6635a1f8mr5819173ybe.15.1689882143201; Thu, 20
 Jul 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Jul 2023 21:42:12 +0200
Message-ID: <CACRpkdYe9b4ZpvYZqkcMq0Jjni_VD_75Zt5oKv4+v9f3pmJbVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 7:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

It still applied cleanly so I just applied it.

Thanks for attention to detail.

Yours,
Linus Walleij
