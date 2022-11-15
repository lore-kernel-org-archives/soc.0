Return-Path: <SRS0=veTA=3P=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F46C43217
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 13:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7005C43143; Tue, 15 Nov 2022 13:58:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86A90C433D7;
	Tue, 15 Nov 2022 13:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86A90C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A2AD1C0014;
	Tue, 15 Nov 2022 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668520703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2xVfnlmooK7Qg1BmLHoWVwjVfzC1dVIJEO1AD5E1VU=;
	b=FNKVsKjgQzR8g1b6dlfOcwb0WiId/4yqMgDzJut3rJM4x6yG2FgJMm6ID4pfDnE3a7j+f8
	Rrfb5yvkFPSuUm6yGwS6JrYvI/y9Om4Wq16mEqJYuH+UoOR9t3Kh9k4ptNRzgM7g1NUJr3
	FSaFdyPUt5WinN2eOoRaym8fOUUtsPpGheeXTtQqIkDDHqQF5EOxwSFDy4dsvLD+vxpXEc
	sY+E3yi+J5GZO5eBCufzgnjSmpNoYxZfddQZBvIIUkI8lhty5r6yKHXj73DfIZ/mNwB8oG
	3yUBaR63Unc7skLNPFI5ky+CONAXqo16GOSJf1k7fdFZTKBOY0MOGgW6qu2jsQ==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org
Subject: [PATCH v3 2/2] clk: spear: Fix SSP clock definition on SPEAr600
Date: Tue, 15 Nov 2022 14:58:13 +0100
Message-Id: <20221115135814.214388-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115135814.214388-1-kory.maincent@bootlin.com>
References: <20221115135814.214388-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

There is no SPEAr600 device named "ssp-pl022.x". Instead, the description
of the SSP (Synchronous Serial Port) was recently added to the Device Tree,
and the device name is "xxx.spi", so we should associate the SSP gateable
clock to these device names.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/clk/spear/spear6xx_clock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index ee0ed89f2954..adfa118520c3 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -326,13 +326,13 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
 
 	clk = clk_register_gate(NULL, "ssp0_clk", "apb_clk", 0, PERIP1_CLK_ENB,
 			SSP0_CLK_ENB, 0, &_lock);
-	clk_register_clkdev(clk, NULL, "ssp-pl022.0");
+	clk_register_clkdev(clk, NULL, "d0100000.spi");
 
 	clk = clk_register_gate(NULL, "ssp1_clk", "apb_clk", 0, PERIP1_CLK_ENB,
 			SSP1_CLK_ENB, 0, &_lock);
-	clk_register_clkdev(clk, NULL, "ssp-pl022.1");
+	clk_register_clkdev(clk, NULL, "d0180000.spi");
 
 	clk = clk_register_gate(NULL, "ssp2_clk", "apb_clk", 0, PERIP1_CLK_ENB,
 			SSP2_CLK_ENB, 0, &_lock);
-	clk_register_clkdev(clk, NULL, "ssp-pl022.2");
+	clk_register_clkdev(clk, NULL, "d8180000.spi");
 }
-- 
2.25.1

