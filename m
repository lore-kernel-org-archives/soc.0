Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8154314B962
	for <soc@lists.linux.dev>; Mon, 11 Nov 2024 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731327590; cv=none; b=HL2qZhoSpl81hP2QD7VUCV2oBsr/tramZyhV3w8FX5++sYn72q4mFtTv7gJNsIeN0TFB++SIzUZitNlwfyVFGiAFF/tuYQUy/3Mx0wFFZzqhVazwZ4iQqF3u/wiy2I/w5fK7NwsFLOz6ptoc19Xs3BeyE/ekmhPX/B1CRuu6Llg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731327590; c=relaxed/simple;
	bh=rtwVjuVUCj/n3sscUZUL980VxYnu8kkZdfT6egRquYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DEQ/hM7uHIYv/wL7K0cjtk+Bkv8AXy/C798aYz4V5jKTK06FptDUgBqpBVl2CW5ZFKlZ5jiTAr5jhTF9D4l7Budgtua2mbfullB3K+gE2dQyky5imZUG6ajE/cHm1FZ+lbvlknCDjhf5WUi7G8zJdqf+VwQ8zHYrjVFEKGKcScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hINQrnK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hINQrnK/"
Received: by smtp.kernel.org (Postfix)
	id 2B426C4AF09; Mon, 11 Nov 2024 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4659AC4CECF;
	Mon, 11 Nov 2024 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731327590;
	bh=rtwVjuVUCj/n3sscUZUL980VxYnu8kkZdfT6egRquYE=;
	h=From:To:Cc:Subject:Date:From;
	b=hINQrnK/u+KKWuy74FMCBenqfc0Da7PaR9f0kZfDf5sG4yaURP5GoFFyFmJBr9oGD
	 B1eXRf8s5DDm2rJCxO8Z4bfLFSi2Ad18y4haa/Vwkxh29xRjbgHTrQWsa8Co0yY3UJ
	 DLcDvA4XWASMqGIwDbjWvuSfl5cfBzoRrQjGfn/Ug8b9nSdkuedZoVFCBP4Dy3dEar
	 fHYdD5BJhBS4H4tffdtv2CdNDFyUtP+dMqkMNXfPzER93GjL0BbUN17Z8eVLTNsjyf
	 KrEqh9aKzI6830swwirPL6RtF3bdV1n6bBa+FpAHBiZ7rslrJKnYeI3OT/6e+mExqO
	 u+cZyaJUoQXdw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Rename variable holding GPIO line names
Date: Mon, 11 Nov 2024 13:19:45 +0100
Message-ID: <20241111121945.14217-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the `omnia_mcu_gpio_templates` variable to
`omnia_mcu_gpio_names`. The array contained templates for the names
during the development of the driver, but the template prefix `gpio%u.`
was dropped before the driver was merged, since this functionality was
broken in gpiolib.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 88e208d45882..5f35f7c5d5d7 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -28,7 +28,7 @@
 #define OMNIA_CMD_INT_ARG_LEN		8
 #define FRONT_BUTTON_RELEASE_DELAY_MS	50
 
-static const char * const omnia_mcu_gpio_templates[64] = {
+static const char * const omnia_mcu_gpio_names[64] = {
 	/* GPIOs with value read from the 16-bit wide status */
 	[4]  = "MiniPCIe0 Card Detect",
 	[5]  = "MiniPCIe0 mSATA Indicator",
@@ -1018,7 +1018,7 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.set_multiple = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
-	mcu->gc.names = omnia_mcu_gpio_templates;
+	mcu->gc.names = omnia_mcu_gpio_names;
 	mcu->gc.base = -1;
 	mcu->gc.ngpio = ARRAY_SIZE(omnia_gpios);
 	mcu->gc.label = "Turris Omnia MCU GPIOs";
-- 
2.45.2

