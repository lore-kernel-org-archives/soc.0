Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DC3C27C7B
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98BA2C4AF1A; Wed, 12 Jun 2024 13:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8061AC116B1;
	Wed, 12 Jun 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200498;
	bh=tgU8PCpcoAUSUZevpHCTHRC2Bimt3v7p8oXarkB55Xc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tuNb7KtvIGpoZzVxziBmgZkxBeoWo1ByaOVT2pvhe6kdwz3jvoKmRcAFxzwib15G8
	 8yNj4gqUqinoudk25WkS4p3/U1cf23ZjChaGVYd1y7hctYS2u3TxDCJMKcpLp70Ntv
	 nmBOOl/jkK6SwQkA4aMO2Iy/GY4OYqkVwTvnbe6zKMuLtH5WThXRtSWoZ3/bgH9i+T
	 sDIPobz3Ws8GYjBzBm7kpT5T5OTUCdmddDvDJZtyM4y1xGF+zACIdpa6xGy58tUvqo
	 dzc5yz4GxE4bgsi6EGRYBbIgUJt0DVD0kqXbxrg61igG1D1gBXBFrkbJF5Pe6L4T9B
	 bSLLRY+L50bIQ==
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
Subject: [PATCH 04/19] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
Date: Wed, 12 Jun 2024 15:54:28 +0200
Message-ID: <20240612135443.30239-5-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the ETH_ALEN macro instead of hardcoded 6 for MAC address length.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 5acdde1bb6d9..1b708a0760e6 100644
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
@@ -65,7 +66,7 @@ struct mox_rwtm {
 	int has_board_info;
 	u64 serial_number;
 	int board_version, ram_size;
-	u8 mac_address1[6], mac_address2[6];
+	u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
 
 	/* public key burned in eFuse */
 	int has_pubkey;
-- 
2.44.2

