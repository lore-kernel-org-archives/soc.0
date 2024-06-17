Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D42C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 14:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 531D7C4AF1D; Mon, 17 Jun 2024 14:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A30C4AF51;
	Mon, 17 Jun 2024 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635555;
	bh=pz7+0i656dlp2cOr2pNHFfRCsQyVt9jrWZhX07rLn1g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HgrAH/cpLFRWyb42BMxe82PEBxFN1FcrytWsBv8y4kGQPz3CErV1PR/gXvlmeli5N
	 jFSwmnHBoTcIRCG8jBZ+UYYgOQQrjDTFV3MU8O2Q031g1nzyFRv2MmFUgraI8uEtUp
	 Fbxjq/OR24WdkmUb4Mz3WwO91f35+nxmFHDkivyVdUQIgCSD/4eIK0pBysqTmMdZh2
	 M5TCLejeevCFjlpzbVs0n1Bhi+TdCZmm8u9gfDYBO71nP8spAX8OnU5OlSoTisPMSz
	 07b1ekKPTMGCAoVAYOAggaiwf4Lg559vHNGfpg5Axkmq8dP/C0trCaU6oFz9Y/Vsj2
	 1yYNxtHCcMNCA==
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
Subject: [PATCH v3 07/17] firmware: turris-mox-rwtm: Fix driver includes
Date: Mon, 17 Jun 2024 16:45:22 +0200
Message-ID: <20240617144532.17385-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
References: <20240617144532.17385-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop including of.h, include several other headers that are used but not
included directly.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 59bb9245e04f..9c66bda2f976 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -8,18 +8,23 @@
 #include <crypto/sha2.h>
 #include <linux/armada-37xx-rwtm-mailbox.h>
 #include <linux/completion.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/hw_random.h>
 #include <linux/if_ether.h>
+#include <linux/kobject.h>
 #include <linux/mailbox_client.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
-- 
2.44.2

