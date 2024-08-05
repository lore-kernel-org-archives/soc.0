Return-Path: <SRS0=0ypw=PE=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A1C3DA64
	for <soc@archiver.kernel.org>; Mon,  5 Aug 2024 01:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14FE9C4AF10; Mon,  5 Aug 2024 01:47:24 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24849C4AF0E
	for <soc@kernel.org>; Mon,  5 Aug 2024 01:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24849C4AF0E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc566ac769so70991915ad.1
        for <soc@kernel.org>; Sun, 04 Aug 2024 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822442; x=1723427242; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwJabViyOwOqlsyuvl72Ko23CJ5ZXu78YeavmKzmGHg=;
        b=aqhwV5d42GRytTNkI7zbb7kAM7+Xfdf947jRFV//KYFa+UL7POYEiOezeze/S3OYEI
         eRPeTc07uSyNuclFKzCy90ffDMXZ5Dzg/LQn1ijLe0MVpsnk8XzCBS8hDJg9KIFu26eU
         zhxHPAGXTEYsGAQQbpIuax67c+67Hh6ODHFcfRxiwPB4o1P0aLJfE1MfqR6v7CIONasf
         I3blsPnYRb40MZfS2TjbKBOgfqboS/KXRv39frxRPw6bhDBln15kv1O1vEgpvi+ttnq5
         y0pAn7YH6bXTQmryX+RVkW2h94uLY44EBolIM/+lOFqtYpyChnkS9uN+hupJVqb1+vhx
         ECIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822442; x=1723427242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwJabViyOwOqlsyuvl72Ko23CJ5ZXu78YeavmKzmGHg=;
        b=BJDXL+/JJdpyyf46RdXFFUcy9BIAWVyTqSuDP2AQJZKmcPX6+hz2T3LKIwkp2ldxHB
         AaHnKvjCItixuNFRXCqUAyupVjZnzjOHtnR5NljKhoqEBcbH3+wcQ4uieu7f0GM89bs2
         CHTgezaFD8ByAT0ngcXfNTeSYu+sF+gJZcXBKc/diGwu4fcPaXaXlDwbINE78+uNYndC
         o3TKvXCctm/Mr9saJTBhzUMqO86AKM8fr5+AGUf742oy39oLT+PvYi7Kxl3Qj4tkqF9A
         0imeTjdd9tCiNl9WgWqnSvoS7PN43ca2dLXOfunvIcXP9dVTkuISn3F8SCLPQtiv/3hF
         /EwA==
X-Forwarded-Encrypted: i=1; AJvYcCVyv+KuO1d3kQ1DDvY6Lq0qnm4Bi9ePek3os70NhMWsCuK1Ef7PblpTo0Y8eYEYx1hr6SNPq/05Rytq/7HB+g==
X-Gm-Message-State: AOJu0YxVwtKxPHY9xA1iIN67pW1ULY91HN0fsAgPzUKyWK/6clpFht+k
	Ut8qHJc1MVBekp4jtkand6Kt2MYIpPoKo+kuhkxKHT8GANXjQOKH
X-Google-Smtp-Source: AGHT+IGqwFPnuoOcmLqV0N/ujzd8JY77yP2Twv7LpGxD6AnhEF82wcYDFjWQijLX+wgx8uEDkpH7hg==
X-Received: by 2002:a17:902:db0b:b0:1ff:6715:70f7 with SMTP id d9443c01a7336-1ff67158218mr47347265ad.28.1722822442416;
        Sun, 04 Aug 2024 18:47:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:22 -0700 (PDT)
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
Subject: [PATCH 1/5] Input: matrix_keypad - remove support for clustered interrupt
Date: Sun,  4 Aug 2024 18:47:04 -0700
Message-ID: <20240805014710.1961677-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no users of this functionality in the mainline kernel (it was
only available to boards using platform data and not device tree).
Remove it to simplify the code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 61 ++++++++++----------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 7a56f3d3aacd..604e90d13ed0 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -29,7 +29,6 @@ struct matrix_keypad {
 	unsigned int row_shift;
 
 	unsigned int row_irqs[MATRIX_MAX_ROWS];
-	unsigned int num_row_irqs;
 	DECLARE_BITMAP(wakeup_enabled_irqs, MATRIX_MAX_ROWS);
 
 	uint32_t last_key_state[MATRIX_MAX_COLS];
@@ -88,7 +87,7 @@ static void enable_row_irqs(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for (i = 0; i < keypad->num_row_irqs; i++)
+	for (i = 0; i < keypad->pdata->num_row_gpios; i++)
 		enable_irq(keypad->row_irqs[i]);
 }
 
@@ -96,7 +95,7 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for (i = 0; i < keypad->num_row_irqs; i++)
+	for (i = 0; i < keypad->pdata->num_row_gpios; i++)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
@@ -225,7 +224,8 @@ static void matrix_keypad_enable_wakeup(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for_each_clear_bit(i, keypad->wakeup_enabled_irqs, keypad->num_row_irqs)
+	for_each_clear_bit(i, keypad->wakeup_enabled_irqs,
+			   keypad->pdata->num_row_gpios)
 		if (enable_irq_wake(keypad->row_irqs[i]) == 0)
 			__set_bit(i, keypad->wakeup_enabled_irqs);
 }
@@ -234,7 +234,8 @@ static void matrix_keypad_disable_wakeup(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for_each_set_bit(i, keypad->wakeup_enabled_irqs, keypad->num_row_irqs) {
+	for_each_set_bit(i, keypad->wakeup_enabled_irqs,
+			 keypad->pdata->num_row_gpios) {
 		disable_irq_wake(keypad->row_irqs[i]);
 		__clear_bit(i, keypad->wakeup_enabled_irqs);
 	}
@@ -302,48 +303,30 @@ static int matrix_keypad_init_gpio(struct platform_device *pdev,
 		gpio_direction_input(pdata->row_gpios[i]);
 	}
 
-	if (pdata->clustered_irq > 0) {
+	for (i = 0; i < pdata->num_row_gpios; i++) {
+		irq = gpio_to_irq(pdata->row_gpios[i]);
+		if (irq < 0) {
+			err = irq;
+			dev_err(&pdev->dev,
+				"Unable to convert GPIO line %i to irq: %d\n",
+				pdata->row_gpios[i], err);
+			return err;
+		}
+
 		err = devm_request_any_context_irq(&pdev->dev,
-				pdata->clustered_irq,
+				irq,
 				matrix_keypad_interrupt,
-				pdata->clustered_irq_flags,
+				IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING,
 				"matrix-keypad", keypad);
 		if (err < 0) {
 			dev_err(&pdev->dev,
-				"Unable to acquire clustered interrupt\n");
+				"Unable to acquire interrupt for GPIO line %i\n",
+				pdata->row_gpios[i]);
 			return err;
 		}
 
-		keypad->row_irqs[0] = pdata->clustered_irq;
-		keypad->num_row_irqs = 1;
-	} else {
-		for (i = 0; i < pdata->num_row_gpios; i++) {
-			irq = gpio_to_irq(pdata->row_gpios[i]);
-			if (irq < 0) {
-				err = irq;
-				dev_err(&pdev->dev,
-					"Unable to convert GPIO line %i to irq: %d\n",
-					pdata->row_gpios[i], err);
-				return err;
-			}
-
-			err = devm_request_any_context_irq(&pdev->dev,
-					irq,
-					matrix_keypad_interrupt,
-					IRQF_TRIGGER_RISING |
-						IRQF_TRIGGER_FALLING,
-					"matrix-keypad", keypad);
-			if (err < 0) {
-				dev_err(&pdev->dev,
-					"Unable to acquire interrupt for GPIO line %i\n",
-					pdata->row_gpios[i]);
-				return err;
-			}
-
-			keypad->row_irqs[i] = irq;
-		}
-
-		keypad->num_row_irqs = pdata->num_row_gpios;
+		keypad->row_irqs[i] = irq;
 	}
 
 	/* initialized as disabled - enabled by input->open */
-- 
2.46.0.rc2.264.g509ed76dc8-goog

