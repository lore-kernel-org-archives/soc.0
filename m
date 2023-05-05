Return-Path: <SRS0=Iq7n=A2=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE2BC7EE23
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 03:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F35C5C433A8; Fri,  5 May 2023 03:29:51 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D54DEC4339B;
	Fri,  5 May 2023 03:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D54DEC4339B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-18ef8aa1576so1111720fac.0;
        Thu, 04 May 2023 20:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683257390; x=1685849390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGh96GpF1w56WRuG0KE+CcOTucEJsJno0dq0Q6fCK1s=;
        b=gbEQNDC+Bu3oV2+BvMwxsN7MXZGk616HMfcZRs7dOsYo44exsUOOA14lm9QnKhrj5B
         Fy0+uWHcZjuYH971YT5BJqhaWfCbn4C0DDV0BtwERYebDrJZ9JDbiZNNGrD8+dBfadTK
         gwKLpyWUtfUFj2msJHLiCXY0P1PlSOrwPZFAETmsukvgqhXtFrqNU8Cbnbr4yevjkAKL
         USJ/RB9dJ3UU3GKBTgyGu3IcUbQDWzldS2x/17nWXSFe8fdDvfLMbb3tzbdi6onqakSu
         rQPUTSNFUxI6fNNZEIs9Jy5d4xIn9ItyVctpJALlsiPIh2ZwPLBYRd5wZvRmwQxbcS3j
         CJwA==
X-Gm-Message-State: AC+VfDxF+ei2prJpvtGHE8uGvpanigSTu55iFaY5b8/UcqLXsvkUw6pd
	WOOR+H1ATbVSdjMyFC4PBQ==
X-Google-Smtp-Source: ACHHUZ6Ouk9QsRDuY7RaJWgtUD36KbaZon3pr26YZGtdSnAszI68UGDhoFcHEim9vKKLP4+HdIV7bw==
X-Received: by 2002:a05:6870:a484:b0:187:c830:92d with SMTP id j4-20020a056870a48400b00187c830092dmr162785oal.27.1683257389747;
        Thu, 04 May 2023 20:29:49 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e1-20020a056870c34100b0018449ae08cesm1366705oak.13.2023.05.04.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 20:29:49 -0700 (PDT)
Received: (nullmailer pid 1056846 invoked by uid 1000);
	Fri, 05 May 2023 03:29:31 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 04 May 2023 22:29:26 -0500
Subject: [PATCH 1/4] ARM: dts: allwinner: Use quoted #include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230504-arm-dts-mv-v1-1-2c8e51a2b6c4@kernel.org>
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

In preparation to move .dts files into subdirectories, include
sunxi-h3-h5-emlid-neutis.dtsi from the current directory rather than the
symlinked include path.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
index eedd5da5dc2f..35e71f46c197 100644
--- a/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
@@ -8,4 +8,4 @@
 /dts-v1/;
 
 #include "sun8i-h3.dtsi"
-#include <arm/sunxi-h3-h5-emlid-neutis.dtsi>
+#include "sunxi-h3-h5-emlid-neutis.dtsi"

-- 
2.39.2

