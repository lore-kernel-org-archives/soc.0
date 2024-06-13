Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD599C41513
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A00A4C32786; Thu, 13 Jun 2024 16:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C28C4AF49;
	Thu, 13 Jun 2024 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295081;
	bh=Zwaj3fK3W0vC4aI0OZ43ek2Pcu3wpD5VEZbxj73a0ts=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrBzZEZn13Hu4TVmwp7Dtd4bQVQ+zPce4eVq+bUoSmSPAPXk3LkEcYa7ZpLgnh4Me
	 Y7ORoiYO7fKX1KId/md5oOTqMO0nabeced/od6/pi4ahhX++f3mstTZgyL/nQe/fEo
	 mi1oO4GjEMAw8qFunqQLnD73kbyi1fvRdgtH3laUaVrk2RM0zQTYGUezHf2YEwr9nG
	 pnOGxqyx8xa+sPTNT0JHDix5Ry6EHvesTDDlSp3AvkMUeLUZIbzZonYCLxzZ/64P50
	 HO/+rjX6eG6zFk/oj8zzSrCJftB61GJfKsPCXyggpoFNNwpOnTKlmM9PMtlx2N+8dp
	 P3dGNq3b3G1OA==
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
Subject: [PATCH v2 12/17] firmware: turris-mox-rwtm: Initialize completion before mailbox
Date: Thu, 13 Jun 2024 18:10:40 +0200
Message-ID: <20240613161045.29606-13-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Initialize the completion before the mailbox channel is requested.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 81a82b1ef515..35c2a899caab 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -454,6 +454,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
+	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
@@ -472,8 +473,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&rwtm->cmd_done);
-
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
-- 
2.44.2

