Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD78C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DAE1C3277B; Wed, 12 Jun 2024 13:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A65C4AF1A;
	Wed, 12 Jun 2024 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200506;
	bh=NCKHSWCnLa+FimG1uW1VNJqome5YSP5MoytzzxjTQC8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uEkRNjXqe8wXYul/9UeGaQbDF+mqYLsxC84YKNKvuiVoA6tjwujTHZNMAqw+4fHDB
	 xc2g1RuGw0ILgLdzSui7xKpnMN56zbLTBtrUAp0Pc6/9AVGqbSgnSzA1YlR3qHd0MU
	 WKBjnYrQy/mkGZup38v7Z65At+OJsZVuQdBjJqI8qNQFkh/UAJqSy0PbNdvnudxIQo
	 l/FkdC3mWj0YGgnDYwqIS8nHFhxliDjZnZ5+x6G6Id3VOzstsrRP10ji13AAbS7eoy
	 IsIJmBgJKJtXI+1RTtK+rDU25405rg2VsREmXuVVcBh8oIan+9kqF6x8eEh6KKiJYG
	 MJF3mO4dwpWVQ==
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
Subject: [PATCH 07/19] firmware: turris-mox-rwtm: Fix driver includes
Date: Wed, 12 Jun 2024 15:54:31 +0200
Message-ID: <20240612135443.30239-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
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
index 254629437f59..5675f94a3ff2 100644
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

