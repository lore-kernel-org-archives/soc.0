Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3565C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B4A0C4AF0B; Mon, 15 Jul 2024 10:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70558C4AF0E;
	Mon, 15 Jul 2024 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040478;
	bh=tefhaZTEF44wo+1+6IH3p/hjgSJjZbrphTxfFvM90YM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dk1PQCrAPvSL6bt+Q+bQWwIOGQaoGw+fEfuoxfPDOIQCWlQvKemJRsXvNuMYzIE5h
	 NBNxQ8363LII+9DIAMz3F5Rd26k57BF/5ljL+n1fG3W1CXD8lEAXHQYgWWG28LHRd8
	 pdoOboZicaFjP0bmIl9uw6mPEUfCgR3foLxPqT1PBAwF2eQNavUUXG5lYzKk96wIfj
	 ljhEfce7vfaW3HXVM7S03vWEI1Lw+XL2DNODPRxSFdVUOaBXs5CmTksBXhRJuIBNxl
	 Vp86Qk0YG2IoqHWonVxE41dh/5wvUYOy3q5jiYPp09oo6BVzd0T6yBB6OGJowebWvF
	 pGqSpHbobKaPw==
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
Subject: [PATCH v4 12/19] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
Date: Mon, 15 Jul 2024 12:47:16 +0200
Message-ID: <20240715104723.17751-13-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
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
index 5f44fece33f2..30c124e664d9 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -458,13 +458,9 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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
@@ -488,10 +484,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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

