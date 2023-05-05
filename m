Return-Path: <SRS0=Iq7n=A2=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66158C7EE23
	for <soc@archiver.kernel.org>; Fri,  5 May 2023 03:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A9B3C4339C; Fri,  5 May 2023 03:29:44 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCF19C4339B;
	Fri,  5 May 2023 03:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCF19C4339B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-54caba50d07so698771eaf.2;
        Thu, 04 May 2023 20:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683257382; x=1685849382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO08HzmVk1n7d0QynKl12ITRwYajT1G6ollIJzLwnQ0=;
        b=iqdmGf6l+IULd2nyBY/W2AhHpq3xY9IrOgE1j1DMOQLJ5wItqRS8cMbTpiARmkOSv/
         UtwVVjD5xLnbDDhpPHVNF1WIyK7CP8KGTXfatfGDsgryAxgGHeSMmNx5HdgijB9rM474
         DvsZBZ9A2Tr1IAsDYkUBpeA64MWO2mVBlTJgnxvd3jPM92hiNV5iOsimF70O4RniPrkN
         dinjW1OyRS0FFDM5QkaH/pUjpqIMEySA/CgrSQUd71COPVNUjoJeqPpHBwR3iNyyjteA
         FoG8GGp4oXIcjz5YK9oVAxZTpheOCnS8JGrkU8NH3+MLMCtnr+oeVR3rVAw0e9zWKSeB
         nFpg==
X-Gm-Message-State: AC+VfDxjtPSQMT42Eyh/Nl3inUxwXRtMI7sLmjACfcDnOeiHY00pntv9
	x3tiF3XC93vcHfAl95jvAw==
X-Google-Smtp-Source: ACHHUZ5dG/KV5t6GBZgbnTBt4RRfH6XJsLQcOegoUooL1M3JR9y6bvBwgGoVTHkorw1jCXtBTd5onw==
X-Received: by 2002:a05:6808:308f:b0:38c:3c53:9e15 with SMTP id bl15-20020a056808308f00b0038c3c539e15mr3141116oib.13.1683257381863;
        Thu, 04 May 2023 20:29:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w12-20020a056808090c00b0038c235e24fesm2259619oih.48.2023.05.04.20.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 20:29:41 -0700 (PDT)
Received: (nullmailer pid 1056850 invoked by uid 1000);
	Fri, 05 May 2023 03:29:31 -0000
From: Rob Herring <robh@kernel.org>
Date: Thu, 04 May 2023 22:29:28 -0500
Subject: [PATCH 3/4] kbuild: Support flat DTBs install
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230504-arm-dts-mv-v1-3-2c8e51a2b6c4@kernel.org>
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

In preparation to move Arm .dts files into sub-directories grouped
by vendor/family, the current flat tree of DTBs generated by
dtbs_install needs to be maintained. Moving the installed DTBs to
sub-directories would break various consumers using 'make dtbs_install'.

This is a NOP until sub-directories are introduced.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/Kconfig         | 3 +++
 scripts/Makefile.dtbinst | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..7a3b1176f19d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1463,6 +1463,9 @@ config USE_OF
 	help
 	  Include support for flattened device tree machine descriptions.
 
+config ARCH_WANT_FLAT_DTB_INSTALL
+	def_bool y
+
 config ATAGS
 	bool "Support for the traditional ATAGS boot data passing"
 	default y
diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 2ab936e4179d..4405d5b67578 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -34,6 +34,6 @@ $(dst)/%.dtbo: $(obj)/%.dtbo
 
 PHONY += $(subdirs)
 $(subdirs):
-	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
+	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(if $(CONFIG_ARCH_WANT_FLAT_DTB_INSTALL),$(dst),$(patsubst $(obj)/%,$(dst)/%,$@))
 
 .PHONY: $(PHONY)

-- 
2.39.2

