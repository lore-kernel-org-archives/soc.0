Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654EDCD13CF
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 10:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 579B5C4AF0D; Tue,  3 Sep 2024 10:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896D6C4CEC5;
	Tue,  3 Sep 2024 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358795;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=L9h5MjvvKcR3OiV9LIUg/LrLhC1Efo24XO3rdporcUB5IrYdi2n+6JsFPYaWEt1C4
	 JET0MmjoPSosm6n+fvYZJhlerTTwN/tekJXjkKuq1qUNBmmPVGBfo2U8Qfp94Db7iJ
	 lg7ur4DqNF2HIqLlvSup66gd91tL6FPZyhIv0Xag0fd55u0gOqGtzylI9gODHw8t7K
	 WBBDWORUnzZJdHHciKIyEou4eJSvOOEhxhUjlm8Es5q1spQ8l9PkZ5osM7BFNJTWkD
	 mEYqXDhBZrqRpanyVca6fhtQhCBD82lY+2ZBjBW+GQAFvF8eOO/G6PLa1ZzBuR75Gp
	 sD5SQBh8Iz6JA==
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
Subject: [PATCH leds v2 06/11] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Tue,  3 Sep 2024 12:19:25 +0200
Message-ID: <20240903101930.16251-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When reading MCU firmware features, check also for the LED panel
brightness change interrupt feature, and suggest upgrading the firmware
if it is missing.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index bb871226e357..3bb4a3cfdb29 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -258,6 +258,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(NEW_INT_API,		"new interrupt API"),
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
+		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.44.2

