Return-Path: <SRS0=0ypw=PE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2D2C52D6D
	for <soc@archiver.kernel.org>; Mon,  5 Aug 2024 01:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D306C32786; Mon,  5 Aug 2024 01:47:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C010AC4AF0E
	for <soc@kernel.org>; Mon,  5 Aug 2024 01:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C010AC4AF0E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fec34f94abso77364875ad.2
        for <soc@kernel.org>; Sun, 04 Aug 2024 18:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822445; x=1723427245; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KT5OQ6GzPXvDFTLkEAc2lVR09Idrwl4z6UvcUd1WRM=;
        b=XFrxTSN+QI6whPseWLYFdSNFQEsWYqXLw8noguTeTNZ6kSRwp9VX2BxhDMUzQmVU3x
         qibtXzbHbkNLBdIZJEQRsXzsBlbOSQOhBT6+LNICXq5JU5QLSvsRUllV3vsqH/jODO0k
         90/DKW63ArhGCzU7qCvalp+R+q2eaYldzOTLhHTZ9izGXNtOGlup6C69LciHeXMC7Q/H
         VtwuAor/eu7WycSEliBCLVYY4VQy7hZjrzKAITmTo3TS6AVT7kIjpn385F2PGv9sAcIk
         FBMY9rQ2WByXXtfaK0LniPEzYA1/TsJBRrVLXAvIr2QhKhDs5qUKJr65qRyM6twji8cg
         47Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822445; x=1723427245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KT5OQ6GzPXvDFTLkEAc2lVR09Idrwl4z6UvcUd1WRM=;
        b=KroFqo5bn1g4wKOiX29sn4vT/I4gQ8J8iBL5kzwUrudUa0Rtve2ZMTvReVwuNb1L+J
         5u8ctlqEjsLXzfdwCpLMQRNfloH1JH7uPIja+hvbx2ogI79tV8KnYm2pM8Y9DMMjajWg
         2TC1rhEK1Xsjbi4JdfvXvYaMCMcUUoOvVYPU/Pb8tsq/QH+VuEcsCD+yyFgqSYkJYhZH
         +KZN7LU9j5gGoy9euFSJGrJVSTi8snhs0Xv9NoSaHlfNCbWDiZCuZMtzVJwE9K/c+SC8
         EOR9bW2SJQcFW/YzkM6babUF2TfesSVU2lYHrXE7mpcKU73ZeUGy8VImOSWh93ilwVzU
         QnuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmJtq6M1UpSD9tUKPd8eeFIzbF31JMSGVoUkrpVt7jlPZCUhxCnOudbpEEB83OUywFvfiOukVs7xHH5oQNwQ==
X-Gm-Message-State: AOJu0Ywo5j355b2B1KO1rfM/JmQQOHho6S376fJPcj/EcX90AWyahawt
	hCV1RdyvGcSpY8wgOhiQYns6+6m3R5t5yB/8RQK4Bqq5PrXZIR7T
X-Google-Smtp-Source: AGHT+IGrPevOGrlhiIh2ypAJGRzfsgFKi7VmSIU2ZX7hVG5vsny8HwZs2H2+Vz3F41zi1kTLTuMLEw==
X-Received: by 2002:a17:902:d505:b0:1ff:49a0:46b1 with SMTP id d9443c01a7336-1ff5722e7abmr106827945ad.6.1722822444951;
        Sun, 04 Aug 2024 18:47:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:24 -0700 (PDT)
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
Subject: [PATCH 3/5] ARM: spitz: Use software nodes/properties for the GPIO-driven buttons
Date: Sun,  4 Aug 2024 18:47:06 -0700
Message-ID: <20240805014710.1961677-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Spitz to use software nodes and static properties to
describe GPIOs for the GPIO-driven buttons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 99 +++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 452bf7aac1fa..9a7dc7b8676d 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -419,45 +419,82 @@ static inline void spitz_mkp_init(void) {}
  * GPIO keys
  ******************************************************************************/
 #if defined(CONFIG_KEYBOARD_GPIO) || defined(CONFIG_KEYBOARD_GPIO_MODULE)
-static struct gpio_keys_button spitz_gpio_keys[] = {
-	{
-		.type	= EV_PWR,
-		.code	= KEY_SUSPEND,
-		.gpio	= SPITZ_GPIO_ON_KEY,
-		.desc	= "On Off",
-		.wakeup	= 1,
-	},
-	/* Two buttons detecting the lid state */
-	{
-		.type	= EV_SW,
-		.code	= 0,
-		.gpio	= SPITZ_GPIO_SWA,
-		.desc	= "Display Down",
-	},
-	{
-		.type	= EV_SW,
-		.code	= 1,
-		.gpio	= SPITZ_GPIO_SWB,
-		.desc	= "Lid Closed",
-	},
+static const struct software_node spitz_gpio_keys_node = {
+	.name = "spitz-gpio-keys",
 };
 
-static struct gpio_keys_platform_data spitz_gpio_keys_platform_data = {
-	.buttons	= spitz_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(spitz_gpio_keys),
+static const struct property_entry spitz_suspend_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_U32("linux,code", KEY_SUSPEND),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_ON_KEY, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "On Off"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device spitz_gpio_keys_device = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &spitz_gpio_keys_platform_data,
-	},
+static const struct software_node spitz_suspend_key_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_suspend_key_props,
+};
+
+static const struct property_entry spitz_sw1_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", 0),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_SWA, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Display Down"),
+	{ }
+};
+
+static const struct software_node spitz_sw1_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_sw1_props,
+};
+
+static const struct property_entry spitz_sw2_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", 1),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_SWB, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Lid Closed"),
+	{ }
+};
+
+static const struct software_node spitz_sw2_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_sw2_props,
+};
+
+static const struct software_node *spitz_gpio_keys_swnodes[] = {
+	&spitz_gpio_keys_node,
+	&spitz_suspend_key_node,
+	&spitz_sw1_node,
+	&spitz_sw2_node,
+	NULL
 };
 
 static void __init spitz_keys_init(void)
 {
-	platform_device_register(&spitz_gpio_keys_device);
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(spitz_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&spitz_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
 }
 #else
 static inline void spitz_keys_init(void) {}
-- 
2.46.0.rc2.264.g509ed76dc8-goog

