Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8461C46467
	for <soc@archiver.kernel.org>; Mon, 26 Dec 2022 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE243C433EF; Mon, 26 Dec 2022 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CF1C433F2;
	Mon, 26 Dec 2022 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672059012;
	bh=ia6Uzbrx7WpjS0aHDUCS047277ftVQz0RijvAmVbW3Y=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzw39cSfLfAsjOmx6FWZOXI1PSu4IKHuMTxUu6n3RgVb3OYHlADZAKtSTVPrfin9J
	 vezv1oFX5ofMJRDEr10HVocfY+67SYZALPD++wZLXBKwH79XTB8WODsrBCPF+omG1Y
	 uLQTh29G7vKHomaa6HnB7q3K4x2vy2tD9PLJsRPUQOlDnuy7PDAWOid4jNU9ib42/U
	 BWCJ9IMntQL8cuSWG4ZzJtvKBR8O9NerQYEXCt2l4D9npIdwI4m99S8noP/45B1hiY
	 mcLBqlvbtQFD7g+7v8M4/RW4oVKj5LcFGAica7kSpPQIlh+ANaok0WMzPJE4vMi0+m
	 5UQ1qUrKgQ0ug==
Received: by pali.im (Postfix)
	id 528109D7; Mon, 26 Dec 2022 13:50:12 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 7/8] leds: turris-omnia: initialize multi-intensity to full
Date: Mon, 26 Dec 2022 13:36:29 +0100
Message-Id: <20221226123630.6515-8-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221226123630.6515-1-pali@kernel.org>
References: <20221226123630.6515-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Behún <kabel@kernel.org>

The default color of each LED before driver probe (255, 255, 255).
Initialize multi_intensity to this value, so that it corresponds to the
reality.

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
Reviewed-by: Pali Rohár <pali@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bb7af9e59ad6..71340dec492a 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -131,10 +131,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	led->subled_info[0].color_index = LED_COLOR_ID_RED;
+	led->subled_info[0].intensity = 255;
 	led->subled_info[0].channel = 0;
 	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	led->subled_info[1].intensity = 255;
 	led->subled_info[1].channel = 1;
 	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	led->subled_info[2].intensity = 255;
 	led->subled_info[2].channel = 2;
 
 	led->mc_cdev.subled_info = led->subled_info;
-- 
2.20.1

