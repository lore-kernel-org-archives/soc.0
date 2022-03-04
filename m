Return-Path: <SRS0=uyAw=TP=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41A9C433EF
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 15:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD937C340F0; Fri,  4 Mar 2022 15:36:21 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D88BC340F1;
	Fri,  4 Mar 2022 15:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D88BC340F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 48C8C223EF;
	Fri,  4 Mar 2022 16:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1646408178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnNAbVT0vaSgxG9HwhKDZpxUdWN7OJ8SoTprLMlFALQ=;
	b=tDXI74AoueOgZohRxucZHb38HHdmXWMD56uUsCYl4g/3O2Utf49Heosxc51wyOnyaGOoK+
	qNaDf9a3IBCHlz2hq1Gm0g56IeJiuBhrb2eVNQwlRYHMr2iAV/k8GhdHvB4hu9t9R14yh6
	ly6IV5cbo9fVWCAMQgH9cx+5sddHtcw=
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
Subject: [PATCH v2 3/7] ARM: dts: lan966x: add missing uart DMA channel
Date: Fri,  4 Mar 2022 16:35:44 +0100
Message-Id: <20220304153548.3364480-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304153548.3364480-1-michael@walle.cc>
References: <20220304153548.3364480-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usart node of the flexcom3 block is missing the DMA channels. Add
it.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/lan966x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index 39dfdb8e29ed..230de3bdd5f1 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -144,6 +144,9 @@ usart3: serial@200 {
 				compatible = "atmel,at91sam9260-usart";
 				reg = <0x200 0x200>;
 				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(9)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(8)>;
+				dma-names = "tx", "rx";
 				clocks = <&nic_clk>;
 				clock-names = "usart";
 				atmel,fifo-size = <32>;
-- 
2.30.2

