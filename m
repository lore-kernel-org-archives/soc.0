Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AAF396D1C
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394052; cv=none; b=g9lzBO8Z2oFETzW2EqAx0Acmc8dbJnDu4/p3qd7Px4bNgZHIye6WUxf22IxebSG5FYZ7uyAcg2FH7Hhl776F0pl9dyIb3En90TQLLi2/FGVNC8AnBftDJ34C/zjrakbWFH+hRVuRUH1wvFVLbQsf1nsHLo4YocThFEDXOrbwhL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394052; c=relaxed/simple;
	bh=nmnbvZ4nrQF/XALe3TNYVildY/MYZkjzLTs27GDLksU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sO/gky2FFfX3mEn87YeDvlLifq3QSmSnimPvGdN+/e7ICapSAf4DkKvT9BTWxENUO8DAGCmKVEsmfIfbM0qZ6Ur1Yc7JggukultlasFoFm9vwtGN1S08Vpd19RUDPLLhH0QqO1WeSFqODBmB+rsQEC98xA6hqlc+bp7Vwy81vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9Vz/YRS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9Vz/YRS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c89636920a3so1820542a12.1
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394050; x=1783998850; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=q9Vz/YRSL9pZaOxXThpcNgPl2+34gwUuish35KgOo5ZaDeBCJAdZXqZ0spUAHaUzhq
         IuHkuN8rDUQHlMgar06v43RAkS0Efnu3YnyucVBbGZbc6j25MPyjzqk2JjmvW15pBY/g
         Hhs7BrlT1jvxUg70k970+/DtxrUnDUmd30d2uvvLczfnlGyINdz0MBX0XbgvuZQcFrIh
         dbbZMRF7btmrfzfIyeCkdN6+sgR5d55LDnEZ4VYZlqAhGpIVysxCBBfYZjoxgDI3+Srg
         rBVjlmcZHy+vlSGdN6YbrXXQGJvtdGAfiSP170BhUyUu7wksxpuUaAEbA4rG1Dz1LGW0
         SuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394050; x=1783998850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=WVfBQxW5fUZP/k0+rVNaLqq0hbDH+cgVjAAf0SYXSdpZBR2SXNtEKmdiuKHzsVzhHC
         4Vapp7ZaffDNPdZ177D9ZFGa/92Dw+oEiGkfk2QMl/22nGVjSAZfLtygOh8sinwyGyII
         7e0Iolt4J7+rgbt9/IyXH60yNqyik4kAYnDGEPMFGrtWTYwDNAYGhQUftmqQyIKh6z/v
         Ny2PSWjG/fWfWq0q2DkR88x/ieDpip5IuUcMgOLEh/TA4qeSLjAilQZQg5F6RtnGWLk7
         HQ1Hp3hiVtUEIoeEI3Om6gbUTbBUSZl1tOJXcp4qeZJDg5g4xTHMbEsZAyyKjFv0pUTC
         qY+w==
X-Forwarded-Encrypted: i=1; AHgh+RogqAELK5JVmClGPbqSOiGnE+qpRTwv8WutZ/gxLQXDfWQiWwfLcCBADohbmyr0rfc0WF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNzK9ikcLyE1orowlHyNXMNJiOGWrd9NxG54F+uUSc4f296mJe
	wA+3ryG3+HKg0/UkrqSUJOXejxuCmWeFrZxmSaHdhuillyiDNAmQWN2D
X-Gm-Gg: AfdE7claGU9fUXnH2z/r682F0nc7oTSgsLZTZZLYNFMQKw/OgcVVogMmc1VRpFT08lc
	uPlf1d6bDNngkArT5x5UbWMu7W1DyE+0pMp4PSVLHOP+uFrdf3Ob2UJ1BAG7qYZRehlruVVFQJ1
	q22UkSsk3+5zp5uHiXVh4JvC19pGt8B7u1rKxajdA0Dt/WK4cFlh14fO3ciEDPReFRAJupjejPR
	wZwKlR/54yxJ1+NYeGMtrDYtq/BIvbp1lwTSvCtp56bT/TQW619b9RnxkNzY9hl12zFOkERy8Z6
	Se7srEXhu/v7hU4VzrpfsFJ+xuAIVYcPVSDEX7K2JdtbLfliTxrQthWAZN50uJagY9H5K1a30P2
	9Dpm5xoZ3UPtHNGJT3aEGy1d9yPyG10iW+FfJdyuRWjnEywlhAitoexjtbwdKyOM4O3CUtXdYrP
	wwH2sejjlC1b2iRoc+9xn/T9WCoHg/kdwrhGPv6A5IdPfbEPFyZqPB/ef9vxg9Lbho84+sB2/kf
	s83o6siZbBaJkI=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr4090827637.52.1783394049834;
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:02 -0700
Subject: [PATCH 3/4] ARM: sa1100: collie: convert gpio-keys to use software
 nodes
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-3-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Collie (Sharp Zaurus SL-5500) board to use software nodes and device
properties. This helps progress the removal of platform data support
from the gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
sync button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly and specifying EV_PWR input type. In
collie_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/collie.c | 74 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index 466d755d5702..53df6eb9ce83 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -27,10 +27,11 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/timer.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/property.h>
 #include <linux/power/gpio-charger.h>
 
 #include <video/sa1100fb.h>
@@ -228,43 +229,57 @@ struct platform_device collie_locomo_device = {
 	.resource	= locomo_resources,
 };
 
-static struct gpio_keys_button collie_gpio_keys[] = {
-	{
-		.type	= EV_PWR,
-		.code	= KEY_RESERVED,
-		.gpio	= COLLIE_GPIO_ON_KEY,
-		.desc	= "On key",
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	{
-		.type	= EV_PWR,
-		.code	= KEY_WAKEUP,
-		.gpio	= COLLIE_GPIO_WAKEUP,
-		.desc	= "Sync",
-		.wakeup = 1,
-		.active_low = 1,
-	},
+static const struct software_node collie_gpio_keys_node = {
+	.name = "collie-gpio-keys",
 };
 
-static struct gpio_keys_platform_data collie_gpio_keys_data = {
-	.buttons	= collie_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(collie_gpio_keys),
+static const struct property_entry collie_on_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_ON_KEY, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "On key"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device collie_gpio_keys_device = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &collie_gpio_keys_data,
-	},
+static const struct software_node collie_on_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_on_key_props,
+};
+
+static const struct property_entry collie_wakeup_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_WAKEUP),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_WAKEUP, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Sync"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node collie_wakeup_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_wakeup_key_props,
+};
+
+static const struct software_node * const collie_gpio_keys_swnodes[] __initconst = {
+	&collie_gpio_keys_node,
+	&collie_on_key_node,
+	&collie_wakeup_key_node,
+	NULL
+};
+
+static const struct platform_device_info collie_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &collie_gpio_keys_node,
 };
 
 static struct platform_device *devices[] __initdata = {
 	&collie_locomo_device,
 	&colliescoop_device,
 	&collie_power_device,
-	&collie_gpio_keys_device,
 };
 
 static struct mtd_partition collie_partitions[] = {
@@ -384,6 +399,9 @@ static void __init collie_init(void)
 		printk(KERN_WARNING "collie: Unable to register LoCoMo device\n");
 	}
 
+	software_node_register_node_group(collie_gpio_keys_swnodes);
+	platform_device_register_full(&collie_gpio_keys_dev_info);
+
 	sa11x0_register_lcd(&collie_lcd_info);
 	sa11x0_register_mtd(&collie_flash_data, collie_flash_resources,
 			    ARRAY_SIZE(collie_flash_resources));

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

