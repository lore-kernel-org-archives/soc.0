Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351B8C3DA59
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F8A5C4AF0E; Mon, 15 Jul 2024 10:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B2EC32782;
	Mon, 15 Jul 2024 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040466;
	bh=EWfl7Pzk2wgZExrt1XlXb7co9xshNocr3bGJAUWtFbg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWrQmgBVfsiSgnZqiHKQhcmDa4ag758VlUvthlVHGVaUiogjJuULTW7NatosVn8w7
	 wzw9H7AE8t6W6D4WFbR2VV+Ag4B2+q+Sq3EwQXy+0UcHW9Ow6vHSS7SJ2vnjiwxqxq
	 ZLDB4kxyPJynAzAUKxXEvkJ7OY7f12t8VfGZzC/5brrLQjXUAyOquozbNxqZco0nY+
	 L5JzV6y8xh05AN5z1tgvnHxpZwdKFW6wgwsy3mSnIJL/ISq2xgW7ilMmY+YSkxNQhp
	 s3IwFeZZ8u9EsXc0Q1qTJTwagLkiR5tKRu0Qy09JShQA+bjokAtLSiJg4lJPRmYMPL
	 A6lVh3hA+qRzA==
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
Subject: [PATCH v4 07/19] firmware: turris-mox-rwtm: Fix driver includes
Date: Mon, 15 Jul 2024 12:47:11 +0200
Message-ID: <20240715104723.17751-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
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
index 0ae5b2086113..0da40f55c750 100644
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

