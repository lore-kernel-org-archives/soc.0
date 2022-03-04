Return-Path: <SRS0=uyAw=TP=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1B0C43217
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8CCFC340F3; Fri,  4 Mar 2022 15:36:21 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3088CC340E9;
	Fri,  4 Mar 2022 15:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3088CC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id C6C39223ED;
	Fri,  4 Mar 2022 16:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1646408177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxLOGbpQNwRx2KKbHLEwXJ5hTTQqVuqevKqD6qnm1ew=;
	b=hYwEb5WILQ78SkPreh/lepSw5RCJxV+CoZ2b0jT2sNBsvIUyaCHnzaXsN7NwBS96R1aJF2
	Ha/eFS2IBVxW+VSmpkoZpc0BjRc+o9XV0bssxQaaOZTQdnzyIHPnNFH+yvLDrtr25wxhSG
	VnFgWRVtjiyK9kK3MlwGZerHPGxdV3Q=
From: Michael Walle <michael@walle.cc>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 2/7] ARM: dts: lan966x: add sgpio node
Date: Fri,  4 Mar 2022 16:35:43 +0100
Message-Id: <20220304153548.3364480-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304153548.3364480-1-michael@walle.cc>
References: <20220304153548.3364480-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the SGPIO IP block reused from the
SparX-5. Keep the node disabled by default.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/lan966x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index 5e9cbc8cdcbc..39dfdb8e29ed 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -223,6 +223,32 @@ gpio: pinctrl@e2004064 {
 			#interrupt-cells = <2>;
 		};
 
+		sgpio: gpio@e2004190 {
+			compatible = "microchip,sparx5-sgpio";
+			reg = <0xe2004190 0x118>;
+			clocks = <&sys_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			sgpio_in: gpio@0 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+			};
+
+			sgpio_out: gpio@1 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <3>;
+			};
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,gic-400", "arm,cortex-a7-gic";
 			#interrupt-cells = <3>;
-- 
2.30.2

