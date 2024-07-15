Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA8C3DA5D
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 10:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D764C4AF0F; Mon, 15 Jul 2024 10:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03980C4AF0A;
	Mon, 15 Jul 2024 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040471;
	bh=5XVMq6Zj0fgRRybCQ1Ckyb89CTJwFtTCG3NWvPiSKEo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b0bI16G9SiApLHTZKf0xePgyX67mCTAJQl3fBHUDMsizHcgN60h98puzGXPC/a0y1
	 J3i2JFd4RuSBE+B20ZTSfLuG9OalJZRkValceNc0JyIao9cAbrHR+/69isbvC+02u5
	 f2WiB04ctOd9GKkeGxaQkrbCnQFFqKkTDmWLJhR7aGTv6+z7yCh7gTCvaarSzp92ji
	 pdfLnOQPqMBYjTeWSmIkBICZ8BFjA/kUBmNjzJAfo9P/LzzcYlhuOxXdc2l9Xdj4EA
	 brCzWTEutF30BflJ64TMxG2aEsAISkh22q8qbTqDuz7d4ncY+23RVNOuTskpuWxgpo
	 xpqZ67zjioBsw==
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
Subject: [PATCH v4 09/19] firmware: turris-mox-rwtm: Don't create own kobject type
Date: Mon, 15 Jul 2024 12:47:13 +0200
Message-ID: <20240715104723.17751-10-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
References: <20240715104723.17751-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to create attribute files in /sys/firmware/turris-mox-rwtm,
this driver creates it's own kobject type.

Simplify this by dropping this own kobject creation, and instead
creating standard device attribute files.

For backwards compatibility with sysfs ABI, create a symlink
/sys/firmware/turris-mox-rwtm, pointing to this device's sysfs
directory.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 108 ++++++++---------------------
 1 file changed, 30 insertions(+), 78 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index e3e209247e68..ca70a07b4dee 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -23,7 +23,6 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
-#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -61,13 +60,10 @@ enum mbox_cmd {
 	MBOX_CMD_OTP_WRITE	= 8,
 };
 
-struct mox_kobject;
-
 struct mox_rwtm {
 	struct device *dev;
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
-	struct mox_kobject *kobj;
 	struct hwrng hwrng;
 
 	struct armada_37xx_rwtm_rx_msg reply;
@@ -101,59 +97,17 @@ struct mox_rwtm {
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
-static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
-{
-	return container_of(kobj, struct mox_kobject, kobj)->rwtm;
-}
-
-static void mox_kobj_release(struct kobject *kobj)
-{
-	kfree(to_rwtm(kobj)->kobj);
-}
-
-static const struct kobj_type mox_kobj_ktype = {
-	.release	= mox_kobj_release,
-	.sysfs_ops	= &kobj_sysfs_ops,
-};
-
-static int mox_kobj_create(struct mox_rwtm *rwtm)
-{
-	rwtm->kobj = kzalloc(sizeof(*rwtm->kobj), GFP_KERNEL);
-	if (!rwtm->kobj)
-		return -ENOMEM;
-
-	kobject_init(rwtm_to_kobj(rwtm), &mox_kobj_ktype);
-	if (kobject_add(rwtm_to_kobj(rwtm), firmware_kobj, "turris-mox-rwtm")) {
-		kobject_put(rwtm_to_kobj(rwtm));
-		return -ENXIO;
-	}
-
-	rwtm->kobj->rwtm = rwtm;
-
-	return 0;
-}
-
 #define MOX_ATTR_RO(name, format, cat)				\
 static ssize_t							\
-name##_show(struct kobject *kobj, struct kobj_attribute *a,	\
+name##_show(struct device *dev, struct device_attribute *a,	\
 	    char *buf)						\
 {								\
-	struct mox_rwtm *rwtm = to_rwtm(kobj);	\
+	struct mox_rwtm *rwtm = dev_get_drvdata(dev);		\
 	if (!rwtm->has_##cat)					\
 		return -ENODATA;				\
 	return sysfs_emit(buf, format, rwtm->name);		\
 }								\
-static struct kobj_attribute mox_attr_##name = __ATTR_RO(name)
+static DEVICE_ATTR_RO(name)
 
 MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
 MOX_ATTR_RO(board_version, "%i\n", board_info);
@@ -162,6 +116,17 @@ MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
 MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
 MOX_ATTR_RO(pubkey, "%s\n", pubkey);
 
+static struct attribute *turris_mox_rwtm_attrs[] = {
+	&dev_attr_serial_number.attr,
+	&dev_attr_board_version.attr,
+	&dev_attr_ram_size.attr,
+	&dev_attr_mac_address1.attr,
+	&dev_attr_mac_address2.attr,
+	&dev_attr_pubkey.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(turris_mox_rwtm);
+
 static int mox_get_status(enum mbox_cmd cmd, u32 retval)
 {
 	if (MBOX_STS_CMD(retval) != cmd)
@@ -176,16 +141,6 @@ static int mox_get_status(enum mbox_cmd cmd, u32 retval)
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
@@ -486,6 +441,11 @@ static inline void rwtm_unregister_debugfs(struct mox_rwtm *rwtm)
 }
 #endif
 
+static void rwtm_firmware_symlink_drop(void *parent)
+{
+	sysfs_remove_link(parent, DRIVER_NAME);
+}
+
 static int turris_mox_rwtm_probe(struct platform_device *pdev)
 {
 	struct mox_rwtm *rwtm;
@@ -502,18 +462,6 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 	if (!rwtm->buf)
 		return -ENOMEM;
 
-	ret = mox_kobj_create(rwtm);
-	if (ret < 0) {
-		dev_err(dev, "Cannot create turris-mox-rwtm kobject!\n");
-		return ret;
-	}
-
-	ret = sysfs_create_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
-	if (ret < 0) {
-		dev_err(dev, "Cannot create sysfs files!\n");
-		goto put_kobj;
-	}
-
 	platform_set_drvdata(pdev, rwtm);
 
 	mutex_init(&rwtm->busy);
@@ -527,7 +475,7 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Cannot request mailbox channel: %i\n",
 				ret);
-		goto remove_files;
+		return ret;
 	}
 
 	init_completion(&rwtm->cmd_done);
@@ -561,14 +509,19 @@ static int turris_mox_rwtm_probe(struct platform_device *pdev)
 
 	dev_info(dev, "HWRNG successfully registered\n");
 
+	/*
+	 * For sysfs ABI compatibility, create symlink
+	 * /sys/firmware/turris-mox-rwtm to this device's sysfs directory.
+	 */
+	ret = sysfs_create_link(firmware_kobj, &dev->kobj, DRIVER_NAME);
+	if (!ret)
+		devm_add_action_or_reset(dev, rwtm_firmware_symlink_drop,
+					 firmware_kobj);
+
 	return 0;
 
 free_channel:
 	mbox_free_channel(rwtm->mbox);
-remove_files:
-	sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
-put_kobj:
-	kobject_put(rwtm_to_kobj(rwtm));
 	return ret;
 }
 
@@ -577,8 +530,6 @@ static void turris_mox_rwtm_remove(struct platform_device *pdev)
 	struct mox_rwtm *rwtm = platform_get_drvdata(pdev);
 
 	rwtm_unregister_debugfs(rwtm);
-	sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
-	kobject_put(rwtm_to_kobj(rwtm));
 	mbox_free_channel(rwtm->mbox);
 }
 
@@ -596,6 +547,7 @@ static struct platform_driver turris_mox_rwtm_driver = {
 	.driver	= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= turris_mox_rwtm_match,
+		.dev_groups	= turris_mox_rwtm_groups,
 	},
 };
 module_platform_driver(turris_mox_rwtm_driver);
-- 
2.44.2

