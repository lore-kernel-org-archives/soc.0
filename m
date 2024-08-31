Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE1CD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1ED83C4CEC9; Sat, 31 Aug 2024 09:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1668FC4CEC0;
	Sat, 31 Aug 2024 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096063;
	bh=1I034L4LLf9or8F0uskNWOW/awQZlwNsmaQxnhu9RK0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dIU0akJ/rw4csfbTNcG4OL7XcNbKsI73eKwi2TthWaaLGnyQ4UFYKZAOzjw+htgdN
	 263IT5FD9EiW0xKoKKT+xkB68rF4dWfNmoHqWOGIrVm+94JnxjZDYqcl2fJwgLqaJP
	 pIc6MVihsRFr8fvWjK7gHuRze64XSicdUEHltxUWZW3B3DcrO+aBVex3HRKGmZI1BF
	 mGuXjhB61Vdvy5kZgx3DK3ei2sAlwmjf5kh+0vMx2+yyb7IPrfAMe5Yvo8nhTISOqT
	 pK6/GecHWzRDX/IU8o15djrD6M/op+RkRuUzwCwDCJW8y6pari75y5MZij7eTvaPk4
	 fQxxu3NT1yjRQ==
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
Subject: [PATCH v5 02/16] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
Date: Sat, 31 Aug 2024 11:20:36 +0200
Message-ID: <20240831092050.23093-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
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
index 67d7b65da174..d3ce093d4835 100644
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

