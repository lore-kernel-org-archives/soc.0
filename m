Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DBBCD54B0
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 10:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59478C433CC; Tue, 19 Sep 2023 10:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBFCC433C8;
	Tue, 19 Sep 2023 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695119917;
	bh=VBKn+C4ELVGwxIhIpD3LNsz/sY/R/7maSkiWu6JpXDM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8SWAaSwBRcfZxXe1HCm1KucoTDAiI2XUyWvoSg6meit6VxE17vMmy1JRxNoZMNMR
	 m8RlOrkuryoeeklYatUxHnPoIxN061QnPS4Y+c5RgW4CbODGOzdTRaHVv8wC0wC7xz
	 iMRZodjBA+1hUjZoWr3ZYLqDiffu5s1XF3NFC/wN9g9jIeg6r6/raqaoNhK8HKrMLD
	 wbEsQgigxdvcE4clVTP94ariqbS0aBSi/OJ3jZzN8rV9cmmMx36D/RTSWrEjBm+Uib
	 s1KT1nr/bY2lXggI3fFoJt+cnPCvm0oMCq+PTpKiiW1ME19vMdq2lkOQ6xYrQZM+n5
	 5Txa8zZL0D/9g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 7/7] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Tue, 19 Sep 2023 12:38:15 +0200
Message-ID: <20230919103815.16818-8-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919103815.16818-1-kabel@kernel.org>
References: <20230919103815.16818-1-kabel@kernel.org>
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
index 7682fda4000a..016adfa0b470 100644
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

