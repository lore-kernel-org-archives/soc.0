Return-Path: <SRS0=BhPz=V4=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EA3C433F5
	for <soc@archiver.kernel.org>; Fri, 20 May 2022 07:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B3B7C385AA; Fri, 20 May 2022 07:42:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82E05C385A9;
	Fri, 20 May 2022 07:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82E05C385A9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=fujitsu.com
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="61442673"
X-IronPort-AV: E=Sophos;i="5.91,238,1647270000"; 
   d="scan'208";a="61442673"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 20 May 2022 16:42:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7243DB9F6;
	Fri, 20 May 2022 16:42:17 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E408DD9C66;
	Fri, 20 May 2022 16:42:11 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id D98134044EB13;
	Fri, 20 May 2022 16:42:10 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	sumit.garg@linaro.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.thompson@linaro.org,
	dianders@chromium.org,
	hasegawa-hitomi@fujitsu.com
Subject: [PATCH v5 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
Date: Fri, 20 May 2022 16:41:19 +0900
Message-Id: <20220520074119.3574753-2-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
References: <20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

Register the NMI/IRQ corresponding to the A64FX's device definition
dedicated to diagnostic interrupts, so that when this interrupt is
sent using the BMC, it causes a panic. This can be used to obtain
a kernel dump.

Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
---
 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  16 ++++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 154 +++++++++++++++++++++++++++++++
 6 files changed, 180 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cd0f68d4a34a..dc35c81ba917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,6 +241,11 @@ F:	include/trace/events/9p.h
 F:	include/uapi/linux/virtio_9p.h
 F:	net/9p/
 
+A64FX DIAG DRIVER
+M:	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
+S:	Supported
+F:	drivers/soc/fujitsu/a64fx-diag.c
+
 A8293 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a8562678c437..e10eb27e1e7e 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -9,6 +9,7 @@ source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
+source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index adb30c2d4fea..b12b0b03ad47 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
+obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-y				+= ixp4xx/
diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
new file mode 100644
index 000000000000..56275b44b293
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "fujitsu SoC drivers"
+
+config A64FX_DIAG
+	tristate "A64FX diag driver"
+	depends on ARM64
+	depends on ACPI
+	help
+	  Say Y here if you want to enable diag interrupt on Fujitsu A64FX.
+	  This driver enables BMC's diagnostic requests and enables
+	  A64FX-specific interrupts. This allows administrators to obtain
+	  kernel dumps via diagnostic requests using ipmitool, etc.
+
+	  If unsure, say N.
+
+endmenu
diff --git a/drivers/soc/fujitsu/Makefile b/drivers/soc/fujitsu/Makefile
new file mode 100644
index 000000000000..945bc1c14ad0
--- /dev/null
+++ b/drivers/soc/fujitsu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_A64FX_DIAG)	+= a64fx-diag.o
diff --git a/drivers/soc/fujitsu/a64fx-diag.c b/drivers/soc/fujitsu/a64fx-diag.c
new file mode 100644
index 000000000000..d87f348427bf
--- /dev/null
+++ b/drivers/soc/fujitsu/a64fx-diag.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A64FX diag driver.
+ * Copyright (c) 2022 Fujitsu Ltd.
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define A64FX_DIAG_IRQ 1
+#define BMC_DIAG_INTERRUPT_ENABLE 0x40
+#define BMC_DIAG_INTERRUPT_STATUS 0x44
+#define BMC_DIAG_INTERRUPT_MASK BIT(31)
+
+struct a64fx_diag_priv {
+	void __iomem *mmsc_reg_base;
+	int irq;
+	bool has_nmi;
+};
+
+static irqreturn_t a64fx_diag_handler_nmi(int irq, void *dev_id)
+{
+	nmi_panic(NULL, "a64fx_diag: interrupt received\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t a64fx_diag_handler_irq(int irq, void *dev_id)
+{
+	panic("a64fx_diag: interrupt received\n");
+
+	return IRQ_HANDLED;
+}
+
+static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
+{
+	void __iomem *diag_status_reg_addr;
+	u32 mmsc;
+
+	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS;
+	mmsc = readl(diag_status_reg_addr);
+	if (mmsc & BMC_DIAG_INTERRUPT_MASK)
+		writel(BMC_DIAG_INTERRUPT_MASK, diag_status_reg_addr);
+}
+
+static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
+{
+	void __iomem *diag_enable_reg_addr;
+	u32 mmsc;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE;
+	mmsc = readl(diag_enable_reg_addr);
+	if (!(mmsc & BMC_DIAG_INTERRUPT_MASK)) {
+		mmsc |= BMC_DIAG_INTERRUPT_MASK;
+		writel(mmsc, diag_enable_reg_addr);
+	}
+}
+
+static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
+{
+	void __iomem *diag_enable_reg_addr;
+	u32 mmsc;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE;
+	mmsc = readl(diag_enable_reg_addr);
+	if (mmsc & BMC_DIAG_INTERRUPT_MASK) {
+		mmsc &= ~BMC_DIAG_INTERRUPT_MASK;
+		writel(mmsc, diag_enable_reg_addr);
+	}
+}
+
+static int a64fx_diag_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct a64fx_diag_priv *priv;
+	unsigned long irq_flags;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (priv == NULL)
+		return -ENOMEM;
+
+	priv->mmsc_reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->mmsc_reg_base))
+		return PTR_ERR(priv->mmsc_reg_base);
+
+	priv->irq = platform_get_irq(pdev, A64FX_DIAG_IRQ);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	platform_set_drvdata(pdev, priv);
+
+	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
+		   IRQF_NO_THREAD;
+	ret = request_nmi(priv->irq, &a64fx_diag_handler_nmi, irq_flags,
+			"a64fx_diag_nmi", NULL);
+	if (ret) {
+		ret = request_irq(priv->irq, &a64fx_diag_handler_irq,
+				irq_flags, "a64fx_diag_irq", NULL);
+		if (ret) {
+			dev_err(dev, "cannot register IRQ %d\n", ret);
+			return ret;
+		}
+		enable_irq(priv->irq);
+	} else {
+		enable_nmi(priv->irq);
+		priv->has_nmi = true;
+	}
+
+	a64fx_diag_interrupt_clear(priv);
+	a64fx_diag_interrupt_enable(priv);
+
+	return 0;
+}
+
+static int a64fx_diag_remove(struct platform_device *pdev)
+{
+	struct a64fx_diag_priv *priv = platform_get_drvdata(pdev);
+
+	a64fx_diag_interrupt_disable(priv);
+	a64fx_diag_interrupt_clear(priv);
+
+	if (priv->has_nmi)
+		free_nmi(priv->irq, NULL);
+	else
+		free_irq(priv->irq, NULL);
+
+	return 0;
+}
+
+static const struct acpi_device_id a64fx_diag_acpi_match[] = {
+	{ "FUJI2007", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, a64fx_diag_acpi_match);
+
+
+static struct platform_driver a64fx_diag_driver = {
+	.driver = {
+		.name = "a64fx_diag_driver",
+		.acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
+	},
+	.probe = a64fx_diag_probe,
+	.remove = a64fx_diag_remove,
+};
+
+module_platform_driver(a64fx_diag_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>");
+MODULE_DESCRIPTION("A64FX diag driver");
-- 
2.27.0

