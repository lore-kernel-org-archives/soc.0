Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50FCA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFEBCC4CEC5; Sat, 31 Aug 2024 09:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72F5C4CEC7;
	Sat, 31 Aug 2024 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096084;
	bh=jbqAfRXeCbJK3CKZJ1Pv0ED1fDxWbljUDKYPCI6fzjg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cHNgLMWjwz0TpznoNLFlYkHa2qjCyh2ez29x3s/A+6ELwZDKhhLC9oO4cOnM1DZNR
	 d7XjxLVwaoRLZBfBA5HK8h7XMFK7A5L9i7oOgFSNTNhI/z9uRpvQBZkf5ZLoiOdj43
	 0JYiNfCHDuVQIrqVtGSNDmmP/a8mfRgRJ2GjTMnrW9s0nSZZuxyPMcsjp/cAx6Ttd+
	 B+1odkGirtlzg6MKmYMdSMnWr32Eot1hyWebtt2eBNYKJ17W/JtgQZqnXzmTZh9on0
	 IOSxJO8dU57whEdXkomPvnWaink3h4a7rwsHOsOEfL5NcIikwByZzdLeYsi+wcwiXI
	 ZsKCIWZ6y1lyg==
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
Subject: [PATCH v5 11/16] firmware: turris-mox-rwtm: Drop redundant device pointer
Date: Sat, 31 Aug 2024 11:20:45 +0200
Message-ID: <20240831092050.23093-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop redundant device pointer from driver's private structure.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index f291df9a72ff..d12e29625022 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -61,7 +61,6 @@ enum mbox_cmd {
 };
 
 struct mox_rwtm {
-	struct device *dev;
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
 	struct hwrng hwrng;
@@ -96,6 +95,11 @@ struct mox_rwtm {
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
@@ -164,6 +168,7 @@ static void reply_to_mac_addr(u8 *mac, u32 t1, u32 t2)
 
 static int mox_get_board_info(struct mox_rwtm *rwtm)
 {
+	struct device *dev = rwtm_dev(rwtm);
 	struct armada_37xx_rwtm_tx_msg msg;
 	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
 	int ret;
@@ -178,10 +183,10 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
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
@@ -213,9 +218,9 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
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
@@ -416,7 +421,7 @@ static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
 
 	debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sign_fops);
 
-	devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root);
+	devm_add_action_or_reset(rwtm_dev(rwtm), rwtm_debugfs_release, root);
 }
 #else
 static inline void rwtm_register_debugfs(struct mox_rwtm *rwtm)
@@ -444,7 +449,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (!rwtm)
 		return -ENOMEM;
 
-	rwtm->dev = dev;
 	rwtm->buf = dmam_alloc_coherent(dev, RWTM_DMA_BUFFER_SIZE,
 					&rwtm->buf_phys, GFP_KERNEL);
 	if (!rwtm->buf)
-- 
2.44.2

