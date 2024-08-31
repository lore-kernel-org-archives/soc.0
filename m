Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8661CA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCCAEC4CEC0; Sat, 31 Aug 2024 09:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45F9C4CEC7;
	Sat, 31 Aug 2024 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096091;
	bh=fZXp5znfN0w2WN+UlYs07thNJDMXh+5ZEjk8LG8Hru4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWCmo/SUPrjaQbDNNSRYHUKFu0qzqsXDRFULweViPBp/DxX+CymjsbDVnF8Ew/51g
	 OVG8URY+mkpIdH+yEPCf3jSTGTtd3Da3Qbf5rVNUwc8H4/y/Eqnjf0f3ufaJLAeMf0
	 DzcNR+GD8M5y1FxMZZmXTytwstxKiXsGH+tZUEKv57EUVQud7moIby2Dnw7aYPPTqb
	 x+bb6FihjFqCic3bB/qwbXj3Oiu9d3JIBqV+niZzUmjg3NgdtoXtzlIOltulvVLc9+
	 1+LZCJWiOR2ZYmg/OR7xQrY8mVUTb4R96ST3GXWU5sjvTRiATjiAB1ifYWDtesFuQE
	 bkoArSCsNZgmw==
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
Subject: [PATCH v5 14/16] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
Date: Sat, 31 Aug 2024 11:20:48 +0200
Message-ID: <20240831092050.23093-15-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
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

