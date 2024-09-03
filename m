Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6295CD13CF
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B61B8C4AF0C; Tue,  3 Sep 2024 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83A8C4CECB;
	Tue,  3 Sep 2024 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358785;
	bh=S/tehr0UqsyEPKT6uUh6GVtGPKIFAxLsm2v5FR1uRNw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ie93orkqqXCapX5/azk9PFUdo+nLHeyaanovh/fqoEcF8Zpbgz6ECluQmdC6oCpsL
	 bWOfZZoEGyFP6JTyP8yA3MHiIiq3iuFmdpp1n0fi4MKaR56+Shv0mPPh0+pnXd5EXX
	 pNJ4xn0+BJPof6GYtLFlIPB9gnGPvb1dR0gDp4Xi6KfmajOiXDqGdOwoWNMJFNqA11
	 DVrv3eCwePdjhcMyf3adyGz3Lt8zuGtrpDaXJByZN/HUODPUYNuDMHE01eC5X7NscX
	 BoKygFzHSU9cCZWwnFiikHzCb26i7AHqdcOhUjeyHL0G/dxr8dppZNr6o6McaX+yO+
	 6Vy0EI4Fkmuhw==
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
Subject: [PATCH leds v2 03/11] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Tue,  3 Sep 2024 12:19:22 +0200
Message-ID: <20240903101930.16251-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
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

