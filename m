Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99915C27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D90FC4AF1C; Wed, 12 Jun 2024 13:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756ACC4AF1A;
	Wed, 12 Jun 2024 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200503;
	bh=OtJMZCrUsbmNab955NgjcKdtWPN6mrFbBfHlEtFgF6c=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ho9DrH0GD7FVpt2NcpogoQzI/Ok5RimLilivij1Tx4ZCApERWjYx8nFvf9XQBQUBt
	 C3dzBHJNQvPVjob/UYL/f0uLWzj9Zkayfp6s8FS/K7DIDU/fOWC3QPRrix2nNDvLZL
	 RTivfyzVEqoXXEiAJcAtpdi2Znr7jcR8Xnli8wRUXuRcVPFBe/ZFtg92p0wNLli4+T
	 nkB0OB9/JzyRFkb6DjmM4gvlFoGaKiqdA689ip5RRdKHUAk2Gk1P0LhvgpM0yDUwSw
	 rt4FPmQpB/lDx/qtzZiXTwGy15pRhU2dTh+8mbc7Cydw1gmtbrc2xN9eA+L6r9+TRm
	 F2qh5eRGRf6LQ==
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
Subject: [PATCH 06/19] firmware: turris-mox-rwtm: Hide signature related constants behind macros
Date: Wed, 12 Jun 2024 15:54:30 +0200
Message-ID: <20240612135443.30239-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hide signature generation related constants behind macros instead of
hardcoding the values.

Use SHA512_DIGEST_SIZE from crypto/sha2.h instead of hardcoded 64 as the
message size.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 34 +++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index b7212bdc301d..254629437f59 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019, 2024 Marek Behún <kabel@kernel.org>
  */
 
+#include <crypto/sha2.h>
 #include <linux/armada-37xx-rwtm-mailbox.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
@@ -27,6 +28,12 @@
  * https://gitlab.labs.nic.cz/turris/mox-boot-builder/tree/master/wtmi.
  */
 
+#define MOX_ECC_NUMBER_WORDS	17
+#define MOX_ECC_NUMBER_LEN	(MOX_ECC_NUMBER_WORDS * sizeof(u32))
+
+#define MOX_ECC_SIGNATURE_WORDS	(2 * MOX_ECC_NUMBER_WORDS)
+#define MOX_ECC_SIGNATURE_LEN	(MOX_ECC_NUMBER_WORDS * sizeof(u32))
+
 #define MBOX_STS_SUCCESS	(0 << 30)
 #define MBOX_STS_FAIL		(1 << 30)
 #define MBOX_STS_BADCMD		(2 << 30)
@@ -81,7 +88,7 @@ struct mox_rwtm {
 	 * from userspace.
 	 */
 	struct dentry *debugfs_root;
-	u32 last_sig[34];
+	u32 last_sig[MOX_ECC_SIGNATURE_WORDS];
 	bool last_sig_done;
 #endif
 };
@@ -342,14 +349,15 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
 	if (*ppos != 0)
 		return 0;
 
-	if (len < 136)
+	if (len < MOX_ECC_SIGNATURE_LEN)
 		return -EINVAL;
 
 	if (!rwtm->last_sig_done)
 		return -ENODATA;
 
 	/* 2 arrays of 17 32-bit words are 136 bytes */
-	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 136);
+	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig,
+				      MOX_ECC_SIGNATURE_LEN);
 	rwtm->last_sig_done = false;
 
 	return ret;
@@ -364,8 +372,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	loff_t dummy = 0;
 	ssize_t ret;
 
-	/* the input is a SHA-512 hash, so exactly 64 bytes have to be read */
-	if (len != 64)
+	if (len != SHA512_DIGEST_SIZE)
 		return -EINVAL;
 
 	/* if last result is not zero user has not read that information yet */
@@ -386,17 +393,18 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 *   3. Address of the buffer where ECDSA signature value S shall be
 	 *      stored by the rWTM firmware.
 	 */
-	memset(rwtm->buf, 0, 4);
-	ret = simple_write_to_buffer(rwtm->buf + 4, 64, &dummy, buf, len);
+	memset(rwtm->buf, 0, sizeof(u32));
+	ret = simple_write_to_buffer(rwtm->buf + sizeof(u32),
+				     SHA512_DIGEST_SIZE, &dummy, buf, len);
 	if (ret < 0)
 		goto unlock_mutex;
-	be32_to_cpu_array(rwtm->buf, rwtm->buf, 17);
+	be32_to_cpu_array(rwtm->buf, rwtm->buf, MOX_ECC_NUMBER_WORDS);
 
 	msg.command = MBOX_CMD_SIGN;
 	msg.args[0] = 1;
 	msg.args[1] = rwtm->buf_phys;
-	msg.args[2] = rwtm->buf_phys + 68;
-	msg.args[3] = rwtm->buf_phys + 2 * 68;
+	msg.args[2] = rwtm->buf_phys + MOX_ECC_NUMBER_LEN;
+	msg.args[3] = rwtm->buf_phys + 2 * MOX_ECC_NUMBER_LEN;
 	ret = mbox_send_message(rwtm->mbox, &msg);
 	if (ret < 0)
 		goto unlock_mutex;
@@ -414,8 +422,10 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 * computed by the rWTM firmware and convert their words from
 	 * LE to BE.
 	 */
-	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
-	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
+	memcpy(rwtm->last_sig, rwtm->buf + MOX_ECC_NUMBER_LEN,
+	       MOX_ECC_SIGNATURE_LEN);
+	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig,
+			  MOX_ECC_SIGNATURE_WORDS);
 	rwtm->last_sig_done = true;
 
 	mutex_unlock(&rwtm->busy);
-- 
2.44.2

