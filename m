Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831E1C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 753D6C3277B; Wed, 12 Jun 2024 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD08C116B1;
	Wed, 12 Jun 2024 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200513;
	bh=oH4c2b46Uxiua0aZV3BzNe9qtvV1Wp1s4VPDuk/wB9k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2ADrSpz0J8PW2E6s4bj9kNNlTLFPWJ+jLznRN9/mlIJkMJPsqA1HwK7jdXuPmVaY
	 dUGS2WTnFG9ybwvjVfuW4WkW7ErUW0vQjnrZMYZ84GwAs81x6RovG4GZ1ViyGEHYue
	 QTfbZeNMU6w0XhXMom6zmQ8+U/2W7p/5GywG9rggZV3UOJ7oj604Z+HoZni/1Tl6Ez
	 t5hmpp8mDe73e83RNMEKba8hFUW+YwQ5pVYRehzIoobx5ZmBLi/QEhwp4GheoJ/89l
	 VlHC1CCJZm26ryIMpphAyz13fjf4EgFbwdbWd3XWCy4OUjgTuAgb1Y7hxcwBA1wZKI
	 7N4+hIRQ9dCHQ==
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
Subject: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver kobject code
Date: Wed, 12 Jun 2024 15:54:34 +0200
Message-ID: <20240612135443.30239-11-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop the mox_kobject wrapper that needs to be allocated, instead put the
kobject directly into the driver private structure. This allows us to
drop one kzalloc() call.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 36 ++++++++----------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 6d1e0b1dd2b4..84ec72575c4d 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -21,7 +21,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -58,13 +57,11 @@ enum mbox_cmd {
 	MBOX_CMD_OTP_WRITE	= 8,
 };
 
-struct mox_kobject;
-
 struct mox_rwtm {
 	struct device *dev;
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
-	struct mox_kobject *kobj;
+	struct kobject kobj;
 	struct hwrng hwrng;
 
 	struct armada_37xx_rwtm_rx_msg reply;
@@ -97,19 +94,9 @@ struct mox_rwtm {
 #endif
 };
 
-struct mox_kobject {
-	struct kobject kobj;
-	struct mox_rwtm *rwtm;
-};
-
-static inline struct kobject *rwtm_to_kobj(struct mox_rwtm *rwtm)
-{
-	return &rwtm->kobj->kobj;
-}
-
 static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
 {
-	return container_of(kobj, struct mox_kobject, kobj)->rwtm;
+	return container_of(kobj, struct mox_rwtm, kobj);
 }
 
 #define MOX_ATTR_RO(name, format, cat)				\
@@ -142,9 +129,8 @@ static struct attribute *mox_rwtm_attrs[] = {
 };
 ATTRIBUTE_GROUPS(mox_rwtm);
 
-static void mox_kobj_release(struct kobject *kobj)
+static void mox_kobj_release(struct kobject *)
 {
-	kfree(to_rwtm(kobj)->kobj);
 }
 
 static const struct kobj_type mox_kobj_ktype = {
@@ -155,18 +141,14 @@ static const struct kobj_type mox_kobj_ktype = {
 
 static int mox_kobj_create(struct mox_rwtm *rwtm)
 {
-	rwtm->kobj = kzalloc(sizeof(*rwtm->kobj), GFP_KERNEL);
-	if (!rwtm->kobj)
-		return -ENOMEM;
+	struct kobject *kobj = &rwtm->kobj;
 
-	kobject_init(rwtm_to_kobj(rwtm), &mox_kobj_ktype);
-	if (kobject_add(rwtm_to_kobj(rwtm), firmware_kobj, "turris-mox-rwtm")) {
-		kobject_put(rwtm_to_kobj(rwtm));
+	kobject_init(kobj, &mox_kobj_ktype);
+	if (kobject_add(kobj, firmware_kobj, "turris-mox-rwtm")) {
+		kobject_put(kobj);
 		return -ENXIO;
 	}
 
-	rwtm->kobj->rwtm = rwtm;
-
 	return 0;
 }
 
@@ -540,7 +522,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 free_channel:
 	mbox_free_channel(rwtm->mbox);
 put_kobj:
-	kobject_put(rwtm_to_kobj(rwtm));
+	kobject_put(&rwtm->kobj);
 	return ret;
 }
 
@@ -548,7 +530,7 @@ static void turris_mox_rwtm_remove(struct platform_device *pdev)
 {
 	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
 
-	kobject_put(rwtm_to_kobj(rwtm));
+	kobject_put(&rwtm->kobj);
 	mbox_free_channel(rwtm->mbox);
 }
 
-- 
2.44.2

