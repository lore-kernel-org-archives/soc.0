Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856FBC07E8E
	for <soc@archiver.kernel.org>; Wed, 24 Apr 2024 17:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 759FCC3277B; Wed, 24 Apr 2024 17:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F943C32783;
	Wed, 24 Apr 2024 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713980327;
	bh=TLaO4PDj+2DqhXNFfIhRQHhMhs/mD6k6Z62/73Qbj6Y=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsSj3umq66SAUQNeJw424d00LyjtIgnooReAkBEhWykoawXbajOt9y7zc8n/TyYF8
	 aXkcVs5E2+a8JXVJEvsNu8c+zt+ntaRZXX1TIPoKezenXI7b4IjErcBD37z2z6Htpm
	 xoDpBqNs2yhl+jhrBrEIXuxoaQ9LgPmxkEOIADYWLx9N6PvHKeLr50QbjzOmAn3+SU
	 IIMOYjHZ4So2BNnFziSNE4ZjfKFO3rQVVBIU1NziMu5RwFCh6XjPR5XGatP0EaDIgj
	 Wfcs69U0B+zqUfmB5WRSQ9vZeEOXU+0mS90mEj8ZbPE9YaUCp4IhK8T7TKSusdjleU
	 3MWJH2pNfbdgQ==
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
Subject: [PATCH v7 9/9] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Wed, 24 Apr 2024 19:38:08 +0200
Message-ID: <20240424173809.7214-10-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424173809.7214-1-kabel@kernel.org>
References: <20240424173809.7214-1-kabel@kernel.org>
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

