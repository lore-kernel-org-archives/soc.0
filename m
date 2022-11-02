Return-Path: <SRS0=OCyK=3C=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94360C433FE
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 17:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7ADDDC433C1; Wed,  2 Nov 2022 17:11:06 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A344EC433D6;
	Wed,  2 Nov 2022 17:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A344EC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 957D3100009;
	Wed,  2 Nov 2022 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667409063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2xVfnlmooK7Qg1BmLHoWVwjVfzC1dVIJEO1AD5E1VU=;
	b=FwF9YkUVYzUrCoshasYZIRNKboNo6j1i0R4ypo9aBEDT5lyrnQWloO6wdIb3IXD9Hc0KGA
	bLyFCSbR9kqnEUDp2so6a7Pxk/ablv5ycwC91CsTv+Vh5mpBxPfC/hx4QRMi6sy5ZtR9hB
	AZMqkdZAdt/N6zVYqACerzJvn8yxIke3Ou+HN9V38aAv6MDbkfJtqulndK4Ib1xwE2Z6x6
	R7lYDSFPvQU/SPcZQAb7hv1fP1qvDWzYZDT2W2G32zNyUyZm8WoaiaVQx5Heas1TB5NXr4
	358zV1riX4xRPxQr82Jag2b6IEUy8q6hB6/vPA8gd93Db4f1mQKmHiAXe/0+/w==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: viresh.kumar@linaro.org,
	Bhavna Yadav <bhavna.yadav@st.com>,
	Vijay Kumar Mishra <vijay.kumar@st.com>,
	Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Vipul Kumar Samar <vipulkumar.samar@st.com>,
	Vipin Kumar <vipin.kumar@st.com>
Subject: [PATCH v2 6/6] clk: spear: Fix SSP clock definition on SPEAr600
Date: Wed,  2 Nov 2022 18:10:10 +0100
Message-Id: <20221102171012.49150-7-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102171012.49150-1-kory.maincent@bootlin.com>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
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

