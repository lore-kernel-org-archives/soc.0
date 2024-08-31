Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57395CA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 497E5C4CEC7; Sat, 31 Aug 2024 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C70C4CEC0;
	Sat, 31 Aug 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096094;
	bh=8BMIGuOiKNipiQV7zt2ZZvMZ3wYh4xdIWqHGjkxp12s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpbCJmHQapth6GWzEEe7iOcLdIuC5NtXGVkNNbBin213ym+2cjnuSzQLvSGAM72MZ
	 a4CmSxkZDkK5vJf+oRIV4ZrXxl/4TNRLSdumgfVJA2voO1YfD6jc6sTwvHDzmSR+OI
	 pM/AszcBSo8ZR9jnRUcKPpJgoWQhu03WQVVezCm9aIhu9Omc+9kNGLVYHS/B8+VEhY
	 JCxQITxtuUZzctLefd0+TqCiEl2YKMu+IANkBWwPM7+CZYJV8PjsR3fYm6dwZJVARl
	 V3MQ1JwYn9EN54F99N6WTimjLrQLpusjl+ZitTMDIjPdY6WlWM1JDLnAe7bKGpAfVa
	 WuAtWJ+7j4qtA==
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
Subject: [PATCH v5 15/16] firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
Date: Sat, 31 Aug 2024 11:20:49 +0200
Message-ID: <20240831092050.23093-16-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use ALIGN(max, 4) instead of hardcoding ((max + 3) & ~3).

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index a9391705f5b4..0c7d8c96ea17 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -6,6 +6,7 @@
  */
 
 #include <crypto/sha2.h>
+#include <linux/align.h>
 #include <linux/armada-37xx-rwtm-mailbox.h>
 #include <linux/completion.h>
 #include <linux/container_of.h>
@@ -268,7 +269,7 @@ static int mox_hwrng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	msg.command = MBOX_CMD_GET_RANDOM;
 	msg.args[0] = 1;
 	msg.args[1] = rwtm->buf_phys;
-	msg.args[2] = (max + 3) & ~3;
+	msg.args[2] = ALIGN(max, 4);
 
 	if (!wait) {
 		if (!mutex_trylock(&rwtm->busy))
-- 
2.44.2

