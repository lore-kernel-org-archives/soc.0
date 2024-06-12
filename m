Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F64C27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3237FC4AF1A; Wed, 12 Jun 2024 13:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1D7C116B1;
	Wed, 12 Jun 2024 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200491;
	bh=qNQKeKVAjEgxOQBenmNAc0eVUtJC4/u8mbQTNzE9vLQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOwelx94P9Adhgg+DYwL/GL0POlSbZv4GyL/fMEQQ+BAIDhBMbc3F4RHJZAus2C9N
	 QFvTvMguua9xmMsf9YOArP0e1ugD+9KdonA1hAFDYDl1GTjutjLZCL1o7hBSyEr+WJ
	 5K+sV80Ep7NWIu+Hcf4ab1uOrPxANCAhYWuniDzXsdgZkGKikGmwmrYcKK9ZlfLq3t
	 2doG6xBMuEaAACWPbU9GeE4JPeTqfLXYC2B0hWaDwlrD4F0Pj4VoQscHRv9RLDOFeL
	 pJkGUrilF8a7S54p6IOPW2/A7Nnu3tjqcuoR7FNSqSyR6yFdxgQ36vP+drX8U/dtAF
	 S/fB8XZuC6yAg==
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
Subject: [PATCH 01/19] firmware: turris-mox-rwtm: Do not complete if there are no waiters
Date: Wed, 12 Jun 2024 15:54:25 +0200
Message-ID: <20240612135443.30239-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
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

