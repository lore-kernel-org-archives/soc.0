Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EFEC27C77
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFCDDC4AF1A; Wed, 12 Jun 2024 13:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71F9C116B1;
	Wed, 12 Jun 2024 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200530;
	bh=McfKg9k2MTP61RXrnOKchL8mdl0535mBGq+KGqtDx0U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZhD32MtFGfLMo4NkUo1TWkijmaVNKyWehflqi0KYPmvDuxGNBm86fLUYgCcQXO0C
	 7Fpv1RqitZkOvG/zG51uZ5TH2lVtG31XjPOaRU63k+mRAqBwaS5Yw2/kmVxKeDt0zP
	 Mk8FaR4BgXAGe9AYhFd0npalRXBHM9K2bpmwy7Geg5q08X+eGTiqUFXhP7uay4xgNH
	 fFIdsK3fsgORKXT+Ga93jH/ZCfnFCB51uurJPYz+XafKrJtksRfvpoTJX3Nyi8DL81
	 eQjVt6+v/9RLyTVxi8oSBzEJauSdYTi5lfH2Y2XoT2Pi1YrRSzAFKaPHe8QpYsuSQT
	 IfhxRZF5vt+DA==
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
Subject: [PATCH 17/19] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
Date: Wed, 12 Jun 2024 15:54:41 +0200
Message-ID: <20240612135443.30239-18-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
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
index f753e98f1ca7..5991434f62a3 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -292,7 +292,7 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
 
 static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
-	struct mox_rwtm *rwtm = (struct mox_rwtm *) rng->priv;
+	struct mox_rwtm *rwtm = container_of(rng, struct mox_rwtm, hwrng);
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
@@ -527,7 +527,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	rwtm->hwrng.name = DRIVER_NAME "_hwrng";
 	rwtm->hwrng.read = mox_hwrng_read;
-	rwtm->hwrng.priv = (unsigned long) rwtm;
 
 	ret = devm_hwrng_register(dev, &rwtm->hwrng);
 	if (ret < 0)
-- 
2.44.2

