Return-Path: <SRS0=xfH4=2U=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381A4C433FE
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 13:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB0D4C4347C; Wed, 19 Oct 2022 13:32:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34300C433C1;
	Wed, 19 Oct 2022 13:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34300C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C4C70E0002;
	Wed, 19 Oct 2022 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666186340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNevX7Gw1xrDZvzmJ6+jrL3rUSR/hzQIzfoZ7oOdAgA=;
	b=IEjy2/p2jMCGD899pJlMWlxsbTXTJGzNi2Qkh7QpqyRu07FseRrGy/mnynOyLVOqA7GVv/
	gRIuUJN5RhQvkfPtxcEd/+xhCs+aggLIsl9et7Gzym8RSbbWVwpMhkLUglN7cz+xF8LDGX
	IUtqr88iYmP5RQ2bdphzPAkiAu6/79gY8UeIqhHRAVuimlgdCgnD262+qIgBbZL8InbAlR
	zsQnnHhw6QzLSGDhI9qbYeLKONUQvnh5caocO8/a4FPmXHycZ/1LVU/xsNkXg4PP5rgraD
	UD8JFYp78p4pl/TiEFnu2O/I15xAzu09/kNz7bHVgtYdP5/n1/CyLzi3WCcmow==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: thomas.petazzoni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 4/6] clk: spear: Fix CLCD clock definition on SPEAr600
Date: Wed, 19 Oct 2022 15:32:06 +0200
Message-Id: <20221019133208.319626-5-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019133208.319626-1-kory.maincent@bootlin.com>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

There is no SPEAr600 device named "clcd". Instead, the description of the
CLCD (color liquid crystal display controller) name is "fc200000.clcd", so
we should associate the CLCD gateable clock to this device name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/clk/spear/spear6xx_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index c192a9141b86..ee0ed89f2954 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -207,7 +207,7 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
 
 	clk = clk_register_gate(NULL, "clcd_clk", "clcd_mclk", 0,
 			PERIP1_CLK_ENB, CLCD_CLK_ENB, 0, &_lock);
-	clk_register_clkdev(clk, NULL, "clcd");
+	clk_register_clkdev(clk, NULL, "fc200000.clcd");
 
 	/* gpt clocks */
 	clk = clk_register_gpt("gpt0_1_syn_clk", "pll1_clk", 0, PRSC0_CLK_CFG,
-- 
2.25.1

