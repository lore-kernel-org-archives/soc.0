Return-Path: <SRS0=QxmZ=57=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41292C61DA4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 03:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B514C433EF; Fri,  3 Feb 2023 03:50:54 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84979C433D2;
	Fri,  3 Feb 2023 03:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84979C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675396253; x=1706932253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/FmuJe85bAHYZr8iZGtQCBIR7zCPBdVyq4OhYP65Jc=;
  b=eyNf3H5J2RvkhD34l2vRVm9cpb198U4goIUHbX2vgfNmM7G8D+NR0ckx
   BBaaHvrw4/OOHmktfcfb8DIobAAarIlKuoex4bNUzHTFOMzOc/Q31QIWx
   P6jmyVfMGh5TryE3zyudwj5uVhsH1hho2jQU9wIyGaldiccq4pO7kj8bY
   YfOVY06zUDyO18sgMuLYwgTB8cAS4IrPcH8SlV21LbH0CJrvSnobQiNpY
   j7TSgwV63n9ugbqS/xEMZmjhz5F1y9lKR9Xm4TqjWYeNqszAixkIQyf0z
   uvdovg3crAbDhmtiTclgQX7Rp6ZarV3tr1t5yT1tBv8mx6GbgVD8Y+e9N
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669100400"; 
   d="scan'208";a="199411244"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 20:50:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 20:50:47 -0700
Received: from che-lt-i66125lx.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 20:50:37 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <claudiu.beznea@microchip.com>,
	<cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
	<krzysztof.kozlowski@linaro.org>, <alexandre.belloni@bootlin.com>,
	<davem@davemloft.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Kavyasree.Kotagiri@microchip.com>,
	<Horatiu.Vultur@microchip.com>, <robh+dt@kernel.org>, <andrew@lunn.ch>,
	<michael@walle.cc>, <jerry.ray@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH v5 7/8] dt-bindings: arm: at91: Add info on sam9x60 curiosity
Date: Fri, 3 Feb 2023 09:18:32 +0530
Message-ID: <20230203034833.451461-8-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230203034833.451461-1-durai.manickamkr@microchip.com>
References: <20230203034833.451461-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adding the sam9x60 curiosity board from Microchip into the atmel AT91 board
description yaml file.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 2224b18801a1..dfb8fd089197 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -91,9 +91,11 @@ properties:
           - const: atmel,sama5d2
           - const: atmel,sama5
 
-      - description: SAM9X60-EK board
+      - description: Microchip SAM9X60 Evaluation Boards
         items:
-          - const: microchip,sam9x60ek
+          - enum:
+              - microchip,sam9x60ek
+              - microchip,sam9x60-curiosity
           - const: microchip,sam9x60
           - const: atmel,at91sam9
 
-- 
2.25.1

