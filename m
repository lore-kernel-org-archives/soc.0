Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74673C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 668FFC3277B; Wed, 12 Jun 2024 13:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E26DC4AF1A;
	Wed, 12 Jun 2024 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200518;
	bh=7x42hmfj08LWLsSjf15DKkCEuTD32sDaWvE5MzcKO2g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L3NhcknAknT8iFqmY+XAh8HPR1m1SA85Qb77aY0cwQCUCJ1LnZGMh4mqypLHr3lzC
	 3H61gcKhEyx8jBbIho+fRxd7dyNlWyHKv8pYGwB71T2kz1b3LSLPzV6GwY0k7+hRv4
	 ftD5Erb2s9mDf802BLQlLeTtmUbIxqMBxllwzf3scOWkrNs/wD0G7azcKsM65La7L+
	 zdHUVa68K+3wQiSDyhYf/lJ318fGFJPeEJ8h9t7qcsCWRlzDzk0fV65FiA61VVGgC1
	 CiX4/ixBAUEwlwqWBwqU7iQ4mOVlFGC7prdwHyzKr0sITOS37hF5mfuhPMU/Qbr8kG
	 dmYZKOWOeTNfQ==
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
Subject: [PATCH 12/19] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
Date: Wed, 12 Jun 2024 15:54:36 +0200
Message-ID: <20240612135443.30239-13-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm resource management for driver's kobject and mailbox. This
allows us to get rid of driver's .remove() method and gotos in .probe().

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 41 +++++++++++++++---------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index cdbe244be694..153772721901 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -139,6 +139,11 @@ static const struct kobj_type mox_kobj_ktype = {
 	.default_groups	= mox_rwtm_groups,
 };
 
+static void mox_devm_kobj_release(void *kobj)
+{
+	kobject_put(kobj);
+}
+
 static int mox_kobj_create(struct mox_rwtm *rwtm)
 {
 	struct kobject *kobj = &rwtm->kobj;
@@ -146,11 +151,11 @@ static int mox_kobj_create(struct mox_rwtm *rwtm)
 
 	kobject_init(kobj, &mox_kobj_ktype);
 
-	ret = kobject_add(kobj, firmware_kobj, "turris-mox-rwtm");
+	ret = devm_add_action_or_reset(rwtm->dev, mox_devm_kobj_release, kobj);
 	if (ret)
-		kobject_put(kobj);
+		return ret;
 
-	return ret;
+	return kobject_add(kobj, firmware_kobj, "turris-mox-rwtm");
 }
 
 static int mox_get_status(enum mbox_cmd cmd, u32 retval)
@@ -453,6 +458,11 @@ static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 }
 #endif
 
+static void rwtm_devm_mbox_release(void *mbox)
+{
+	mbox_free_channel(mbox);
+}
+
 static int turris_mox_rwtm_probe(struct platform_device *pdev)
 {
 	struct mox_rwtm *rwtm;
@@ -488,9 +498,13 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Cannot request mailbox channel: %i\n",
 				ret);
-		goto put_kobj;
+		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
+	if (ret < 0)
+		return ret;
+
 	init_completion(&rwtm->cmd_done);
 
 	ret = mox_get_board_info(rwtm);
@@ -501,7 +515,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_notice(dev,
 			   "Firmware does not support the GET_RANDOM command\n");
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
@@ -511,7 +525,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		goto free_channel;
+		return ret;
 	}
 
 	rwtm_register_debugfs(rwtm);
@@ -519,20 +533,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	dev_info(dev, "HWRNG successfully registered\n");
 
 	return 0;
-
-free_channel:
-	mbox_free_channel(rwtm->mbox);
-put_kobj:
-	kobject_put(&rwtm->kobj);
-	return ret;
-}
-
-static void turris_mox_rwtm_remove(struct platform_device *pdev)
-{
-	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
-
-	kobject_put(&rwtm->kobj);
-	mbox_free_channel(rwtm->mbox);
 }
 
 static const struct of_device_id turris_mox_rwtm_match[] = {
@@ -545,7 +545,6 @@ MODULE_DEVICE_TABLE(of, turris_mox_rwtm_match);
 
 static struct platform_driver turris_mox_rwtm_driver = {
 	.probe	= turris_mox_rwtm_probe,
-	.remove_new = turris_mox_rwtm_remove,
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= turris_mox_rwtm_match,
-- 
2.44.2

