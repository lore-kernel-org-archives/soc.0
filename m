Return-Path: <SRS0=BfWA=CL=microchip.com=Varshini.Rajendran@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED3C001DE
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 20:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3107DC433C8; Fri, 23 Jun 2023 20:34:14 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA04BC433CC;
	Fri, 23 Jun 2023 20:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA04BC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552447; x=1719088447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/HQhcHBxeFox5idw381gGM3I1gJzj1ra4FhcdQBIWA=;
  b=UvREYS5oUtl7KEVvxSt7QNVjneo+MGgi7wvHxCIr51P3KbkG3oHjj20S
   RdZJQkNucSgf97IhtY5QJIm7nNhfMv8RLrPAd9fm/oDTiVb+45pJ06Kj/
   lbjMjsNe76Qvb5bNaCg1KaLMg5u40Q6yg0DIaWuNpvGG/cIBl2TR6Lw+i
   kYg9b+3cK8D4b8Jv+dzLpePxlqcoBucE8FoHtHPNb3gsqdhBYd8Qj3Grw
   N1YlSLdm6OCzgrHlLBmWye3rfcbYRxIMHhT/QgS7caCaUy2LibZXLO8/Q
   uLbb1taseeRMB1fFfXV7cv2Iu0Bsh3BgmmDwUW5Dp1YWKzz4Z9fT+DN1U
   w==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="220216091"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:34:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:33:57 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:33:29 -0700
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
Subject: [PATCH v2 05/45] ARM: at91: pm: add support for sam9x7 SoC family
Date: Sat, 24 Jun 2023 02:00:16 +0530
Message-ID: <20230623203056.689705-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support and pm init config for sam9x7 SoC.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/mach-at91/generic.h |  2 ++
 arch/arm/mach-at91/pm.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index 0c3960a8b3eb..acf0b3c82a30 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -12,6 +12,7 @@
 extern void __init at91rm9200_pm_init(void);
 extern void __init at91sam9_pm_init(void);
 extern void __init sam9x60_pm_init(void);
+extern void __init sam9x7_pm_init(void);
 extern void __init sama5_pm_init(void);
 extern void __init sama5d2_pm_init(void);
 extern void __init sama7_pm_init(void);
@@ -19,6 +20,7 @@ extern void __init sama7_pm_init(void);
 static inline void __init at91rm9200_pm_init(void) { }
 static inline void __init at91sam9_pm_init(void) { }
 static inline void __init sam9x60_pm_init(void) { }
+static inline void __init sam9x7_pm_init(void) { }
 static inline void __init sama5_pm_init(void) { }
 static inline void __init sama5d2_pm_init(void) { }
 static inline void __init sama7_pm_init(void) { }
diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 60dc56d8acfb..43a77ae0c38c 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -232,6 +232,17 @@ static const struct of_device_id sama7g5_ws_ids[] = {
 	{ /* sentinel */ }
 };
 
+static const struct of_device_id sam9x7_ws_ids[] = {
+	{ .compatible = "microchip,sam9x60-rtc",	.data = &ws_info[1] },
+	{ .compatible = "atmel,at91rm9200-ohci",	.data = &ws_info[2] },
+	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
+	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
+	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
+	{ .compatible = "microchip,sam9x60-rtt",	.data = &ws_info[4] },
+	{ .compatible = "microchip,sam9x7-gem",		.data = &ws_info[5] },
+	{ /* sentinel */ }
+};
+
 static int at91_pm_config_ws(unsigned int pm_mode, bool set)
 {
 	const struct wakeup_source_info *wsi;
@@ -1133,6 +1144,7 @@ static const struct of_device_id gmac_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-gem" },
 	{ .compatible = "atmel,sama5d29-gem" },
 	{ .compatible = "microchip,sama7g5-gem" },
+	{ .compatible = "microchip,sam9x7-gem" },
 	{ },
 };
 
@@ -1360,6 +1372,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
 	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
 	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
 	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
+	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
 	{ /* sentinel */ },
 };
 
@@ -1497,6 +1510,28 @@ void __init sam9x60_pm_init(void)
 	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
 }
 
+void __init sam9x7_pm_init(void)
+{
+	static const int modes[] __initconst = {
+		AT91_PM_STANDBY, AT91_PM_ULP0,
+	};
+
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_SOC_SAM9X7))
+		return;
+
+	at91_pm_modes_validate(modes, ARRAY_SIZE(modes));
+	ret = at91_dt_ramc(false);
+	if (ret)
+		return;
+
+	at91_pm_init(NULL);
+
+	soc_pm.ws_ids = sam9x7_ws_ids;
+	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
+}
+
 void __init at91sam9_pm_init(void)
 {
 	int ret;
-- 
2.25.1

