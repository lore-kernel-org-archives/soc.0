Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03817CA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFCB4C4CEC5; Sat, 31 Aug 2024 09:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7072C4CEC8;
	Sat, 31 Aug 2024 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096067;
	bh=AwT5qzxhp9vQo1GlsE1SlB7a3vvarFYBTj9yOuK6/iA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q8QZzeedWqfWgdPXplTYnwFIDjRI7dihxVXzRFRK5CZUKf9RsGuoq9NwbzXywJYL7
	 P1JSJ7sAsqeAMaY9kcF13n4k7oRYTORq62rOTUrkQCbMLT8AUYFDrSeYwVQJtvFkgO
	 WKijPh516iIub1HwAJB/M4UdCI46Z9D4xdCZI9/XhdgYg0+XSV1cYDZv/Dpqw6+w4r
	 +Or/yRK+jLkYfAqD7jmpv5niV5U7YXpIQSo7Ydv9DVd7oj8Etr1bACsqfhGKm5TwSB
	 rkqWOV0tlWIo34D7L7fKRKpR/heKWpi1VrzBss7Fr8IxMvIMszY9x7tHOu5SObDBwq
	 RftG3BjrSY13g==
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
Subject: [PATCH v5 04/16] firmware: turris-mox-rwtm: Hide signature related constants behind macros
Date: Sat, 31 Aug 2024 11:20:38 +0200
Message-ID: <20240831092050.23093-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hide signature generation related constants behind macros instead of
hardcoding the values.

Use SHA512_DIGEST_SIZE from crypto/sha2.h instead of hardcoded 64 as the
message size.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 36 ++++++++++++++++++------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 8875c35f9b19..cf8c605d99ef 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019, 2024 Marek Behún <kabel@kernel.org>
  */
 
+#include <crypto/sha2.h>
 #include <linux/armada-37xx-rwtm-mailbox.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
@@ -31,6 +32,11 @@
  * https://gitlab.labs.nic.cz/turris/mox-boot-builder/tree/master/wtmi.
  */
 
+#define MOX_ECC_NUMBER_WORDS	17
+#define MOX_ECC_NUMBER_LEN	(MOX_ECC_NUMBER_WORDS * sizeof(u32))
+
+#define MOX_ECC_SIGNATURE_WORDS	(2 * MOX_ECC_NUMBER_WORDS)
+
 #define MBOX_STS_SUCCESS	(0 << 30)
 #define MBOX_STS_FAIL		(1 << 30)
 #define MBOX_STS_BADCMD		(2 << 30)
@@ -85,7 +91,7 @@ struct mox_rwtm {
 	 * from userspace.
 	 */
 	struct dentry *debugfs_root;
-	u32 last_sig[34];
+	u32 last_sig[MOX_ECC_SIGNATURE_WORDS];
 	bool last_sig_done;
 #endif
 };
@@ -341,18 +347,18 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
 	struct mox_rwtm *rwtm = file->private_data;
 	ssize_t ret;
 
-	/* only allow one read, of 136 bytes, from position 0 */
+	/* only allow one read, of whole signature, from position 0 */
 	if (*ppos != 0)
 		return 0;
 
-	if (len < 136)
+	if (len < sizeof(rwtm->last_sig))
 		return -EINVAL;
 
 	if (!rwtm->last_sig_done)
 		return -ENODATA;
 
-	/* 2 arrays of 17 32-bit words are 136 bytes */
-	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 136);
+	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig,
+				      sizeof(rwtm->last_sig));
 	rwtm->last_sig_done = false;
 
 	return ret;
@@ -367,8 +373,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	loff_t dummy = 0;
 	ssize_t ret;
 
-	/* the input is a SHA-512 hash, so exactly 64 bytes have to be read */
-	if (len != 64)
+	if (len != SHA512_DIGEST_SIZE)
 		return -EINVAL;
 
 	/* if last result is not zero user has not read that information yet */
@@ -389,17 +394,18 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
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
@@ -417,8 +423,10 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 * computed by the rWTM firmware and convert their words from
 	 * LE to BE.
 	 */
-	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
-	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
+	memcpy(rwtm->last_sig, rwtm->buf + MOX_ECC_NUMBER_LEN,
+	       sizeof(rwtm->last_sig));
+	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig,
+			  MOX_ECC_SIGNATURE_WORDS);
 	rwtm->last_sig_done = true;
 
 	mutex_unlock(&rwtm->busy);
-- 
2.44.2

