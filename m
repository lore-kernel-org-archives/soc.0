Return-Path: <SRS0=/hd/=37=gmail.com=sergio.paracuellos@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C25C43217
	for <soc@archiver.kernel.org>; Thu,  1 Dec 2022 06:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50DCAC433B5; Thu,  1 Dec 2022 06:05:00 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55A76C433C1;
	Thu,  1 Dec 2022 06:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55A76C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id v82so1023474oib.4;
        Wed, 30 Nov 2022 22:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=PvHY6dBEyebJE6QNI6Wjq2MneXIl4rTpGS7fBC7Qv6R/Yiga7OIh4/Pj4BgHnrpndG
         GrmgooNZOVFverQjG/PwQwa+jNTTeu5eaofi0fQ6sUgKspL/GgqiAAoT7DsAPA/bcNeL
         CuuBxemNVt9HiH103qegQcLdL8byYtx9q2Sy8nfwvxBZulJQ2g5EAZZ4I/KTXdccwea1
         xayFiXCzBGxNpmCBPyhigLfeSVQaNBWPI/KTZtc4+CqnxGM8xxSJGEpvpTJVaXAoUIMI
         LhDFRKO2nzxUjEipEZonE2WghJNoafzVk4PIFC+1xTm7vj4OLlTNuK0dUH2dye1MdJio
         EOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=YrofVooYa6BnV8r//4WN41NajE1+UAs1LpyVg66wnzkEsjYlBWv/GIiHO/cuAW1yX1
         Y8M4A+ck2W7HvYhehsaC21HAHXKIPtoPUhAekuh+dxCORgZESm2zzg5J2MfWw5rkdfkh
         6pQmUk7RzeTmdiLAq0AGMWFxMXcWBDEEEc15z+ebsX23FfwC5Wcu7UCXLRqZ1RL0QlJN
         LWzbedhryBVscHs+ozZw0zp3bcKVnuofiHGkwIfK+3oPpS8Ds2CkYQW5mHXhQKmJEJN2
         jzOhW8fLYFZsVtc+A5jusVnX/NqLvjABhyyDbc3TPUPe+ok86J9nIsoPTi99epPnwqCs
         a7Yw==
X-Gm-Message-State: ANoB5pntQ3JlfJa0TIGczqjpsoE8aNlhUFiIevxBXbryz1HTpbRrsbBI
	TJ1YZKOFPmYA7t7LGjKPX4ul8F3o+6ckXcBwk04=
X-Google-Smtp-Source: AA0mqf5l2e4XTILLZHTH7QTRBPvz28RAyHNavvCrAHgTBlylFcIYKmUFvkgoGR7uLixlsP/mcB3a5GSDsiHvA3KSd08=
X-Received: by 2002:aca:60c6:0:b0:35a:51fc:2134 with SMTP id
 u189-20020aca60c6000000b0035a51fc2134mr22358640oib.144.1669874698405; Wed, 30
 Nov 2022 22:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-5-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 1 Dec 2022 07:04:47 +0100
Message-ID: <CAMhs-H_yk4_ieChz9ZaMgZiQNSO7RxhAXPN0nHWWxbox=qY_mw@mail.gmail.com>
Subject: Re: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
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

On Wed, Nov 30, 2022 at 3:14 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
