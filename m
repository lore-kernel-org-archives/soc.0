Return-Path: <SRS0=BfWA=CL=microchip.com=Varshini.Rajendran@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBE7C04A6A
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 21:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94042C433AB; Fri, 23 Jun 2023 21:28:32 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF121C433C0;
	Fri, 23 Jun 2023 21:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF121C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687555708; x=1719091708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LaFuLsEGQ6mxqfpcSL/WdyF7cpNwZFZOEiL/qzQcsPg=;
  b=1x+ChwM7gablz3IFHjk33NMmEgQBCHZZvfMsnxcXxjDflKHm6D8rW0g+
   ULFrlDxA3AF4pXjzRXBg1haz7/GgSKcoTE0reB8BX50UVWMzCkAbqbXnd
   70x4aiqlo7AOq2DUIdPVuKNhcdR2tm3sjZUcpMP/o7/v6ovqqCuLgRzJQ
   ia2p78ZBufTr8Rx+1eMWVOLSO2o8ob42Ne9TedqnT4mwobEleoCWHx7g2
   8nwybYpEXU67IqvMaPGb2oUm61m3yxQPHF+GcLoUdCnCiIqSEIfVpHu66
   sb/jSeama/JNHx1j7aMRGEUjWXztb7YY0eMgqtI6/kdTI5KIxlXKQI/l4
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="220223109"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 14:28:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:43:08 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:42:40 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 24/45] dt-bindings: sdhci-of-at91: add microchip,sam9x7-sdhci
Date: Sat, 24 Jun 2023 02:00:35 +0530
Message-ID: <20230623203056.689705-25-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add microchip,sam9x7-sdhci to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-atmel.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
index 69edfd4d3922..b8df78fbc00f 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
@@ -5,11 +5,13 @@ Documentation/devicetree/bindings/mmc/mmc.txt and the properties used by the
 sdhci-of-at91 driver.
 
 Required properties:
-- compatible:		Must be "atmel,sama5d2-sdhci" or "microchip,sam9x60-sdhci".
+- compatible:		Must be "atmel,sama5d2-sdhci" or "microchip,sam9x60-sdhci"
+			or "microchip,sam9x7-sdhci"
 - clocks:		Phandlers to the clocks.
 - clock-names:		Must be "hclock", "multclk", "baseclk" for
 			"atmel,sama5d2-sdhci".
 			Must be "hclock", "multclk" for "microchip,sam9x60-sdhci".
+			Must be "hclock", "multclk" for "microchip,sam9x7-sdhci".
 
 Optional properties:
 - assigned-clocks:	The same with "multclk".
-- 
2.25.1

