Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0CC3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0AC7C32782; Mon, 15 Jul 2024 10:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53F8C4AF0A;
	Mon, 15 Jul 2024 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040490;
	bh=fZXp5znfN0w2WN+UlYs07thNJDMXh+5ZEjk8LG8Hru4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WLbhAdyJc2NJgKcJRl48d9JXcqRg/F4t/kB1wgL8RwIs7JkOIB3PD6bRtBAB/7Q1A
	 sytnkxnulsy0RlKHVB/Pzkry5uGKLbkdyeZC9mdc8iDorEea6qE0OEngANCjqRwRO+
	 31lDhQBpdcaKTdWBuacrb2sRUcx5sA4/paFb1OFeNKYmOs2Rwkhlxz3pu1JrlpQIRi
	 gYNLUr2EN3nhUgueeIz1ok+9GE6ucQDCQAZgz9cqkhc69yYMzKr7szwdS1P5I88TyI
	 vtX4JYZ/oOmBsRaiBQGdy820at++gV8R03roion/lOR6D7ccQhwJwWkdCraNYvvOf9
	 X/MYS20U989Rg==
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
Subject: [PATCH v4 17/19] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
Date: Mon, 15 Jul 2024 12:47:21 +0200
Message-ID: <20240715104723.17751-18-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checkpatch warns agains -ENOSYS:
  WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Use EOPNOTSUPP instead.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 52f97235c3a6..a9391705f5b4 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -137,7 +137,7 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_FAIL)
 		return -(int)MBOX_STS_VALUE(retval);
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 	else if (MBOX_STS_ERROR(retval) != MBOX_STS_SUCCESS)
 		return -EIO;
 	else
@@ -185,7 +185,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret == -ENODATA) {
 		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the BOARD_INFO command\n");
 	} else if (ret < 0) {
@@ -219,7 +219,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
 	if (ret == -ENODATA) {
 		dev_warn(dev, "Board has no public key burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the ECDSA_PUB_KEY command\n");
 	} else if (ret < 0) {
-- 
2.44.2

