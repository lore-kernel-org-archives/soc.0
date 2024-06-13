Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4FDC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AC56C4AF1C; Thu, 13 Jun 2024 16:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7340C32789;
	Thu, 13 Jun 2024 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295079;
	bh=MLwvK/C/JclmC0UMosPEx3nJi7odhdUQRtSCpsaanJY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLzVDONs2VokIl8UaSreRKS+ySvGuNdZfwdUYQMrUPFI+hqJ4MXcOzGuUXv4NpHBZ
	 rcE+cEy0zXnHYcHGwFt71Y0/XrHjyOmeD5jqHF4ViKFo3lL+WPWY7sYm+qNgY45H6x
	 uH/TT68amg1JiOdg6xj7Z3GtE3MxkrS+rnoNnft4eP2l+37kLEBj7f/eu4waZWDhGD
	 atdHucOtgo481a/bJ0Hxe06llfvpknqncY7sGw30kd52buD+7DlEMY7+mKbRd/nGr+
	 DkcYNkKChn5dmYtgPxAV2XjZGH5RO0D7WjLdRuO2gDRBMnftowl00Vd3mOKP/mMABp
	 SMcrBIs6dCujA==
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
Subject: [PATCH v2 11/17] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
Date: Thu, 13 Jun 2024 18:10:39 +0200
Message-ID: <20240613161045.29606-12-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use dev_err_probe() where possible in the driver's .probe() method.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3017a8c19005..81a82b1ef515 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -461,10 +461,11 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->mbox = mbox_request_channel(&rwtm->mbox_client, 0);
 	if (IS_ERR(rwtm->mbox)) {
 		ret = PTR_ERR(rwtm->mbox);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Cannot request mailbox channel: %i\n",
-				ret);
-		return ret;
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		return dev_err_probe(dev, ret,
+				     "Cannot request mailbox channel!\n");
 	}
 
 	ret = devm_add_action_or_reset(dev, rwtm_devm_mbox_release, rwtm->mbox);
@@ -489,10 +490,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
-	if (ret < 0) {
-		dev_err(dev, "Cannot register HWRNG: %i\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Cannot register HWRNG!\n");
 
 	rwtm_register_debugfs(rwtm);
 
-- 
2.44.2

