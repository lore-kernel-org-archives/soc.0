Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CED3398B
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729996; cv=none; b=uICGa0jXLlGkk/GSCS45uWFDK2zgzOTrxA+h1G3tx1d0b1lW57N3gUB0kIi4ISYagtWlZ5d7A6dyXst3b0Z32/rOJ4UadNsqy6GWp6mMVjc1ZsH4+NcAXzG7NXD+fTMbhaONsLigkiJExvtdL9/vS+h8GdRz6g3aagu9R1d7CiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729996; c=relaxed/simple;
	bh=rTAIY6aQ5hb64k5weAhBRvT5KfxwL7qw3p8nyT7tcWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByNtMW/QUdG9jDmsYfKyD9CbDjcLvMy4oyd8vabnMxsVYM94syHRBXoa1VsUESv8Sy6RJwBfC+UxewQt0Q1ijEHznPDV3dlK9gE9NblCbjyggYCkmCeUrOUSwCLhCmLRiMLRrT1m07bIWygqvtrAuINxoJC2wAPgrl0WebyoFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TriR2BpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TriR2BpN"
Received: by smtp.kernel.org (Postfix)
	id C82D0C4CED0; Mon,  4 Nov 2024 14:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D39CC4CED5;
	Mon,  4 Nov 2024 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729996;
	bh=rTAIY6aQ5hb64k5weAhBRvT5KfxwL7qw3p8nyT7tcWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TriR2BpNeEIc6o1Ght8c2kGxwvaLn/is7DQ/L3QYweYlrqVilNA//Zmg2d4Ev0ru/
	 /yTafdUmKjt3kC6j1jc8PphJd3R++zesLmMvz/6RLQJMiPJYxFpDVJ9r7Vz8QYqtci
	 gHqeuqipjttdKUZteUVMQ169c46n/je14GZLhcYgPwWTJVGm+ExW0aU460Y1iMtr6A
	 xnyXmGVqTDmy2kDNItDSG1OmoxZelogk0lSvLEPxbYN/kI4s8F58wNtuVyUWIinUTq
	 MQF0p6KiXbs2WUnL2+vRu4oTvrEkRgLgfdISeAaz/dYls2HeaKBwqxuTzPu+ZOlfmj
	 CUjD3oGUYKF0w==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
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
Subject: [PATCH leds v5 06/12] leds: turris-omnia: Document driver private structures
Date: Mon,  4 Nov 2024 15:19:18 +0100
Message-ID: <20241104141924.18816-7-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for driver private structures, `struct omnia_leds` and
`struct omnia_led`.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 50fef4389c93..7d2ed0c6500a 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -19,6 +19,15 @@
 /* MCU controller I2C address 0x2a, needed for detecting MCU features */
 #define OMNIA_MCU_I2C_ADDR	0x2a
 
+/**
+ * struct omnia_led - per-LED part of driver private data structure
+ * @mc_cdev:		multi-color LED class device
+ * @subled_info:	per-channel information
+ * @cached_channels:	cached values of per-channel brightness that was sent to the MCU
+ * @on:			whether the LED was set on
+ * @hwtrig:		whether the LED blinking was offloaded to the MCU
+ * @reg:		LED identifier to the MCU
+ */
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
 	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
@@ -29,6 +38,13 @@ struct omnia_led {
 
 #define to_omnia_led(l)		container_of(l, struct omnia_led, mc_cdev)
 
+/**
+ * struct omnia_leds - driver private data structure
+ * @client:			I2C client device
+ * @lock:			mutex to protect
+ * @has_gamma_correction:	whether the MCU firmware supports gamma correction
+ * @leds:			flexible array of per-LED data
+ */
 struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
-- 
2.45.2

