Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C854C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 159EDC4AF0E; Mon, 15 Jul 2024 10:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE919C32782;
	Mon, 15 Jul 2024 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040476;
	bh=SDdIezfetOjkv1Sjj9Ygh8uOOyA2sNzJKo9KfkvWUUs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MK4YvNvJ61QaPfmfAgz+1WIJDCQf36n0/CKxkMbm4j5KKyPIyZ18gINEFK0nX3cJc
	 oIAjyD5SzM8GQ/7cu9fnNSsxoQSgBEXMLVOAgjhzk30Pyd2hgq16hCD1MuHQT9Lke9
	 Dyg3OxOjATihEFQicoPVVVA59SrZ19DxylgK9guJERtI0WG8Mg9ZEOPp4zDGr1cvkA
	 euVb42I/eE+MCOb+D0m1r7ihECWCuh0tLuzWU8csP1cvU/Rz/IYKWVqoDNL3T9Pqrd
	 r68Tt99sPSmTG1t7wHEK9CEntSK24D2NjEm2IXmTmO/kyc6tULWC1+y8DLLHgsxqBu
	 m8qdGF+ERMmog==
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
Subject: [PATCH v4 11/19] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
Date: Mon, 15 Jul 2024 12:47:15 +0200
Message-ID: <20240715104723.17751-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm resource management for driver's mailbox. This allows us to get
rid of the driver's .remove() method and the gotos in .probe().

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index f95e77cc4716..5f44fece33f2 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -424,6 +424,11 @@ static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 }
 #endif
 
+static void rwtm_devm_mbox_release(void *mbox)
+{
+	mbox_free_channel(mbox);
+}
+
 static void rwtm_firmware_symlink_drop(void *parent)
 {
 	sysfs_remove_link(parent, DRIVER_NAME);
@@ -461,6 +466,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
+	if (ret)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	ret = mox_get_board_info(rwtm);
@@ -471,7 +480,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_notice(dev,
 			   "Firmware does not support the GET_RANDOM command\n");
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
@@ -481,7 +490,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm_register_debugfs(rwtm);
@@ -498,17 +507,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 					 firmware_kobj);
 
 	return 0;
-
-free_channel:
-	mbox_free_channel(rwtm->mbox);
-	return ret;
-}
-
-static void turris_mox_rwtm_remove(struct platform_device *pdev)
-{
-	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
-
-	mbox_free_channel(rwtm->mbox);
 }
 
 static const struct of_device_id turris_mox_rwtm_match[] = {
@@ -521,7 +519,6 @@ MODULE_DEVICE_TABLE(of, turris_mox_rwtm_match);
 
 static struct platform_driver turris_mox_rwtm_driver = {
 	.probe	= turris_mox_rwtm_probe,
-	.remove_new = turris_mox_rwtm_remove,
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= turris_mox_rwtm_match,
-- 
2.44.2

