Return-Path: <SRS0=BfWA=CL=microchip.com=Varshini.Rajendran@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944AEB64DD
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 20:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A8A2C433C9; Fri, 23 Jun 2023 20:41:04 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4741C433C0;
	Fri, 23 Jun 2023 20:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4741C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552858; x=1719088858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4yoh5RmFPpDPEd8+mS0XJxngkCLNjReCGr1KTZz03Y0=;
  b=nCUzLy/Q1ZsF/+WCjfNer21U+nI2CAkXkyN8LD/H+6YaZLaBfAgvhDi9
   /5XEn8h3UT4pv2FN4C23E0PgTnctvc6LIwyL6A4lfXzynNR9EEOWaGnf2
   w8xJDuJeRGiK/CQt8WFITPwgQf2yV+HR9y1rkC7SaLY/EeWg1OAEaw9Xv
   Rky48zF8+cq0E4UhrcuFDOAhereiBAghCFWtnI19wbubly5sWgp7xOz0A
   gSjqm1KiN7NFWrj9aaUi8F606J56b4XgaBkb43nDU00uWxYTyOOIIou8Q
   sgmZI9PvqzLj7nS0aPKgiRzWzigpEVpQ13O2OQci6+0ptAtMwfz/WQjdC
   A==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="217419077"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:40:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:40:14 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:39:46 -0700
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
Subject: [PATCH v2 18/45] dt-bindings: i2c: at91: Add SAM9X7 compatible string
Date: Sat, 24 Jun 2023 02:00:29 +0530
Message-ID: <20230623203056.689705-19-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible string for sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index 6adedd3ec399..440f890e209f 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -24,9 +24,11 @@ properties:
               - atmel,sama5d4-i2c
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
+              - microchip,sam9x7-i2c
       - items:
           - const: microchip,sama7g5-i2c
           - const: microchip,sam9x60-i2c
+          - const: microchip,sam9x7-i2c
 
   reg:
     maxItems: 1
@@ -84,6 +86,7 @@ allOf:
               - atmel,sama5d4-i2c
               - atmel,sama5d2-i2c
               - microchip,sam9x60-i2c
+              - microchip,sam9x7-i2c
               - microchip,sama7g5-i2c
     then:
       properties:
-- 
2.25.1

