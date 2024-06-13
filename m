Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7EC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3161DC32789; Thu, 13 Jun 2024 16:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09418C2BBFC;
	Thu, 13 Jun 2024 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295084;
	bh=55GghQejX7nb7g6k/8wT9vG0nONR5JYBKQRC3HvgmJY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYrf1ro4fIumOK3z5EpxQ8yr8bFyVWvnhoc50qCZHL0BhcVK+4h8VofDZJNGKJNlY
	 f3VtWCHummIIW3rdnWjHHjeBpCLK5LsggXaU71zDCCQL2+8Z1vpsupJ9WuH5RAr3qA
	 Vw+rmgg42bQTSDAbQ8GqqfBqeQYbajCK7y6c1v3Vv7Oy6SJpcvlJuRNIRKXXyDJA/1
	 yNWmehTu37jxrts8L6XDHfF439hIJVe+2XhydzsVkvbcqRzvjGLqbYD48dfq1YUcdI
	 8TfI8FyoRjDoAcZOQacevdPprJlLEvVkTmhDUmy80xeaJIXOkGR6kYcRsfXk5fiDBC
	 N7DcrjCBRuV3A==
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
Subject: [PATCH v2 13/17] firmware: turris-mox-rwtm: Drop redundant device pointer
Date: Thu, 13 Jun 2024 18:10:41 +0200
Message-ID: <20240613161045.29606-14-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop redundant device pointer from driver's private structure.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 35c2a899caab..e1142083186c 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -60,7 +60,6 @@ enum mbox_cmd {
 };
 
 struct mox_rwtm {
-	struct device *dev;
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
 	struct hwrng hwrng;
@@ -95,6 +94,11 @@ struct mox_rwtm {
 #endif
 };
 
+static inline struct device *rwtm_dev(struct mox_rwtm *rwtm)
+{
+	return rwtm->mbox_client.dev;
+}
+
 #define MOX_ATTR_RO(name, format, cat)				\
 static ssize_t							\
 name##_show(struct device *dev, struct device_attribute *a,	\
@@ -163,6 +167,7 @@ static void reply_to_mac_addr(u8 *mac, u32 t1, u32 t2)
 
 static int mox_get_board_info(struct mox_rwtm *rwtm)
 {
+	struct device *dev = rwtm_dev(rwtm);
 	struct armada_37xx_rwtm_tx_msg msg;
 	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
 	int ret;
@@ -177,10 +182,10 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
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
@@ -212,9 +217,9 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
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
@@ -415,7 +420,7 @@ static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 
 	root = debugfs_create_dir("turris-mox-rwtm", NULL);
 
-	devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root);
+	devm_add_action_or_reset(rwtm_dev(rwtm), rwtm_debugfs_release, root);
 
 	debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sign_fops);
 }
@@ -445,7 +450,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (!rwtm)
 		return -ENOMEM;
 
-	rwtm->dev = dev;
 	rwtm->buf = dmam_alloc_coherent(dev, RWTM_DMA_BUFFER_SIZE,
 					&rwtm->buf_phys, GFP_KERNEL);
 	if (!rwtm->buf)
-- 
2.44.2

