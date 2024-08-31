Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFDDCA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2D1BC4CEC7; Sat, 31 Aug 2024 09:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8EDC4CEC0;
	Sat, 31 Aug 2024 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096079;
	bh=NQryTML5jdSBcx2G6HYZdjf8LG1gasfjM7xFkLaZRnE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F106tJvZpJ++0HD/HECBAjT9NcEMrUVIake43pJdPbd9z5y3LGWF8vUMw9bsYqDBu
	 Kg6irowqG2Lbu/bImAJSQinXgMmEhFL+G7GISRi8tJEtSNjedVOoSDvFv/CDlbDVL6
	 32WIQS/dcNf9oYY6RQQn3naahA+RD7Sr7/OY7/I3KjY3jsv/iQ105LvEsmg8yQnrrb
	 SqA3LL8fMT7ELZOOhNKEtLfuD3a+cqyPHQ3egBMbA4Istn/vtj/oa5/FIHglIaypSC
	 G6BK75qTUUtbgqTqPQHQH2iPrd1uPU9oiTmSZfpsBNgrniQj1HnQcYeBbPXC0RfkDq
	 lXexvuI8c2iSQ==
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
Subject: [PATCH v5 09/16] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
Date: Sat, 31 Aug 2024 11:20:43 +0200
Message-ID: <20240831092050.23093-10-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
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
index 0462c345778c..dd0dbaa9de72 100644
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
@@ -462,6 +467,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
+	if (ret)
+		return ret;
+
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
@@ -470,7 +479,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_notice(dev,
 			   "Firmware does not support the GET_RANDOM command\n");
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
@@ -480,7 +489,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm_register_debugfs(rwtm);
@@ -497,17 +506,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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
@@ -520,7 +518,6 @@ MODULE_DEVICE_TABLE(of, turris_mox_rwtm_match);
 
 static struct platform_driver turris_mox_rwtm_driver = {
 	.probe	= turris_mox_rwtm_probe,
-	.remove_new = turris_mox_rwtm_remove,
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= turris_mox_rwtm_match,
-- 
2.44.2

