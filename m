Return-Path: <SRS0=xBYX=5J=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42164C677F1
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0774AC43396; Thu, 12 Jan 2023 11:03:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63D14C433EF;
	Thu, 12 Jan 2023 11:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63D14C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673521436; x=1705057436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/FmuJe85bAHYZr8iZGtQCBIR7zCPBdVyq4OhYP65Jc=;
  b=O67itFc8M7qbY/XVQxKcHdkbSGWXCKB9s2pvpkKYAJpUJqRJSpy63fCw
   +oFNtM2A8Y8H0kBgla+M6tywF1haJgNvFMm/XwrRYVj2bKHIvd1KukxOl
   Y8ENFzfijnsXXciDsAM8DarUrKzAX7HaAreI0xwr+DO9OrBZ0mOWjndGs
   X+wckcgu0L5pm3tRgl1Q2hMoGRpWYaWLUhaLN4OX4IkRR1wZOJQNf2P4a
   W7CDlmdmzNAJMOeDX8o96mpOW3UIucFGr3W64wTO0dxNWlQ6cyG7JYW1g
   u32c/Pt/WFOzs+oC+PE0bkv2NpSjIctIlfWsR5E9S+N5S7BOB0yIlZ+Kf
   g==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="131991656"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 04:03:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 04:03:51 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 04:03:43 -0700
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
Subject: [PATCH v4 7/8] dt-bindings: arm: at91: Add info on sam9x60 curiosity
Date: Thu, 12 Jan 2023 16:32:07 +0530
Message-ID: <20230112110208.97946-8-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112110208.97946-1-durai.manickamkr@microchip.com>
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
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

