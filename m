Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D4C27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D90B0C3277B; Wed, 12 Jun 2024 13:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11ABC4AF1C;
	Wed, 12 Jun 2024 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200520;
	bh=NB3+7yKH7jftdDy0/3uzHo2M1+UbHlrMh0HTTbTUVu8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UWlPeV5OPeq1N8OSJPtEhTWIrzG5plQO72Tf7OIMYx/bnUCOVhHcgQqkWJdXWT48g
	 mFsNx6Pd/OYxcZ1cpS9BlVae/dujlzEr7ZEC+Jsj3174OCfeb6RBRYnF4NiRDgLGlu
	 uKfsS+KJHKk+8fH6YUd03/4k2wGULD0ocgI3GXC+1xBxwOvzIWjRFhwnfYodXX6W1/
	 a7Xt3NPuU1zlB4JpdA/ZDDg0BElQaWq28Ofj4zb7lpDEOuSzs8OymISpT1ZE5fGy0Q
	 /6rY0+mOcA5lV3ZwSVK6B39N0UdGC92dAxbZ1quTPdOv5oWZ5/NgEo18dXY/D9E36b
	 cbi8IcDMosfjw==
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
Subject: [PATCH 13/19] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
Date: Wed, 12 Jun 2024 15:54:37 +0200
Message-ID: <20240612135443.30239-14-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use dev_err_probe() where possible in the driver's .probe() method.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 153772721901..3c3f8ae23809 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -480,10 +480,9 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = mox_kobj_create(rwtm);
-	if (ret < 0) {
-		dev_err(dev, "Cannot create turris-mox-rwtm kobject!\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Cannot create turris-mox-rwtm kobject!\n");
 
 	platform_set_drvdata(pdev, rwtm);
 
@@ -495,10 +494,11 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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
@@ -523,10 +523,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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

