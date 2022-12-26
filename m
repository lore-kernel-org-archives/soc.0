Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A980EC3DA7D
	for <soc@archiver.kernel.org>; Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88922C433EF; Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51899C433F1;
	Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672059007;
	bh=pP+4wtVGKbIsOAg8Ek+NQSpQr5Q1Uw027OLYSi9iPXc=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ko6A8bgm9WlLTNaUxbAKj2EeW5kSkFEldNx2cBtE7iOVxPoz21nFP9oHmuwXh6L2D
	 KfH/M/VWUYUXb8k6wrys5zpSrUQfRh0utRQgZYHdTz9wsKBG28APqhqt0M4FL3rWqG
	 blVwfcjJvoWegQsjQO125+Wot9W6WMtEdEiDqm3KU3bkiSuTJwH6jkxfp6UfYB9CsP
	 qLYLx/n5xSOpPrrgzN7WwZNl1hU8ID91Mud7pVI5ik3ozmXp6sMX4PUch5U/rXXZ1L
	 xva4l467UJN8Q4+R40UuivJTZdoPkoUpwJLu/KCF7YZz5QlkkgDJSNTI+u5zXvHVz3
	 59I+4JQ2+Tq6g==
Received: by pali.im (Postfix)
	id 0CF999D7; Mon, 26 Dec 2022 13:50:07 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/8] leds: syscon: Implement support for active-low property
Date: Mon, 26 Dec 2022 13:36:24 +0100
Message-Id: <20221226123630.6515-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221226123630.6515-1-pali@kernel.org>
References: <20221226123630.6515-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This new active-low property specify that LED has inverted logic
(0 - enable LED, 1 - disable LED).

Signed-off-by: Pali Rohár <pali@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-syscon.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 7eddb8ecb44e..5e605d8438e9 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -29,6 +29,7 @@ struct syscon_led {
 	struct regmap *map;
 	u32 offset;
 	u32 mask;
+	bool active_low;
 	bool state;
 };
 
@@ -41,10 +42,10 @@ static void syscon_led_set(struct led_classdev *led_cdev,
 	int ret;
 
 	if (value == LED_OFF) {
-		val = 0;
+		val = sled->active_low ? sled->mask : 0;
 		sled->state = false;
 	} else {
-		val = sled->mask;
+		val = sled->active_low ? 0 : sled->mask;
 		sled->state = true;
 	}
 
@@ -85,6 +86,8 @@ static int syscon_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 	if (of_property_read_u32(np, "mask", &sled->mask))
 		return -EINVAL;
+	if (of_find_property(np, "active-low", NULL))
+		sled->active_low = true;
 
 	state = of_get_property(np, "default-state", NULL);
 	if (state) {
@@ -95,17 +98,20 @@ static int syscon_led_probe(struct platform_device *pdev)
 			if (ret < 0)
 				return ret;
 			sled->state = !!(val & sled->mask);
+			if (sled->active_low)
+				sled->state = !sled->state;
 		} else if (!strcmp(state, "on")) {
 			sled->state = true;
 			ret = regmap_update_bits(map, sled->offset,
 						 sled->mask,
-						 sled->mask);
+						 sled->active_low ? 0 : sled->mask);
 			if (ret < 0)
 				return ret;
 		} else {
 			sled->state = false;
 			ret = regmap_update_bits(map, sled->offset,
-						 sled->mask, 0);
+						 sled->mask,
+						 sled->active_low ? sled->mask : 0);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.20.1

