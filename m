Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AEDCA101D
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 09:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B724AC4CEC7; Sat, 31 Aug 2024 09:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35B9C4CEC5;
	Sat, 31 Aug 2024 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725096072;
	bh=QOYrXpy2pmCBbkyC+LvWvL/9josV+fUBW6pQ3TTjIMc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6MZZUwrQW4aCVfpZS6DfnpheL2urClIWIMmqR2t9ORM+l2SgmssIPHldZlNWDDX3
	 gKUTgpEIAMS1ntO+E8iTFsN/jYWrFCCk7PKNwImZlkdlI4IsilRGcVcTjrjEHRKPZX
	 SKpMy2J47dbGx/rGDI0KWGwYDBp/8wfBCklXLyczvcEu2C31A/CLGezBs5NjYJzktk
	 abtOs09U5b8Jz79WKEjjBlAxGp7aZ1FcLgSikcdxyjhi3qvyQoWbZNcHnCnwuh1hAh
	 d/ulQ3ufvXu9YUokpsqJpb1uJYLlCHvIILslmWwE2DdHDGSF9+8B7DeBGmp9yxi3/B
	 eR65ZOTc7/5og==
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
Subject: [PATCH v5 06/16] firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
Date: Sat, 31 Aug 2024 11:20:40 +0200
Message-ID: <20240831092050.23093-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240831092050.23093-1-kabel@kernel.org>
References: <20240831092050.23093-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() in sysfs attribute .show()
method.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index ca1eb1687d44..8923c4cabcd0 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -151,7 +151,7 @@ name##_show(struct kobject *kobj, struct kobj_attribute *a,	\
 	struct mox_rwtm *rwtm = to_rwtm(kobj);	\
 	if (!rwtm->has_##cat)					\
 		return -ENODATA;				\
-	return sprintf(buf, format, rwtm->name);		\
+	return sysfs_emit(buf, format, rwtm->name);		\
 }								\
 static struct kobj_attribute mox_attr_##name = __ATTR_RO(name)
 
-- 
2.44.2

