Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36BCC27C7B
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3A8BC3277B; Wed, 12 Jun 2024 13:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA924C116B1;
	Wed, 12 Jun 2024 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200525;
	bh=KBKGcGMHOE+vukZuKgYKLszyxK53WRdJFswjU3Adm0o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnTp6RRs9DjaQ0qvJbI+YzIDiPW0kxIOVaO7qLKWTeJi1thO0ajd1CWZqsN97f1NA
	 CgN7ZbU60obG1WgavrTousPBKQYYoSujEafw/WvBFc3FojOHzRlN3ABqK5pAM1JE7c
	 e4VD3nEmbccvryp6tNH8h5JCY7ICc5oqQq+/M3G+MnGxqeYxBcDttC3S9MlKnNYjLn
	 LdASDqjr/tCCA08HKpIn2MNMXFHsSzRvQCyoVEVHLzgh5yrmjvfIyPduwmrN/cxk/b
	 j4hmV8P0Qt30Bq+F2iKyUgW7nfcJ6942P5aACsaZqrj1gmEkpfQOqeLTdE0HUR5X6c
	 2InEHbedLX4Ag==
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
Subject: [PATCH 15/19] firmware: turris-mox-rwtm: Drop redundant device pointer
Date: Wed, 12 Jun 2024 15:54:39 +0200
Message-ID: <20240612135443.30239-16-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop redundant device pointer from driver's private structure.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index b9be3c806695..5f4dd919ce2e 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -58,7 +58,6 @@ enum mbox_cmd {
 };
 
 struct mox_rwtm {
-	struct device *dev;
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
 	struct kobject kobj;
@@ -94,6 +93,11 @@ struct mox_rwtm {
 #endif
 };
 
+static inline struct device *rwtm_dev(struct mox_rwtm *rwtm)
+{
+	return rwtm->mbox_client.dev;
+}
+
 static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
 {
 	return container_of(kobj, struct mox_rwtm, kobj);
@@ -151,7 +155,8 @@ static int mox_kobj_create(struct mox_rwtm *rwtm)
 
 	kobject_init(kobj, &mox_kobj_ktype);
 
-	ret = devm_add_action_or_reset(rwtm->dev, mox_devm_kobj_release, kobj);
+	ret = devm_add_action_or_reset(rwtm_dev(rwtm), mox_devm_kobj_release,
+				       kobj);
 	if (ret)
 		return ret;
 
@@ -196,6 +201,7 @@ static void reply_to_mac_addr(u8 *mac, u32 t1, u32 t2)
 
 static int mox_get_board_info(struct mox_rwtm *rwtm)
 {
+	struct device *dev = rwtm_dev(rwtm);
 	struct armada_37xx_rwtm_tx_msg msg;
 	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
 	int ret;
@@ -210,10 +216,10 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
 	ret = mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
 	if (ret == -ENODATA) {
-		dev_warn(rwtm->dev,
+		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
 	} else if (ret == -ENOSYS) {
-		dev_notice(rwtm->dev,
+		dev_notice(dev,
 			   "Firmware does not support the BOARD_INFO command\n");
 	} else if (ret < 0) {
 		return ret;
@@ -245,9 +251,9 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
 	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
 	if (ret == -ENODATA) {
-		dev_warn(rwtm->dev, "Board has no public key burned!\n");
+		dev_warn(dev, "Board has no public key burned!\n");
 	} else if (ret == -ENOSYS) {
-		dev_notice(rwtm->dev,
+		dev_notice(dev,
 			   "Firmware does not support the ECDSA_PUB_KEY command\n");
 	} else if (ret < 0) {
 		return ret;
@@ -448,7 +454,7 @@ static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 
 	root = debugfs_create_dir("turris-mox-rwtm", NULL);
 
-	devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root);
+	devm_add_action_or_reset(rwtm_dev(rwtm), rwtm_debugfs_release, root);
 
 	debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sign_fops);
 }
@@ -473,7 +479,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (!rwtm)
 		return -ENOMEM;
 
-	rwtm->dev = dev;
 	rwtm->buf = dmam_alloc_coherent(dev, PAGE_SIZE, &rwtm->buf_phys,
 					GFP_KERNEL);
 	if (!rwtm->buf)
-- 
2.44.2

