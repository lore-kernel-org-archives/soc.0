Return-Path: <SRS0=BfWA=CL=microchip.com=Varshini.Rajendran@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD71EB64D7
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 20:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D97CC433C9; Fri, 23 Jun 2023 20:52:01 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ED27C433C8;
	Fri, 23 Jun 2023 20:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ED27C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687553516; x=1719089516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CL7AMEd4iWfhNY7rztjIZf6Et4SGAj+Z92S97fPh/g=;
  b=AQVRBbvqI0X90XPuQCvQYydLBlqnMS97oq+SX9WAsT8QQYBG6noGwv7w
   dTmVqM1jzqDx78pLIrPLJd+P5EAvEReSlHFfbG7S6BIgbybqBSN5nFbR4
   YW3T62vN9Zfj6O7dahfxXATUfvkqBsveGZyzKAWOPl3NsmfL70raWqCKS
   LHyAOipH+Ep/8aJFoBslCd6Gtgw4Eai6G7+oIHZ0tmEEMmyHKPjfETaiM
   S+/qup6X17RLbXUYOYbCjb5x/yvWwY1SbCMkCOGISvGQid6syCfqM3l8v
   KBNvaUl7GarjU0rQX+FDaQftnYgS2cV3N61yDO5JtZ7q0+xPcFothtGWh
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="221703423"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:51:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:51:26 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:50:57 -0700
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
Subject: [PATCH v2 41/45] ARM: at91: Kconfig: add config flag for SAM9X7 SoC
Date: Sat, 24 Jun 2023 02:00:52 +0530
Message-ID: <20230623203056.689705-42-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add config flag for sam9x7 SoC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/mach-at91/Kconfig | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 3dd9e718661b..4e9cb30f5091 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -143,11 +143,28 @@ config SOC_SAM9X60
 	help
 	  Select this if you are using Microchip's SAM9X60 SoC
 
+config SOC_SAM9X7
+	bool "SAM9X7"
+	depends on ARCH_MULTI_V5
+	select ATMEL_AIC5_IRQ
+	select ATMEL_PM if PM
+	select ATMEL_SDRAMC
+	select CPU_ARM926T
+	select HAVE_AT91_USB_CLK
+	select HAVE_AT91_GENERATED_CLK
+	select HAVE_AT91_SAM9X60_PLL
+	select MEMORY
+	select PINCTRL_AT91
+	select SOC_SAM_V4_V5
+	select SRAM if PM
+	help
+	  Select this if you are using Microchip's SAM9X7 SoC
+
 comment "Clocksource driver selection"
 
 config ATMEL_CLOCKSOURCE_PIT
 	bool "Periodic Interval Timer (PIT) support"
-	depends on SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAMA5
+	depends on SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA5
 	default SOC_AT91SAM9 || SOC_SAMA5
 	select ATMEL_PIT
 	help
@@ -157,7 +174,7 @@ config ATMEL_CLOCKSOURCE_PIT
 
 config ATMEL_CLOCKSOURCE_TCB
 	bool "Timer Counter Blocks (TCB) support"
-	default SOC_AT91RM9200 || SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAMA5
+	default SOC_AT91RM9200 || SOC_AT91SAM9 || SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA5
 	select ATMEL_TCB_CLKSRC
 	help
 	  Select this to get a high precision clocksource based on a
@@ -168,7 +185,7 @@ config ATMEL_CLOCKSOURCE_TCB
 
 config MICROCHIP_CLOCKSOURCE_PIT64B
 	bool "64-bit Periodic Interval Timer (PIT64B) support"
-	default SOC_SAM9X60 || SOC_SAMA7
+	default SOC_SAM9X60 || SOC_SAM9X7 || SOC_SAMA7
 	select MICROCHIP_PIT64B
 	help
 	  Select this to get a high resolution clockevent (SAM9X60) or
-- 
2.25.1

