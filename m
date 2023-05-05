Return-Path: <SRS0=Iq7n=A2=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95403C7EE21
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 03:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50DFAC433AA; Fri,  5 May 2023 03:29:41 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D504FC4339B;
	Fri,  5 May 2023 03:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D504FC4339B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1925ad4953dso596007fac.2;
        Thu, 04 May 2023 20:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683257379; x=1685849379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krDfg6eQorFar2BpT+qnQpTfnL3RzdaYbq8obJrv+/Q=;
        b=Z5UsLmYcnnfu+wuxwzBMEqqdV5efc4FjpbYfLeEsQd7fnhXafPnPihSfwT8X3UZ8uz
         mNHT6OhVjTxLeUcASoJH5LPbKOeHtvSF4kCotiT4wrLWvImunYgItHshzc/Vda2ChorX
         ofCy0AwFcVnX3Jl3eHfavBfGcDb24NDoctOlnv8WiGk6H9/djUhUGHHNqbusqwxz32nD
         RukeDWqMnHKN0thSyaJQiAFo8Vr6aDjQ9h/KnD/Nt1nldcrqYuXsDWmwbWU5xADqYZl5
         lGB9jW6FuwMEkXq5/gaWkK5a+YHNs8l/txHSGn2QwYG+kv0v3kDZJVURVmeAB7xLpX4S
         /Snw==
X-Gm-Message-State: AC+VfDwBUTJ7JkLQO45XnkteeBRF0irFMHojjOuio7cgrebGkA/m9dx1
	bh7GbinEaaWH7vlvMMcUxA==
X-Google-Smtp-Source: ACHHUZ68TTTqF83QwSVG8QIgx0pe1rGpwuKnkT2ePoQ26EPmsn27BR+W57lYjAvZ7fiOrLSWLuMUmg==
X-Received: by 2002:a05:6870:304:b0:192:57fd:9062 with SMTP id m4-20020a056870030400b0019257fd9062mr173653oaf.1.1683257378744;
        Thu, 04 May 2023 20:29:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x15-20020a4ae78f000000b0053b547ebee7sm501012oov.1.2023.05.04.20.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 20:29:38 -0700 (PDT)
Received: (nullmailer pid 1056848 invoked by uid 1000);
	Fri, 05 May 2023 03:29:31 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 04 May 2023 22:29:27 -0500
Subject: [PATCH 2/4] ARM: dts: Add .dts files missing from the build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230504-arm-dts-mv-v1-2-2c8e51a2b6c4@kernel.org>
References: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
In-Reply-To: <20230504-arm-dts-mv-v1-0-2c8e51a2b6c4@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Christian Marangi <ansuelsmth@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Joel Stanley <joel@jms.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Lars Persson <lars.persson@axis.com>, 
	Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>, 
	Wei Xu <xuwei5@hisilicon.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Matthias Brugger <matthias.bgg@gmail.com>, Peter Rosin <peda@axentia.se>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Marek Vasut <marex@denx.de>, 
	Qin Jian <qinjian@cqplus1.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Paul Barker <paul.barker@sancloud.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com
X-Mailer: b4 0.13-dev

Comparing .dts files to built .dtb files yielded a few .dts files which
are never built. Add them to the build.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..3cf1bf724e8e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -335,6 +335,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-iconnect.dtb \
 	kirkwood-iomega_ix2_200.dtb \
 	kirkwood-is2.dtb \
+	kirkwood-km_fixedeth.dtb \
 	kirkwood-km_kirkwood.dtb \
 	kirkwood-l-50.dtb \
 	kirkwood-laplug.dtb \
@@ -880,7 +881,10 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	am3517-craneboard.dtb \
 	am3517-evm.dtb \
 	am3517_mt_ventoux.dtb \
+	logicpd-torpedo-35xx-devkit.dtb \
 	logicpd-torpedo-37xx-devkit.dtb \
+	logicpd-torpedo-37xx-devkit-28.dtb \
+	logicpd-som-lv-35xx-devkit.dtb \
 	logicpd-som-lv-37xx-devkit.dtb \
 	omap3430-sdp.dtb \
 	omap3-beagle.dtb \
@@ -1561,6 +1565,8 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
 	armada-388-helios4.dtb \
 	armada-388-rd.dtb
 dtb-$(CONFIG_MACH_ARMADA_39X) += \
+	armada-390-db.dtb \
+	armada-395-gp.dtb \
 	armada-398-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_XP) += \
 	armada-xp-axpwifiap.dtb \
@@ -1590,6 +1596,7 @@ dtb-$(CONFIG_MACH_DOVE) += \
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
 	mt6580-evbp1.dtb \
+	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
 	mt6589-fairphone-fp1.dtb \
 	mt6592-evb.dtb \
@@ -1645,6 +1652,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
+	aspeed-bmc-inspur-on5263m5.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \

-- 
2.39.2

