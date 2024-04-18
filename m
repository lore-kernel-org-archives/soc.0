Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEF2C4345F
	for <soc@archiver.kernel.org>; Thu, 18 Apr 2024 12:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 361CEC2BD11; Thu, 18 Apr 2024 12:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54423C3277B;
	Thu, 18 Apr 2024 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442306;
	bh=ypUSGhQv/68ujM0yOLLZAifAP6IFFNdOBDVaREk68t4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oo5A+RVXX/xNrAWl9tlT9d++XKSxKZ/61s1Y9YpIjqPtcttPlXhw7YHJ4N9EEdI4i
	 GdijSB4EkAnFGU8xgjIdz8PsjksG5DFuvI8EPetWpZTe00h9mEaRcrdhluixhRbzb5
	 p+4vzFaY4sj3I/fJzBdMiX5p0ZNBcYgHw6AZtbnxL7ZuQvgdaWtWy3V4bgXv3C9zoK
	 GLBjsarqPibAXgQ+Zh6XYnJ00qCCH6JHrmo6SRtC/45lu8mCxS+phoG0N/5IinFdnS
	 VKaP5eeXUgbo4AK92zoaiRHeBprDXrG5a5VXsrwQDxNhQqk9Fxs8JjgOSJE3eP0dzH
	 OlXIv8d69ZmUQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v6 08/11] devm-helpers: Add resource managed version of debugfs directory create function
Date: Thu, 18 Apr 2024 14:11:13 +0200
Message-ID: <20240418121116.22184-9-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
References: <20240418121116.22184-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few drivers register a devm action to remove a debugfs directory,
implementing a one-liner function that calls debufs_remove_recursive().
Help drivers avoid this repeated implementations by adding managed
version of debugfs directory create function.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/devm-helpers.h | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index fe62b28baf03..58e0a7fbd549 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -23,6 +23,7 @@
  * already ran.
  */
 
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/kconfig.h>
 #include <linux/irqdomain.h>
@@ -130,4 +131,43 @@ static inline int devm_irq_create_mapping(struct device *dev,
 	return virq;
 }
 
+static inline void devm_debugfs_dir_recursive_drop(void *res)
+{
+	debugfs_remove_recursive(res);
+}
+
+/**
+ * devm_debugfs_create_dir - Resource managed debugfs directory creation
+ * @dev:	Device which lifetime the directory is bound to
+ * @name:	a pointer to a string containing the name of the directory to
+ *		create
+ * @parent:	a pointer to the parent dentry for this file.  This should be a
+ *		directory dentry if set.  If this parameter is NULL, then the
+ *		directory will be created in the root of the debugfs filesystem.
+ *
+ * Create a debugfs directory which is automatically recursively removed when
+ * the driver is detached. A few drivers create debugfs directories which they
+ * want removed before driver is detached.
+ * devm_debugfs_create_dir() can be used to omit the explicit
+ * debugfs_remove_recursive() call when driver is detached.
+ */
+static inline struct dentry *
+devm_debugfs_create_dir(struct device *dev, const char *name,
+			struct dentry *parent)
+{
+	struct dentry *dentry;
+	int err;
+
+	dentry = debugfs_create_dir(name, parent);
+	if (IS_ERR(dentry))
+		return dentry;
+
+	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
+				       dentry);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	return dentry;
+}
+
 #endif
-- 
2.43.2

