Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC790C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1BA9C4AF1D; Mon, 17 Jun 2024 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF69C4AF4D;
	Mon, 17 Jun 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635540;
	bh=qNQKeKVAjEgxOQBenmNAc0eVUtJC4/u8mbQTNzE9vLQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qiQ7+pZN18F5rjHkAWsh1J+VHxZTChrF2Xeri/YbRrcNMr5gTRI+s+QNv3yJUbHGo
	 qvY7W5vFiSl1c8++zG4hKW4SFZ0GOUd9PslFH3pILI6IfWnMCrRw3h7MxmrXOLJJeT
	 IKCUATtvCiHeibSMi8iYbDzbnUYgxz/wP0p8pz1tvZll0tiTU4y9FOnjz9jtE4WJAS
	 nsqmFPU5sWgu/ip3k+JNYyBps+lMrssnjBWJDsnYEZ7V0Oht8WeGrQVQT7rbiUfEX1
	 1SGada6kaEUagmfcskDDQ9CKl0pC9PyxfUI4J1nEMI8ZCCbLDGfxmFNfR7YoKh5mGt
	 Ygj94UPNsLScQ==
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
Subject: [PATCH v3 01/17] firmware: turris-mox-rwtm: Do not complete if there are no waiters
Date: Mon, 17 Jun 2024 16:45:16 +0200
Message-ID: <20240617144532.17385-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not complete the command done completion if there are no waiters.
This can happen if a wait_for_completion timed out or was interrupted.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 31d962cdd6eb..f1f9160c4195 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -2,7 +2,7 @@
 /*
  * Turris Mox rWTM firmware driver
  *
- * Copyright (C) 2019 Marek Behún <kabel@kernel.org>
+ * Copyright (C) 2019, 2024 Marek Behún <kabel@kernel.org>
  */
 
 #include <linux/armada-37xx-rwtm-mailbox.h>
@@ -174,6 +174,9 @@ static void mox_rwtm_rx_callback(struct mbox_client *cl, void *data)
 	struct mox_rwtm *rwtm = dev_get_drvdata(cl->dev);
 	struct armada_37xx_rwtm_rx_msg *msg = data;
 
+	if (completion_done(&rwtm->cmd_done))
+		return;
+
 	rwtm->reply = *msg;
 	complete(&rwtm->cmd_done);
 }
-- 
2.44.2

