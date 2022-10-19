Return-Path: <SRS0=xfH4=2U=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A217C4332F
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 13:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D886C433B5; Wed, 19 Oct 2022 13:32:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0799C433D6;
	Wed, 19 Oct 2022 13:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0799C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D76FAE0007;
	Wed, 19 Oct 2022 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666186343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4H7vT96t4Gg2mvOMTAf2MIe6YqeZHlVPrSbGQ6Z0P8U=;
	b=CUy8nN36BZsU6m2IBtItc7gm2WLjl4v/gW7apb0LG5G+/b5o54EWRmh7oGhxJ0nOwV1ga7
	C3RSJBI/JxW8doW/hUs0fNQ1BrdzoNzB5eP29YIrK5l0Hf1KpimS4mchfUgk46TctPq+nx
	O89Hb1KJ872kYLdDwS3Zaqg01SBvf5fqvm+l0wYKfxS9xt89b4xSz15QQo1XeSHjVy2lfU
	aANYFiYsF3eJHaN45klxj2fQVr2/SOsGCIg9y6I0sLdrnjLGhWmA6BOoSOL04HruC+V6XP
	7TmKp1vntsTG35puwEMzFauSQeYEKVlvtm4/1LlsdS0fA5MbhjqHcJ+JpnJPeA==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: thomas.petazzoni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/6] arm: dts: spear600: Add ssp controller nodes
Date: Wed, 19 Oct 2022 15:32:07 +0200
Message-Id: <20221019133208.319626-6-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019133208.319626-1-kory.maincent@bootlin.com>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

The SPEAr600 has three Synchronous serial port to enables synchronous
serial communication with slave or master peripherals (SPI). Lets add these
nodes to be able to use them.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 arch/arm/boot/dts/spear600.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index 9d5a04a46b14..6b67c0ceaed9 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -207,6 +207,36 @@ adc: adc@d820b000 {
 				interrupts = <6>;
 				status = "disabled";
 			};
+
+			ssp1: spi@d0100000 {
+				compatible = "arm,pl022", "arm,primecell";
+				reg = <0xd0100000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupt-parent = <&vic0>;
+				interrupts = <26>;
+				status = "disabled";
+			};
+
+			ssp2: spi@d0180000 {
+				compatible = "arm,pl022", "arm,primecell";
+				reg = <0xd0180000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupt-parent = <&vic0>;
+				interrupts = <27>;
+				status = "disabled";
+			};
+
+			ssp3: spi@d8180000 {
+				compatible = "arm,pl022", "arm,primecell";
+				reg = <0xd8180000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupt-parent = <&vic1>;
+				interrupts = <5>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.25.1

