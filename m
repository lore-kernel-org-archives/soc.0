Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBE38889D
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394050; cv=none; b=gUUqkcvyyLSvcW8w3djAXU5pJcVNh4jrLXpeELDLJ5/J3D1VrgjFlwzgqAHi2dMa4jYM62lKcyiOHOt6DT9q1N/KPB/QQFIcUtVJ0Qi1Uk4jfzAEkDdXeBBlUco2fGKhJsg+MzPV3/+8JFszFgOr5OATNW6pDlbOvc5Ac+TlNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394050; c=relaxed/simple;
	bh=htYOVpebTX0RCUzuTTIdoToW26XugbTANpRTT0kaVWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGqMsuuM6IECbqwNxIqo+lJm5XBoO0w3k0gTCtdb/ok+05tmJpFn+m6G8IuKhosoTNPofOM4qe1TSpQBIoPvaKLGrwFpU6jjiPGg+XMYi3lN8U7fFaQAaaJENSebmFfw5kVdvjNTYUy4NGGQllt99NZ9j8O/rzpznyOHGiHI8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E40C2187; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E40C2187"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso45337075ad.1
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 20:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394048; x=1783998848; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=E40C2187ATGPOjeGfmzwFOqtC3OrWHwk7g2zyVgni7QlEYAZ818HVYEfdd5NMmt6Pb
         NPECFUmV5KAvy7u6/QvbvONfVoDXzgwkwFsvh8Xrivm7W+a26uZxpB/UsZr3oM1yjwg6
         0dTeie9F2ULBDfxKN/RB0FXJ1IoEHpmQ6WkRIQw7XFIAYF4FLaUnrEzMlGMcVG0r9MXy
         kihaUn/k+7fxc2vfsJ1okm+u8fgULqkx7Rk6htQLBh3tEq96EWlXgndGWT9baGOUbi6P
         Tf4EDILdBInRsF4fS3WTCZV1kEK/thBC9yeLp+HuQuwXhc7EGsMA0ved+VHJqhoEAjck
         ECyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394048; x=1783998848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=JZ/l60B/Jw7Km+0OzMLz5o41VwVTkyIGtRgIkPjBZSWgJ5AeTx+87ZRY25/NbIh2WB
         TemU4LD7Cjjri3Bc5pIW//kHpm12qaTP7MgKj5qxguMS0rEayofb6RDmhNWmxb53f3Yj
         Jx+p4PSgmjtIRkluiIzOnrsSbcNQBRbcEG25qhHCp20PJoRKzILB4EPJ++8ZKJX1/hQb
         AdnyPLZJxtqtpMo5eTqmGFDFTPqNVXb9KIe9CCMpepHv3uMtWLEDJAkQnnhFmHBQBOL5
         zFJF0TyXclV7Sv7orloKso3T0A0LoHa/4x/wJAGFUZEC3ulYizlzHti8jmt6TdTVjUbw
         hAfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGbv0YBHo8WUHPDoz3OzW9U2jp9Spgkqu4XAhhUQM3/xEMEdgG1ZRiPLEjLeiHW58KYKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ+zeIXxOnRj/fqXR0yqLSX9eaqGmBZ7lJm/aSdb2PcY2qTWSc
	yKhVEgLzJCT7IQbOnbhY8FWZ4KLCxC/+h+xBxoXzmCu+iR3tJnU2zMND
X-Gm-Gg: AfdE7clHdEshrJiB83SlpkjbHfJhLcShU3KrWGucmLkplj/21i5iVOEOtLc/Xu70OLk
	+vHGN+b/uEkeJ5X8wkOEEyU7teRTy3/6NWp0j/EM+9478bkUnF6uWGipHo7nqFpguDOnYacqJa0
	vOaVKsEa+NAcmqjyNDqQPiLGzt2/ExqPAgnUCntETQyhVs+TvsNt+X7dDL7Z0fnXvB3uL/gJk0a
	BL2nfPvZccAMjaM5kSZWTM/VEiEC+3ju+n6CjA5k40/7jImNcXLXAjeFnnp9bFqKD2rnYr9ldjK
	caUmj6fMTQtV63cpTBGCNPwvYMIvlUnyG5LPCsIk1VNlo00Hgq/k1A/NuAVeMMYIQ82Pv3pugZU
	5mUJglOdS6cq9AO1KTUcuHYvbcDxAi5VEHfSommMQC5lXTDANRwo+qZ4E5quUBX14lrh+DtPxjo
	0F30l/+YpjtOcUrEbeakHqqeOM93Saicyetk0QZz8bTwmyCUFWbJV3tQHtK2Z9ZdUVcS9mUGXxH
	Ntu
X-Received: by 2002:a05:6a20:1615:b0:3bf:6c05:ad with SMTP id adf61e73a8af0-3c08f020a10mr4089430637.60.1783394048343;
        Mon, 06 Jul 2026 20:14:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:01 -0700
Subject: [PATCH 2/4] ARM: sa1100: assabet: convert gpio-keys to use
 software nodes
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-2-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Assabet evaluation board to use software nodes and device properties.
This allows describing the buttons and their GPIO bindings via software
nodes so that platform data support can eventually be removed from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the two button
child nodes at file scope, referencing the SA-1100 GPIO controller node
directly. In assabet_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b..b001f0b6a3fa 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -13,8 +13,10 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/input.h>
 #include <linux/ioport.h>
+#include <linux/property.h>
 #include <linux/platform_data/sa11x0-serial.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -467,28 +469,53 @@ static const struct gpio_led_platform_data assabet_leds_pdata __initconst = {
 	.leds = assabet_leds,
 };
 
-static struct gpio_keys_button assabet_keys_buttons[] = {
-	{
-		.gpio = 0,
-		.irq = IRQ_GPIO0,
-		.desc = "gpio0",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	}, {
-		.gpio = 1,
-		.irq = IRQ_GPIO1,
-		.desc = "gpio1",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	},
+static const struct software_node assabet_gpio_keys_node = {
+	.name = "assabet-gpio-keys",
+};
+
+static const struct property_entry assabet_key0_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    0, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio0"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key0_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key0_props,
+};
+
+static const struct property_entry assabet_key1_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio1"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key1_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key1_props,
+};
+
+static const struct software_node * const assabet_gpio_keys_swnodes[] __initconst = {
+	&assabet_gpio_keys_node,
+	&assabet_key0_node,
+	&assabet_key1_node,
+	NULL
 };
 
-static const struct gpio_keys_platform_data assabet_keys_pdata = {
-	.buttons = assabet_keys_buttons,
-	.nbuttons = ARRAY_SIZE(assabet_keys_buttons),
-	.rep = 0,
+static const struct platform_device_info assabet_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &assabet_gpio_keys_node,
 };
 
 static struct gpiod_lookup_table assabet_uart1_gpio_table = {
@@ -571,10 +598,8 @@ static void __init assabet_init(void)
 
 	}
 
-	platform_device_register_resndata(NULL, "gpio-keys", 0,
-					  NULL, 0,
-					  &assabet_keys_pdata,
-					  sizeof(assabet_keys_pdata));
+	software_node_register_node_group(assabet_gpio_keys_swnodes);
+	platform_device_register_full(&assabet_gpio_keys_dev_info);
 
 	gpiod_add_lookup_table(&assabet_leds_gpio_table);
 	gpio_led_register_device(-1, &assabet_leds_pdata);

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

