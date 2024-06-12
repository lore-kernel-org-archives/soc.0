Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB5DC27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3372C3277B; Wed, 12 Jun 2024 13:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAACDC4AF1C;
	Wed, 12 Jun 2024 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200535;
	bh=XwoWP6pEFsDmCWAubVOo61604qzI/mvr37a1NpuVFMM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHHJ+YVz9QEijtJJcfytvQVNd3ZEiu4mkzKjuSj/K/HJIm/VTG50c8PHSibhYaRcW
	 uHAn08lmDD4pEblxYa8Os/Upro5Xs92D1l2SZpHTi/G34FgnbOBYuoEkVZ21vnR2QG
	 PEKmCk/beEbapgJW1yv9mkAHk0ldn25WG49WI3PWMSaOltgszIrwAaRocJRwCY7jJE
	 es3fwMCC/CrZjiLTzRK7aP02U8m0rc4+8PRysIGp9wtFVX4+/9vB5Zb/v3opaH5HQc
	 cg0VarXGtPjNaVASLhk37W4RR4BIgQDNnGnQfEreVKeSX7lJtEApEg9Qxn8wQ6I7tT
	 5BKtbELBaG9NA==
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
Subject: [PATCH 19/19] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
Date: Wed, 12 Jun 2024 15:54:43 +0200
Message-ID: <20240612135443.30239-20-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checkpatch warns agains -ENOSYS:
  WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Use EOPNOTSUPP instead.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index ea5ff1827d08..d1e5ee37aca4 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -170,7 +170,7 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_FAIL)
 		return -(int)MBOX_STS_VALUE(retval);
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 	else if (MBOX_STS_ERROR(retval) != MBOX_STS_SUCCESS)
 		return -EIO;
 	else
@@ -237,7 +237,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret == -ENODATA) {
 		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the BOARD_INFO command\n");
 	} else if (ret < 0) {
@@ -263,7 +263,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	ret = mox_rwtm_exec(rwtm, MBOX_CMD_ECDSA_PUB_KEY, NULL, false);
 	if (ret == -ENODATA) {
 		dev_warn(dev, "Board has no public key burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the ECDSA_PUB_KEY command\n");
 	} else if (ret < 0) {
-- 
2.44.2

