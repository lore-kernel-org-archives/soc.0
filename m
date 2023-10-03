Return-Path: <SRS0=ROKT=FR=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE2CE7AD62
	for <soc@archiver.kernel.org>; Tue,  3 Oct 2023 14:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20665C433C8; Tue,  3 Oct 2023 14:51:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3506EC433C7
	for <soc@kernel.org>; Tue,  3 Oct 2023 14:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3506EC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so9761465e9.3
        for <soc@kernel.org>; Tue, 03 Oct 2023 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344696; x=1696949496; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqqnOvKvXDp4MSe7jhplDhHv0MUiBDnh5IiTR46rq2A=;
        b=fDrW9mE5NbEc57KZqxBN1MLnrrK9y7LKXi+Mha2ciNx8wvEjHrZHaz3HP4xhVoJ4rX
         +r21OGUaSjP0MHVmr12pW6tq7BnLP2DyxDQZ1lD/OmxAaSTbG50ES4P1FwHt/UchDLcA
         wXo5rruU1QGEMjeGe5FCFENDdSwUjgL8F0Zr4RQWERLpxZtJkj8JudCh0SF99OzPbqhY
         /VZLE+TTuzQHIsOtvhCpECVsc74Rtuq060fdD+O/smx9sdEvAFdp2mdfyiAv7V4in57Y
         oDuj+cacHjutK48dxvYN9dfV1OOCo+6pvtbHNP5XZ2JVo7wmf3Zgnp7XebfQPh/D2hmQ
         +KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344696; x=1696949496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqqnOvKvXDp4MSe7jhplDhHv0MUiBDnh5IiTR46rq2A=;
        b=h4kX3PnoaulsD9mANWY2Sc+shn8Ju/eo1B5LD7U6fAt9vyviXfPo3LbR6SccLHOQ9l
         Ja8B2yuXReo1MdB5/GGMso79N/ZPed0gepVS2YbS4T7KW3B+Jz9Af1P7fQ/bNIDqdT0c
         AXhBgnzg9bTz2HRFsPcZ2ejZ/HKcxOjLAxg4Tg5nGjN07oqJUhCcuHl5fS7aiSsWH8xN
         Clob43QVSZ0q4e5biVHdMI30gPFkZKL+KifV6wnR3XRwYhA5VwQbTTYJOpF9cHDDnj9x
         Fv/5LLty1AKTK72tZ814LwBMImXMZK0tDRwUN7uN2val4fSHhCBv0YmUImWpHM2IaQGs
         SAQw==
X-Gm-Message-State: AOJu0YxaeezYLeI997avBkCgCB8SR6a5DPguktKGt0uSayGXzxi4MLut
	lzseaNsj/lO2zVMEV0h+DMyoSw==
X-Google-Smtp-Source: AGHT+IFnlOwLrQQ9qokqmc7bFZCQ5YA43OcLjE3hejUjE/x2JsMW8rvflYJmqgZ+/wOccZYbGAvvvA==
X-Received: by 2002:a05:600c:2303:b0:405:dbe2:df10 with SMTP id 3-20020a05600c230300b00405dbe2df10mr12537741wmo.35.1696344696539;
        Tue, 03 Oct 2023 07:51:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org
Subject: [PATCH 17/36] pinctrl: spear: use new pinctrl GPIO helpers
Date: Tue,  3 Oct 2023 16:50:55 +0200
Message-Id: <20231003145114.21637-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 722681e0b89b..7488f6394318 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -204,14 +204,13 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 	int ret = 0;
 
 	if (offset >= chip->ngpio)
 		return -EINVAL;
 
-	ret = pinctrl_gpio_request(gpio);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -249,14 +248,13 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 err0:
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 	return ret;
 }
 
 static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 
 	if (offset >= chip->ngpio)
@@ -280,7 +278,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 /* PLGPIO IRQ */
-- 
2.39.2

