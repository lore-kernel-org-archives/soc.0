Return-Path: <SRS0=wsM2=24=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48257C67871
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 08:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15D28C433C1; Thu, 27 Oct 2022 08:11:15 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE860C433D6
	for <soc@kernel.org>; Thu, 27 Oct 2022 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE860C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id r14so1250913lfm.2
        for <soc@kernel.org>; Thu, 27 Oct 2022 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMKrhWtEGgJEHMUsPcZ5EkFWH3rKurAQv3sdpE15J7M=;
        b=Xm76KFyXjTssbhlSwSiJ9K0n93eCg87fpMlMDVvaq5WLVZBTRW9Bc2ANHHXy1Sm8AY
         pE8NzT/v1gz9/kx7ILCjBa2WnDB2cULeBdN+5TVbx+fqfwqYcgFmj5QnWqHz0NwDPi5B
         MwpEgbJuFH9fd4/A1zhFu5YAkDQQ+tLD+fTHBGZ/yf3XSE8PFpyXvVlc2PQXagPlFjOd
         hK/g1Nvj14KEXNT022uTbil25ao3IGUMOkF4e9350+o3SO0TJ2Lm1GsU8SXPUEqmUgFy
         BpLNKVMjITon1EpBuNBLcTAT3P2oAudU5fABhlT97e1nxNpU3Kki2hj4fLlWAisfXqnq
         vd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMKrhWtEGgJEHMUsPcZ5EkFWH3rKurAQv3sdpE15J7M=;
        b=x99j8kQ0yjgtDy3hjDQMcV68eml3szCtVLpUJBNpmGFnX4sF2OO96r6WSJRbIUyQGW
         xbeVZgz9h9ecbvA8MMXQY4GrpCPUKcXzgv+/WkajuH2hSNSaY+VXxRmAJL0lYrnq3nG8
         aYQS7IfowTSwerGgJJwA3IVNFpB0qr3KPYWGjdUbdZb+MHgQ5AfYZN7F4ylDdhL/2wor
         FMxRWkWhgGdrxkTe3n/NqDHbOyUvWASImiwAQnk363FhhB0PJy38WRGncu3sneFX5SrG
         DoDfYc9c+pP6dwuS+JQCEZEEAOpgYYyoVtxtfvUSBoGnXWQGtLkNcfQVYE8ANX14jfht
         W6UA==
X-Gm-Message-State: ACrzQf3qMBxODBq2bdf7+kQ08mU2Ey6TBXo+VvrkANC02dHuh41VXTyq
	SAJU6x9sigk6JYFro2BNQY5SFg==
X-Google-Smtp-Source: AMsMyM7ZtMmTHsWm1e00XPIiTpNT0S7/rCzS9DGyQzKImljosCGvsi8Ha9Q7bz3rjqOV8jiOmpbFwQ==
X-Received: by 2002:a05:6512:3b2:b0:4a2:48c3:1f46 with SMTP id v18-20020a05651203b200b004a248c31f46mr17353514lfp.572.1666858271692;
        Thu, 27 Oct 2022 01:11:11 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05651c169800b002772b70c1acsm136881ljb.21.2022.10.27.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:11:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	soc@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3] soc: fsl: qe: Avoid using gpio_to_desc()
Date: Thu, 27 Oct 2022 10:11:08 +0200
Message-Id: <20221027081108.174662-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qe gpio driver is a custom API combined GPIO and pin control
driver that exist outside of the pin control subsystem for historical
reasons.

We want to get rid of the old GPIO numberspace, so instead of
calling gpio_to_desc() we get the gpio descriptor for the requested
line from the device tree directly without passing through the
GPIO numberspace, and then we get the gpiochip from the descriptor.

Using the reference counting inside the gpio descriptor we can drop
the reference counting code in this driver. A second gpiod_get()
will not succeed.

To obtain the local hardware offset of the GPIO line, the driver
need to include the header from the gpiolib internals. This isn't
pretty but it is the lesser evil compared to keeping the code
as a roadblock to gpiolib refactoring. A proper solution would be
to rewrite the driver as a real pin control driver with a
built-in gpio_chip.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for -next if it seems
OK.

ChangeLog v2->v3:
- Realize what the driver is trying to do and make a deeper
  refactoring to get at gpiolib internals.
ChangeLog v1->v2:
- Add back the <linux/of_gpio.h> include: we are using the
  mm_of_gpio_chip, which should be fixed, but not now.
---
 drivers/soc/fsl/qe/gpio.c | 66 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..af9193e7e49b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -14,20 +14,23 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
+/*
+ * FIXME: this is legacy code that is accessing gpiolib internals in order
+ * to implement a custom pin controller. The proper solution is to create
+ * a real combined pin control and GPIO driver in drivers/pinctrl. However
+ * this hack is here for legacy code reasons.
+ */
+#include "../../../gpio/gpiolib.h"
 
 struct qe_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
 	spinlock_t lock;
 
-	unsigned long pin_flags[QE_PIO_PINS];
-#define QE_PIN_REQUESTED 0
-
 	/* shadowed data register to clear/set bits safely */
 	u32 cpdata;
 
@@ -144,6 +147,7 @@ struct qe_pin {
 	 * something like qe_pio_controller. Someday.
 	 */
 	struct qe_gpio_chip *controller;
+	struct gpio_desc *gpiod;
 	int num;
 };
 
@@ -160,9 +164,8 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 {
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
-	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
-	unsigned long flags;
 
 	qe_pin = kzalloc(sizeof(*qe_pin), GFP_KERNEL);
 	if (!qe_pin) {
@@ -170,38 +173,36 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	err = of_get_gpio(np, index);
-	if (err < 0)
+	gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), NULL, index, GPIOD_ASIS, "qe");
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
+		goto err0;
+	}
+	if (!gpiod) {
+		err = -EINVAL;
 		goto err0;
-	gc = gpio_to_chip(err);
+	}
+	gc = gpiod_to_chip(gpiod);
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
 	}
+	qe_pin->gpiod = gpiod;
+	qe_pin->controller = gpiochip_get_data(gc);
+	/*
+	 * FIXME: this gets the local offset on the gpio_chip so that the driver
+	 * can manipulate pin control settings through its custom API. The real
+	 * solution is to create a real pin control driver for this.
+	 */
+	qe_pin->num = gpio_chip_hwgpio(gpiod);
 
 	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
+		gpiod_put(gpiod);
 		err = -EINVAL;
 		goto err0;
 	}
-
-	qe_gc = gpiochip_get_data(gc);
-
-	spin_lock_irqsave(&qe_gc->lock, flags);
-
-	err -= gc->base;
-	if (test_and_set_bit(QE_PIN_REQUESTED, &qe_gc->pin_flags[err]) == 0) {
-		qe_pin->controller = qe_gc;
-		qe_pin->num = err;
-		err = 0;
-	} else {
-		err = -EBUSY;
-	}
-
-	spin_unlock_irqrestore(&qe_gc->lock, flags);
-
-	if (!err)
-		return qe_pin;
+	return qe_pin;
 err0:
 	kfree(qe_pin);
 	pr_debug("%s failed with status %d\n", __func__, err);
@@ -219,14 +220,7 @@ EXPORT_SYMBOL(qe_pin_request);
  */
 void qe_pin_free(struct qe_pin *qe_pin)
 {
-	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	unsigned long flags;
-	const int pin = qe_pin->num;
-
-	spin_lock_irqsave(&qe_gc->lock, flags);
-	test_and_clear_bit(QE_PIN_REQUESTED, &qe_gc->pin_flags[pin]);
-	spin_unlock_irqrestore(&qe_gc->lock, flags);
-
+	gpiod_put(qe_pin->gpiod);
 	kfree(qe_pin);
 }
 EXPORT_SYMBOL(qe_pin_free);
-- 
2.34.1

