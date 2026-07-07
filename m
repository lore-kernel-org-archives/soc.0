Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6639EF0C
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394054; cv=none; b=LTbvOOBZzT0mBi3RsO+HKolVDSuKzulfwMQb5r6ayA3oYOEDGn99D3ZZnhDVe2KCY+5rK5w8YTQ39SfLy3nwc14puzaMGZ+EjMybakYp7whemPRGLEpNcVGVr1eyhvg3Gn63UrCZM5wGYPKi73V2yNPvDVmRDxmmyQXFtH0ZG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394054; c=relaxed/simple;
	bh=5Jp8jeF+SrREW3hN60FmP3Iai5PVrGN+vsevf9e3tvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrII5jse0Kiv6s8SCzNVm0RWufYOqXZvDClR7cG/YqOppQD4TEYHXIvELGCmBcS34uDvSS/fxnKQNfzRcrrQiOMV68qVt2kBs7rU6ZGadowYzvJK7G/G1Fm63C3JgaK0ZK8BrUs3eqPUxHk7sEAnZHiZZa0DjCqjLh615+5YEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5yj6+ir; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5yj6+ir"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so1903002a12.3
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 20:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394051; x=1783998851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=Q5yj6+irQyP9haK62EAiom9M7giHwykQwIj0D0PT5mAZKdxorir8KeAOopI43B3N7q
         rce5PjuCcOPgqNuY+3gPYQWzGyId8ffSuNkRvXo40TV20iob+D2kth9AM+PiPLL89e5r
         Bab2mdLKMpNlb0KvUZzM4kcTNAOcfZepHn3fBZgRaEYiqx7yILqRpd8Ir15TQ5UtNQEc
         LcAKxQ6EO8imWoQ7bo46mstDgDnNAcL8HdiNA/MlrH9WyzAN8YyBHdgvphLnYLcZhqS+
         KGR/teKsfmU6dpT00cLp3WX/fFPhmkul0SwktVPpAiJuyE8/Sd4hcmeqtqQG86xPtE+d
         lcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394051; x=1783998851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=E05vv8a1gMnL7rV74cnfXRw5w8qNEIe2eOLjHsmYu1PLLU4sds2NRLSFfIHCoNT5Wz
         rqhrSTqu/qJKpaUEeuMJMw1PPtbjiG0cyxgWEouGUbpjf37Q7zxrFUXiGYW8WcRYKmdD
         nHBQgPl2ccE0ooCOeSAFxi/R78FSRMOLH3Kl5Jew+ECOrORyNVL62q5rA+CiGN1DOz5C
         /hM2XO/z69oWHj5JXPWse4C+XiMM0Qw3qbYigycfznXVIuHYU6+fNjzHr3q4V88PJRrg
         3lZFIki6HiWR9xjqp0hTlCbGrVWLDuNzjS/h9E64Hdfzi1FZfAgOSMdKbPCYCWBO/jH9
         l9Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpT2cE6BwElvhfQmSZ47LF4BYuF5zDqbSQgKFtg61tz9Rt1T+ncx+FPeezNiTQIVw8Xm/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4PNHhE+6AqE1JghmLNISBONlJEiLGb55MjvBxAeIG5WlyOC0b
	P9r6vD4JuNQQDUBPwRWdrFuUYJzmprns1T3sZnxVQhk9fQvnAs7xPIe/
X-Gm-Gg: AfdE7cmaYUgvEiRFtkM44cUf1UfDoh1BtzFttjCuoLrHfdXnsP80e+PaSlaL1xYA+KY
	aI5VTjOLbRBvL3Lmz2dMW2LSgRn1+/TCd2lVQJjHKdfItphJSpmJud5Gu0WK7U7EvN2g/IzGdO1
	F2tcIbNe7Ohk9kT0EAMy96rtWRpCufbPlK5aIV1rgWyRWy+xcltN98F9dchcVU1pQ/emfeppdyy
	faR8llzFvWOwfRx9yOhStBzKSj6YnwRWdmikjbzNGuifoaeSJE/u0LfzS7vw83ICjy6tacdVqzt
	j6e9k4JvT9X8liV5liqclMDS+LPoG647ePQ3P2+WQtS+uCVuvwctlLPmczGcyo6IfSOgY7iUGAJ
	hgRTbcqPBk/hrKpfu7qv9rr8AmnOH+I3Tv00vMg0ZqiughkfsqPoyatpqyfzn3JMLuFu7p47meN
	IM8bcsP3Hs9q7EIZSgvSj+9fbTkGtcsc4Gw5emVU4JGdCfbOrwICwjV+Dg0I42gqqsu+tYoi5Gx
	V2O
X-Received: by 2002:a05:6a21:6b05:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c08ed0adfcmr3907819637.13.1783394051311;
        Mon, 06 Jul 2026 20:14:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:03 -0700
Subject: [PATCH 4/4] ARM: sa1100: h3xxx: convert gpio-keys to use software
 nodes
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-4-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
HP iPAQ H3xxx series boards to use software nodes and device properties.
This helps progress the removal of platform data support from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
action button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly. In h3xxx_mach_init(), register the software node
group and use platform_device_register_full() to register the device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/h3xxx.c | 69 +++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..13c0aa4c0bfa 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -8,9 +8,10 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/gpio.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_data/gpio-htc-egpio.h>
@@ -168,35 +169,48 @@ static struct platform_device h3xxx_egpio = {
  * GPIO keys
  */
 
-static struct gpio_keys_button h3xxx_button_table[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= H3XXX_GPIO_PWR_BUTTON,
-		.desc		= "Power Button",
-		.active_low	= 1,
-		.type		= EV_KEY,
-		.wakeup		= 1,
-	}, {
-		.code		= KEY_ENTER,
-		.gpio		= H3XXX_GPIO_ACTION_BUTTON,
-		.active_low	= 1,
-		.desc		= "Action button",
-		.type		= EV_KEY,
-		.wakeup		= 0,
-	},
+static const struct software_node h3xxx_gpio_keys_node = {
+	.name = "h3xxx-gpio-keys",
 };
 
-static struct gpio_keys_platform_data h3xxx_keys_data = {
-	.buttons  = h3xxx_button_table,
-	.nbuttons = ARRAY_SIZE(h3xxx_button_table),
+static const struct property_entry h3xxx_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_PWR_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power Button"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device h3xxx_keys = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &h3xxx_keys_data,
-	},
+static const struct software_node h3xxx_power_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_power_key_props,
+};
+
+static const struct property_entry h3xxx_action_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_ACTION_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Action button"),
+	{ }
+};
+
+static const struct software_node h3xxx_action_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_action_key_props,
+};
+
+static const struct software_node * const h3xxx_gpio_keys_swnodes[] __initconst = {
+	&h3xxx_gpio_keys_node,
+	&h3xxx_power_key_node,
+	&h3xxx_action_key_node,
+	NULL
+};
+
+static const struct platform_device_info h3xxx_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &h3xxx_gpio_keys_node,
 };
 
 static struct resource h3xxx_micro_resources[] = {
@@ -214,7 +228,6 @@ struct platform_device h3xxx_micro_asic = {
 
 static struct platform_device *h3xxx_devices[] = {
 	&h3xxx_egpio,
-	&h3xxx_keys,
 	&h3xxx_micro_asic,
 };
 
@@ -240,6 +253,8 @@ void __init h3xxx_mach_init(void)
 	sa1100_register_uart_fns(&h3xxx_port_fns);
 	sa11x0_register_mtd(&h3xxx_flash_data, &h3xxx_flash_resource, 1);
 	platform_add_devices(h3xxx_devices, ARRAY_SIZE(h3xxx_devices));
+	software_node_register_node_group(h3xxx_gpio_keys_swnodes);
+	platform_device_register_full(&h3xxx_gpio_keys_dev_info);
 }
 
 static struct map_desc h3600_io_desc[] __initdata = {

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

