Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08868C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7518C4AF0E; Mon, 15 Jul 2024 10:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC87AC4AF0A;
	Mon, 15 Jul 2024 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040495;
	bh=ra4UQDdEcA4b5Z3A9nyljWhOjo6TN9B8ZBY2ZwYX6gI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKjWaTclRAy0MEGW8/2aOWALLaRxTROYKwi2goJ14PKUkiP9owGfFSWuISPTOBWZD
	 WOF+iveprDd/WOid5utMR0qfqg/+4J6EASVjgFTDlA0xPpPjP4eFZP+XV1rCvuN54c
	 YawXxwh2FYaSvsc575C5DUdIUcrPnyNltqt65qbVDcCls090dRi2mqrKMTvl6i2vl4
	 NGaAkjtfWC/qPegDA+MqJ3/Gt4AzvCIyReIRB2zPPsQlXzkcwQluKEvxSZzu56UMFJ
	 Q8zVzHi6gCkMvn2B1ahbTmG12JP9TCa0l93Tua0K48jMEY53y5xiFKGoblPN9OkGIe
	 KfVW1yjfV/fig==
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
Subject: [PATCH v4 19/19] firmware: turris-mox-rwtm: Deduplicate command execution code
Date: Mon, 15 Jul 2024 12:47:23 +0200
Message-ID: <20240715104723.17751-20-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Deduplicate rWTM command execution calls
  mbox_send_message()
  wait_for_completion()
  mox_get_status()
to one function
  mox_rwtm_exec()

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 98 ++++++++++++------------------
 1 file changed, 39 insertions(+), 59 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 0c7d8c96ea17..525ebdc7ded5 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -157,6 +157,34 @@ static void mox_rwtm_rx_callback(struct mbox_client *cl, void *data)
 	complete(&rwtm->cmd_done);
 }
 
+static int mox_rwtm_exec(struct mox_rwtm *rwtm, enum mbox_cmd cmd,
+			 struct armada_37xx_rwtm_tx_msg *msg,
+			 bool interruptible)
+{
+	struct armada_37xx_rwtm_tx_msg _msg = {};
+	int ret;
+
+	if (!msg)
+		msg = &_msg;
+
+	msg->command = cmd;
+
+	ret = mbox_send_message(rwtm->mbox, msg);
+	if (ret < 0)
+		return ret;
+
+	if (interruptible) {
+		ret = wait_for_completion_interruptible(&rwtm->cmd_done);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
+			return -ETIMEDOUT;
+	}
+
+	return mox_get_status(cmd, rwtm->reply.retval);
+}
+
 static void reply_to_mac_addr(u8 *mac, u32 t1, u32 t2)
 {
 	mac[0] = t1 >> 8;
@@ -170,19 +198,10 @@ static void reply_to_mac_addr(u8 *mac, u32 t1, u32 t2)
 static int mox_get_board_info(struct mox_rwtm *rwtm)
 {
 	struct device *dev = rwtm_dev(rwtm);
-	struct armada_37xx_rwtm_tx_msg msg;
 	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
 	int ret;
 
-	msg.command = MBOX_CMD_BOARD_INFO;
-	ret = mbox_send_message(rwtm->mbox, &msg);
-	if (ret < 0)
-		return ret;
-
-	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
-		return -ETIMEDOUT;
-
-	ret = mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
+	ret = mox_rwtm_exec(rwtm, MBOX_CMD_BOARD_INFO, NULL, false);
 	if (ret == -ENODATA) {
 		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
@@ -209,15 +228,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 		pr_info("           burned RAM size %i MiB\n", rwtm->ram_size);
 	}
 
-	msg.command = MBOX_CMD_ECDSA_PUB_KEY;
-	ret = mbox_send_message(rwtm->mbox, &msg);
-	if (ret < 0)
-		return ret;
-
-	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
-		return -ETIMEDOUT;
-
-	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
+	ret = mox_rwtm_exec(rwtm, MBOX_CMD_ECDSA_PUB_KEY, NULL, false);
 	if (ret == -ENODATA) {
 		dev_warn(dev, "Board has no public key burned!\n");
 	} else if (ret == -EOPNOTSUPP) {
@@ -240,37 +251,23 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 
 static int check_get_random_support(struct mox_rwtm *rwtm)
 {
-	struct armada_37xx_rwtm_tx_msg msg;
-	int ret;
-
-	msg.command = MBOX_CMD_GET_RANDOM;
-	msg.args[0] = 1;
-	msg.args[1] = rwtm->buf_phys;
-	msg.args[2] = 4;
-
-	ret = mbox_send_message(rwtm->mbox, &msg);
-	if (ret < 0)
-		return ret;
-
-	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
-		return -ETIMEDOUT;
+	struct armada_37xx_rwtm_tx_msg msg = {
+		.args = { 1, rwtm->buf_phys, 4 },
+	};
 
-	return mox_get_status(MBOX_CMD_GET_RANDOM, rwtm->reply.retval);
+	return mox_rwtm_exec(rwtm, MBOX_CMD_GET_RANDOM, &msg, false);
 }
 
 static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
 	struct mox_rwtm *rwtm = container_of(rng, struct mox_rwtm, hwrng);
-	struct armada_37xx_rwtm_tx_msg msg;
+	struct armada_37xx_rwtm_tx_msg msg = {
+		.args = { 1, rwtm->buf_phys, ALIGN(max, 4) },
+	};
 	int ret;
 
 	max = min(max, RWTM_DMA_BUFFER_SIZE);
 
-	msg.command = MBOX_CMD_GET_RANDOM;
-	msg.args[0] = 1;
-	msg.args[1] = rwtm->buf_phys;
-	msg.args[2] = ALIGN(max, 4);
-
 	if (!wait) {
 		if (!mutex_trylock(&rwtm->busy))
 			return -EBUSY;
@@ -278,15 +275,7 @@ static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 		mutex_lock(&rwtm->busy);
 	}
 
-	ret = mbox_send_message(rwtm->mbox, &msg);
-	if (ret < 0)
-		goto unlock_mutex;
-
-	ret = wait_for_completion_interruptible(&rwtm->cmd_done);
-	if (ret < 0)
-		goto unlock_mutex;
-
-	ret = mox_get_status(MBOX_CMD_GET_RANDOM, rwtm->reply.retval);
+	ret = mox_rwtm_exec(rwtm, MBOX_CMD_GET_RANDOM, &msg, true);
 	if (ret < 0)
 		goto unlock_mutex;
 
@@ -333,7 +322,6 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 			     size_t len, loff_t *ppos)
 {
 	struct mox_rwtm *rwtm = file->private_data;
-	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
 	struct armada_37xx_rwtm_tx_msg msg;
 	loff_t dummy = 0;
 	ssize_t ret;
@@ -366,23 +354,15 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 		goto unlock_mutex;
 	be32_to_cpu_array(rwtm->buf, rwtm->buf, MOX_ECC_NUMBER_WORDS);
 
-	msg.command = MBOX_CMD_SIGN;
 	msg.args[0] = 1;
 	msg.args[1] = rwtm->buf_phys;
 	msg.args[2] = rwtm->buf_phys + MOX_ECC_NUMBER_LEN;
 	msg.args[3] = rwtm->buf_phys + 2 * MOX_ECC_NUMBER_LEN;
-	ret = mbox_send_message(rwtm->mbox, &msg);
-	if (ret < 0)
-		goto unlock_mutex;
 
-	ret = wait_for_completion_interruptible(&rwtm->cmd_done);
+	ret = mox_rwtm_exec(rwtm, MBOX_CMD_SIGN, &msg, true);
 	if (ret < 0)
 		goto unlock_mutex;
 
-	ret = MBOX_STS_VALUE(reply->retval);
-	if (MBOX_STS_ERROR(reply->retval) != MBOX_STS_SUCCESS)
-		goto unlock_mutex;
-
 	/*
 	 * Here we read the R and S values of the ECDSA signature
 	 * computed by the rWTM firmware and convert their words from
-- 
2.44.2

