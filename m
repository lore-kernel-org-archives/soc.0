Return-Path: <SRS0=0bQq=TP=fujitsu.com=hasegawa-hitomi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B7C433F5
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 06:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E9B7C340F5; Fri,  4 Mar 2022 06:47:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 199C4C340E9;
	Fri,  4 Mar 2022 06:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 199C4C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fujitsu.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
IronPort-SDR: VnTR0Ef4EQ5a0EJ8YASk4YNjRaWu/1GOTHBaKiZuVC36jjtYIsFkLkVTgHvWDn8mip8/DaaMsm
 /yL5XLRkBsKdwOy+ollFxhgGvvb7kuloGxx08c3q4fLDR+g8npI7gsQJJciemU+xv3JNawNKwi
 hONr/3x3txUr5XuEjin1u9sSQwJhOYs405A4a99D0CZiixRMF5a97oWdT/+aWwVnYQiA+xtYmN
 O7hsY+gAg/IS4mdd7loX5lg34i8H8PoJ7lW7njzs1mDpeC508eRzOI6ikTH3AHiT4UPWksnZrX
 bvl3hQuJopwOkz4zRUHf0gVy
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="64667367"
X-IronPort-AV: E=Sophos;i="5.90,154,1643641200"; 
   d="scan'208";a="64667367"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP; 04 Mar 2022 15:45:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B8298CA38E;
	Fri,  4 Mar 2022 15:45:51 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFF6E1427C;
	Fri,  4 Mar 2022 15:45:50 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp [10.123.235.113])
	by yto-om2.fujitsu.com (Postfix) with ESMTP id 838674007DEED;
	Fri,  4 Mar 2022 15:45:50 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	linux-serial@vger.kernel.org,
	sumit.garg@linaro.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	jason.wessel@windriver.com,
	daniel.thompson@linaro.org,
	dianders@chromium.org,
	linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	peterz@infradead.org,
	hasegawa-hitomi@fujitsu.com
Subject: [PATCH v2 2/2] soc: fujitsu: Add A64FX diagnostic interrupt driver
Date: Fri,  4 Mar 2022 15:43:24 +0900
Message-Id: <20220304064324.331217-3-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

Enable diagnostic interrupts for the A64FX.
This is done using a pseudo-NMI.

Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
---
 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
 6 files changed, 174 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dd36acc87ce6..e9663fa92a52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,6 +239,11 @@ F:	include/trace/events/9p.h
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
index e8a30c4c5aec..0405ff0b3be6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -8,6 +8,7 @@ source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
+source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index a05e9fbcd3e0..86596405a39c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
+obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-y				+= ixp4xx/
diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
new file mode 100644
index 000000000000..b41cdac67637
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "fujitsu SoC drivers"
+
+config A64FX_DIAG
+	bool "A64FX diag driver"
+	depends on ARM64
+	help
+	  Say Y here if you want to enable diag interrupt on A64FX.
+	  This driver uses pseudo-NMI if available.
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
index 000000000000..c6f895cf8912
--- /dev/null
+++ b/drivers/soc/fujitsu/a64fx-diag.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A64FX diag driver.
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sysrq.h>
+
+#define A64FX_DIAG_IRQ 1
+#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
+#define BMC_INTERRUPT_STATUS_MASK ((1U) << 31)
+#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
+#define BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)
+
+struct a64fx_diag_priv {
+	int irq;
+	void __iomem *mmsc_reg_base;
+	bool has_nmi;
+};
+
+static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
+{
+	handle_sysrq('c');
+
+	return IRQ_HANDLED;
+}
+
+static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_status_reg_addr;
+
+	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
+	mmsc = readl(diag_status_reg_addr);
+	if (mmsc & BMC_INTERRUPT_STATUS_MASK)
+		writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
+}
+
+static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (!(mmsc & BMC_INTERRUPT_ENABLE_MASK)) {
+		mmsc |= BMC_INTERRUPT_STATUS_MASK;
+		writel(mmsc, (void *)diag_enable_reg_addr);
+	}
+}
+
+static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (mmsc & BMC_INTERRUPT_ENABLE_MASK) {
+		mmsc &= ~BMC_INTERRUPT_ENABLE_MASK;
+		writel(mmsc, (void *)diag_enable_reg_addr);
+	}
+}
+
+static int a64fx_diag_probe(struct platform_device *pdev)
+{
+	int ret;
+	unsigned long irq_flags;
+	struct device *dev = &pdev->dev;
+	struct a64fx_diag_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv), GFP_KERNEL);
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
+	a64fx_diag_interrupt_clear(priv);
+	a64fx_diag_interrupt_enable(priv);
+
+	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
+		   IRQF_NO_THREAD;
+	ret = request_nmi(priv->irq, &a64fx_diag_handler, irq_flags,
+			"a64fx_diag_nmi", NULL);
+	if (ret) {
+		ret = request_irq(priv->irq, &a64fx_diag_handler,
+				irq_flags, "a64fx_diag_irq", NULL);
+		if (ret) {
+			dev_err(dev, "cannot register IRQ %d\n", ret);
+			return ret;
+		}
+		enable_irq(priv->irq);
+		priv->has_nmi = false;
+		dev_info(dev, "registered for IRQ %d\n", priv->irq);
+	} else {
+		enable_nmi(priv->irq);
+		priv->has_nmi = true;
+		dev_info(dev, "registered for NMI %d\n", priv->irq);
+	}
+
+	return 0;
+}
+
+static int __exit a64fx_diag_remove(struct platform_device *pdev)
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

