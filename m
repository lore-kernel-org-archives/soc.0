Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC02CD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F7A8C4CEC5; Sat, 31 Aug 2024 09:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46734C4CEC7;
	Sat, 31 Aug 2024 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096082;
	bh=JR9ApgNuHbv2NGYPXh7+aUFxvoqTkluAm9nDSKFhru4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eb6HCimZjUM9UkdpZAW1jwcn1GgVAjiubRJ2V6jhuBQlkNJUj2ybLswHi6F0hpdsj
	 Xdu8BpubyLYXVvzOqe0xmz9Z8y+aHMYY2ji68tqGqmQf3JNcoA/BsSKALaqj08ahbi
	 5LjeMPXGTCHVkKSvp2wNq3CKT39stOv3zGw4xn4mX/7dDXlRVE2cjjL2PbINNQB+TZ
	 /TAU/SFagtFzm+kdtDsvG8FWhtltRt/ib89fQlYEhJaODzEQzlqI9ksK6JXjr87ezt
	 rF7XB/86uSEXSIVGiUyrDQ3pE8ucH31LkG2pL4Ulq5yLJ+3UVbuf1SAzr4dWUnRgzJ
	 1hoVCAlqjhG8g==
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
Subject: [PATCH v5 10/16] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
Date: Sat, 31 Aug 2024 11:20:44 +0200
Message-ID: <20240831092050.23093-11-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use dev_err_probe() where possible in the driver's .probe() method.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index dd0dbaa9de72..f291df9a72ff 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -459,13 +459,9 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->mbox_client.rx_callback = mox_rwtm_rx_callback;
 
 	rwtm->mbox = mbox_request_channel(&rwtm->mbox_client, 0);
-	if (IS_ERR(rwtm->mbox)) {
-		ret = PTR_ERR(rwtm->mbox);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot request mailbox channel: %i\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(rwtm->mbox))
+		return dev_err_probe(dev, PTR_ERR(rwtm->mbox),
+				     "Cannot request mailbox channel!\n");
 
 	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
 	if (ret)
@@ -487,10 +483,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
-	if (ret < 0) {
-		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register HWRNG!\n");
 
 	rwtm_register_debugfs(rwtm);
 
-- 
2.44.2

