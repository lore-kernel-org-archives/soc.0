Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D86C2BA18
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 807D6C4AF48; Mon, 17 Jun 2024 14:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70442C2BD10;
	Mon, 17 Jun 2024 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635567;
	bh=CQPS0TEQajBleFkxswdiW1wMbGSGeV3Womaa40tIEPw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XPYLRuUjr47xeyYH5YqS0S+6oxqP4mxXSfO0Yg1/YEvtyC+TaH36QhUWdSQ4XOZNM
	 iodSbBYoszmevGV8d3Dat4FB98zNy21vydnZ6WdOPFl1tQh2kHnXNQtP1hayOeRrdR
	 KjWtC/wcoYyClzVkR9EPYrh2mbvdWGr8dk73d2gXyLRHPCSBTF9Smvkqpiw23fcf0Q
	 0f09ZBGdMeC5HLxNUwmmwKDmIym0wrmDo6sZk4GqdI1WCrYfuBhiSlSMqImEXrm30E
	 /Gyl8oiMESkURHnRbp5rEETUEMl3E6RkUUEkr1V1Yg+HYffTd+SR53pBBwA+Yv+M7Y
	 XE42Mmlm/TkVg==
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
Subject: [PATCH v3 12/17] firmware: turris-mox-rwtm: Initialize completion before mailbox
Date: Mon, 17 Jun 2024 16:45:27 +0200
Message-ID: <20240617144532.17385-13-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initialize the completion before the mailbox channel is requested.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 397175fafbe0..2c43af69783c 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -455,6 +455,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
+	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
@@ -468,8 +469,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	init_completion(&rwtm->cmd_done);
-
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
-- 
2.44.2

