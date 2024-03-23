Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEFCC6FD1F
	for <soc@archiver.kernel.org>; Sat, 23 Mar 2024 16:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E714C433C7; Sat, 23 Mar 2024 16:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2814C43390;
	Sat, 23 Mar 2024 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711212276;
	bh=u7RlmIxY9GpDC/xAsDsapUIzM6VU6jLYJZvqM+7M9po=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s4gSxNuQvb1hyRPjzYuRskJ/93HgRXnlvysljfoYMLsrSbReQFxtjzepa/e6w0GbS
	 qQzY8UZl8jgrd2vyiSzFxThV9A83Jwo6zxwPFK1o4uDLqyyKRsHLbhpBRHlo4hDKJs
	 zja8AkzUHxwHoN27lNqSLhy1bdqkO8mKacBN4ysLrN5TANHpI+1K8iZK7BzjkrNLz8
	 xS1zP/XvmR8/RJK08/m11JxL5TLx47/tSx5UOUhzUYar7G9IJ6ClgeMF5evUrYK+11
	 Nca33A63Pf1TuLiWeEihGXIKX9yPXxS8J1lg/f0CHkbjPjiP1xIdofeGG0ZfhtfPZN
	 8aO/t+Oz1kDyQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 11/11] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Sat, 23 Mar 2024 17:43:59 +0100
Message-ID: <20240323164359.21642-12-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240323164359.21642-1-kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have the MCU device-tree node, which acts as a GPIO
controller, add GPIO key node for the front button.

Fixes: 26ca8b52d6e1 ("ARM: dts: add support for Turris Omnia")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
Changes since v4:
- gpio specifier has 3 args instead of 2, see patch 01/11
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

