Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689A4C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 11:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AF89C4AF12; Mon,  1 Jul 2024 11:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FF9C32786;
	Mon,  1 Jul 2024 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719833452;
	bh=fe0hAV7ALNaaXPDURyyV5f+mGCPo+4ZJTjNHFkb4faY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aYjixNMVCXEdCyd5ttXVvy6wambd51K4Ee4r7Cse1TcxJE37qLslx5SkAxmNXSzY6
	 8m06QJeC8j3G2gISnZIverCU3ExG8K+CmFyB2LEM2p1MV7gm/Kurk2BJfco/3KU7gE
	 7Dc+MWcYfq17xaR96muZgEOn/nNjCg5kkhpBN2qLUV8tzZ1mAvS0aVGUcR73n7ISGZ
	 4mKL1E40HQRB3pi0VjZzRae2Du+aISwTD7gdmgCDAffACj0d/sKUI99DnMXU4gL7J6
	 Ne0fvbvkjBRL2R4rjyWPENAxDq1IDSRkMeEOUi1KmFVa+Zgakw9OTnHJqoa61JnvMo
	 e30HfyMksXhtQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v13 8/8] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Mon,  1 Jul 2024 13:30:10 +0200
Message-ID: <20240701113010.16447-9-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240701113010.16447-1-kabel@kernel.org>
References: <20240701113010.16447-1-kabel@kernel.org>
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
2.44.2

