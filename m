Return-Path: <SRS0=Wnfl=6D=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C40C636CC
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 11:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84FEDC433D2; Tue,  7 Feb 2023 11:08:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E01DC433EF;
	Tue,  7 Feb 2023 11:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E01DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675768124; x=1707304124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p1lbUVhb7i+rNn22EBbKPX27IsYE8BqOKDNggZDvwDs=;
  b=i46SXDjjN/jxKJdeHPsjdJfRLV49IxfSafvj5V7jyRzmaB6DkW+2VEWR
   XNCM9SMtwbtl4pVzsT/NSBBXbRIFhYj/A6Q6JFdDVeE5IFldYMX7KrmaC
   5HgwfLDJFMau9WgUM8N3mhj4jfz1NhCtkW2hLszro3dn8Lh12stvPI82s
   zyVXDptTUSwJ7HvPYkb5mpmA0lBTLVLyqw42hMhzf0tjE8huBAC6p4Y4R
   5Gdt5F5saKSc5hiW55NZOlQFytbooVUBWStmczdeuEvHYLxKBhnbdcYiF
   fFhszFp4FS+rWPmNAj/gxVNVz5sK9HeFLkD+Orx9dHp00nmDuCZGzJJBc
   g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669100400"; 
   d="scan'208";a="199283546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2023 04:08:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 04:08:42 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 04:08:32 -0700
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
Subject: [PATCH v6 7/8] dt-bindings: arm: at91: Add info on sam9x60 curiosity
Date: Tue, 7 Feb 2023 16:36:50 +0530
Message-ID: <20230207110651.197268-8-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207110651.197268-1-durai.manickamkr@microchip.com>
References: <20230207110651.197268-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adding the sam9x60 curiosity board from Microchip into the atmel AT91 board
description yaml file.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

