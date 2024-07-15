Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC469C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5477C4AF0B; Mon, 15 Jul 2024 10:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA60C32782;
	Mon, 15 Jul 2024 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040458;
	bh=8Xa2UhyieKUsXGB16/F+i+QUPtzQHAeGEKxGEogPFVg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGLeT8oPTTH82IlWeJdZFow651ilGWUu3Y0YIn51ZbY6QlNA0q1wm+hsaZTrpWfmp
	 fb3qWY9BNaaEx3ZOvWvqwBKmjzeDk6c1P30cMLwsK8BtEIFoInVdUAxrT0rq0fhgQv
	 wZ1pG8kExq65yD/l7QMCgkWfbgVhTBzFg124AuqfpI3HRYeFyqODNhH2jMsRetBkNE
	 H6pI0e86kshQ0UL+rAHj6Gg7YoJa6ybWItXINvzdgIjLe9gy9d0tu1A1XlawAX5co1
	 ti8VDs8igoJU5FtpZpd60OvLktqdQS/T5feYqVr4oohIZE6Caq2LNDwJPL9r7wP04M
	 ATCgf1twkpJcg==
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
Subject: [PATCH v4 04/19] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
Date: Mon, 15 Jul 2024 12:47:08 +0200
Message-ID: <20240715104723.17751-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the ETH_ALEN macro instead of hardcoded 6 for MAC address length.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index aafd747543f6..f7f9859b8f61 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-mapping.h>
 #include <linux/hw_random.h>
+#include <linux/if_ether.h>
 #include <linux/mailbox_client.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -69,7 +70,7 @@ struct mox_rwtm {
 	int has_board_info;
 	u64 serial_number;
 	int board_version, ram_size;
-	u8 mac_address1[6], mac_address2[6];
+	u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
 
 	/* public key burned in eFuse */
 	int has_pubkey;
-- 
2.44.2

