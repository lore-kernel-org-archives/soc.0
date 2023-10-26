Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DAEC25B67
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B995C433C9; Thu, 26 Oct 2023 16:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89192C433CD;
	Thu, 26 Oct 2023 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698337116;
	bh=VBKn+C4ELVGwxIhIpD3LNsz/sY/R/7maSkiWu6JpXDM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uRmZSE2eGnc3twEq42QK9Tbuu52snF392NiRLp6jPIhLNjQhV+mHqB1SPy4Aai9HI
	 1UOStb3L417b31to5J4It/cuc+x2p5vw/7H0C7NV7IBQACAeSwhx5LHaF6IMO3bASn
	 K2/vNgyrQ6gNE+r/2vQN6y8bxTogsm7LX89AX3J8Dksx05d+h5Wy1Ru9ZORkYelybK
	 EkSA8dwjYCj/kisNl9EVMQ6yihpXjXIDelZPVsT3Tz0cMlhuV1brC/b1b/Ap+h8Ks8
	 LN+BQ85Gyzc2IiAsZMNIijdSkRBwaUExZrEdmR6S/M6otqDbD8cgjglgmyycMyt+8Q
	 6SNR6uPYe4lOA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 7/7] ARM: dts: turris-omnia: Add GPIO key node for front button
Date: Thu, 26 Oct 2023 18:18:03 +0200
Message-ID: <20231026161803.16750-8-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026161803.16750-1-kabel@kernel.org>
References: <20231026161803.16750-1-kabel@kernel.org>
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

