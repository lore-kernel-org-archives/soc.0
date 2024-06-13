Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A496C27C78
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A073C4AF1D; Thu, 13 Jun 2024 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF42C2BBFC;
	Thu, 13 Jun 2024 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295066;
	bh=5sUhV6nX9Vo/EEV46JLBxRD5cr/cO4CJxi1KWGIAUio=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qeL1ZLR9HIi725BCO0+aYNAL2cjdFbksx2OOU85LjnIPx2FSJlL+2SgJpgirwRc4G
	 ydZ3GZb0Tw7DZL4O77YwFSz+ZBHOard39VlulHMNCwYRe5wVfD2pzYzYM54F9aRXv0
	 1w6EH3J+D+m7xvT/RltNQ7CNCXLnLtr5sAe68sgz2ZpwCoEIMDLzI5Ev/qu8Cpl6SR
	 zrLLEhMa++fZ8VhwVoGz5tZs0GhxPTK0R+hLQoHzMnyLyHOTErHzA7yUy+TJss524S
	 GD5oQvZ8zqVx9UvXWHKHcesh8T/im6eqtSt7oidKyLmy01gJGF2TgAc5ZTaLNIkVVX
	 6nRtoibevZT9w==
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
Subject: [PATCH v2 06/17] firmware: turris-mox-rwtm: Hide signature related constants behind macros
Date: Thu, 13 Jun 2024 18:10:34 +0200
Message-ID: <20240613161045.29606-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
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
index 703b05c404e4..fb263f9bbab9 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019, 2024 Marek Behún <kabel@kernel.org>
  */
 
+#include <crypto/sha2.h>
 #include <linux/armada-37xx-rwtm-mailbox.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
@@ -29,6 +30,12 @@
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
@@ -83,7 +90,7 @@ struct mox_rwtm {
 	 * from userspace.
 	 */
 	struct dentry *debugfs_root;
-	u32 last_sig[34];
+	u32 last_sig[MOX_ECC_SIGNATURE_WORDS];
 	bool last_sig_done;
 #endif
 };
@@ -344,14 +351,15 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
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
@@ -366,8 +374,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	loff_t dummy = 0;
 	ssize_t ret;
 
-	/* the input is a SHA-512 hash, so exactly 64 bytes have to be read */
-	if (len != 64)
+	if (len != SHA512_DIGEST_SIZE)
 		return -EINVAL;
 
 	/* if last result is not zero user has not read that information yet */
@@ -388,17 +395,18 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
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
@@ -416,8 +424,10 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
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

