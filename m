Return-Path: <SRS0=4j1D=AF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE45BC77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 14:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0EF3C4339C; Fri, 14 Apr 2023 14:06:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29717C433AC
	for <soc@kernel.org>; Fri, 14 Apr 2023 14:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29717C433AC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id h37so6724415lfv.0
        for <soc@kernel.org>; Fri, 14 Apr 2023 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481186; x=1684073186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BHCI/166BKjZ+FXcUih3BMF+v7LRQkg3jx37UcTFdA=;
        b=Rtev4/ouMtv+3Ed1LMSldMuZi7Jobjganjd2eiBngYCBR11LBhPlNuqD0oYCykYj8z
         hgK2yiOi9reFESjiXBFAuocR3eC5qVgfkbX9rIqfTmBiZPYeqB3c40dLsPTERtiWObjt
         r4lJCABTXAOdw5aQOaTx+o4jhXklmEuRxWv4urJxtFwjWNLf0v/u56mNqt2a7yR/O3dt
         8gtCdcEYkB2wsn6TtmRVIQLTZEr07XPZ89MH3XjwAPYqLEoOqQ64Q7rqOgNWCk++rrMC
         BCifHz4Kazh47gRnljH7yeWv1uAY7NsZI+hlf5gRfbLNHV1x/j7BrE+2jQuE3cs3ZTKV
         bmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481186; x=1684073186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BHCI/166BKjZ+FXcUih3BMF+v7LRQkg3jx37UcTFdA=;
        b=CwhJ/3Euoe10eKYIEhRVgztDQoahoA6AYYpW0Glboaa2wRih5f4+Lae2EgRlUaq2FB
         L/DSU0lR+WGNK14bMFNk3vFFB8kOrAFnWKgGXTnlS5Yu9WTJakU3/CMgUEPu1E4QehI8
         lFJYPYG049kkvYcX+Bk2WQMV3Fukjooc0TDQdWW0kp8INk7m5/NQeg0EmuvX073zW1rG
         4OpRtW4zue1WCCvooXCEuxDJ9Ow6llZhyDqhP+BERIkd7G5gXIanMgWRkr4OBY6SqZCH
         VUlUULHxwh8Oo+EmwQQz5QI9xKQoMTOejD6FQDBx+6x/eCT28rvE211KHNkZwhHLpSys
         XPAg==
X-Gm-Message-State: AAQBX9cpDqGl8q14lY6e1gmOeWX61wZaQIy4pwseCnTcffrnI7oWG6fL
	T9aNtv3Vom04Oz8r1OEDpSfhwg==
X-Google-Smtp-Source: AKy350YriwNgCGDtf5oV+RFjWvDkEL94w5t6irwr93Q8pCEGa96woZ1cRxPOwIE/JcEBXleGpR4rxQ==
X-Received: by 2002:ac2:5159:0:b0:4dd:a61c:8f71 with SMTP id q25-20020ac25159000000b004dda61c8f71mr1960530lfd.41.1681481186017;
        Fri, 14 Apr 2023 07:06:26 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 16:06:20 +0200
Subject: [PATCH 4/6] pinctrl: qcom spmi-mpp: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230414-immutable-irqchips-2-v1-4-6b59a5186b00@linaro.org>
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
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 38 ++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 644fb4a0e72a..fe0393829c20 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -143,7 +143,6 @@ struct pmic_mpp_state {
 	struct regmap	*map;
 	struct pinctrl_dev *ctrl;
 	struct gpio_chip chip;
-	struct irq_chip irq;
 };
 
 static const struct pinconf_generic_params pmic_mpp_bindings[] = {
@@ -823,6 +822,33 @@ static int pmic_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
 	return 0;
 }
 
+static void pmic_mpp_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+}
+
+static void pmic_mpp_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	irq_chip_unmask_parent(d);
+}
+
+static const struct irq_chip pmic_mpp_irq_chip = {
+	.name = "spmi-mpp",
+	.irq_ack = irq_chip_ack_parent,
+	.irq_mask = pmic_mpp_irq_mask,
+	.irq_unmask = pmic_mpp_irq_unmask,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_set_wake = irq_chip_set_wake_parent,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int pmic_mpp_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -915,16 +941,8 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
-	state->irq.name = "spmi-mpp",
-	state->irq.irq_ack = irq_chip_ack_parent,
-	state->irq.irq_mask = irq_chip_mask_parent,
-	state->irq.irq_unmask = irq_chip_unmask_parent,
-	state->irq.irq_set_type = irq_chip_set_type_parent,
-	state->irq.irq_set_wake = irq_chip_set_wake_parent,
-	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
-
 	girq = &state->chip.irq;
-	girq->chip = &state->irq;
+	gpio_irq_chip_set_chip(girq, &pmic_mpp_irq_chip);
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->fwnode = dev_fwnode(state->dev);

-- 
2.34.1

