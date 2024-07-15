Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527EC3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F3F1C4AF0F; Mon, 15 Jul 2024 10:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2169AC4AF10;
	Mon, 15 Jul 2024 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040451;
	bh=O4uaxv7GHUzy/dI7jVG1XspnPohL9XyQ4MFsapoSjic=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ju2oU8BeB2CBHFs7oQomALT02Q8GtOsq/Kztk9cxyL33di+Isw79fre5bO4prVNRp
	 u3aTXCj6Xv6SFm0DST5DlCT2ULsFW33XCyTdoZs7jmnwrWYw8a6TpS5ZqxmlIDiMxX
	 84dxzAYZvKjJOzfLk97QUU7V2BbX6c4/MWQ3ZW57qMD2Dmg3alf1FzovOHBGQncWiv
	 w0tD5ucaHYNmmc+wdYF2gRl+tX16PaaRj3/4TCtct18IQxz74rCxx3rEvQgWzyeQzz
	 wHMEISHQ5vyzsUpAvz/uuImZVnaPRLSZ0/WHUz7ewomsAShVtcfsCRS0FvALjEyICS
	 MmBJqt2t3hxsg==
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
Subject: [PATCH v4 01/19] firmware: turris-mox-rwtm: Do not complete if there are no waiters
Date: Mon, 15 Jul 2024 12:47:05 +0200
Message-ID: <20240715104723.17751-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
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

