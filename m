Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7CECD1293
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C082C4CEC5; Sat, 31 Aug 2024 09:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432B1C4CEC0;
	Sat, 31 Aug 2024 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096070;
	bh=SprDeKaKZM3BNc5A0mxv+mHWFnXhvCaYNzKPcz6ZuEU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bN42+lU7NzCf8gfHQaA+UphQ9iM1oW6tcJeg1IOf74lj8e0MOOUDbY6RgBAGxvGMb
	 1Y5KsLrVX35eHW8SxnZwfOAYlS5isfX/8w1A1t22qv3kbfkPWHts4jsx3oJlyt2MPx
	 fQoAIXJW9dqRyDZSFp/SJys59mDg2o7axWae6v5fONJW/vXVin1RfuBewKwycc5BWf
	 IlIoKqupEL60dF6Y5OO4x5rnWHHknKTADEtmt8lrw9HffBtOu+hsLlF2ojqlRJ45bd
	 IkfOyKQdjdbC5j611Z+23TBDHkEeBkl6vFNYURRAUlim4rLU6WdYr/3UPkg3ElEC3r
	 oWFCxgLElmjDQ==
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
Subject: [PATCH v5 05/16] firmware: turris-mox-rwtm: Fix driver includes
Date: Sat, 31 Aug 2024 11:20:39 +0200
Message-ID: <20240831092050.23093-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop including of.h, include several other headers that are used but not
included directly.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index cf8c605d99ef..ca1eb1687d44 100644
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

