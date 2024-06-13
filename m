Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E2EC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6379C4AF1C; Thu, 13 Jun 2024 16:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEABDC2BBFC;
	Thu, 13 Jun 2024 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295091;
	bh=Df/Dkob1b0VVO8dg7dYO2hLQ98+FMH0QNMv3Kp2BTEI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKcn7nzBMaM1tbwlkXLF7h+cCPQuwgPi3zn0U+1y6rEJ8Z3XvmoPwUd0c9VHYpeh4
	 jvPdjNM0MoMYgeYLM30iGvjdax7o3BxclRtKEXK067QF+Ady34Hvz7Wz57jbGlmlS5
	 kqddJU0x3XjU+zHPBNxianQNUkIj5kovHbQuNbHjjUVb5xJQPOHKicebx3hZ4EAGDl
	 IBr4iko1bLfJaIF/pHGvUVdRuaGNwp98kvgY0euBUwCsFj2vvT3uyhnk7jjRdaDU1V
	 zqOaKfdkpy6xz92t4bd+nCiTezrCOZglC8MiIvSHPoR2vd0xgBo9LGmfCk4fA1h1/S
	 rVKJ3LAXA/zOg==
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
Subject: [PATCH v2 16/17] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
Date: Thu, 13 Jun 2024 18:10:44 +0200
Message-ID: <20240613161045.29606-17-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
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
index 4c445f6b8140..2ea378fec414 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -136,7 +136,7 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_FAIL)
 		return -(int)MBOX_STS_VALUE(retval);
 	else if (MBOX_STS_ERROR(retval) == MBOX_STS_BADCMD)
-		return -ENOSYS;
+		return -EOPNOTSUPP;
 	else if (MBOX_STS_ERROR(retval) != MBOX_STS_SUCCESS)
 		return -EIO;
 	else
@@ -184,7 +184,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret == -ENODATA) {
 		dev_warn(dev,
 			 "Board does not have manufacturing information burned!\n");
-	} else if (ret == -ENOSYS) {
+	} else if (ret == -EOPNOTSUPP) {
 		dev_notice(dev,
 			   "Firmware does not support the BOARD_INFO command\n");
 	} else if (ret < 0) {
@@ -218,7 +218,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
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

