Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F528C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51700C2BBFC; Thu, 13 Jun 2024 16:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298B4C32789;
	Thu, 13 Jun 2024 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295089;
	bh=mH1F/suc/waIrIyGrYdyRdS7WMaQZnGhIjfiC/hOZRQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouFb2KUu318ZvhlylFHxsDCJR5FvMdCJvjIL0Ca9QmmciM8SfyMq8NOY29g1Z2YhE
	 VC6nBRETmed/jEagT77R+D5LSQz9spB+fJGn6xPVKt58CSvCsu9yZzPqEkEKpRRWoN
	 sntYhBl7R0oYfSj4ufhi9Dq1gV3g+L5VLkoJKXFGRRMHsp/qCNTKs4yDrkFxoSNYIt
	 ipSS6vXYb0jicFHxVKsj9RiYPTTjDqoUh4QJ5g5cDdAL42Ep3aa0wT+ffXdKKa7H2y
	 VOBHWxXfbWgm4GhGpaQ8Rf6oqVWDlpDFcZRWOhlZWU8Cw/btsX2r5mpXVk0P/IUsqC
	 4IXfhNi/mzKZQ==
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
Subject: [PATCH v2 15/17] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
Date: Thu, 13 Jun 2024 18:10:43 +0200
Message-ID: <20240613161045.29606-16-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use container_of() to get driver private structure from hwnrg structure,
instead of the hwrng's .priv member, as suggested by Herbert for another
driver [1].

[1] https://lore.kernel.org/soc/ZmLhQBdmg613KdET@gondor.apana.org.au/

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index a9a3a189ea47..4c445f6b8140 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -258,7 +258,7 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
 
 static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
-	struct mox_rwtm *rwtm = (struct mox_rwtm *) rng->priv;
+	struct mox_rwtm *rwtm = container_of(rng, struct mox_rwtm, hwrng);
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
@@ -493,7 +493,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
 	rwtm->hwrng.read = mox_hwrng_read;
-	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0)
-- 
2.44.2

