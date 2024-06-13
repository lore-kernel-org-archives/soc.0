Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB4C27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A106C4AF1D; Thu, 13 Jun 2024 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62664C4AF4D;
	Thu, 13 Jun 2024 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295076;
	bh=bP6xkK3kiVLTNVMY36qFiS9LEgByfxrnF733kZQYIY4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANglOerz1lrjITZz/HSm3TzZ0DcCsbxBJ5mfmwA1K5J20Eqb9B/IqAsruUE9JqhUK
	 YsYvHITjO2+EnGA0s2XHvw3D1gk82SyNCKApMBkvz5+IfhNodKAxW9PKY9WENgWilg
	 +0aAxZIEylK6HPbmYQvQisryZtX24IfvVucT0DUKKIv+R86VpPftYuV+TKglNLSKGZ
	 iMsXaE4VDqlWqjj+LdFGKGcLfL6zV4xeE9ifzxONoaCDqmJSVq4xpZwgfmSrtbYCXu
	 Yr8REmfLkcSe6piJojrmKVpTV/96Z43nZWQSEZhNUuCA+6Jj/5ADU3+9+P0TeMYSit
	 bq6OtUm8ll5iA==
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
Subject: [PATCH v2 10/17] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
Date: Thu, 13 Jun 2024 18:10:38 +0200
Message-ID: <20240613161045.29606-11-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm resource management for driver's mailbox. This allows us to get
rid of driver's .remove() method and gotos in .probe().

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index a536c9c461a7..3017a8c19005 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -425,6 +425,11 @@ static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 }
 #endif
 
+static void rwtm_devm_mbox_release(void *mbox)
+{
+	mbox_free_channel(mbox);
+}
+
 static void rwtm_firmware_symlink_drop(void *)
 {
 	sysfs_remove_link(firmware_kobj, DRIVER_NAME);
@@ -462,6 +467,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
+	if (ret < 0)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	ret = mox_get_board_info(rwtm);
@@ -472,7 +481,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_notice(dev,
 			   "Firmware does not support the GET_RANDOM command\n");
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
@@ -482,7 +491,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm_register_debugfs(rwtm);
@@ -498,17 +507,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		devm_add_action_or_reset(dev, rwtm_firmware_symlink_drop, NULL);
 
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

