Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DBEE4993
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7448C433CC; Wed, 23 Aug 2023 16:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CECC433D9;
	Wed, 23 Aug 2023 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807023;
	bh=cQXwPs1gWhOVg+IcaDDYDl5lXYxMw4991+/+4tHF9mk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hr6Osc8IYA/siUJifBfowOJvlohl5HtR0Izfbn6e6J8mGlRdQXONc22gabBuTF2ER
	 KmGyc15iEJHIo9/lLwL8mAqlqKHjYSDuqjg8Y4k+mcTXxCQwSeGP/iD7cXWtNfm6Oc
	 QXWk7oeAyqXkStbQkdev4sfQ0b4T2jTlsqTzJMdoTU03PDrt813XlhuzQ6bRO96YTN
	 iHtNxpj9xOFltH89CZ/PP2ttN2qAwjHyNSZ8mXbTdqNZiLkMDnEzG6n+iaNcEi4aC1
	 ROJgGiBlgcBdR02tH4GkbJo2fZCg+BRluR4r7XI9v8L6t3U/L2cxEIQQ9UqzKzSd8w
	 R7HHFNhJy3P0Q==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 4/4] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Wed, 23 Aug 2023 18:10:12 +0200
Message-ID: <20230823161012.6986-5-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823161012.6986-1-kabel@kernel.org>
References: <20230823161012.6986-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have the MCU device-tree node, which acts as a GPIO
controller, add GPIO key node for the front button.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../boot/dts/marvell/armada-385-turris-omnia.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 761147f5870f..3bbccbae89ab 100644
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
+			gpios = <&mcu 12 GPIO_ACTIVE_HIGH>;
+			/* debouncing is done by the microcontroller */
+			debounce-interval = <0>;
+		};
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "SPDIF";
-- 
2.41.0

