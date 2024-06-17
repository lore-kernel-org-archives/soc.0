Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66678C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B1C8C4AF1C; Mon, 17 Jun 2024 14:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38714C4AF1D;
	Mon, 17 Jun 2024 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635577;
	bh=m9Ap4DRQXDlrhv05clTlujfZTHJ87jS+3h1ZSvaZPyw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLDpKuuO5Dhqm7hMiYcy+lEEaMhQxXgYAilrhY7iAVBHEmEOXQ9tXLwitS9Q1gjmV
	 jm0lUcMIa7NrhQyTERtyiYMFV44kerHiSX2h3n/mvuGJZHBZD+5DypmJedrnrIPDN4
	 5g4bfcLdqRPU2yHY1ZcFvOXyxTB+dT9LWKSMFi4QR+FVvo6OxnK8gFpXFaXPkgzlcN
	 yo3WB/nMer9in5ppQeeq5oN07tDySnv9J6tJ5QCdgJz8eN44N3bwcR/4SF3JNAnSfg
	 qHZM5Lgn8gTH5xlMts01CqW7ECj/usS9mvv8qVjz9gNaAgmhj/wLPotlKc/ekfuCjD
	 MXfMgZxDvoJ2g==
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
Subject: [PATCH v3 16/17] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
Date: Mon, 17 Jun 2024 16:45:31 +0200
Message-ID: <20240617144532.17385-17-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
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
index 135adfa9fb1f..9197e0549c6d 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -138,7 +138,7 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_FAIL)
 		return -(int)MBOX_STS_VALUE(retval);
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 	else if (MBOX_STS_ERROR(retval) != MBOX_STS_SUCCESS)
 		return -EIO;
 	else
@@ -186,7 +186,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret == -ENODATA) {
 		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the BOARD_INFO command\n");
 	} else if (ret < 0) {
@@ -220,7 +220,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
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

