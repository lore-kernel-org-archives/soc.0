Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2981C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97D43C4AF1D; Thu, 13 Jun 2024 16:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5A7C2BBFC;
	Thu, 13 Jun 2024 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295058;
	bh=hAxG7fxH+1ivyfex6hZATKBA6MlX0OKPE/iu6xwVFFE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgjyqJWHmh/xZk3kM6B0cKl2MJXgCf8byG1++HJzYKzTriVkp2lFmgoRXGgar/L9i
	 9MDKmcLBNwN52a72lpZnT5GfPVCnllNHI9cSQoU2tkN73QYkuKs16MpiN0WwP4iDC0
	 fJxbi8NRanLFQHwrfhQh9k+J2byAELVby+hJJ2Esi1OUiqVLlSQ3bXcEyy//1Tm5Vw
	 8/ELupwKEJ8E+ROFOUk0X+1Y7ckmzJP//sKd8ELKti71z68YLMV/1mf9v0/pi22ok5
	 k0VvAIecAgijtfLyfk7dfYl2H3Ejuj3UqDUiKHykaNADdvoeoxVP6NSjZtkDnXzryN
	 I5TyjmkctEjVg==
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
Subject: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
Date: Thu, 13 Jun 2024 18:10:31 +0200
Message-ID: <20240613161045.29606-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
allocated to one PAGE_SIZE bytes. Use new local macro constant
RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_read().

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3f4758e03c81..b8deb13aed98 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -19,6 +19,8 @@
 
 #define DRIVER_NAME		"turris-mox-rwtm"
 
+#define RWTM_DMA_BUFFER_SIZE	PAGE_SIZE
+
 /*
  * The macros and constants below come from Turris Mox's rWTM firmware code.
  * This firmware is open source and it's sources can be found at
@@ -287,8 +289,8 @@ static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
-	if (max > 4096)
-		max = 4096;
+	if (max > RWTM_DMA_BUFFER_SIZE)
+		max = RWTM_DMA_BUFFER_SIZE;
 
 	msg.command = MBOX_CMD_GET_RANDOM;
 	msg.args[0] = 1;
@@ -479,8 +481,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rwtm->dev = dev;
-	rwtm->buf = dmam_alloc_coherent(dev, PAGE_SIZE, &rwtm->buf_phys,
-					GFP_KERNEL);
+	rwtm->buf = dmam_alloc_coherent(dev, RWTM_DMA_BUFFER_SIZE,
+					&rwtm->buf_phys, GFP_KERNEL);
 	if (!rwtm->buf)
 		return -ENOMEM;
 
-- 
2.44.2

