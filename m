Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940FAFA374A
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7801CC4CECE; Fri, 13 Sep 2024 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C1CC4CECF;
	Fri, 13 Sep 2024 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230681;
	bh=S/tehr0UqsyEPKT6uUh6GVtGPKIFAxLsm2v5FR1uRNw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZXNndLZkHlaUYcqiXmzw9nDdMZECWl/1D7iXu9HkNJYnFUXDPLXBkOel61xyI36xM
	 XM4TH93uXrdxVib3n66Iq57jj7F1AcXgvf+7Z3PJlnljMEcnIBuwIhgCg9HEz1sxc8
	 vN9bWT9PLEksREFwu43SOdjIcN15kNu9xF7NPXKW9W/akMOyYDPxnIP2Od3zFX/fL/
	 cocA+5xIwSfNILVrwbN5UbN68vObO59chM7nrckt5bHxgWtd+fo+I9+VKI/ZYn+q+Z
	 C15d4mIpBRxYhG52OmdzEu5ibYep2/omItZlmNbK9usSuYvAZVEXD4Px/B0vyHtNHZ
	 XwZkWECyPvlLA==
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
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 03/11] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Fri, 13 Sep 2024 14:30:55 +0200
Message-ID: <20240913123103.21226-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add definitions for contents of the OMNIA_CMD_LED_MODE and
OMNIA_CMD_LED_STATE commands to the global turris-omnia-mcu-interface.h
header.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/turris-omnia-mcu-interface.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
index b587549141cb..bac275b0ae42 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -239,6 +239,18 @@ enum omnia_int_e {
 	OMNIA_INT_LAN5_LED1		= BIT(31),
 };
 
+enum omnia_cmd_led_mode_e {
+	OMNIA_CMD_LED_MODE_LED_MASK	= GENMASK(3, 0),
+#define OMNIA_CMD_LED_MODE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_MODE_LED_MASK, _l)
+	OMNIA_CMD_LED_MODE_USER		= BIT(4),
+};
+
+enum omnia_cmd_led_state_e {
+	OMNIA_CMD_LED_STATE_LED_MASK	= GENMASK(3, 0),
+#define OMNIA_CMD_LED_STATE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_STATE_LED_MASK, _l)
+	OMNIA_CMD_LED_STATE_ON		= BIT(4),
+};
+
 enum omnia_cmd_poweroff_e {
 	OMNIA_CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
 	OMNIA_CMD_POWER_OFF_MAGIC		= 0xdead,
-- 
2.44.2

