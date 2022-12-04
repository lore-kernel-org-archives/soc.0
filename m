Return-Path: <SRS0=Klw3=4C=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1CCC4332F
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 21:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75E8EC43143; Sun,  4 Dec 2022 21:31:54 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BFE7C433D6
	for <soc@kernel.org>; Sun,  4 Dec 2022 21:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BFE7C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id j196so12342419ybj.2
        for <soc@kernel.org>; Sun, 04 Dec 2022 13:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI01SEvVv3MktbLdSo/+mTT0yrIOdj+1vIgFJfDfN34=;
        b=ihXgyprU2JPflAJxQ2hlVAlQWQi84KLxjubvaMjwbXraHSizz8TCIx4U240bsQyj7+
         f4S620hisnyPfhiCwKcejyelzlojnRQY4jMp9A5DZ+yb6q2aq4EA73+dpm0+UL0Oxh1a
         IYwnyg3VzbGB2nq4bXM6+FsV3LOGBHWgjtL25AWN7IG9Q1azGQhN55hwsfFxbGLKWiOD
         f/a/T7Q/HJsAQI/owlcuy6xGaGqVr+p5wZVckWegEIRl5Ivc5Qji4Sl+FvX4zG7kVyuj
         +sXdCe5JgrGyvJk71T09UvTiajH6J8eboYF7zb6jD/uuzxRFmOa9C/7E2gTQahmgh7lS
         cwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI01SEvVv3MktbLdSo/+mTT0yrIOdj+1vIgFJfDfN34=;
        b=4S1WbyBxARoj7MwEXvIDMOReFKDA6AFYoEHS4XfJhbp2eI2DW4YKA3H5GUH3UCKbGY
         BHMbpIftU3F7mtirYm9SUpFwqEcubixFjR3fdQsVv97hJyjmVX+pzrYzcG0yhrPuTql2
         tg7Qh93cEXASf/ZZFfMwOXtZxwqPMJjJ6I26T7AN2GrYhXZG5TZ8MIzFqH1p89yEI0jU
         Jm0Ea7/jVvC6o28nAPn5UGyGkQCbRof21oQJm5q/8vY2+Khl6oCbXbVwbdcs6i37Ukvl
         xIbNkScDjAOgJhykfCLr/SFY0RX9brgdD57PpBEy0bcvW3bSUcUYGstGp/2r53xCS+wx
         M6lA==
X-Gm-Message-State: ANoB5pm8rgnIcRntHWtdYiiLPjEosShpVmpU88lixfF6TO7iA1IKh77t
	vhwZUnVPPw8+2xq+e/nB1mhuMrhnf5LAC9Q/Ta7HCQ==
X-Google-Smtp-Source: AA0mqf6AghRoYoTD/xrAAjTRoEs/YU038ITJkX/3Vhiv+Ox9xXlJbEIBdnkIbFDPiPE2mKag2EXwUYp2ImAROIxTvOc=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr72141889ybf.506.1670189512119; Sun, 04
 Dec 2022 13:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 4 Dec 2022 22:31:40 +0100
Message-ID: <CACRpkdbojTVjR2G+95YS1Xqvau9XmwTkp_KtpaeE7-+v41hgeg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Heiko Stuebner <heiko@sntech.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Frank Wunderlich <frank-w@public-files.de>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Oleksij Rempel <linux@rempel-privat.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 3:13 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:

> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
