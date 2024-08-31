Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90923CA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F46FC4CEC7; Sat, 31 Aug 2024 09:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7670CC4CECB;
	Sat, 31 Aug 2024 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096065;
	bh=iAZ6bIn+WN0rB7kQZOlw9v8V713pYkJzGxek3pkoSX4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItIIsvmjyr9LKF5S9W295eiejNSDyOamHEMP3cicTOXJho4jQUgEy/8SNSS0z8JiW
	 b1Rpu0jzDMdoNR8W6eQfiEwvMwiQxbj7oVQRKC/e713k3pSz8zALNIT5AuzPpV3Q5N
	 LbWEj68PTIT1HOPGbe3WSAASknf+sS7mDPa98WzuXGH3lBFlQaNm+imyAT72lb9j/Z
	 pdVa6bgWbFnq/iNYmuAZpp8M1LGhMukm7llssAMrN/P2QQs9/2wW8oboqdx1G1nbTG
	 oALiSH5nHyqkEpgBbVOWOnkWkqEKCiGsg81CDoEHfXToK6fqX/EvNBNJasacgoNcof
	 sB4qPLSRX3lRA==
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
Subject: [PATCH v5 03/16] firmware: turris-mox-rwtm: Use the boolean type where appropriate
Date: Sat, 31 Aug 2024 11:20:37 +0200
Message-ID: <20240831092050.23093-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the boolean type for has_board_info, has_pubkey and last_sig_done
members of the driver's private structure.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index d3ce093d4835..8875c35f9b19 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/types.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
 
@@ -67,13 +68,13 @@ struct mox_rwtm {
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
@@ -85,7 +86,7 @@ struct mox_rwtm {
 	 */
 	struct dentry *debugfs_root;
 	u32 last_sig[34];
-	int last_sig_done;
+	bool last_sig_done;
 #endif
 };
 
@@ -229,7 +230,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 				  reply->status[5]);
 		reply_to_mac_addr(rwtm->mac_address2, reply->status[6],
 				  reply->status[7]);
-		rwtm->has_board_info = 1;
+		rwtm->has_board_info = true;
 
 		pr_info("Turris Mox serial number %016llX\n",
 			rwtm->serial_number);
@@ -256,7 +257,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	} else {
 		u32 *s = reply->status;
 
-		rwtm->has_pubkey = 1;
+		rwtm->has_pubkey = true;
 		sprintf(rwtm->pubkey,
 			"%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
 			ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
@@ -352,7 +353,7 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
 
 	/* 2 arrays of 17 32-bit words are 136 bytes */
 	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 136);
-	rwtm->last_sig_done = 0;
+	rwtm->last_sig_done = false;
 
 	return ret;
 }
@@ -418,7 +419,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 */
 	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
 	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
-	rwtm->last_sig_done = 1;
+	rwtm->last_sig_done = true;
 
 	mutex_unlock(&rwtm->busy);
 	return len;
-- 
2.44.2

