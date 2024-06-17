Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E527BC2BA18
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D36D5C4AF49; Mon, 17 Jun 2024 14:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3085C4AF1C;
	Mon, 17 Jun 2024 14:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635574;
	bh=CIb1ugDZLJlNiMHju0VNi48nJ7pg+VXzTe97P45Z3nM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRPY4TRMztd55cuP4t8pMToW7pZdp9pw+Hxz4f61+//yUvGnETBB6aJPrJweFqhNm
	 VLfE/wIJutcOGAQrz6Uhc5jch7jD3deuvNuTHeIVNVHofskoZJUGQDWEJgpZoY/OcD
	 iwRPiOYFFPVy1BsWPlcBTGirMwfzrh4B5T3kvAqqkIPSRTnwvmLRoNem6gQk8eG4Sq
	 JmyYk6s6FAjuoa7qGkHSciJs54dXapUZjLdIgEg1XG3M9AGNbzkdkveZzcLBI54DNC
	 K2tXlcltShESTAYV+JgZ+cUvdi4S26wHIfMC9u56T4JPiidJnAd+rjuuS3WY0IebDA
	 Xn1Z3Eypre78w==
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
Subject: [PATCH v3 15/17] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
Date: Mon, 17 Jun 2024 16:45:30 +0200
Message-ID: <20240617144532.17385-16-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
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
index 5a850dc27fe3..135adfa9fb1f 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -260,7 +260,7 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
 
 static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
-	struct mox_rwtm *rwtm = (struct mox_rwtm *) rng->priv;
+	struct mox_rwtm *rwtm = container_of(rng, struct mox_rwtm, hwrng);
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
@@ -489,7 +489,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
 	rwtm->hwrng.read = mox_hwrng_read;
-	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret)
-- 
2.44.2

