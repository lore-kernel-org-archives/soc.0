Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E1CC27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 13:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84F7FC4AF49; Wed, 12 Jun 2024 13:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68188C4AF1C;
	Wed, 12 Jun 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718200508;
	bh=Bf9tRSAmEXenw45r/F8ave9yg8ECTSVDJu6/QnQTpN4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bYmwmlXbzak/3S6E18d5kS3LGnhkBjV9M9pCiFE60gkrB16ehU0qHcGkJjD0WCt40
	 YQ3VyVE1cENPqXX1sXihu5ASU5zbIoimETOIY6RK3ZNNf9Vvg9AML1UXBWSCSmkOs7
	 O283nqmhKzbswNTYfF0LmCrGxwO5aZEwVyXhYfq/GxZu2cUT9MgXkbU7to4rlQg0vd
	 V8uhMuky4q4TyPVrNzS/F1nCSkWIzKFch4yDcFOF5dHOV9bBKbdP5xeJXIiVcwbnvx
	 8JwHsyx8VkuFuZQ96Hi+3mXH4zpDqZrBFKaX4aBQnAbzhy6kNi5dJSTuP15GpSOiYg
	 7pyfNNbi4zFQw==
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
Subject: [PATCH 08/19] firmware: turris-mox-rwtm: Use kobj_type's default_groups member for automatic sysfs files creation
Date: Wed, 12 Jun 2024 15:54:32 +0200
Message-ID: <20240612135443.30239-9-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612135443.30239-1-kabel@kernel.org>
References: <20240612135443.30239-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Put the turris-mox-rwtm attribute group into the .default_groups
member of the underlying kobject type and drop the manual
sysfs_create_files() / sysfs_remove_files(). The kobject library will
take care of this in it's internal code.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 71 ++++++++++++++----------------
 1 file changed, 32 insertions(+), 39 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 5675f94a3ff2..441409fefc59 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -113,6 +113,36 @@ static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
 	return container_of(kobj, struct mox_kobject, kobj)->rwtm;
 }
 
+#define MOX_ATTR_RO(name, format, cat)				\
+static ssize_t							\
+name##_show(struct kobject *kobj, struct kobj_attribute *a,	\
+	    char *buf)						\
+{								\
+	struct mox_rwtm *rwtm = to_rwtm(kobj);	\
+	if (!rwtm->has_##cat)					\
+		return -ENODATA;				\
+	return sprintf(buf, format, rwtm->name);		\
+}								\
+static struct kobj_attribute mox_attr_##name = __ATTR_RO(name)
+
+MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
+MOX_ATTR_RO(board_version, "%i\n", board_info);
+MOX_ATTR_RO(ram_size, "%i\n", board_info);
+MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
+MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
+MOX_ATTR_RO(pubkey, "%s\n", pubkey);
+
+static struct attribute *mox_rwtm_attrs[] = {
+	&mox_attr_serial_number.attr,
+	&mox_attr_board_version.attr,
+	&mox_attr_ram_size.attr,
+	&mox_attr_mac_address1.attr,
+	&mox_attr_mac_address2.attr,
+	&mox_attr_pubkey.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mox_rwtm);
+
 static void mox_kobj_release(struct kobject *kobj)
 {
 	kfree(to_rwtm(kobj)->kobj);
@@ -121,6 +151,7 @@ static void mox_kobj_release(struct kobject *kobj)
 static const struct kobj_type mox_kobj_ktype = {
 	.release	= mox_kobj_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups	= mox_rwtm_groups,
 };
 
 static int mox_kobj_create(struct mox_rwtm *rwtm)
@@ -140,25 +171,6 @@ static int mox_kobj_create(struct mox_rwtm *rwtm)
 	return 0;
 }
 
-#define MOX_ATTR_RO(name, format, cat)				\
-static ssize_t							\
-name##_show(struct kobject *kobj, struct kobj_attribute *a,	\
-	    char *buf)						\
-{								\
-	struct mox_rwtm *rwtm = to_rwtm(kobj);	\
-	if (!rwtm->has_##cat)					\
-		return -ENODATA;				\
-	return sprintf(buf, format, rwtm->name);		\
-}								\
-static struct kobj_attribute mox_attr_##name = __ATTR_RO(name)
-
-MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
-MOX_ATTR_RO(board_version, "%i\n", board_info);
-MOX_ATTR_RO(ram_size, "%i\n", board_info);
-MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
-MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
-MOX_ATTR_RO(pubkey, "%s\n", pubkey);
-
 static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 {
 	if (MBOX_STS_CMD(retval) != cmd)
@@ -173,16 +185,6 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 		return MBOX_STS_VALUE(retval);
 }
 
-static const struct attribute *mox_rwtm_attrs[] = {
-	&mox_attr_serial_number.attr,
-	&mox_attr_board_version.attr,
-	&mox_attr_ram_size.attr,
-	&mox_attr_mac_address1.attr,
-	&mox_attr_mac_address2.attr,
-	&mox_attr_pubkey.attr,
-	NULL
-};
-
 static void mox_rwtm_rx_callback(struct mbox_client *cl, void *data)
 {
 	struct mox_rwtm *rwtm = dev_get_drvdata(cl->dev);
@@ -507,12 +509,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = sysfs_create_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
-	if (ret < 0) {
-		dev_err(dev, "Cannot create sysfs files!\n");
-		goto put_kobj;
-	}
-
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
@@ -526,7 +522,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Cannot request mailbox channel: %i\n",
 				ret);
-		goto remove_files;
+		goto put_kobj;
 	}
 
 	init_completion(&rwtm->cmd_done);
@@ -564,8 +560,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 free_channel:
 	mbox_free_channel(rwtm->mbox);
-remove_files:
-	sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
 put_kobj:
 	kobject_put(rwtm_to_kobj(rwtm));
 	return ret;
@@ -576,7 +570,6 @@ static void turris_mox_rwtm_remove(struct platform_device *pdev)
 	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
 
 	rwtm_unregister_debugfs(rwtm);
-	sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
 	kobject_put(rwtm_to_kobj(rwtm));
 	mbox_free_channel(rwtm->mbox);
 }
-- 
2.44.2

