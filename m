Return-Path: <SRS0=0Aq4=CK=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7BCC001B3
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 14:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEFBAC433C8; Thu, 22 Jun 2023 14:13:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81A4BC433CB;
	Thu, 22 Jun 2023 14:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81A4BC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66872d4a141so2941555b3a.1;
        Thu, 22 Jun 2023 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687443231; x=1690035231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uck4efyxSDISYaLtLdpY/TFsx4URlVDC4giZ3DrD9s0=;
        b=gKCrPDh8tcKTl9WlIrPCoDRriKK/t2zA27OoQ47QjaPoueNs+BFilnZ4/V2TunI8hz
         xF8I2fyLOXBNckRcIM615JSSHb5txh8ycE1HFSRY+vm3s06+VrlKGl7cuKx1v5nmRVwl
         RNbeR+4KS+Rf/EGFkZXf45x3KP0Bkcfwrx/P74Kftd6EqDrma08EbqlVpQMrYDSyStKA
         aUeOkz+6CdTH64UMGyfYkj0Zai1QXbUNUAs2IKTilK8xyHvEHo9JYr12cmwgNKgwbgDr
         BCqZUh9k7G5dWg5k8/tJGrxWHjcbEwFoeCoBgb5m7PHinWmV2r5+ww9oG6ftJ8OPWoyb
         gGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443231; x=1690035231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uck4efyxSDISYaLtLdpY/TFsx4URlVDC4giZ3DrD9s0=;
        b=cPLqortwxjxMiGbzj1fC3Z7oKOdJPGkJ9lHkeWrGq17IMgUZRXRclMrEHs0uAkf3gP
         lgpLDTitIto5oGpaT0Yl58+2gpDnEaIC5j4ZX+J7ghWo7NPDDZtmUW0K3JYuVaHLRicp
         HBuGY+9kYG6wPwIpkxIJYzbnZWX9Eut5dKp5dDhc9S5RmpCKc26xGh9LqXM9XhDq/gAV
         2EJARrRfITqgo4qXmgiuDn03GrEIk+QvVAvdG5x1HBGRpBjvnwQdH89tXbUvgvJPTooX
         NwN6NbiYGkP3rQwLS7/9UZzauicjWwX5xYYnxsVPrZDCt6JVo1Y/17AlDXETyl6ZwWRp
         OEMg==
X-Gm-Message-State: AC+VfDxkFJbIZnrd6A6TpJaOpbJJlmVPneydERJv42utWm15nIMYj6/H
	mF9tsvUOd30pclW/4jRe8+45KHkiB4Y=
X-Google-Smtp-Source: ACHHUZ6nW/obAwCMBV+IDoUm2Io38lec0kRWhmDvJ5FKR5pT0fSD98L544RPbtAyb9uRiFDQHqRxCg==
X-Received: by 2002:a05:6a00:c8a:b0:66a:5260:36c3 with SMTP id a10-20020a056a000c8a00b0066a526036c3mr2530547pfv.17.1687443231390;
        Thu, 22 Jun 2023 07:13:51 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id i20-20020aa79094000000b0065a1b05193asm4604268pfa.185.2023.06.22.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:13:51 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	soc@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	schung@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: [PATCH v3 1/3] clk: nuvoton: Add clk-ma35d1.h for driver extern functions
Date: Thu, 22 Jun 2023 14:13:41 +0000
Message-Id: <20230622141343.13595-2-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230622141343.13595-1-ychuang570808@gmail.com>
References: <20230622141343.13595-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Moved the declaration of extern functions ma35d1_reg_clk_pll() and
ma35d1_reg_adc_clkdiv() from the .c files to the newly created header
file clk-ma35d1.h.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c |  7 ++-----
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |  5 ++---
 drivers/clk/nuvoton/clk-ma35d1.c         | 10 ++--------
 drivers/clk/nuvoton/clk-ma35d1.h         | 18 ++++++++++++++++++
 4 files changed, 24 insertions(+), 16 deletions(-)
 create mode 100644 drivers/clk/nuvoton/clk-ma35d1.h

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index 0c2bed47909a..bb8c23d2b895 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -9,6 +9,8 @@
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 
+#include "clk-ma35d1.h"
+
 struct ma35d1_adc_clk_div {
 	struct clk_hw hw;
 	void __iomem *reg;
@@ -20,11 +22,6 @@ struct ma35d1_adc_clk_div {
 	spinlock_t *lock;
 };
 
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *parent_hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
-
 static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct ma35d1_adc_clk_div, hw);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index e4c9f94e6796..ff3fb8b87c24 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -15,6 +15,8 @@
 #include <linux/units.h>
 #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
 
+#include "clk-ma35d1.h"
+
 /* PLL frequency limits */
 #define PLL_FREF_MAX_FREQ	(200 * HZ_PER_MHZ)
 #define PLL_FREF_MIN_FREQ	(1 * HZ_PER_MHZ)
@@ -71,9 +73,6 @@ struct ma35d1_clk_pll {
 	void __iomem *ctl2_base;
 };
 
-struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
-				  struct clk_hw *parent_hw, void __iomem *base);
-
 static inline struct ma35d1_clk_pll *to_ma35d1_clk_pll(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct ma35d1_clk_pll, hw);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 297b11585f00..8dfa762494fe 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -12,6 +12,8 @@
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
 
+#include "clk-ma35d1.h"
+
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
@@ -60,14 +62,6 @@ static DEFINE_SPINLOCK(ma35d1_lock);
 #define PLL_MODE_FRAC           1
 #define PLL_MODE_SS             2
 
-struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode,
-				  const char *name, struct clk_hw *parent_hw,
-				  void __iomem *base);
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
-
 static const struct clk_parent_data ca35clk_sel_clks[] = {
 	{ .index = 0 },  /* HXT */
 	{ .index = 1 },  /* CAPLL */
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
new file mode 100644
index 000000000000..3adee440f60a
--- /dev/null
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Chi-Fang Li <cfli0@nuvoton.com>
+ */
+
+#ifndef __DRV_CLK_NUVOTON_MA35D1_H
+#define __DRV_CLK_NUVOTON_MA35D1_H
+
+struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
+				  struct clk_hw *parent_hw, void __iomem *base);
+
+struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
+				     struct clk_hw *parent_hw, spinlock_t *lock,
+				     unsigned long flags, void __iomem *reg,
+				     u8 shift, u8 width, u32 mask_bit);
+
+#endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.34.1

