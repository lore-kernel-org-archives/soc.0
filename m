Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD53093DB
	for <soc@lists.linux.dev>; Tue,  7 Jul 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394048; cv=none; b=gbUjrygZsWF/ptt3xYP8kGKQl93TZ9fDfI/6WU2AaQpBpltBMNjZcj0vU5XeryQGyKENl7Q/xtTl0u9cw62YQUs2lI1+UP4/1YhSS4qVmlUzMPDxm1BtyWEOz1YC4oi8DqHfkkju+t1oxg7Av5AgGd6TBvJXEi1sW1BN+DFNYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394048; c=relaxed/simple;
	bh=23ZMI3BNq1Z9j7vAAvxAPIlBUZZ9Zjk2yQ37dRvW0w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWeQTblGeAiL103BH2S9SbiMte3doY7B6Hy6cpw3xvQ3z3fykIxT4mfZWGc7KD6GVFLdbPkqzdQzS+8t+jefAczLbuQQeCJ4SjgAQY6eHZnLzmRSKPRZUSIqK+EYnsGla8dA+qkbeg0L9M59YtSyokfZblma7oKu5hwcowBDiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTIwZ3G9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTIwZ3G9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3225245a12.3
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394047; x=1783998847; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=TTIwZ3G9xk/30uh+6CpyYM9AjsAxGx8vkM4WQlFMnF9mRgxepeRnOzuTT/iEB/i7oj
         g8umDc7nx4CCcTKq1R08iBCyQu5oBGAZPWVgIa0PFUqQ/a4RTeapP5lfln2l1ZGqaXxP
         iOoiEeul0L6/3zACSztBHxhd7oGTU+EYR7f96Ps4K+uYOBwmU54lpjp/YV61emIVfk9w
         DDlybGruAl1lew8OpTnH+mTT6g474sWzHHeMPUr0Csw5TZHmj6UnopS6yxQ2op0WVj9i
         88+6p4m56iq5mGOOLcBTtX+gwnk8trRrIi2ve9wIew1S3Hn9Rt1TPqCF5Qaok1cR+IVC
         beew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394047; x=1783998847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=bxkvs0GuazeMsbbv1ofvqGCslKnzG9HPwOZ4YuxxJfN84/7rgfPxqu3kXgBxxVK9pE
         RXxkHKFsktCZPoxDEx4xG/ziC0Ri7rlYvKJfFP3x5Gpp7QGZ58livEKnj0yOqltRciXC
         PqByuYY5aBwMMaiRWthoJVYhYQo2jZD4Lp6GVIXXRGiicizLLcr59HRSxX0NE/O4Wc/Z
         TuXCTzgXcEnqvSFT97i7z9pEuhVqGvyv4sEBeBU3qkNHihFdnFgUYZacfa2YxaOxuYvm
         mFnLnSOFO9wrLkh+tyhzEaOfK4tCW4uwv0bN0WRrco4G+S6Jcfk9s/jPmxzlii5oWZ4z
         1PTw==
X-Forwarded-Encrypted: i=1; AHgh+RrOUxA7dh6vo/vUnozQ+N0AHJxqJXOk6Zxtjnr3sj2d2SUfTNSi/Rsjht2Gp7BCfhuKaOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlHmo8e20opCTUFWDLg5Dl0R1ZsUcfVVvZFDdLZec49UHm+qyd
	xCg4Ktbl4p0Z0tCpgztM1wXuoZyLqMEMTr+1gT6cn3YhLtzKrEx3Tzbc
X-Gm-Gg: AfdE7ckSvmNoNE/NE/EiW08c2NojXiZ1foSkl+x8u5IvzbCfHpXaC1cxGqIhUVy3y5u
	etnVhPPxCxZpdrPAZr+nsUX4MkT7QUH+/sJXru4ffLw5A8WnYj55vVXdG/wWf8kjIVIw64svxrQ
	eO8MYyC6FWTGHmrOuD7mQsg8t7sPEmxtz6Vck/1MzOzcWGIYnixfmAMXzZYyOUDKL+8zOy9tgGT
	OXLN9K+NRNnBuzq5J6VMNod5RIfPVif6vWDX+RzslbNGAaR05bUTDeQtYl8cr3I2I6NGh2uVCnr
	1VvPUkGc3djJh07VnfI7kr5H/iuO841dM3Oav2WTEbm8IiV9YzwuOsjQPBKGRzm7l+D7DNYxaGc
	DufBfAt7D7VTe6t7Jm57owN8rFTVizQPgBA4v/JkOVcYmY2cy6qYizKmfwEQMvrhRCpr8F87/jQ
	qB4PzpK2vZpueZN8SoSl1lubTnGy2cZWYbvZr8D9aZ2Ik0ZVgnYRDeaeZg3wfVfXLHMJAdC9Jqg
	pAuMim5efV0rg0=
X-Received: by 2002:a05:6a20:c996:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c08ec7451dmr4414105637.12.1783394046925;
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:00 -0700
Subject: [PATCH 1/4] gpio: sa1100: register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Define and register a static software node (sa1100_gpiochip_node) for the
SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
directly to the GPIO chip prior to calling gpiochip_add_data().

This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
controller in property entries when converting legacy platform data to
software nodes, resolving pin bindings directly via the attached firmware
node without relying on name matching.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/generic.h |  3 +++
 drivers/gpio/gpio-sa1100.c     | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/generic.h b/arch/arm/mach-sa1100/generic.h
index 5fe0d4fc0f8c..3cfe3b647711 100644
--- a/arch/arm/mach-sa1100/generic.h
+++ b/arch/arm/mach-sa1100/generic.h
@@ -48,6 +48,9 @@ int sa11xx_clk_init(void);
 struct gpiod_lookup_table;
 void sa11x0_register_pcmcia(int socket, struct gpiod_lookup_table *);
 
+struct software_node;
+extern const struct software_node sa1100_gpiochip_node;
+
 struct fixed_voltage_config;
 struct regulator_consumer_supply;
 int sa11x0_register_fixed_regulator(int n, struct fixed_voltage_config *cfg,
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 1938ffa2f4f3..ffa73dd3b982 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -13,6 +13,11 @@
 #include <mach/hardware.h>
 #include <mach/irqs.h>
 #include <mach/generic.h>
+#include <linux/property.h>
+
+const struct software_node sa1100_gpiochip_node = {
+	.name = "sa1100-gpio",
+};
 
 struct sa1100_gpio_chip {
 	struct gpio_chip chip;
@@ -317,6 +322,7 @@ static const int sa1100_gpio_irqs[] __initconst = {
 void __init sa1100_init_gpio(void)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
+	struct gpio_chip *gc = &sgc->chip;
 	int i;
 
 	/* clear all GPIO edge detects */
@@ -324,7 +330,9 @@ void __init sa1100_init_gpio(void)
 	writel_relaxed(0, sgc->membase + R_GRER);
 	writel_relaxed(-1, sgc->membase + R_GEDR);
 
-	gpiochip_add_data(&sa1100_gpio_chip.chip, NULL);
+	software_node_register(&sa1100_gpiochip_node);
+	gc->fwnode = software_node_fwnode(&sa1100_gpiochip_node);
+	gpiochip_add_data(gc, NULL);
 
 	sa1100_gpio_irqdomain = irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

