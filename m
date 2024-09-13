Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F72FA374A
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 12:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8EA0C4AF09; Fri, 13 Sep 2024 12:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4755FC4CED3;
	Fri, 13 Sep 2024 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230696;
	bh=FxPKGWWRKbnhjKzH3b2LpLpPDFpRJp5XiJc4PKVXMLI=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACWcuVLdDkRw1EB6yJ98xAbzoK/P4ZltIfNWIqtYj/evjXIffgK8LBAWcvK4ZWFyw
	 e0LS0wHqwP2LjroFksdTvf5FQgNMIg/buLHqM53m8l7c9swTrOzTmmRPDEIUb0toTd
	 GOdGkWzZGK0fR6oasAG7KOeDl+5fca8JATnMJcOQbKmCAABGx5BnbuQHNp88NxBzms
	 1EMZTKEEt+z+j7lNyh+UTRiokBXd3lQHaRsGTBItlFgz0CjPOwbazXYfDHicPrryPc
	 iYl4qRuJf8zAvUZi04eCw4GO8HWkhXOeCZHpj9BGBaIhmS3j1As113tc7KOwToEnOx
	 tUsQuMQEa28Og==
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
Subject: [PATCH leds v3 07/11] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Fri, 13 Sep 2024 14:30:59 +0200
Message-ID: <20240913123103.21226-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
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

