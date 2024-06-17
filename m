Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C89C2BA18
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87D8FC4AF1C; Mon, 17 Jun 2024 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DC5C2BD10;
	Mon, 17 Jun 2024 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635545;
	bh=P3L8zh+LINX0L/EVopvsKWgqUQ9/y+fl1zRqmHFXnAE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVpci2ANSps2eeb2F8BBIgi/gp/QexsU37odf/jPXSc15/322MNt3vgSnstc49L97
	 sJGojkaxhNA8f9e0z6uKbyHCIvs5xUQBBS6C2hdRFnqhLSD74jkPIXhY6hhfiE/q/B
	 LqA7+bVdgRHZTcuktcCCSoIHPsHgHGHuwE91GhSjPMqw6Ux7N9ekgNYyNy714b6FVc
	 TNE26YOz8nhsxYIzVNd2MHgFFjUdD0HkZrtxyC/xzAd9TlXuzOJZGKIrofakxlYWW1
	 C2yVFChZD5Cqe5tJqb54EpxAjVEOUO/u3lLjzAZyd9J+4nE+GgMuv9XPRWNLMAn0Wc
	 j24zwodbpMbYw==
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
Subject: [PATCH v3 03/17] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
Date: Mon, 17 Jun 2024 16:45:18 +0200
Message-ID: <20240617144532.17385-4-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
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
---
 drivers/firmware/turris-mox-rwtm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 3f4758e03c81..aafd747543f6 100644
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

