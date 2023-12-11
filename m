Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF2C10F05
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 16:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A33AC433BF; Mon, 11 Dec 2023 16:24:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20633C433AD
	for <soc@kernel.org>; Mon, 11 Dec 2023 16:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20633C433AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3332f1512e8so4429516f8f.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311868; x=1702916668; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=FuD59hlLYFcbvW/c+HscOaa6adaJg5erN0WHaiNEP/A/vLJU+bz5CVhwNHi9060IyW
         aFyfkz7YNC2Rry7vgGYJ0YD1aC9vcebrJTqPIVgM5fRD9ZAeEKmUEL5QnOYIUy9ra2r9
         pM3NoYnKS15HKv9TP6um3fdiHA4ZbIOkPx9Zrwx4JuOS1vk47yIZYbSAI48Vv31ocjVZ
         BEs9RJjiNnoGfGuzS6t4Sl5j28YZvdEHos2T9Er7VRWT5U/aF1p7LcRZ1VFblFu42nZH
         Mmn+vq0bcevFpl9XKy6xoyw6rPeM2/D/xtj+8oAiPS4L0FctYQUplqh1h0tadt8WO/RW
         5A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311868; x=1702916668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY3NZW1VVkhHi97yDb7wuKAvdZxLolGu7v09v2ECEzA=;
        b=Gqntf7nY9s9ZO8gReUoIGpJTdhNbQamqF7Yyjz9LHZG0ZUeJFOU4Yc/X5vZ8CC61oB
         Fop9D7wjNzfINuK42+w/IRJj+17C/VeDeXycwD4h9NwK6oSEW4haGJY9X2yCt8rCJtvw
         bysmrczR3SJroR3+qA2J+zVH9akw1CKrhIplukKK/w37ugFdNToa3RNnt/IgVJC9oWOg
         GRat/JFleopBS8h16jiiUqpKjtDBgxHCkDbZ8Olgkp7lZFhRoThGHOJ3ZtV+56IYkMOG
         f+a2UsE/N9F0kTC6Y74Ah45FHQpqyfj7VgNhgoFWvk8H2/P8gkU6cJFbft9yX0xur6Ql
         Hz6w==
X-Gm-Message-State: AOJu0Ywl0woNuW+veskuUBroSrAe93SewaJOvwu2uU1njPPrwjphm2nB
	mMPOcW54eRWxBuTnDV5B1txO3g==
X-Google-Smtp-Source: AGHT+IGh34RehzA4y7NRakQmyNCO0bWLmbphPvVU+MIJpWn33vd04o6AuYfkSllgaMbS9psWhNoYfQ==
X-Received: by 2002:adf:ee0f:0:b0:336:1a2d:2f35 with SMTP id y15-20020adfee0f000000b003361a2d2f35mr1584505wrn.130.1702311868567;
        Mon, 11 Dec 2023 08:24:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:28 -0800 (PST)
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
Subject: [PATCH v7 10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
Date: Mon, 11 Dec 2023 16:23:25 +0000
Message-ID: <20231211162331.435900-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WDT uses the CPU core signal DBGACK to determine whether the SoC
is running in debug mode or not. If the DBGACK signal is asserted and
DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
(disabled).

Presence of the DBGACK_MASK bit is determined by adding a new
QUIRK_HAS_DBGACK_BIT quirk. Also update to use BIT macro to avoid
checkpatch --strict warnings.

Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0b4bd883ff28..7ecb762a371d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -9,6 +9,7 @@
  *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -34,9 +35,10 @@
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
 
-#define S3C2410_WTCON_RSTEN	(1 << 0)
-#define S3C2410_WTCON_INTEN	(1 << 2)
-#define S3C2410_WTCON_ENABLE	(1 << 5)
+#define S3C2410_WTCON_RSTEN		BIT(0)
+#define S3C2410_WTCON_INTEN		BIT(2)
+#define S3C2410_WTCON_ENABLE		BIT(5)
+#define S3C2410_WTCON_DBGACK_MASK	BIT(16)
 
 #define S3C2410_WTCON_DIV16	(0 << 3)
 #define S3C2410_WTCON_DIV32	(1 << 3)
@@ -100,12 +102,17 @@
  * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
  * with "watchdog counter enable" bit. That bit should be set to make watchdog
  * counter running.
+ *
+ * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
+ * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
+ * Debug mode is determined by the DBGACK CPU signal.
  */
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
 #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
 #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
+#define QUIRK_HAS_DBGACK_BIT			BIT(5)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -375,6 +382,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 	return 0;
 }
 
+/* Disable watchdog outputs if CPU is in debug mode */
+static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
+{
+	unsigned long wtcon;
+
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
+		return;
+
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
+	wtcon |= S3C2410_WTCON_DBGACK_MASK;
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
+}
+
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
@@ -700,6 +720,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	s3c2410wdt_mask_dbgack(wdt);
+
 	/*
 	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
 	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
-- 
2.43.0.472.g3155946c3a-goog

