Return-Path: <SRS0=0ypw=PE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24466C3DA64
	for <soc@archiver.kernel.org>; Mon,  5 Aug 2024 01:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0515AC4AF0B; Mon,  5 Aug 2024 01:47:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1936DC4AF0C
	for <soc@kernel.org>; Mon,  5 Aug 2024 01:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1936DC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc49c0aaffso72670635ad.3
        for <soc@kernel.org>; Sun, 04 Aug 2024 18:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822446; x=1723427246; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2fTMTU2sCnO518NONvI840diOGxlwU3sQIVaxycmPg=;
        b=Hzm7XHlgTXUPjIfMZvafJdaOClXamEYoOPUq/PcqYZ8irvq8/f/yEIRjW+N5B2zeVZ
         WoJoaKSSwwJJV3UhYVw20RixYleM5v1BVmwI2slsDtuUJ5K9GdqU9IprOT7TDFUyrnsx
         3Xo89OnxBUGD858rxdpNLgdK/Gog5RWDZ8tyPEzW3e01FQhTaMmOJmaYQfc8dxrWciLl
         ODIYigW+d6nrQvWv1FhR6n2YMIvqmOgKvSHYEhj4njKwbi8EjMVaUAqH1/5ApAKvm8o0
         oKQJ1rSPPcPA8o6k6oBBOC0wcEDwIoVOQNYMQApTxrYw5DOVxF8z+gHMI5QKmujnEEe4
         jlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822446; x=1723427246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2fTMTU2sCnO518NONvI840diOGxlwU3sQIVaxycmPg=;
        b=e8jySXyMehgfLZmM7Zzp/zaPeVPV7Jt9BBipO9B9Gl6+18QfrUNlS8GUJgsSOS3Z17
         Or/twKibOAZjw9BNSomVbhUeINLrjqKePZ4en6JJz7LeTW+8t1Ve4vF2OeWojr+MYk/Z
         ghFOPWbR6PY+GPHU64HYLK+6xFyOE7nnikTqbil9rQ9eMgqkVpxl3rsQZTFpXp0xO8OB
         /+s+t9Ozr7ewnv4jKvKaALnk8wgLXFsu49Dsf5SrXoljBkF5oict+wKljoTX8uY7vIsB
         xsOcOmNNltLkpqipR462dlkQ3J1Wj3oxfeGxgTAbOBrT/AQxqwuFLBUwF8z6p94xJ4Pt
         sMHA==
X-Forwarded-Encrypted: i=1; AJvYcCUlBQQn0DpMgiT6L/pqmtPLHWLc2xSRvtrfy16sSRrSFDTblraBrURMLRJaVQN8v6FGzDGoUe08m5BtXx+MgA==
X-Gm-Message-State: AOJu0Yz/1Yg951gI4ukUNaCAD/tXcTiDHlzB8PE+WifmNRnaNMlfKWAF
	jxOu/Ez2v4+/vU8X5O6tm2XGSBlElSO0351qvfWFWR8cFJ8H5rxY
X-Google-Smtp-Source: AGHT+IFGvfv0qGcuu0s9hpraRVdX+4qEf2sPdEvVVkHNnRbbklmFC1Z3IJaCt/qLGORFLVGSXNLLxw==
X-Received: by 2002:a17:902:d2ce:b0:1f6:f298:e50 with SMTP id d9443c01a7336-1ff574e697cmr111650735ad.58.1722822446358;
        Sun, 04 Aug 2024 18:47:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 4/5] ARM: spitz: Use software nodes/properties for the matrix keypad
Date: Sun,  4 Aug 2024 18:47:07 -0700
Message-ID: <20240805014710.1961677-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Spitz to use software nodes and static properties to
describe GPIOs and other parameters of its matrix keypad.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 64 +++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 9a7dc7b8676d..690596f36979 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -378,38 +378,56 @@ static const uint32_t spitz_keymap[] = {
 	KEY(6, 8, KEY_RIGHT),
 };
 
-static const struct matrix_keymap_data spitz_keymap_data = {
-	.keymap		= spitz_keymap,
-	.keymap_size	= ARRAY_SIZE(spitz_keymap),
+static const struct software_node_ref_args spitz_mkp_row_gpios[] = {
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 17, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 91, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 34, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 36, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 38, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 39, GPIO_ACTIVE_HIGH),
 };
 
-static const uint32_t spitz_row_gpios[] =
-		{ 12, 17, 91, 34, 36, 38, 39 };
-static const uint32_t spitz_col_gpios[] =
-		{ 88, 23, 24, 25, 26, 27, 52, 103, 107, 108, 114 };
-
-static struct matrix_keypad_platform_data spitz_mkp_pdata = {
-	.keymap_data		= &spitz_keymap_data,
-	.row_gpios		= spitz_row_gpios,
-	.col_gpios		= spitz_col_gpios,
-	.num_row_gpios		= ARRAY_SIZE(spitz_row_gpios),
-	.num_col_gpios		= ARRAY_SIZE(spitz_col_gpios),
-	.col_scan_delay_us	= 10,
-	.debounce_ms		= 10,
-	.wakeup			= 1,
+static const struct software_node_ref_args spitz_mkp_col_gpios[] = {
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 88, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 23, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 24, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 26, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 27, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 52, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 103, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 107, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 108, GPIO_ACTIVE_HIGH),
+	SOFTWARE_NODE_REFERENCE(&pxa2xx_gpiochip_node, 114, GPIO_ACTIVE_HIGH),
 };
 
-static struct platform_device spitz_mkp_device = {
+static const struct property_entry spitz_mkp_properties[] = {
+	PROPERTY_ENTRY_ARRAY_U32("linux,keymap", spitz_keymap),
+	PROPERTY_ENTRY_REF_ARRAY("row-gpios", spitz_mkp_row_gpios),
+	PROPERTY_ENTRY_REF_ARRAY("col-gpios", spitz_mkp_col_gpios),
+	PROPERTY_ENTRY_U32("col-scan-delay-us", 10),
+	PROPERTY_ENTRY_U32("debounce-delay-ms", 10),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct platform_device_info spitz_mkp_info __initconst = {
 	.name		= "matrix-keypad",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &spitz_mkp_pdata,
-	},
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= spitz_mkp_properties,
 };
 
+
 static void __init spitz_mkp_init(void)
 {
-	platform_device_register(&spitz_mkp_device);
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&spitz_mkp_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create keypad device: %d\n", err);
 }
 #else
 static inline void spitz_mkp_init(void) {}
-- 
2.46.0.rc2.264.g509ed76dc8-goog

