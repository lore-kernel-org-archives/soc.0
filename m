Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA38AC3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98D20C4AF0E; Mon, 15 Jul 2024 11:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A38C4AF0B;
	Mon, 15 Jul 2024 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044762;
	bh=udt9/WXU0333dsDexLSegt9f3/2x+UBO21YW0AgcJHI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWz1lIzbQEXJC+KBYVd5XHFus9Cow0WdmuAaRmY6/eUlZpDgxb9c+jFCMF7ISh2nS
	 wpEna6C7fNjGeyJ8mSdGjoHXrhqX3DGBamRKcd+a+carTX1DswvYNVWMF97BpYDNAi
	 tOhgfQhyXcHv1CehSgHfsVObnx28LGT32d+OIebEML9zWpgtqWjc2liZODqciVwDrW
	 9EeWtrsmfXDU7kAWNIfdfpnvE4aOqrZlJOMbp+VhxZtObbeZL5QL2B5tMKq8wQymkE
	 jyEQYUJK6F1LBmtMiqzxmwaAjZRf4tNT+kr9A7MEDpOnw49vxwoYQoeNlIKtEW/L+u
	 hhTqY5MPq5TpA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 3/3] firmware: turris-mox-rwtm: Initialize completion before mailbox
Date: Mon, 15 Jul 2024 13:59:12 +0200
Message-ID: <20240715115912.9507-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715115912.9507-1-kabel@kernel.org>
References: <20240715115912.9507-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initialize the completion before the mailbox channel is requested.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3f4758e03c81..3e7f186d239a 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -499,6 +499,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
+	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
@@ -512,8 +513,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		goto remove_files;
 	}
 
-	init_completion(&rwtm->cmd_done);
-
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
-- 
2.44.2

