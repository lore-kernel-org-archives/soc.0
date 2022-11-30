Return-Path: <SRS0=DPSW=36=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C39C4332F
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 14:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43FD1C43470; Wed, 30 Nov 2022 14:51:17 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1EB8C433D6;
	Wed, 30 Nov 2022 14:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1EB8C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id fz10so11260880qtb.3;
        Wed, 30 Nov 2022 06:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbewHNiIDPrh2vDJAS18QQyUgoqR1U2XFbW+RCOiyVY=;
        b=WfJQJ/Ii/YItHUnQnYy5TsebOHgx9SvC5SgYc62d3JZPGC/hxN3W58b41BTuq6mWd3
         IZ/Tmy3d4sbZP7tsCWtfl2NOC7XxO/kh4k/2eOj1NnYuBECtW0FpXxooJ1d3iv56soY1
         RlHB0D2urF+ZFlojhfxT91kGLOSuej9ClB7AxCnFIL3WnEnabvbPK1mmfMHtGfJWBILX
         WOoM8M6AgmO2Prg67LEsX4xF+614H78iz7lgPTcqe3Ynez97hT62NTYED5tWmv6w4VPH
         TgADtF3Qum9absIUb20hb22bgl2nNY3anT8GsnSflHW4n54Ff6x38a/l4Nm1iyFH6Mc5
         K1BA==
X-Gm-Message-State: ANoB5pkZoCe5QDCUOFVLlJmHQ7Ay5Wl4pq6gIKbpMdK7H4Xiku2ctjpK
	6Dn066e463m8yfy+lbAwAWhlghF+t1C22g==
X-Google-Smtp-Source: AA0mqf5SU88nUcAK/0Q4ThMDtOJnH07o9XigRdl10ZVg5kjlBv4nClzhi6y+qZUn06hNC6ra40ORJg==
X-Received: by 2002:a05:622a:5c90:b0:3a5:6de2:b400 with SMTP id ge16-20020a05622a5c9000b003a56de2b400mr10543805qtb.631.1669819874371;
        Wed, 30 Nov 2022 06:51:14 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l11-20020a05620a28cb00b006f9e103260dsm1320882qkp.91.2022.11.30.06.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:51:13 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3691e040abaso173375857b3.9;
        Wed, 30 Nov 2022 06:51:12 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr55824371ywm.283.1669819872327; Wed, 30
 Nov 2022 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2022 15:51:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
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
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Heiko Stuebner <heiko@sntech.de>, 
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
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC cleger

On Wed, Nov 30, 2022 at 3:33 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

>  arch/arm/boot/dts/r9a06g032.dtsi                          | 1 -

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -401,7 +401,6 @@ switch_port3: port@3 {
>                                 switch_port4: port@4 {
>                                         reg =3D <4>;
>                                         ethernet =3D <&gmac2>;
> -                                       label =3D "cpu";
>                                         phy-mode =3D "internal";
>                                         status =3D "disabled";
>                                         fixed-link {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
