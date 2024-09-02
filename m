Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7560DCD13CF
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 12:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66BD7C4AF0D; Mon,  2 Sep 2024 12:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9989BC4CEC6;
	Mon,  2 Sep 2024 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280880;
	bh=zvOuyojDJja+UDOztElDzMX9QR22CMLU+PdeXgp60gI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnrTSWQWJEmeYEj9rX7vvXnaSy6BG1e5ifZxHI7r5v2wykWYAHpyKIOyZMwanu8Oz
	 HqRcnPSgN8V+J5Ki47jfchoiOaoc5s00eIDz5a9Wn13cTBNaeDuntG+E7ruNcfJ8Tk
	 jyp+mJAHRTBGcu9/SxC0hlSV+qj+Q2DOGYEDOqwIGqC7YPRfmL99/LKTLO94PFTf1k
	 /QZsDxx57hf0bUZ4TgDmdBfZ4zkUhjLGe5t6kIzRZkh82NpHfFfxwFJ4EXWHCkIfMH
	 4TzoScqrXwJ21b/7i2jnSi5iosZtWnbn9FUOk69/xlTVMxMdYpV4FTiQna72PCVHDs
	 teIYuOKh4bRcA==
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
Subject: [PATCH leds 3/8] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
Date: Mon,  2 Sep 2024 14:40:59 +0200
Message-ID: <20240902124104.14297-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
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
index eab67b81f310..bf5d04e53809 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -240,6 +240,18 @@ enum omnia_int_e {
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

