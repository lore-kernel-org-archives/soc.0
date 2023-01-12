Return-Path: <SRS0=xBYX=5J=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1F0C54EBC
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4D15C433F1; Thu, 12 Jan 2023 11:03:17 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 007BBC433D2;
	Thu, 12 Jan 2023 11:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 007BBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673521395; x=1705057395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a04DBEO5emeAMevR4WYHcvqopccnG+bxo87TD5Rxvls=;
  b=casZ+jnUGAglfRfxgrK+BeQLeCt+EprtA5l3k+Q3vx31P7fa36T1BDod
   eTY6639Rt+ehSnLlQ+54dyz80Osj3t8DXX0k/IfC9lVeVy5hrQGt8X/YL
   dPQUlHbtU1CA6An7OBD+Jy2JHTK0LBJTZTqxoVG3yRhXxPTOxQkMglFvZ
   TpKTksdAs6tD/tlpeFeyn8+ylIq2S1WMhqU6s4g/uHhOSTDFe1pedsON1
   jeIojbDTQAtI/MVZax7lgor+vrajdqMk6NbsRlBs6aKjs4NvzKS3BdL2b
   rBDSkpYu7r1kWOoiBqqswxBhYS8ySn1dm3eaLHiMrepCNsVNTpEQhjQkX
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="131991546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 04:03:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 04:03:07 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 04:03:00 -0700
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
Subject: [PATCH v4 3/8] ARM: dts: at91: sam9x60: fix spi4 node
Date: Thu, 12 Jan 2023 16:32:03 +0530
Message-ID: <20230112110208.97946-4-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112110208.97946-1-durai.manickamkr@microchip.com>
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The ranges, #address-cells and #size-cells properties are not required,
remove them from the spi4 node.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 4ff84633dd43..6b6391d5041e 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -232,8 +232,6 @@ &flx4 {
 	spi4: spi@400 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx4_default>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		status = "disabled";
 	};
 };
-- 
2.25.1

