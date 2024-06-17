Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C2C2BA15
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A20BFC4AF48; Mon, 17 Jun 2024 14:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91876C4AF1D;
	Mon, 17 Jun 2024 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635562;
	bh=XewggOxf0J4sZug5qVvIcqxtdUZ4VRaB7T8zPOqw4LY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fbNZoyjKydJvRMLiMCs5qlBlmdxnxyNNdVtoUzXjMyckMPTyshrpR+lmx8PVz9qax
	 pCI8NZRbTZ1Z2g03pgYwxVg9z3e7ZTV/qL+S6qiHWnBCpB+7eSxV4Xhce7JmWubTQU
	 yjnVIyjtqt4v8VO7lGQH8KrcAUrSk2lgGPoXt91OOAoUlXeqR8PgcU8rCyOrxYvOtG
	 c6xt/y15PdQR60ZVm+JXrMzTC/ABem1nM3KAR45/xHXoOMmPrgu3vH6brF1M+5G/mK
	 dk1pkOvbsvz7VeWXjUVok6vGGM+DRbsw92T498aicHIQS3X9PgjCCUX6pWcg0l6BVh
	 kgtaJiktvSvyw==
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
Subject: [PATCH v3 10/17] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
Date: Mon, 17 Jun 2024 16:45:25 +0200
Message-ID: <20240617144532.17385-11-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm resource management for driver's mailbox. This allows us to get
rid of the driver's .remove() method and the gotos in .probe().

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 77fdd5c66971..9a68784a9619 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -426,6 +426,11 @@ static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
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
@@ -463,6 +468,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
+	if (ret)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	ret = mox_get_board_info(rwtm);
@@ -473,7 +482,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_notice(dev,
 			   "Firmware does not support the GET_RANDOM command\n");
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
@@ -483,7 +492,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm_register_debugfs(rwtm);
@@ -500,17 +509,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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
@@ -523,7 +521,6 @@ MODULE_DEVICE_TABLE(of, turris_mox_rwtm_match);
 
 static struct platform_driver turris_mox_rwtm_driver = {
 	.probe	= turris_mox_rwtm_probe,
-	.remove_new = turris_mox_rwtm_remove,
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= turris_mox_rwtm_match,
-- 
2.44.2

