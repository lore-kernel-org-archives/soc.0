Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9958CD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2F69C4CEC8; Sat, 31 Aug 2024 09:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CFC4CEC9;
	Sat, 31 Aug 2024 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096060;
	bh=Abfd6J238robHdsfA+mAo+HtZEUoV4Xe3/uHVf1Dd3U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nF7pMQ8BD3iplkCYTqQvrnL6VGdUT2QPtjVAzq9ShFZWUjbAuJaibYtKWoTsFvRdk
	 qkTtBilEXtkKUiip1VkHeTQsmBc1AcEtK9qU37xPqhjh4x5FPhr/olKWxhQemTMfEC
	 2KpYz+/VY2Pl8FX6LxMyLf3jSHoV1B1zLLOj6Sfm6Fy3C2TvkVnh1v8l53InxbetLb
	 irHpvjF1N+yWUTDyJEKls5tlB6JXkw3hf/RXbk/a62z0bLZIkAmFaHGRsk6y1NakiF
	 KrJqwlotYfpYH8XwFGULInep973IUidtztUexbAWVyqC8j1thNnGhK2agX1LC3GNeQ
	 STXGSnUaFdQAQ==
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
Subject: [PATCH v5 01/16] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
Date: Sat, 31 Aug 2024 11:20:35 +0200
Message-ID: <20240831092050.23093-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
allocated to one PAGE_SIZE bytes. Use new local macro constant
RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_read().

Use SZ_4K instead of PAGE_SIZE. Although PAGE_SIZE is never set to a
larger value on Armada 3720, it theoretically could, and this would be a
waste of space.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3e7f186d239a..67d7b65da174 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -11,14 +11,18 @@
 #include <linux/dma-mapping.h>
 #include <linux/hw_random.h>
 #include <linux/mailbox_client.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
 
+#define RWTM_DMA_BUFFER_SIZE	SZ_4K
+
 /*
  * The macros and constants below come from Turris Mox's rWTM firmware code.
  * This firmware is open source and it's sources can be found at
@@ -287,8 +291,7 @@ static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	struct armada_37xx_rwtm_tx_msg msg;
 	int ret;
 
-	if (max > 4096)
-		max = 4096;
+	max = min(max, RWTM_DMA_BUFFER_SIZE);
 
 	msg.command = MBOX_CMD_GET_RANDOM;
 	msg.args[0] = 1;
@@ -479,8 +482,8 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
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

