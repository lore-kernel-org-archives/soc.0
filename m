Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D21C27C7B
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03703C116B1; Wed, 12 Jun 2024 13:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE273C4AF4D;
	Wed, 12 Jun 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200510;
	bh=qdLkloo1//kkYo58+g2Kq+JROyy0900hRCsR5nrF8kg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NchAFQecUqPIT7ueHC21YGAf5yMAF3vlX1q85s/8MmKOQH35keQlMVsp8KG2WojVd
	 y7ueG3tFxZ13sMC6s5krEeYQ0oAnLj7ZJF05+kyuCNSx8ga/a9nOt+wyqozlE6bpUI
	 +aJwrEU8VdSwHVt5hCtYlXoqx3jMdVz9aGh/OQwM3mqxy10WiMc7cfLcOMNkeOjEh+
	 TXTkjNuMW9M29pXj4cBvh+8hfTj9UgAJMBgWGGIQuUJ71JtI1hjwWI21BgCQrw59i7
	 F/U97efm3EB44T2+IwaBM+f80BwNNOlJZOyPUE3o4Il0+PjTo5x5Rgpw3hmHMhZ0Rk
	 XBZEnXiS0OnlA==
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
Subject: [PATCH 09/19] firmware: turris-mox-rwtm: Simplify debugfs code
Date: Wed, 12 Jun 2024 15:54:33 +0200
Message-ID: <20240612135443.30239-10-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simplify debugfs code: do not check for errors, as debugfs errors should
be ignored, and use devm action for dropping the debugfs directory.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 44 ++++++++----------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 441409fefc59..6d1e0b1dd2b4 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -92,7 +92,6 @@ struct mox_rwtm {
 	 * It should be rewritten via crypto API once akcipher API is available
 	 * from userspace.
 	 */
-	struct dentry *debugfs_root;
 	u32 last_sig[MOX_ECC_SIGNATURE_WORDS];
 	bool last_sig_done;
 #endif
@@ -450,39 +449,23 @@ static const struct file_operations do_sign_fops = {
 	.llseek	= no_llseek,
 };
 
-static int rwtm_register_debugfs(struct mox_rwtm *rwtm)
+static void rwtm_debugfs_release(void *root)
 {
-	struct dentry *root, *entry;
-
-	root = debugfs_create_dir("turris-mox-rwtm", NULL);
-
-	if (IS_ERR(root))
-		return PTR_ERR(root);
-
-	entry = debugfs_create_file_unsafe("do_sign", 0600, root, rwtm,
-					   &do_sign_fops);
-	if (IS_ERR(entry))
-		goto err_remove;
-
-	rwtm->debugfs_root = root;
-
-	return 0;
-err_remove:
 	debugfs_remove_recursive(root);
-	return PTR_ERR(entry);
 }
 
-static void rwtm_unregister_debugfs(struct mox_rwtm *rwtm)
+static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 {
-	debugfs_remove_recursive(rwtm->debugfs_root);
+	struct dentry *root;
+
+	root = debugfs_create_dir("turris-mox-rwtm", NULL);
+
+	devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root);
+
+	debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sign_fops);
 }
 #else
-static inline int rwtm_register_debugfs(struct mox_rwtm *rwtm)
-{
-	return 0;
-}
-
-static inline void rwtm_unregister_debugfs(struct mox_rwtm *rwtm)
+static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 {
 }
 #endif
@@ -548,11 +531,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		goto free_channel;
 	}
 
-	ret = rwtm_register_debugfs(rwtm);
-	if (ret < 0) {
-		dev_err(dev, "Failed creating debugfs entries: %i\n", ret);
-		goto free_channel;
-	}
+	rwtm_register_debugfs(rwtm);
 
 	dev_info(dev, "HWRNG successfully registered\n");
 
@@ -569,7 +548,6 @@ static void turris_mox_rwtm_remove(struct platform_device *pdev)
 {
 	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
 
-	rwtm_unregister_debugfs(rwtm);
 	kobject_put(rwtm_to_kobj(rwtm));
 	mbox_free_channel(rwtm->mbox);
 }
-- 
2.44.2

