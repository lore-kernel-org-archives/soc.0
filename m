Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EDDC27C75
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3538C32786; Thu, 13 Jun 2024 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC81C2BBFC;
	Thu, 13 Jun 2024 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295068;
	bh=z0DqfcNoX5A2/L3klTRARsHnyz5IqXkJ715WfadhAAA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFBiyNW90RGvHka9zleDUBoZCw1fV9YVj+Aeb19DNZsDxDrdpS6z4jJpx6nx0ag+5
	 UdSj1Wjh/DDrAtSQvZAJeSCBYv5jmp2pHzdAfEkOkBOmmO4H5yc4CLeVT6JLtNJ2ok
	 gYqsMGmuHrztShhN93F0J1sfqSYCErIlAPbVqWXv954GbE9VeXPOX7NFv5wokQPJEB
	 h6sG++UZGI4b7A95DbcCHaYpQudQh1WSQb28eC5Mnt942Yzzu8mVcVCY/4Wg06QpGI
	 9tbVwaXhaaFjKdl2DD5u2BPATCN5tJHJ35Ms/I8/+Az90oMI4nC3u+VU+umqOXEDKH
	 9kJsLvGCqksdg==
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
Subject: [PATCH v2 07/17] firmware: turris-mox-rwtm: Fix driver includes
Date: Thu, 13 Jun 2024 18:10:35 +0200
Message-ID: <20240613161045.29606-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240613161045.29606-1-kabel@kernel.org>
References: <20240613161045.29606-1-kabel@kernel.org>
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
index fb263f9bbab9..75a98386a2b0 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -8,16 +8,21 @@
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
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 
 #define DRIVER_NAME		"turris-mox-rwtm"
-- 
2.44.2

