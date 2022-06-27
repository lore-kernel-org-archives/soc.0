Return-Path: <SRS0=T0cT=XC=microchip.com=Kavyasree.Kotagiri@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897F3C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75F5BC341C7; Mon, 27 Jun 2022 09:16:54 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3F2DC3411D;
	Mon, 27 Jun 2022 09:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3F2DC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656321412; x=1687857412;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ZfnjeGaTXA62WKjkc0ev0zGBTHlOx0/hvfL7GfyMNRA=;
  b=f+GPv5/SyNFumSAdnRTDmRj+MF3xKUMvt2d8mcAa0KE4nGfweBLYbSe8
   pf2Gv+OlNnX0CHQPjiJVAjsbpnt17YSWQNU9qeIlhB4hu6gJugtzCbG6m
   Sn7TPLPGgEB/kPAqK3jRBpEnj+N1Ds5xvgvv44mAZ2E8NZZHZfQdSio6n
   mmdVmXUihj8GWDE6DjC7kg+8ga4OSdKOQig35HXETbKhhettjSZDv11vP
   IplBU54W27RWKuRobllEDsa6mectaWfbhoUkb/YItGVEV3wQCBIrf7fTH
   8nFZXiLA3OCgOH++c6GCCmiJO2oP1MzRSqAJ4Ig9gK/PtGR7Ca7wszoIc
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="179631289"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 02:16:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 02:16:50 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 02:16:47 -0700
From: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <alexandre.belloni@bootlin.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <soc@kernel.org>, <robh+dt@kernel.org>,
	<nicolas.ferre@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.
Date: Mon, 27 Jun 2022 14:42:17 +0530
Message-ID: <20220627091217.21701-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

On pcb8291, Flexcom3 usart has only tx and rx pins.
Cleaningup usart3 pinctrl settings.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
 arch/arm/boot/dts/lan966x-pcb8291.dts | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/lan966x-pcb8291.dts b/arch/arm/boot/dts/lan966x-pcb8291.dts
index 3c7e3a7d6f14..5dc8ed4cee9a 100644
--- a/arch/arm/boot/dts/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/lan966x-pcb8291.dts
@@ -19,19 +19,13 @@
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
+	fc3_b_rxd_pins: fc3-b-rxd-pins {
+		pins = "GPIO_52";
+		function = "fc3_b";
 	};
 
-	fc3_b_pins: fcb3-spi-pins {
-		/* SCK, RXD, TXD */
-		pins = "GPIO_51", "GPIO_52", "GPIO_53";
+	fc3_b_txd_pins: fc3-b-txd-pins {
+		pins = "GPIO_53";
 		function = "fc3_b";
 	};
 
@@ -53,7 +47,7 @@
 	status = "okay";
 
 	usart3: serial@200 {
-		pinctrl-0 = <&fc3_b_pins>, <&fc_shrd7_pins>, <&fc_shrd8_pins>;
+		pinctrl-0 = <&fc3_b_rxd_pins>, <&fc3_b_txd_pins>;
 		pinctrl-names = "default";
 		status = "okay";
 	};
-- 
2.17.1

