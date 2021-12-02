Return-Path: <SRS0=/kpj=QT=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA1C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 09:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9A2EC53FD2; Thu,  2 Dec 2021 09:53:20 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E26BC53FCB;
	Thu,  2 Dec 2021 09:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E26BC53FCB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: herve.codina@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 2AC5E240009;
	Thu,  2 Dec 2021 09:53:16 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 4/6] ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320
Date: Thu,  2 Dec 2021 10:52:53 +0100
Message-Id: <20211202095255.165797-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resources used by plgpio and pinmux are conflicting on SPEAr310
and SPEAr320.

Use the newly introduced regmap property in plgpio node to use
pinmux resources from plgpio and so avoid the conflict.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/arm/boot/dts/spear310.dtsi | 1 +
 arch/arm/boot/dts/spear320.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/spear310.dtsi b/arch/arm/boot/dts/spear310.dtsi
index 8ce751a1376d..77570833d46b 100644
--- a/arch/arm/boot/dts/spear310.dtsi
+++ b/arch/arm/boot/dts/spear310.dtsi
@@ -92,6 +92,7 @@ serial@b2200000 {
 			gpiopinctrl: gpio@b4000000 {
 				compatible = "st,spear-plgpio";
 				reg = <0xb4000000 0x1000>;
+				regmap = <&pinmux>;
 				#interrupt-cells = <1>;
 				interrupt-controller;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
index 3bc1e93a0a55..47ac4474ed96 100644
--- a/arch/arm/boot/dts/spear320.dtsi
+++ b/arch/arm/boot/dts/spear320.dtsi
@@ -120,6 +120,7 @@ serial@a4000000 {
 			gpiopinctrl: gpio@b3000000 {
 				compatible = "st,spear-plgpio";
 				reg = <0xb3000000 0x1000>;
+				regmap = <&pinmux>;
 				#interrupt-cells = <1>;
 				interrupt-controller;
 				gpio-controller;
-- 
2.31.1

