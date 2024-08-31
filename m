Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92847CD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CC61C4AF0C; Sat, 31 Aug 2024 09:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739EDC4CEC8;
	Sat, 31 Aug 2024 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096089;
	bh=kZlRiEZGYaAz7Vl2Ou2b/HAdFUAXeMbtadH/7tYtf1U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9MYiQ5eDX4J9QWFVdxKI0aWZ8HqfZU0cIZzKIj738QnjDOOct2M7nCWkshLR7Y2N
	 tVGE0uDOUfruVvBc9OLJChG6mOZD4dAF6GNpxOlG8t5GVqOaP0Mr3YJOAChmsr3Nbk
	 U6eWgjTWmIiAOxBsjsH0vlZc2OJNIZDdB/ifyIf3NlP43whNcArxoxX8tyKSikdKuQ
	 G1dYMyAYOK2Do8gu8XmfNplajAG4CRQu9FpYc4hT/8EupwBB/gmWFx8EVybrzHjg60
	 is1HazkOO6I8CZpHYnVa3HrH/7//W/iQsETX4dtjTQEF9dKKAWsXE6M5cpPAK1SttR
	 l//vI5sU48wrQ==
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
Subject: [PATCH v5 13/16] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
Date: Sat, 31 Aug 2024 11:20:47 +0200
Message-ID: <20240831092050.23093-14-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use container_of() to get driver private structure from hwnrg structure,
instead of the hwrng's .priv member, as suggested by Herbert for another
driver.

Link: https://lore.kernel.org/soc/ZmLhQBdmg613KdET@gondor.apana.org.au/
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 9f6bda969943..52f97235c3a6 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -259,7 +259,7 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
 
 static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
-	struct mox_rwtm *rwtm = (struct mox_rwtm *) rng->priv;
+	struct mox_rwtm *rwtm = container_of(rng, struct mox_rwtm, hwrng);
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
@@ -487,7 +487,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
 	rwtm->hwrng.read = mox_hwrng_read;
-	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret)
-- 
2.44.2

