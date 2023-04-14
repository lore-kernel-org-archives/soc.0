Return-Path: <SRS0=4j1D=AF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E9CC77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECF4DC433A7; Fri, 14 Apr 2023 14:06:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76916C433A4
	for <soc@kernel.org>; Fri, 14 Apr 2023 14:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76916C433A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id i26so23879355lfc.6
        for <soc@kernel.org>; Fri, 14 Apr 2023 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481183; x=1684073183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypGX6B4su1o68R7FNx6eRYtltMnpOZkLcf7JaVu5ncA=;
        b=SPrYVWnK1EQd7VQe/CpLHqnW7L67MPK8fjhM1oXAYcwtdCSId52Zvn4tnES0lpcYO3
         Z5eUVaFSDJObnVQBX29XaCX+f3dJsjTzcdOnwdjo5JWT1ISg3Xn6dMTEbgIyWUFklBYj
         E8XV/8PTxFirdCK+1VRKGd7aDtD72vietCjMdAc5bg/ioMxP8df6yYtAx2ehd3PrPkWr
         Ku9N/RFBZ2ImYmCOTZj0LjdO9/uNu618m1/dn4ifwVTQbSm1cMJTgmdP2m6Pi4LTpjEI
         +X3L5S4+DBiigRVZdOh76xlTRv4M1G1GiCmlLWGx7Y/vihohbWh92KSBIWAUoIAj75I6
         B1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481183; x=1684073183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypGX6B4su1o68R7FNx6eRYtltMnpOZkLcf7JaVu5ncA=;
        b=GiPQTgGmo+96U8W+V5XbHAxGc5Mf32D052g0uC74UCeDqPZQTqRzgH2hPsa8D31ooq
         EHoFZ6uOqsYSvanpVIuCJcB1MMNoJWPthReR9dWN9tktHVFQKAkqB52I65eG1wG+izbL
         HVjdnakxD+p5o5CQ9awUin0RrBnVHRKkURfBUAfL9e3laosS7nXOuPnklRi+a5dPTQsZ
         r3bp/M0r9h4qqW+5mkqtd2lDqT+8EgqMKvsyPalYdhWrfzIK5g8+F3XSbSM+K9Rdp45Y
         vDf0LVODcbtfgwVWkBIv3eHpci4GMBdeSnQaeu5y+clFx0kLQCg3bzWgCXfzPEkexxz+
         ix2A==
X-Gm-Message-State: AAQBX9faGBThysG3hwLS/yA45f+OLY0BNa3nd4nMJVsUlshQX68cN74Y
	lG6oupJhWyg4RJFXtXPZNsMJ8g==
X-Google-Smtp-Source: AKy350bVkyAIVMqSKC3NijpxaxINkVg9ewI8ds0MaqdAUOR8xG+zrd832wEpaVgjxKJFSwie2XNiuw==
X-Received: by 2002:ac2:5a1c:0:b0:4ea:f632:4738 with SMTP id q28-20020ac25a1c000000b004eaf6324738mr1670009lfn.6.1681481183240;
        Fri, 14 Apr 2023 07:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 16:06:17 +0200
Subject: [PATCH 1/6] pinctrl: pic32: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230414-immutable-irqchips-2-v1-1-6b59a5186b00@linaro.org>
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
intuition. Switch some call to use irqd_to_hwirq() in the
process.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-pic32.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 37acfdfc2cae..dad05294fa72 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -60,8 +61,8 @@ struct pic32_desc_function {
 
 struct pic32_gpio_bank {
 	void __iomem *reg_base;
+	int instance;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 	struct clk *clk;
 };
 
@@ -2008,12 +2009,14 @@ static void pic32_gpio_irq_mask(struct irq_data *data)
 	struct pic32_gpio_bank *bank = irqd_to_bank(data);
 
 	writel(BIT(PIC32_CNCON_ON), bank->reg_base + PIC32_CLR(CNCON_REG));
+	gpiochip_disable_irq(&bank->gpio_chip, irqd_to_hwirq(data));
 }
 
 static void pic32_gpio_irq_unmask(struct irq_data *data)
 {
 	struct pic32_gpio_bank *bank = irqd_to_bank(data);
 
+	gpiochip_enable_irq(&bank->gpio_chip, irqd_to_hwirq(data));
 	writel(BIT(PIC32_CNCON_ON), bank->reg_base + PIC32_SET(CNCON_REG));
 }
 
@@ -2030,7 +2033,7 @@ static unsigned int pic32_gpio_irq_startup(struct irq_data *data)
 static int pic32_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct pic32_gpio_bank *bank = irqd_to_bank(data);
-	u32 mask = BIT(data->hwirq);
+	u32 mask = irqd_to_hwirq(data);
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -2122,14 +2125,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 			.owner = THIS_MODULE,				\
 			.can_sleep = 0,					\
 		},							\
-		.irq_chip = {						\
-			.name = "GPIO" #_bank,				\
-			.irq_startup = pic32_gpio_irq_startup,	\
-			.irq_ack = pic32_gpio_irq_ack,		\
-			.irq_mask = pic32_gpio_irq_mask,		\
-			.irq_unmask = pic32_gpio_irq_unmask,		\
-			.irq_set_type = pic32_gpio_irq_set_type,	\
-		},							\
+		.instance = (_bank),					\
 	}
 
 static struct pic32_gpio_bank pic32_gpio_banks[] = {
@@ -2145,6 +2141,24 @@ static struct pic32_gpio_bank pic32_gpio_banks[] = {
 	GPIO_BANK(9, PINS_PER_BANK),
 };
 
+static void pic32_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct pic32_gpio_bank *bank = irqd_to_bank(data);
+
+	seq_printf(p, "GPIO%d", bank->instance);
+}
+
+static const struct irq_chip pic32_gpio_irq_chip = {
+	.irq_startup = pic32_gpio_irq_startup,
+	.irq_ack = pic32_gpio_irq_ack,
+	.irq_mask = pic32_gpio_irq_mask,
+	.irq_unmask = pic32_gpio_irq_unmask,
+	.irq_set_type = pic32_gpio_irq_set_type,
+	.irq_print_chip = pic32_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int pic32_pinctrl_probe(struct platform_device *pdev)
 {
 	struct pic32_pinctrl *pctl;
@@ -2243,7 +2257,7 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	bank->gpio_chip.parent = &pdev->dev;
 
 	girq = &bank->gpio_chip.irq;
-	girq->chip = &bank->irq_chip;
+	gpio_irq_chip_set_chip(girq, &pic32_gpio_irq_chip);
 	girq->parent_handler = pic32_gpio_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),

-- 
2.34.1

