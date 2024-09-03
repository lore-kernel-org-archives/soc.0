Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C7ECD3420
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 10:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26B24C4CECB; Tue,  3 Sep 2024 10:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D25C4CEC5;
	Tue,  3 Sep 2024 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358811;
	bh=s3xJG6D/pwss0IUNp6uxa7NHr8odZ+slvD78tK31x2M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhD7fsB/Q6fffnMSbbsw00/fnl2UTgpU4vS/mv0tvn0GRGtaa1huCExgeNEIydpvD
	 /rUCq7SuiUdCWAhvg84Hsjhdo764fMJdvk/opxd/pTH8Rt8LMbjWM83gFEyscEoILN
	 y1YGDLMuXVZIj3IXstmUTGzPMF9PicWlL8BkoCr1xCowBeFe291ChMtev4nYdBdBZD
	 mdNtwiFRzi8PDNSfqu+v2R8wnUzPZx5cdQlZRuBlQ2FJXQtpYe4iAcrNYlUS0cp5uI
	 +XAapcODIJ/K0CvCCRWbETgqKv9O551ps3l6iUhhISSaxvOYwL5ZttHZeEINGp97qJ
	 aZGKZEU6BXB1w==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 11/11] ARM: dts: turris-omnia: Add global LED brightness change interrupt
Date: Tue,  3 Sep 2024 12:19:30 +0200
Message-ID: <20240903101930.16251-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When global LED brightness is changed by pressing the front button on
Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
description of this interrupt to the LED controller node.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 43202890c959..83fe00abd652 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -251,6 +251,7 @@ mcu: system-controller@2a {
 			led-controller@2b {
 				compatible = "cznic,turris-omnia-leds";
 				reg = <0x2b>;
+				interrupts-extended = <&mcu 11 IRQ_TYPE_NONE>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "okay";
-- 
2.44.2

