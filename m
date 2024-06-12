Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA41C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 178C2C4AF4D; Wed, 12 Jun 2024 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31A6C4AF1C;
	Wed, 12 Jun 2024 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200501;
	bh=UJKLQjeHEA1kG0tFDE2J4AMYNSgru3E+9THu5hnfly8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RFBO+XKB3KJveH36q1i5lqL1uCOMgbUced9qaKYGgigyFspEURegSnDZODKsshEcs
	 NuZz+ge9dnDVrOmakC2re6gKwRKqjDpjTu34aiQsG+UyOO6YqequQ2lCK7jIHbEvJr
	 pgrvxvB/2s28RM6pO/Xakh1qy0XzIQCooPnGCebUaCgAhq8qSLDBJY6Doopg+u388t
	 oaSMnomKTiObzTA/nBKVr8xjbmGvtZ2ql3q0QceLI/tX/zQY9PYnjN4DaFTGAT3iWD
	 1pUUQfwHXhHNc7GpzSuHCHHbfxke3uCCHNUk0QxwkzpLRl9OkepnqxkqnCxzF1L0qf
	 4aO15shzdeNoA==
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
Subject: [PATCH 05/19] firmware: turris-mox-rwtm: Use the boolean type where appropriate
Date: Wed, 12 Jun 2024 15:54:29 +0200
Message-ID: <20240612135443.30239-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the boolean type for has_board_info, has_pubkey and last_sig_done
members of the driver's private structure.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 1b708a0760e6..b7212bdc301d 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/types.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
 
@@ -63,13 +64,13 @@ struct mox_rwtm {
 	struct completion cmd_done;
 
 	/* board information */
-	int has_board_info;
+	bool has_board_info;
 	u64 serial_number;
 	int board_version, ram_size;
 	u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
 
 	/* public key burned in eFuse */
-	int has_pubkey;
+	bool has_pubkey;
 	u8 pubkey[135];
 
 #ifdef CONFIG_DEBUG_FS
@@ -81,7 +82,7 @@ struct mox_rwtm {
 	 */
 	struct dentry *debugfs_root;
 	u32 last_sig[34];
-	int last_sig_done;
+	bool last_sig_done;
 #endif
 };
 
@@ -225,7 +226,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 				  reply->status[5]);
 		reply_to_mac_addr(rwtm->mac_address2, reply->status[6],
 				  reply->status[7]);
-		rwtm->has_board_info = 1;
+		rwtm->has_board_info = true;
 
 		pr_info("Turris Mox serial number %016llX\n",
 			rwtm->serial_number);
@@ -252,7 +253,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	} else {
 		u32 *s = reply->status;
 
-		rwtm->has_pubkey = 1;
+		rwtm->has_pubkey = true;
 		sprintf(rwtm->pubkey,
 			"%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
 			ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
@@ -349,7 +350,7 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
 
 	/* 2 arrays of 17 32-bit words are 136 bytes */
 	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 136);
-	rwtm->last_sig_done = 0;
+	rwtm->last_sig_done = false;
 
 	return ret;
 }
@@ -415,7 +416,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 */
 	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
 	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
-	rwtm->last_sig_done = 1;
+	rwtm->last_sig_done = true;
 
 	mutex_unlock(&rwtm->busy);
 	return len;
-- 
2.44.2

