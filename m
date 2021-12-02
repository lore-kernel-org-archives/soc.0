Return-Path: <SRS0=/kpj=QT=bootlin.com=herve.codina@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11975C4332F
	for <soc@archiver.kernel.org>; Thu,  2 Dec 2021 09:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00423C53FD0; Thu,  2 Dec 2021 09:53:18 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD3CCC53FCD;
	Thu,  2 Dec 2021 09:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD3CCC53FCD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: herve.codina@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id D088E240016;
	Thu,  2 Dec 2021 09:53:13 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 3/6] pinctrl: spear: plgpio: Introduce regmap phandle
Date: Thu,  2 Dec 2021 10:52:52 +0100
Message-Id: <20211202095255.165797-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resources need to be shared between pinmux and plgpio.

Introduce regmap phandle in order to retrieve the regmap
from the phandle if the property is present.
This allows to retrieve an external regmap (ie the one
used by pinmux if the phandle references the pinmux node)
from plgpio.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 28538ac99eed..b36449724f3f 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -523,6 +523,7 @@ static int plgpio_probe_dt(struct platform_device *pdev, struct plgpio *plgpio)
 
 static int plgpio_probe(struct platform_device *pdev)
 {
+	struct device_node *regmap_np;
 	struct plgpio *plgpio;
 	int ret, irq;
 
@@ -530,11 +531,22 @@ static int plgpio_probe(struct platform_device *pdev)
 	if (!plgpio)
 		return -ENOMEM;
 
-	plgpio->regmap = device_node_to_regmap(pdev->dev.of_node);
-	if (IS_ERR(plgpio->regmap)) {
-		dev_err(&pdev->dev, "Init regmap failed (%pe)\n",
-			plgpio->regmap);
-		return PTR_ERR(plgpio->regmap);
+	regmap_np = of_parse_phandle(pdev->dev.of_node, "regmap", 0);
+	if (regmap_np) {
+		plgpio->regmap = device_node_to_regmap(regmap_np);
+		of_node_put(regmap_np);
+		if (IS_ERR(plgpio->regmap)) {
+			dev_err(&pdev->dev, "Retrieve regmap failed (%pe)\n",
+				plgpio->regmap);
+			return PTR_ERR(plgpio->regmap);
+		}
+	} else {
+		plgpio->regmap = device_node_to_regmap(pdev->dev.of_node);
+		if (IS_ERR(plgpio->regmap)) {
+			dev_err(&pdev->dev, "Init regmap failed (%pe)\n",
+				plgpio->regmap);
+			return PTR_ERR(plgpio->regmap);
+		}
 	}
 
 	ret = plgpio_probe_dt(pdev, plgpio);
-- 
2.31.1

