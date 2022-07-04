Return-Path: <SRS0=IooT=XJ=microchip.com=Kavyasree.Kotagiri@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24ECCCA479
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 13:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80857C341CF; Mon,  4 Jul 2022 13:58:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B74EAC3411E;
	Mon,  4 Jul 2022 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B74EAC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656943131; x=1688479131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Rd2VhqWRy5Lh37VwtNPex5l+zsOkNuQYWDNY6kfDxM=;
  b=vH70/IVxYLXS/6uX350PIXnmvbTl4Ii2X74FO6Axc7ARTKeok9mpeowP
   MO2rHYe1OrggAYyAp4gOzR6LT6oXwl2Aeg9nH5xyN+OYeH5T4nFMFmSHH
   reexuxaDW/u8xWdbjgkazwHdCCutWVE5LWzWdIIVsuvqfp+psGepRouGQ
   POGiPYIZE5OR0LJJn/5AIehcqvBDT/rF37FmNmwSmspc3lodd33R+lV/u
   3i8ITFAA1y27es2UPah6mMsBEg4/6er5FAWOhbGSpcL5TInmvMJe8F2rp
   y1m5qxNiLzeMbj8ipyQRpvcUSWZuW5usHRe8ry1Ej4NYMHP0Acznqv8qk
   w==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="102929581"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 06:58:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 06:58:48 -0700
Received: from kavya.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 06:58:44 -0700
From: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To: <arnd@arndb.de>, <alexandre.belloni@bootlin.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <Nicolas.Ferre@microchip.com>,
	<claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <robh+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: [PATCH v2] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.
Date: Mon, 4 Jul 2022 11:58:09 -0200
Message-ID: <20220704135809.6952-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On pcb8291, Flexcom3 usart has only tx and rx pins.
Cleaningup usart3 pinctrl settings.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
v1 -> v2:
- Keep both tx and rx pins into one node.

 arch/arm/boot/dts/lan966x-pcb8291.dts | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
index 3c7e3a7d6f14..d56d2054c38d 100644
--- a/arch/arm/boot/dts/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
@@ -19,19 +19,9 @@ aliases {
 };
 
 &gpio {
-	fc_shrd7_pins: fc_shrd7-pins {
-		pins = "GPIO_49";
-		function = "fc_shrd7";
-	};
-
-	fc_shrd8_pins: fc_shrd8-pins {
-		pins = "GPIO_54";
-		function = "fc_shrd8";
-	};
-
-	fc3_b_pins: fcb3-spi-pins {
-		/* SCK, RXD, TXD */
-		pins = "GPIO_51", "GPIO_52", "GPIO_53";
+	fc3_b_pins: fc3-b-pins {
+		/* RX, TX */
+		pins = "GPIO_52", "GPIO_53";
 		function = "fc3_b";
 	};
 
@@ -53,7 +43,7 @@ &flx3 {
 	status = "okay";
 
 	usart3: serial@200 {
-		pinctrl-0 = <&fc3_b_pins>, <&fc_shrd7_pins>, <&fc_shrd8_pins>;
+		pinctrl-0 = <&fc3_b_pins>;
 		pinctrl-names = "default";
 		status = "okay";
 	};
-- 
2.25.1

