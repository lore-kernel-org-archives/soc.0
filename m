Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F283DC3DA79
	for <soc@archiver.kernel.org>; Mon, 26 Dec 2022 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7F5CC433EF; Mon, 26 Dec 2022 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0872C433D2;
	Mon, 26 Dec 2022 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672059013;
	bh=vATcvRfVKP16s74F3jAS0bM/o2WoniPhrwR2tCLy/ZE=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3PAMjL513n0WGxZu6T+wV4VK+ITr8YcjCrcclBWDYZjhOgRRmXNXSm5RiWD2X2qm
	 mR0qvNv8AQfHmsLY0ZRkONc9mXswx/3L+dOIVeVP5GN4UU/OsJFcQCsI/t7eKt0CtK
	 bXoy30jOziHcDJ+7+ru5O6en/NyIgyYV6bW5iTLNtpsPTS5BMKIniggN+Tk/ZEBTJu
	 jm7nxar+91YBhO8ZJgLRPXhSeklUagvnz2/2bpjbD4oeghdmW7AiXz2p1ozn3RVsQb
	 mmpUSPAYvqkeiE3E/PVcUt0tvylJMVQ84nXu7X20NTwjUMyKesO/tyfuDjU+8T42ZZ
	 TwY1zGGdG98JQ==
Received: by pali.im (Postfix)
	id 5C2AE9D7; Mon, 26 Dec 2022 13:50:13 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 8/8] leds: turris-omnia: change max brightness from 255 to 1
Date: Mon, 26 Dec 2022 13:36:30 +0100
Message-Id: <20221226123630.6515-9-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221226123630.6515-1-pali@kernel.org>
References: <20221226123630.6515-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Behún <kabel@kernel.org>

Using binary brightness makes more sense for this controller, because
internally in the MCU it works that way: the LED has a color, and a
state whether it is ON or OFF.

The resulting brightness computation with led_mc_calc_color_components()
will now always result in either (0, 0, 0) or the multi_intensity value.

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
Reviewed-by: Pali Rohár <pali@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 71340dec492a..04f01ae46c27 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -146,7 +146,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	init_data.fwnode = &np->fwnode;
 
 	cdev = &led->mc_cdev.led_cdev;
-	cdev->max_brightness = 255;
+	cdev->max_brightness = 1;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
 	cdev->trigger_type = &omnia_hw_trigger_type;
 	cdev->default_trigger = omnia_hw_trigger.name;
-- 
2.20.1

