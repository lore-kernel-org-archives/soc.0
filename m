Return-Path: <SRS0=T0cT=XC=microchip.com=Kavyasree.Kotagiri@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87EAC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 11:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89CF5C341C8; Mon, 27 Jun 2022 11:06:06 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01F66C3411D;
	Mon, 27 Jun 2022 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01F66C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656327964; x=1687863964;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=OoPFRHqikt/yBEHB9HcY/GvSuduX5hDNnHB8YUjJssg=;
  b=kAEjeXR6YJ9WA69Y5G91TIrmURyObm5EMHG4HmfD9RBvEeb/GXYoX4cl
   h6sSHl66A1DNCk3B3OZWEqATlD3s6mBfcNjwTFFPq6/QtIjNrUMl1ryoF
   ZsZbLlPcbEV3NUPhZ2+UxwZll97OE1Lx11qzW7oWAwbdSN/W4ZJblKMPX
   4bM3TlWSzKp6AkHoz0nwFHTcDgmyhKstWEeul728uEwLwMrWOIsEUudlE
   fuKQS8WW5zIJwleXwC8KeWTXdX5eKDRDP4hCg2Lekh840uqeaWK4Zk7jS
   n+0/sWg8p79GDMayXBaXB4L+0Mt/1pCaGvgXpMkDoi1K8N6KWTTzhw+cz
   w==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="101875529"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 04:06:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 04:05:58 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 04:05:54 -0700
From: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To: <alexandre.belloni@bootlin.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <arnd@arndb.de>, <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>, <Kavyasree.Kotagiri@microchip.com>
Subject: [PATCH] ARM: dts: lan966x: Add mcan1 node.
Date: Mon, 27 Jun 2022 16:35:52 +0530
Message-ID: <20220627110552.26315-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Add the mcan1 node. By default, keep it disabled.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
---
 arch/arm/boot/dts/lan966x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index 3cb02fffe716..25cfa89dde7b 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -473,6 +473,21 @@
 			status = "disabled";
 		};
 
+		can1: can@e0820000 {
+			compatible = "bosch,m_can";
+			reg = <0xe0820000 0xfc>, <0x00100000 0x8000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&clks GCK_ID_MCAN1>, <&clks GCK_ID_MCAN1>;
+			clock-names = "hclk", "cclk";
+			assigned-clocks = <&clks GCK_ID_MCAN1>;
+			assigned-clock-rates = <40000000>;
+			bosch,mram-cfg = <0x4000 0 0 64 0 0 32 32>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e200400c {
 			compatible = "microchip,lan966x-switch-reset";
 			reg = <0xe200400c 0x4>;
-- 
2.17.1

