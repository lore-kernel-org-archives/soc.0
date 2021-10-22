Return-Path: <SRS0=XcGZ=PK=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3A2C433F5
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 00:06:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30AE560524; Fri, 22 Oct 2021 00:06:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391F46101D
	for <soc@kernel.org>; Fri, 22 Oct 2021 00:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 391F46101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id m26so2103757pff.3
        for <soc@kernel.org>; Thu, 21 Oct 2021 17:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h/KXmiLFURBaFM+yddCrjpdFHGnxgGidJec5VS7VQqM=;
        b=NQv/Cp9Q5LWYT4Bal+qwDr0ThR4sws9XKIvM70RS7j5juO+sq8Hw4FlI48HL1ViKiM
         lZ4NgKkEo0BU0Hk7MeagBZpUrEj3gfOMjPhCj2Cvh8jMJLQy9UQ23JvIVnCjMbAEGj92
         pdRsZHfcDYq8+KwKffPe6UJdVF3EeFQCASAEzTOJgW9U5OLebGa8tw0GIRZsHuwgfDRS
         ApgCY1ZaRCfj6ASov2vPk+NU0XXeHBOD/NhalotP3PWrJvjp+9Wr2Sgvssh6Xhym74OH
         tfIaRcRUcaHADxf3WL8GNck2wcmkFDFe8O/IH5xt542jU2u8WZev5x7t64RxId5GzXBr
         4njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=h/KXmiLFURBaFM+yddCrjpdFHGnxgGidJec5VS7VQqM=;
        b=butPdtI88AKGA7YSSOeIvj5IRjYCwvP7J65XwdfdeVplmHftXMm4YITq17rkcXU9dK
         XKRkZ6IrZ2xpqNo0jfvFs1PBqMsfMBdTZMeAjVY3OacM4Sq+eJeUYIT6c5VS93/VaORR
         +E2mKFZTW1llpQTGmThsrpTj3f0znLR6dbbSZQ7F2BUz0ox+qtkoSgzQaWuUPlehj6iX
         VvhSGRZkrb4/h6ZWfVJzaZRwFvcC/UnqYT/ozUXDstWq1Pp1OpNPIRmBf1RIbtsZeTC2
         pi6seRs00KqEmg0Ddk0WG6m23nEA3E59A2HyBDqEPuAGHEKHP4TOugMTlEEYt8mnMOmq
         zbAw==
X-Gm-Message-State: AOAM530UJVQIp6u3arxin7x0zC4nXDsDCgWlxHuqX9r+OQTwni+79Wad
	buF2brqT3wlxVCBjdC7mAEdjpoYdiL9Jaw==
X-Google-Smtp-Source: ABdhPJy0hNvU/7LlIrRJlJh2TXOs4vTH+AR5E9yXZPXVIgNg6UE1WOn/snWe6JXZZYibGgI5Cjjq/w==
X-Received: by 2002:a62:188c:0:b0:44d:6660:212b with SMTP id 134-20020a62188c000000b0044d6660212bmr9014723pfy.8.1634861190940;
        Thu, 21 Oct 2021 17:06:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id k3sm10515094pjg.43.2021.10.21.17.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 17:06:30 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Lei YU <yulei.sh@bytedance.com>
Subject: [PATCH] soc: aspeed: Add UART routing support
Date: Fri, 22 Oct 2021 10:36:16 +1030
Message-Id: <20211022000616.481772-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Add driver support for the UART routing control. Users can perform
runtime configuration of the RX muxes among the UART controllers and
the UART IO pins.

The sysfs interface is also exported for the convenience of routing paths
check and update.

Signed-off-by: Oskar Senft <osk@google.com>
Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Tested-by: Lei YU <yulei.sh@bytedance.com>
Link: https://lore.kernel.org/r/20210927023053.6728-5-chiawei_wang@aspeedtech.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hello Soc maintainers, this is the only soc patch I had for v5.16 so I'm
sending it on it's own instead of doing a pull request.

The driver has had several rounds of review. I'm not completely convinced
about the sysfs API, but I also didn't have a better suggestion. The
concept is unique to the ASPEED SoC, and given requirements that it be
adjusted a runtime means it doesn't fit into eg. pinmux or device tree
descriptions.

The bindings and device tree changes have gone through Rob's devicetree
tree and the Aspeed devicetree tree, leaving just the code and the sysfs
document.

The driver has been used out of tree by Google and others for a number
of years, so thank you to Chai-Wei from aspeed for picking it up and
getting it merged.

 .../testing/sysfs-driver-aspeed-uart-routing  |  27 +
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c      | 603 ++++++++++++++++++
 4 files changed, 645 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c

diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
new file mode 100644
index 000000000000..b363827da437
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -0,0 +1,27 @@
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+Date:		September 2021
+Contact:	Oskar Senft <osk@google.com>
+		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+Description:	Selects the RX source of the UARTx device.
+
+		When read, each file shows the list of available options with currently
+		selected option marked by brackets "[]". The list of available options
+		depends on the selected file.
+
+		e.g.
+		cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+		[io1] io2 io3 io4 uart2 uart3 uart4 io6
+
+		In this case, UART1 gets its input from IO1 (physical serial port 1).
+
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+Date:		September 2021
+Contact:	Oskar Senft <osk@google.com>
+		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+Description:	Selects the RX source of IOx serial port. The current selection
+		will be marked by brackets "[]".
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 243ca196e6ad..f579ee0b5afa 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -24,6 +24,16 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
+config ASPEED_UART_ROUTING
+	tristate "ASPEED uart routing control"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Provides a driver to control the UART routing paths, allowing
+	  users to perform runtime configuration of the RX muxes among
+	  the UART controllers and I/O pins.
+
 config ASPEED_P2A_CTRL
 	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fcab7192e1a4..b35d74592964 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
-obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
-obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
-obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
+obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
+obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
+obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
new file mode 100644
index 000000000000..ef8b24fd1851
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2018 Google LLC
+ * Copyright (c) 2021 Aspeed Technology Inc.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+
+/* register offsets */
+#define HICR9	0x98
+#define HICRA	0x9c
+
+/* attributes options */
+#define UART_ROUTING_IO1	"io1"
+#define UART_ROUTING_IO2	"io2"
+#define UART_ROUTING_IO3	"io3"
+#define UART_ROUTING_IO4	"io4"
+#define UART_ROUTING_IO5	"io5"
+#define UART_ROUTING_IO6	"io6"
+#define UART_ROUTING_IO10	"io10"
+#define UART_ROUTING_UART1	"uart1"
+#define UART_ROUTING_UART2	"uart2"
+#define UART_ROUTING_UART3	"uart3"
+#define UART_ROUTING_UART4	"uart4"
+#define UART_ROUTING_UART5	"uart5"
+#define UART_ROUTING_UART6	"uart6"
+#define UART_ROUTING_UART10	"uart10"
+#define UART_ROUTING_RES	"reserved"
+
+struct aspeed_uart_routing {
+	struct regmap *map;
+	struct attribute_group const *attr_grp;
+};
+
+struct aspeed_uart_routing_selector {
+	struct device_attribute	dev_attr;
+	uint8_t reg;
+	uint8_t mask;
+	uint8_t shift;
+	const char *const options[];
+};
+
+#define to_routing_selector(_dev_attr)					\
+	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf);
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count);
+
+#define ROUTING_ATTR(_name) {					\
+	.attr = {.name = _name,					\
+		 .mode = VERIFY_OCTAL_PERMISSIONS(0644) },	\
+	.show = aspeed_uart_routing_show,			\
+	.store = aspeed_uart_routing_store,			\
+}
+
+/* routing selector for AST25xx */
+static struct aspeed_uart_routing_selector ast2500_io6_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO6),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO5,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART5),
+	.reg = HICRA,
+	.shift = 28,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO6,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO5),
+	.reg = HICRA,
+	.shift = 12,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2500_uart_routing_attrs[] = {
+	&ast2500_io6_sel.dev_attr.attr,
+	&ast2500_uart5_sel.dev_attr.attr,
+	&ast2500_uart4_sel.dev_attr.attr,
+	&ast2500_uart3_sel.dev_attr.attr,
+	&ast2500_uart2_sel.dev_attr.attr,
+	&ast2500_uart1_sel.dev_attr.attr,
+	&ast2500_io5_sel.dev_attr.attr,
+	&ast2500_io4_sel.dev_attr.attr,
+	&ast2500_io3_sel.dev_attr.attr,
+	&ast2500_io2_sel.dev_attr.attr,
+	&ast2500_io1_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2500_uart_routing_attr_group = {
+	.attrs = ast2500_uart_routing_attrs,
+};
+
+/* routing selector for AST26xx */
+static struct aspeed_uart_routing_selector ast2600_uart10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART10),
+	.reg = HICR9,
+	.shift = 12,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO10,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO10),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO10,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2600_uart_routing_attrs[] = {
+	&ast2600_uart10_sel.dev_attr.attr,
+	&ast2600_io10_sel.dev_attr.attr,
+	&ast2600_uart4_sel.dev_attr.attr,
+	&ast2600_uart3_sel.dev_attr.attr,
+	&ast2600_uart2_sel.dev_attr.attr,
+	&ast2600_uart1_sel.dev_attr.attr,
+	&ast2600_io4_sel.dev_attr.attr,
+	&ast2600_io3_sel.dev_attr.attr,
+	&ast2600_io2_sel.dev_attr.attr,
+	&ast2600_io1_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2600_uart_routing_attr_group = {
+	.attrs = ast2600_uart_routing_attrs,
+};
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val, pos, len;
+
+	regmap_read(uart_routing->map, sel->reg, &val);
+	val = (val >> sel->shift) & sel->mask;
+
+	len = 0;
+	for (pos = 0; sel->options[pos] != NULL; ++pos) {
+		if (pos == val)
+			len += sysfs_emit_at(buf, len, "[%s] ", sel->options[pos]);
+		else
+			len += sysfs_emit_at(buf, len, "%s ", sel->options[pos]);
+	}
+
+	if (val >= pos)
+		len += sysfs_emit_at(buf, len, "[unknown(%d)]", val);
+
+	len += sysfs_emit_at(buf, len, "\n");
+
+	return len;
+}
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val;
+
+	val = match_string(sel->options, -1, buf);
+	if (val < 0) {
+		dev_err(dev, "invalid value \"%s\"\n", buf);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(uart_routing->map, sel->reg,
+			(sel->mask << sel->shift),
+			(val & sel->mask) << sel->shift);
+
+	return count;
+}
+
+static int aspeed_uart_routing_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct device *dev = &pdev->dev;
+	struct aspeed_uart_routing *uart_routing;
+
+	uart_routing = devm_kzalloc(&pdev->dev, sizeof(*uart_routing), GFP_KERNEL);
+	if (!uart_routing)
+		return -ENOMEM;
+
+	uart_routing->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(uart_routing->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return PTR_ERR(uart_routing->map);
+	}
+
+	uart_routing->attr_grp = of_device_get_match_data(dev);
+
+	rc = sysfs_create_group(&dev->kobj, uart_routing->attr_grp);
+	if (rc < 0)
+		return rc;
+
+	dev_set_drvdata(dev, uart_routing);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_uart_routing_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_uart_routing *uart_routing = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&dev->kobj, uart_routing->attr_grp);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2400-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2500-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2600-uart-routing",
+	  .data = &ast2600_uart_routing_attr_group },
+	{ },
+};
+
+static struct platform_driver aspeed_uart_routing_driver = {
+	.driver = {
+		.name = "aspeed-uart-routing",
+		.of_match_table = aspeed_uart_routing_table,
+	},
+	.probe = aspeed_uart_routing_probe,
+	.remove = aspeed_uart_routing_remove,
+};
+
+module_platform_driver(aspeed_uart_routing_driver);
+
+MODULE_AUTHOR("Oskar Senft <osk@google.com>");
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
-- 
2.33.0

