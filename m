Return-Path: <SRS0=MAlP=VK=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2BFC433F5
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 22:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 549F6C385B6; Mon,  2 May 2022 22:41:38 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C376CC385AC;
	Mon,  2 May 2022 22:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C376CC385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 7C4FD22249;
	Tue,  3 May 2022 00:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1651531294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCEvTZ/O30k3nO+2jrdVl0gFAUtDTetFzbLFbAwJZ9U=;
	b=Yru9yPjkTzjCvK6SKv+ltY7J3LGhrxlX+MorSWJOPlQNKf8ClnNH1Z/vixt31wwaXz7Y4O
	sX/Uzdz45h2tXMX6zpCy2yFAlIZX8GvkjNMF6wznsbnGFWGKhgnI/BhETOAvUMwFe1gDXK
	nhSeQl5SGPZCXTbYs9zOIYbTA4AhW54=
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
	Tudor.Ambarus@microchip.com,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v4 02/13] ARM: dts: lan966x: add sgpio node
Date: Tue,  3 May 2022 00:41:16 +0200
Message-Id: <20220502224127.2604333-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502224127.2604333-1-michael@walle.cc>
References: <20220502224127.2604333-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the SGPIO IP block reused from the
SparX-5. Keep the node disabled by default.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/lan966x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index a99ffb4cfb8a..4c7beebbd1ef 100644
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

