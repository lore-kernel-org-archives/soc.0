Return-Path: <SRS0=4j1D=AF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6ECC77B78
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 14:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E17E6C433A0; Fri, 14 Apr 2023 14:06:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3161C433A7
	for <soc@kernel.org>; Fri, 14 Apr 2023 14:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3161C433A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id h37so6724553lfv.0
        for <soc@kernel.org>; Fri, 14 Apr 2023 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481188; x=1684073188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTAL+X79fFSg7Vdy2Php9Hw3wS0uqtZxqCJF6Zi/jeI=;
        b=YGQPsnba86DaMk0Jax3OQOs/A6b3ow03oOFnX+XJJDcL2QNnkKNIcWGwcnrJ7sn45H
         f3444NABSrf4kpRKA1kK95qZ2g63dJ8gsSsdVEmOQp9FkFTwqa1Gn3HNZ4HUndI/ilFs
         OhP89nob15jC8f9ro3WGj2ryAwI4n+KkfOfRfSVSjCDxRWrPpltvIyMeXuBHq0APUy4I
         /vKKpt//M0l65r2WFQupuwfBQCrEc4F08tgMhTrz8ylsAJ/5TiDhI47VXsKhjvvXB9ZU
         V1JaPb1PHPcFUtaZiZiPc3Jzvsp/Wq7AiAReEpKMY4mX/mJzIjLz5876C2MO3MCq+Fez
         hfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481188; x=1684073188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTAL+X79fFSg7Vdy2Php9Hw3wS0uqtZxqCJF6Zi/jeI=;
        b=eJXzavzGCFm6l04IgmOlIerOR89wG1jtLTSmAH9rZZ9rtPXi2ttNacvCb/TqLmkQXY
         8qAGmymMdLJmh5o46g/vW/wg3SyYlKmJaNnWgd+xqHO2U73m+qat+NUfWGF8OX50fw0r
         3/qAHQJ3eV27L1qoAR+BHYydIqGkv2ah2t0guElBId7mw+VlKCDR6Qnx32u8xBHTXW5G
         Na91ldJ/GrMyZO2LCkqEhfkEFJ6uNw6CwOJ4eZsgxX54TO+lFhbt1MQmMwmIQkODaFgI
         iW3tJj4zuuzTfalFwANbW40Qmy3gwgro7U1CM16reyGWF1GhMAoizjR47rCn+36TZ40a
         yFKw==
X-Gm-Message-State: AAQBX9foiKSriKNfCwS6IcyWvHijl5+4nOeePzP6An3fhdLYYoTZgKzB
	JOGZatUf2aMcUnlkHs/RYeXtDQ==
X-Google-Smtp-Source: AKy350YW1tq7RlVAbMysRMGGwpO123vxwnoXAyGTOLxIgY81ErunoKL5Dlr4nWwny/5PkWJnupMGuQ==
X-Received: by 2002:a05:6512:b83:b0:4dc:8049:6f36 with SMTP id b3-20020a0565120b8300b004dc80496f36mr2567531lfv.1.1681481188014;
        Fri, 14 Apr 2023 07:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 16:06:22 +0200
Subject: [PATCH 6/6] pinctrl: qcom ssbi-gpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230414-immutable-irqchips-2-v1-6-6b59a5186b00@linaro.org>
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
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index e973001e5c88..dec1ffc49ffd 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -652,12 +652,30 @@ static int pm8xxx_pin_populate(struct pm8xxx_gpio *pctrl,
 	return 0;
 }
 
-static struct irq_chip pm8xxx_irq_chip = {
+static void pm8xxx_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+}
+
+static void pm8xxx_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+}
+
+static const struct irq_chip pm8xxx_irq_chip = {
 	.name = "ssbi-gpio",
 	.irq_mask_ack = irq_chip_mask_ack_parent,
 	.irq_unmask = irq_chip_unmask_parent,
+	.irq_disable = pm8xxx_irq_disable,
+	.irq_enable = pm8xxx_irq_enable,
 	.irq_set_type = irq_chip_set_type_parent,
-	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE |
+		IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int pm8xxx_domain_translate(struct irq_domain *domain,
@@ -788,7 +806,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	girq = &pctrl->chip.irq;
-	girq->chip = &pm8xxx_irq_chip;
+	gpio_irq_chip_set_chip(girq, &pm8xxx_irq_chip);
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->fwnode = dev_fwnode(pctrl->dev);

-- 
2.34.1

