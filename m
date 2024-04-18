Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8564C04FF8
	for <soc@archiver.kernel.org>; Thu, 18 Apr 2024 12:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B4DEC2BD11; Thu, 18 Apr 2024 12:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E193FC3277B;
	Thu, 18 Apr 2024 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713442301;
	bh=gDm+vxifqfgI0zvQH3cprDJiS9FxvEo5MXz4TMPtOqY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GiBNT9aw6Yf6jO2XBM+9591H3Nh6Yp/RwF+OoMKbzc+LKD6ZEgl7lQinv47yTJxFa
	 2jAYSWSEehRWW+9G6o6I98wr1C8kEpAKSwGVV9sWb3y99esPf/tr8cMlqhYxfZ1QJZ
	 9SBNASH0GfY3t+ulQjVWOdO3TtW4+yHX7B6OOGXgkJkMRmqKRkoB7jVPSdFUmMbHrg
	 f3m7uZ+Q4te8jfKP24TE0JlWHYZcmmv2DL0I2brHR43OPpF4lWK1SjWB8cuyGLEpnj
	 jDwUARhYqCSUX2Ymx+kdgItkBuJWYHJxIzdATyTu9V7TppdTXXG7H1vPb7AelLf83P
	 dSYMsHRShLCRg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v6 06/11] devm-helpers: Add resource managed version of irq_create_mapping()
Date: Thu, 18 Apr 2024 14:11:11 +0200
Message-ID: <20240418121116.22184-7-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418121116.22184-1-kabel@kernel.org>
References: <20240418121116.22184-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add resource managed version of irq_create_mapping(), to help drivers
automatically dispose a linux irq mapping when driver is detached.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/devm-helpers.h | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index 74891802200d..fe62b28baf03 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -24,6 +24,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/kconfig.h>
+#include <linux/irqdomain.h>
 #include <linux/workqueue.h>
 
 static inline void devm_delayed_work_drop(void *res)
@@ -76,4 +78,56 @@ static inline int devm_work_autocancel(struct device *dev,
 	return devm_add_action(dev, devm_work_drop, w);
 }
 
+/**
+ * devm_irq_mapping_drop - devm action for disposing an irq mapping
+ * @res:	linux irq number cast to the void * type
+ *
+ * devm_irq_mapping_drop() can be used as an action parameter for the
+ * devm_add_action_or_reset() function in order to automatically dispose
+ * a linux irq mapping when a device driver is detached.
+ */
+static inline void devm_irq_mapping_drop(void *res)
+{
+	irq_dispose_mapping((unsigned int)(unsigned long)res);
+}
+
+/**
+ * devm_irq_create_mapping - Resource managed version of irq_create_mapping()
+ * @dev:	Device which lifetime the mapping is bound to
+ * @domain:	domain owning this hardware interrupt or NULL for default domain
+ * @hwirq:	hardware irq number in that domain space
+ *
+ * Create an irq mapping to linux irq space which is automatically disposed when
+ * the driver is detached.
+ * devm_irq_create_mapping() can be used to omit the explicit
+ * irq_dispose_mapping() call when driver is detached.
+ *
+ * Returns a linux irq number on success, -ENXIO if the mapping could not be
+ * created, or a negative error number if devm action could not be added.
+ */
+static inline int devm_irq_create_mapping(struct device *dev,
+					  struct irq_domain *domain,
+					  irq_hw_number_t hwirq)
+{
+	unsigned int virq = irq_create_mapping(domain, hwirq);
+
+	if (!virq)
+		return -ENXIO;
+
+	/*
+	 * irq_dispose_mapping() is an empty function if CONFIG_IRQ_DOMAIN is
+	 * disabled. No need to register an action in that case.
+	 */
+	if (IS_ENABLED(CONFIG_IRQ_DOMAIN)) {
+		int err;
+
+		err = devm_add_action_or_reset(dev, devm_irq_mapping_drop,
+					       (void *)(unsigned long)virq);
+		if (err)
+			return err;
+	}
+
+	return virq;
+}
+
 #endif
-- 
2.43.2

