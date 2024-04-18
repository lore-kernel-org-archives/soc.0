Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F9C4345F
	for <soc@archiver.kernel.org>; Thu, 18 Apr 2024 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5916C2BD11; Thu, 18 Apr 2024 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55819C32783;
	Thu, 18 Apr 2024 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442313;
	bh=TLaO4PDj+2DqhXNFfIhRQHhMhs/mD6k6Z62/73Qbj6Y=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+190KiWyW5iPuk9e5x7jRpPdJTxPwtkyR0TwhmjjKHI2YgYrObdRqFsWGwiZPRJs
	 7lGnjjzPygcC4A8W6QmWt2+tPvGVe5fyti4FE3Klsf8T4UA2yk0+3xGjEocFCx+FKb
	 mqffydc8J4F6bq3qvWWgfoZgvh0juILBcOcsK1HMMlsrg5UH6EeklFYC3r78GS0GL9
	 GBwNm9slCX7vZjAYrUXUPcgdWqxA4J8+9oJc/Efrs4/GkGHZfdddKdbzKmmeFuaojd
	 CKCkAm2+LodrlzITyrGjavpIVmg/JllUCD+y+u4SMwvHkguiVcCc8hOyStxTf+qKM/
	 o1BurOx33xstA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v6 11/11] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Thu, 18 Apr 2024 14:11:16 +0200
Message-ID: <20240418121116.22184-12-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
References: <20240418121116.22184-1-kabel@kernel.org>
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

