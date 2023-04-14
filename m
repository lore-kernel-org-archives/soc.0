Return-Path: <SRS0=4j1D=AF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF5C77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 434A3C433A0; Fri, 14 Apr 2023 14:06:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39EA3C433A1
	for <soc@kernel.org>; Fri, 14 Apr 2023 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39EA3C433A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 26so6805689lfq.11
        for <soc@kernel.org>; Fri, 14 Apr 2023 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481184; x=1684073184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HANrBatD66XHrbynSUb+/d3zU2tkPBuvtN1APBMREqs=;
        b=vmS8y1HoE3osnmSlFtEzioX6TV5Um9jP0ExIdP3zFRLiSZW6+sRf5ERlXDRKWWEBx/
         fTivZmIt9xt9gE01HBFaWbuMcAq158o4uWc4udD6AFn5gRS4dwlCQhKN4o4kISiFQGXL
         LqCuczJt6lpfI1bWxF/ub8BSg+qk8PI4FoJ2z+475a+y2LiBYM9ncWzV1juQmh44WhpO
         CJQvVbz6ZORpvmZhPvl88e2t6M3tSRGKeCdbRNKvuE8n2QK32R57LvkIJxrjqGCQSAbL
         BH590BAv8/RfVSA5wo595UDxqGt/cdrTFVNmwNCR0aqfmyXl3cTpOHGluf/rR9y8pDbh
         I+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481184; x=1684073184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HANrBatD66XHrbynSUb+/d3zU2tkPBuvtN1APBMREqs=;
        b=QJKgTKmLp+k+r46ulRZuyV3jDykEuHLeYyMtFBaJijv4Sy+Iygc+vNF5dGzESNLlO1
         37WDybKyfXpQU2/5z/osSp3hxlhX0mZBCZ33EiTXrcvIHaPgQ9xx/VPXkH2+TkcR4WXm
         2d2jCM1p9EFGKIAdrqDVhwiJlzQNv4J5j7/gjzngKuhsSbligD5GMUFZi/3vEJMUkT2b
         uU838yMHLHZBNR7OOKAwxpGdh4OTgRObS7Amir1cOVrJc0vdrXjlzD//G5yttsYbICuI
         YuoxvV4h/2W1B0MahCfGbLgu318vApcW0Xmu1BHiGV2vKOKh5Ve3yME5YUh2R5ri30Fk
         L+Jg==
X-Gm-Message-State: AAQBX9diHcoA4LGMVFP0C+4Qk6UneTHxBpDimpZe27BrjgPEgReizOfs
	VSEevi3z68nvdH8AaynlUSvLSA==
X-Google-Smtp-Source: AKy350ZXNx9gUpKotPMlL4TZIccFfIfntAQ6+DMyC3z1S7xiZNKxTlSI+yACE1Foc5Bc8CHs7KMgZg==
X-Received: by 2002:a19:5208:0:b0:4e8:16e8:88b with SMTP id m8-20020a195208000000b004e816e8088bmr1761984lfb.29.1681481184186;
        Fri, 14 Apr 2023 07:06:24 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 16:06:18 +0200
Subject: [PATCH 2/6] pinctrl: pistachio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230414-immutable-irqchips-2-v1-2-6b59a5186b00@linaro.org>
References: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
In-Reply-To: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1

Convert the driver to immutable irq-chip with a bit of
intuition.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 7ca4ecb6eb8d..53408344927a 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -93,10 +94,10 @@ struct pistachio_pin_group {
 struct pistachio_gpio_bank {
 	struct pistachio_pinctrl *pctl;
 	void __iomem *base;
+	int instance;
 	unsigned int pin_base;
 	unsigned int npins;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 };
 
 struct pistachio_pinctrl {
@@ -1228,12 +1229,14 @@ static void pistachio_gpio_irq_mask(struct irq_data *data)
 	struct pistachio_gpio_bank *bank = irqd_to_bank(data);
 
 	gpio_mask_writel(bank, GPIO_INTERRUPT_EN, data->hwirq, 0);
+	gpiochip_disable_irq(&bank->gpio_chip, irqd_to_hwirq(data));
 }
 
 static void pistachio_gpio_irq_unmask(struct irq_data *data)
 {
 	struct pistachio_gpio_bank *bank = irqd_to_bank(data);
 
+	gpiochip_enable_irq(&bank->gpio_chip, irqd_to_hwirq(data));
 	gpio_mask_writel(bank, GPIO_INTERRUPT_EN, data->hwirq, 1);
 }
 
@@ -1312,6 +1315,7 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 
 #define GPIO_BANK(_bank, _pin_base, _npins)				\
 	{								\
+		.instance = (_bank),					\
 		.pin_base = _pin_base,					\
 		.npins = _npins,					\
 		.gpio_chip = {						\
@@ -1326,14 +1330,6 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 			.base = _pin_base,				\
 			.ngpio = _npins,				\
 		},							\
-		.irq_chip = {						\
-			.name = "GPIO" #_bank,				\
-			.irq_startup = pistachio_gpio_irq_startup,	\
-			.irq_ack = pistachio_gpio_irq_ack,		\
-			.irq_mask = pistachio_gpio_irq_mask,		\
-			.irq_unmask = pistachio_gpio_irq_unmask,	\
-			.irq_set_type = pistachio_gpio_irq_set_type,	\
-		},							\
 	}
 
 static struct pistachio_gpio_bank pistachio_gpio_banks[] = {
@@ -1345,6 +1341,25 @@ static struct pistachio_gpio_bank pistachio_gpio_banks[] = {
 	GPIO_BANK(5, PISTACHIO_PIN_MFIO(80), 10),
 };
 
+static void pistachio_gpio_irq_print_chip(struct irq_data *data,
+					  struct seq_file *p)
+{
+	struct pistachio_gpio_bank *bank = irqd_to_bank(data);
+
+	seq_printf(p, "GPIO%d", bank->instance);
+}
+
+static const struct irq_chip pistachio_gpio_irq_chip = {
+	.irq_startup = pistachio_gpio_irq_startup,
+	.irq_ack = pistachio_gpio_irq_ack,
+	.irq_mask = pistachio_gpio_irq_mask,
+	.irq_unmask = pistachio_gpio_irq_unmask,
+	.irq_set_type = pistachio_gpio_irq_set_type,
+	.irq_print_chip = pistachio_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 {
 	struct pistachio_gpio_bank *bank;
@@ -1394,7 +1409,7 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 		bank->gpio_chip.fwnode = child;
 
 		girq = &bank->gpio_chip.irq;
-		girq->chip = &bank->irq_chip;
+		gpio_irq_chip_set_chip(girq, &pistachio_gpio_irq_chip);
 		girq->parent_handler = pistachio_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(pctl->dev, 1,

-- 
2.34.1

