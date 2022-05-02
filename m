Return-Path: <SRS0=MAlP=VK=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11FEC43219
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 22:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFF77C385AF; Mon,  2 May 2022 22:41:41 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F81DC385B5;
	Mon,  2 May 2022 22:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F81DC385B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id BA1532225D;
	Tue,  3 May 2022 00:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1651531298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLWEvQ8H+N+3ves5MQiRM3TPUboBDqPSmRhE9EEJUOU=;
	b=WAxU/t/88HEbE3Q+VI5LbQcqn0mMy3+OUBscftabnkHQfSha+X9STuQjjPZ8KJvNUkKiZg
	AXmRQlcXzOaCZVESiO70BqkJXxI/VkW8EToF2AuhkB5RbpxdkcFYOyEs17ECLPga56Kxm5
	L9AhR78s3VucnnlqJB5NUlQ+VYRpKW4=
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
Subject: [PATCH v4 12/13] ARM: dts: lan966x: add switch node
Date: Tue,  3 May 2022 00:41:26 +0200
Message-Id: <20220502224127.2604333-13-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502224127.2604333-1-michael@walle.cc>
References: <20220502224127.2604333-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the switch node and its 8 children ports. All are disabled by default.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/lan966x.dtsi | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index d8185f5c7bfc..38e90a31d2dd 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -84,6 +84,68 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		switch: switch@e0000000 {
+			compatible = "microchip,lan966x-switch";
+			reg = <0xe0000000 0x0100000>,
+			      <0xe2000000 0x0800000>;
+			reg-names = "cpu", "gcb";
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "xtr", "fdma", "ana", "ptp",
+					  "ptp-ext";
+			resets = <&reset 0>;
+			reset-names = "switch";
+			status = "disabled";
+
+			ethernet-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port0: port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port1: port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port2: port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port3: port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				port4: port@4 {
+					reg = <4>;
+					status = "disabled";
+				};
+
+				port5: port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+
+				port6: port@6 {
+					reg = <6>;
+					status = "disabled";
+				};
+
+				port7: port@7 {
+					reg = <7>;
+					status = "disabled";
+				};
+			};
+		};
+
 		flx0: flexcom@e0040000 {
 			compatible = "atmel,sama5d2-flexcom";
 			reg = <0xe0040000 0x100>;
-- 
2.30.2

