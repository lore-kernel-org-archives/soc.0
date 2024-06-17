Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F16C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 175B9C4AF48; Mon, 17 Jun 2024 14:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0716DC2BD10;
	Mon, 17 Jun 2024 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635565;
	bh=af5nHrY+O9vceRQiuHfUUbh4Q1ap+nLXCKNlbA24ZFA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAyB3tpcUGzFHojgKZh3TdlKvLe0KSc2TU3I2NXRHLx0n2qSpr1umH3CxpEb7eBsO
	 xcspl5nf4FHRtLaTuOW1Fb6Ey3aIPIXypiGI9/wxJSN5QdjEAycljzb4QoAB2JnWFa
	 swL7nLfaVvpSa0eU9YDTo/uvaWqayuISNjEdwC58mqvHw+TiXmj7JPumbox04Jr8KN
	 T9M7x/I3a55x2RLaAYHrz+KEakYXzPBjYpCrI0YkxfDQt5vk1EcZnKrXuhxsfsXD73
	 CFYCfAkbLm7cUFc73iOgcfF4JeI7PdwRCVK8YDA421vu97oDnRp8ikaO164nBgz9ar
	 D/PteUcZRe44g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 11/17] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
Date: Mon, 17 Jun 2024 16:45:26 +0200
Message-ID: <20240617144532.17385-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use dev_err_probe() where possible in the driver's .probe() method.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 9a68784a9619..397175fafbe0 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -460,13 +460,9 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
 
 	rwtm->mbox = mbox_request_channel(&rwtm->mbox_client, 0);
-	if (IS_ERR(rwtm->mbox)) {
-		ret = PTR_ERR(rwtm->mbox);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot request mailbox channel: %i\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(rwtm->mbox))
+		return dev_err_probe(dev, PTR_ERR(rwtm->mbox),
+				     "Cannot request mailbox channel!\n");
 
 	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
 	if (ret)
@@ -490,10 +486,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
-	if (ret < 0) {
-		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register HWRNG!\n");
 
 	rwtm_register_debugfs(rwtm);
 
-- 
2.44.2

