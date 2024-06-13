Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50550C27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31346C4AF1C; Thu, 13 Jun 2024 16:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BE9C32789;
	Thu, 13 Jun 2024 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295061;
	bh=tZFkMyom4LPKKn0vPNlYjH1EaU3wiJwuxLlWGg5cu0Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMzgJT8k8W/XxVzInGajoljT+da+MeMxYQs1L/HI9ziCo2SKLtv4s0bpflDJQw3ZW
	 aPhHXvTeBhWM3Qslq/TYYaGIJ4q2dQtDwZHmMnZtKXXBCI4ATgLUhpivJx0poNF2Da
	 R0ces267EyXviQrooXW3PVRcQNgmEJeaUp+LDehzEsVzRjNhYHvb11cHhh4dS3QwgU
	 KUJywEdTzQmvogKyMeEBP8CJyGXp6z7Bd6ZY0nYHDSbpybMDHcmBXYz3lLp2YrwaVz
	 LVs9OgbxS9DyzvkO4R910PWYmI15LS48dgiBl98yqoEytxP6V2tMfB+JEKuaD+k5fA
	 jCPkF8a73WhQQ==
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
Subject: [PATCH v2 04/17] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
Date: Thu, 13 Jun 2024 18:10:32 +0200
Message-ID: <20240613161045.29606-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the ETH_ALEN macro instead of hardcoded 6 for MAC address length.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/firmware/turris-mox-rwtm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index b8deb13aed98..3a7969d15d27 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-mapping.h>
 #include <linux/hw_random.h>
+#include <linux/if_ether.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -67,7 +68,7 @@ struct mox_rwtm {
 	int has_board_info;
 	u64 serial_number;
 	int board_version, ram_size;
-	u8 mac_address1[6], mac_address2[6];
+	u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
 
 	/* public key burned in eFuse */
 	int has_pubkey;
-- 
2.44.2

