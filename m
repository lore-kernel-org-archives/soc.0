Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76AC3DA5D
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D1B3C4AF0F; Mon, 15 Jul 2024 11:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDBAC4AF0A;
	Mon, 15 Jul 2024 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044758;
	bh=O4uaxv7GHUzy/dI7jVG1XspnPohL9XyQ4MFsapoSjic=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMqkDTFbHLikOHr0PN5S9G7uUaeB9g+Ji3Ii3M1AuXvcjnESyVXrcaIo17U+uSUxu
	 0xS95IWWm45V37EpMpYP+Ar1h//Kju1GQSWwApYZqTMVH0Q6Fzd4JIQt74C0qOQFjI
	 Fb5g3Qs30kAZJWBB69WSTR13Dg+aRHm3lnsT5m54o2/ljeLwrDnUefMYU1ArCxEoaR
	 Hf5EmX4gengCWyb0H5wWR421Fjtk6Az/Kb5ONPMHDb3pXMGjGCgDVYu0StBfRPcz01
	 dYw1JPHVu12sQUId+6umhB1C+5aM6LpIQh62Ot22OnI2FVVaqLQ8XMU2cocJbhGcyN
	 Q/sGP2ZXe6jow==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 1/3] firmware: turris-mox-rwtm: Do not complete if there are no waiters
Date: Mon, 15 Jul 2024 13:59:10 +0200
Message-ID: <20240715115912.9507-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715115912.9507-1-kabel@kernel.org>
References: <20240715115912.9507-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Do not complete the "command done" completion if there are no waiters.
This can happen if a wait_for_completion() timed out or was interrupted.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

