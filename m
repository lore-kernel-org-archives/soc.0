Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F6C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 11:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EE8FC4AF1D; Tue, 30 Apr 2024 11:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2D4C4AF18;
	Tue, 30 Apr 2024 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477909;
	bh=OJ23cnbCVS69gWFZGDNc/VynWcSsWstZHEG/jFLqnFI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+GWPCI1fDW5k2OeUqy6zp2iyuxKsZABtkAMM/HRuhOHSs7YBhrZ2eDBt8j5MtH9S
	 HPWZ9jRv7v2+PUThPhbhlVCV/oTHS8vMWeh/AM3tr+Utg0RPnYlsjCsVA6+80k0YmA
	 IVWcKgnvgZ4UDt00EqyBL1zkIM2PFoKplvnUYhric8zA/JuIUor99r2arZINzNDquf
	 TycH0Yffc2EEYmA9WUw/K1cyjVGsTlY064beNap9k07tja1R/yDZHgWfJzwCzhYP4Z
	 BnObl5r1UKatSzY2G11JQQZp9s1+cbXTTa6lkTABYL/WPAXANlHeHlZ9MuMB8G0JgT
	 hhA0Qay5QDxhw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 9/9] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Tue, 30 Apr 2024 13:51:11 +0200
Message-ID: <20240430115111.3453-10-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240430115111.3453-1-kabel@kernel.org>
References: <20240430115111.3453-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have the MCU device-tree node, which acts as a GPIO
controller, add GPIO key node for the front button.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../boot/dts/marvell/armada-385-turris-omnia.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 59079d63fe27..43202890c959 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -112,6 +112,19 @@ sfp: sfp {
 		status = "disabled";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		front-button {
+			label = "Front Button";
+			linux,code = <KEY_VENDOR>;
+			linux,can-disable;
+			gpios = <&mcu 0 12 GPIO_ACTIVE_HIGH>;
+			/* debouncing is done by the microcontroller */
+			debounce-interval = <0>;
+		};
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "SPDIF";
-- 
2.43.2

