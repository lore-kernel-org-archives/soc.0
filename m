Return-Path: <SRS0=MAlP=VK=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479AAC3527B
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 22:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CF0BC385B2; Mon,  2 May 2022 22:41:41 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30B71C385B6;
	Mon,  2 May 2022 22:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30B71C385B6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 2739D22259;
	Tue,  3 May 2022 00:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1651531298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vzO+oKgDSaVbLDInS6cU89cYjO6q21VAAN84a2Gs6g=;
	b=Y6pQuvWFMv6MdMUlm5rWGSFtakp4S7olxxV3Obe8YwNEaYkeChYQ9MffIaTL1SVqwa9hEF
	Q+VFC8nEontE9UgcRdMZ6AzufLLmMAVp39/HcBEFtau7+tah9hJy+a20Wmz3QtNEMFtbge
	Vglf+qEaL2cEidblISE8kbb8iQQDUW4=
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
Subject: [PATCH v4 10/13] ARM: dts: lan966x: add reset switch reset node
Date: Tue,  3 May 2022 00:41:24 +0200
Message-Id: <20220502224127.2604333-11-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502224127.2604333-1-michael@walle.cc>
References: <20220502224127.2604333-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the switch reset node which will later be used by the switch driver.
The switch reset also resets the GPIO controller and the SGPIO
controller, thus it also has to be connectected to these nodes. This way
the reset will only issued once for the first device requesting the
reset.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/lan966x.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index 0442735910da..7020b31322d8 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -391,6 +391,11 @@ watchdog: watchdog@e0090000 {
 			status = "disabled";
 		};
 
+		cpu_ctrl: syscon@e00c0000 {
+			compatible = "microchip,lan966x-cpu-syscon", "syscon";
+			reg = <0xe00c0000 0x350>;
+		};
+
 		can0: can@e081c000 {
 			compatible = "bosch,m_can";
 			reg = <0xe081c000 0xfc>, <0x00100000 0x4000>;
@@ -406,10 +411,20 @@ can0: can@e081c000 {
 			status = "disabled";
 		};
 
+		reset: reset-controller@e200400c {
+			compatible = "microchip,lan966x-switch-reset";
+			reg = <0xe200400c 0x4>;
+			reg-names = "gcb";
+			#reset-cells = <1>;
+			cpu-syscon = <&cpu_ctrl>;
+		};
+
 		gpio: pinctrl@e2004064 {
 			compatible = "microchip,lan966x-pinctrl";
 			reg = <0xe2004064 0xb4>,
 			    <0xe2010024 0x138>;
+			resets = <&reset 0>;
+			reset-names = "switch";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&gpio 0 0 78>;
@@ -453,6 +468,8 @@ sgpio: gpio@e2004190 {
 			compatible = "microchip,sparx5-sgpio";
 			reg = <0xe2004190 0x118>;
 			clocks = <&sys_clk>;
+			resets = <&reset 0>;
+			reset-names = "switch";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.30.2

