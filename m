Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDCCC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1835C32789; Thu, 13 Jun 2024 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93405C2BBFC;
	Thu, 13 Jun 2024 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295063;
	bh=c/FIgLy7vTlW+cKH3iunrz6w4aWB8+uhMsclcdHnxJU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8c2hYLGbeGqHJVv6kagMjg3sDldJOMZNUrPrwAwRW0fluwOhWOUJe8MOpoGEZBFi
	 KKr2XWFfuz0UMc5dJo97BiFK12v4ne7mSf6CizE4r1CCnrnZKws6xxBSbxdoGBmQuN
	 OCKuGw5Tci6bSqr8Cduv4i0MYuXEyjIyVtHxAsC26c+KxtK7n3ulZ/RDcMjLTp741U
	 os9KAClM/qr3/t43B76FXvljnDCTAYPRYVdxIhCE3H1q/T99ztko4ShDcEIfru5+Zg
	 hbWoOsz+pBbHUMw0k/2Eq3ykOE8pYm6/xX5nVAqmgyonncMkJ8poam9mnd/vlUKv6X
	 zNfVjPqFOumog==
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
Subject: [PATCH v2 05/17] firmware: turris-mox-rwtm: Use the boolean type where appropriate
Date: Thu, 13 Jun 2024 18:10:33 +0200
Message-ID: <20240613161045.29606-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
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
index 3a7969d15d27..703b05c404e4 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/types.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
 
@@ -65,13 +66,13 @@ struct mox_rwtm {
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
@@ -83,7 +84,7 @@ struct mox_rwtm {
 	 */
 	struct dentry *debugfs_root;
 	u32 last_sig[34];
-	int last_sig_done;
+	bool last_sig_done;
 #endif
 };
 
@@ -227,7 +228,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 				  reply->status[5]);
 		reply_to_mac_addr(rwtm->mac_address2, reply->status[6],
 				  reply->status[7]);
-		rwtm->has_board_info = 1;
+		rwtm->has_board_info = true;
 
 		pr_info("Turris Mox serial number %016llX\n",
 			rwtm->serial_number);
@@ -254,7 +255,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	} else {
 		u32 *s = reply->status;
 
-		rwtm->has_pubkey = 1;
+		rwtm->has_pubkey = true;
 		sprintf(rwtm->pubkey,
 			"%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
 			ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
@@ -351,7 +352,7 @@ static ssize_t do_sign_read(struct file *file, char __user *buf, size_t len,
 
 	/* 2 arrays of 17 32-bit words are 136 bytes */
 	ret = simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 136);
-	rwtm->last_sig_done = 0;
+	rwtm->last_sig_done = false;
 
 	return ret;
 }
@@ -417,7 +418,7 @@ static ssize_t do_sign_write(struct file *file, const char __user *buf,
 	 */
 	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
 	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
-	rwtm->last_sig_done = 1;
+	rwtm->last_sig_done = true;
 
 	mutex_unlock(&rwtm->busy);
 	return len;
-- 
2.44.2

