Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DFCC46CA3
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 23:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AB9EC4163C; Sat,  9 Dec 2023 23:31:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 575E1C433CD
	for <soc@kernel.org>; Sat,  9 Dec 2023 23:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 575E1C433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso4850055e9.1
        for <soc@kernel.org>; Sat, 09 Dec 2023 15:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164695; x=1702769495; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoGMxuTqmMzPSQbecCcQ3I4JYf9Tu3NR+1KxWNy/7jg=;
        b=F6Ncxvm98ZsVuizMBd63JS3+RLzOXBmZWEheeDRBy9ukr945d8ByU7A0R2Xyb+kp+R
         FgK7tlIRP5B90GcoL6zc/v4Vqk0TGUFFED5VkDkAudick6ig76gR9nK41BXXYRmDsFOY
         LUZlvn7CW5bxBPjlttfP5dvtrprdSXh498FdlVog9bheHqV5CjivHkyj7TI/t3PmHRQo
         bx6pvrFHIYMWDNO28NMYYC+gMFoE1VITVVzEMsdtaDGNXdGuNsC42FLJ25njA/xBKAil
         OE4ui8w5CpYzLaUgD83g+R0FW/GgIzSUtnBTCZMx9zGPR2TWTNrnnUbrLI+l/IMENZMY
         gbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164695; x=1702769495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoGMxuTqmMzPSQbecCcQ3I4JYf9Tu3NR+1KxWNy/7jg=;
        b=hBLaQj8fhlFzpNyuDujGQioA+ZqizwXtWkEbw7Qz0UupmAQ/CL1XZKxG53NPXDfZdL
         17qyu7C52ZEv6V2Ov7P8dbUiZMzWlWHPFtfqp4OA/Z5yVtq8GFejjMq6TSFeQJJF+0w3
         Ix9tgDYA915J5u9IZIk/wkLhuyC3YvTfNlJhE5c4AXFKRk3dWnVH1IUatEmSgkwr6aHg
         pC3CVEMN76f/xxBCKZy4fuaTsGvx7iLDnvJ9S1huAdO4Ot551DD8EZRAZkWhMJhWR894
         voYdQbTNaNsIU9QO3vDa8JLDc4F5FD5pUrsmo7LE0fLlBARyT5xziry6kCUGB9W0bmzx
         PcCg==
X-Gm-Message-State: AOJu0YwIFPn17AWqzr9/26XqdcMQa6XMEbXHIpxxhaM7svIdXV+i5Qa+
	3TguB1fFItaH9MXVI5uU8XAYaLIsyup/TUFeUMw=
X-Google-Smtp-Source: AGHT+IE+IZh4rz2wjLSpD/TKmP7mvYRLpaWw+NokKdvGwSO/RsM9jR5eBYEAHEvjvASiRvlgIO3JjA==
X-Received: by 2002:a7b:c84b:0:b0:40c:3820:efeb with SMTP id c11-20020a7bc84b000000b0040c3820efebmr1104619wml.196.1702164694721;
        Sat, 09 Dec 2023 15:31:34 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:33 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 13/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date: Sat,  9 Dec 2023 23:30:59 +0000
Message-ID: <20231209233106.147416-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pin-controller found on the gs101 SoC used in
Pixel 6 phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 145 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..8d08b29a21f6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,143 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 	.ctrl		= fsd_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
 };
+
+/* pin banks of gs101 pin-controller (ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_alive[] = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC0) */
+		.pin_banks	= gs101_pin_peric0,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC1) */
+		.pin_banks	= gs101_pin_peric1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume	= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI1) */
+		.pin_banks	= gs101_pin_hsi1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI2) */
+		.pin_banks	= gs101_pin_hsi2,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
+	.ctrl		= gs101_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 6b58ec84e34b..3834bf953178 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -468,6 +468,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
 			.data = &exynos7_wkup_irq_chip },
 	{ .compatible = "samsung,exynosautov9-wakeup-eint",
 			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "google,gs101-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
 	{ }
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 79babbb39ced..b8d549fe38cb 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynosautov9_of_data },
 	{ .compatible = "tesla,fsd-pinctrl",
 		.data = &fsd_of_data },
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 9b3db50adef3..0b459651bc4a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -351,6 +351,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.43.0.472.g3155946c3a-goog

