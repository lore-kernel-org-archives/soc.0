Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92810C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60D5FC3277B; Wed, 12 Jun 2024 13:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F753C4AF1C;
	Wed, 12 Jun 2024 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200523;
	bh=1gQhXqOVGRWAUH0rPrpfISbwSYU7INaumxyrJJcurYg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfXr56dgn3TLJmFbt1/zWaKsl40Qbje2FrdQ6O1aQsJOffdB+907ASF60vvwMPrHD
	 ky1DXh53Tno/Ui41v5ozWoms4fODIDWzFXPImHrD1zULPH5k3zL2YI7p4c4krzGwAE
	 l5PVfoIqyQRXJllkR0ek2FltKWM83NEdgc00wyj7FmQNEYZlJbbSZayV1vsy0zS53r
	 R1Ik6X+NsFe3KzrvIuf/jh2AJN+fc/oTYoitr/lur1mYH7jagytWABFfNkoCjucSPc
	 WGlOIkuREvc5B6LOryfALBbIomDtCY9DgXsCNNmUzFYddnTKccJHwCQ5h9TyP0L49G
	 U/xqxc4ADb7LQ==
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
Subject: [PATCH 14/19] firmware: turris-mox-rwtm: Rearrange probe calls
Date: Wed, 12 Jun 2024 15:54:38 +0200
Message-ID: <20240612135443.30239-15-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rearrange probe calls:
- create the kobject (and corresponding sysfs files) only after the
  mailbox is created and board info is read
- initialize the completion before mailbox channel is requested

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3c3f8ae23809..b9be3c806695 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -479,14 +479,10 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (!rwtm->buf)
 		return -ENOMEM;
 
-	ret = mox_kobj_create(rwtm);
-	if (ret < 0)
-		return dev_err_probe(dev, ret,
-				     "Cannot create turris-mox-rwtm kobject!\n");
-
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
+	init_completion(&rwtm->cmd_done);
 
 	rwtm->mbox_client.dev = dev;
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
@@ -505,12 +501,15 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&rwtm->cmd_done);
-
 	ret = mox_get_board_info(rwtm);
 	if (ret < 0)
 		dev_warn(dev, "Cannot read board information: %i\n", ret);
 
+	ret = mox_kobj_create(rwtm);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Cannot create turris-mox-rwtm kobject!\n");
+
 	ret = check_get_random_support(rwtm);
 	if (ret < 0) {
 		dev_notice(dev,
-- 
2.44.2

