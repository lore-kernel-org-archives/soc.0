Return-Path: <SRS0=7jOf=OA=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF21EC433FE
	for <soc@archiver.kernel.org>; Fri, 10 Sep 2021 19:03:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B2E58611F0; Fri, 10 Sep 2021 19:03:46 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866A0611F2;
	Fri, 10 Sep 2021 19:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 866A0611F2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id g16so4044951wrb.3;
        Fri, 10 Sep 2021 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGTqavmnWdlKJwkfVQQAo6bbT7HMk/T1nrpPRitatNM=;
        b=X6U/xiajTuwoGIwBDss266fgvixbjpstAqhokC9k6DDeSXLb6wmUneKEulUNNHu3kG
         trNw+x3lVDTTBOpbqlJUvFzmOG43XU3HHzibAY20SKATuVOA+8Tz7Y2Pt/REpef/KSXm
         nFgG8+eyHgnvX6x9k0qlsJOG8Vxr41yZreVBV//fxU8atKxrDVJDtxPWk7Q5/COAt5Lj
         SzMRuEGapccKYfnPztThxjeXvbicXjZ80gT+yP0BAdUDOr+qn4nC/+OIcTpy1nom3iA8
         vYgO6uz1DMd7ElFVnNo6GzIcwfZNHv9RuiFN0Y5oP/XEkM3ATuablNUtY4ItRkhKd/z5
         W6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGTqavmnWdlKJwkfVQQAo6bbT7HMk/T1nrpPRitatNM=;
        b=cO69aPA04OwVXyAeRLZyG3k63jZvNE/QGL82gsSZ+K7+SVby1hZbf408AOqmVTIGmV
         /bvzQ9aDwpITwizhTi6BNakzx2KwC6jUNsvl0MVGtUtcaEGC9PpURmVsDp52DxoUP1wc
         ayCMuPW9UL6pOh0/c/NEd8mujnnvjEjr3F2lqMRyjRt6ZsiNs6sTT28ibn8yfq/EOGxW
         VHoJzoKcuAnXoxUpfpgR/5kLnl9PagLhEapommK8L4D1JIVAbPbQpd9KwqRsCPICx32a
         ttkrLCqGzaOe8yENvxOs8d+pzEPPNKi4JOdoWxufrMVlnDpprzzeK8rbtHc9aJD7geHE
         H6gg==
X-Gm-Message-State: AOAM530/kcFoh5gYErEJDL40f6cmMEx0eVFgenJ9OQdmUksvOQXukOJ/
	ZA9aiIkPwdqTtFZI45RcsFWEy8Dq7vs=
X-Google-Smtp-Source: ABdhPJzzR9AyXJ0nVUXYXZIDp7dioUR7BYl7dNT9AbxRJVpD3bOFUuGlKFYVp5sA5ebHrAGWc22Aew==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr9769355wrs.44.1631300625161;
        Fri, 10 Sep 2021 12:03:45 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id l1sm4311111wmq.8.2021.09.10.12.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:03:44 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
Date: Fri, 10 Sep 2021 21:03:20 +0200
Message-Id: <20210910190322.27058-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Wireless Tag IDO-SBC2D06-V1B-22W[1] is an SBC powered by SSD202D
with a dual Ethernet and a connector for a 4-inch and 7-inch display.
It embeds a System-On-Module IDO-SOM2D01[2] with an Mstar SSD202 SoC
dual-core Cortex-A7 CPU @ 1.2Ghz , 2D GPU, 128 MB DDR3 (on-chip) and
a 256MB SPI NAND flash. This commit adds basic definition for this
board.

1. http://linux-chenxing.org/infinity2/ido-sbc2d06
2. http://www.wireless-tag.com/portfolio/ido-som2d01

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../devicetree/bindings/arm/mstar/mstar.yaml  |  2 ++
 arch/arm/boot/dts/Makefile                    |  1 +
 ...star-infinity2m-ssd201-som2d01-common.dtsi | 21 ++++++++++++++
 ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 23 +++++++++++++++
 ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi | 28 +++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index a316eef1b728..10efd703717e 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -25,6 +25,8 @@ properties:
           - enum:
               - honestar,ssd201htv2 # Honestar SSD201_HT_V2 devkit
               - m5stack,unitv2 # M5Stack UnitV2
+              - wirelesstag,ido-som2d01 # Wireless Tag IDO-SOM2D01
+              - wirelesstag,ido-sbc2d06-v1b-22w # Wireless Tag IDO-SBC2D06-1VB-22W
           - const: mstar,infinity2m
 
       - description: infinity3 boards
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..7f0e92cea716 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1448,6 +1448,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity-msc313-breadbee_crust.dtb \
+	mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dtb \
 	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
 	mstar-infinity2m-ssd202d-unitv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
new file mode 100644
index 000000000000..0178d17ab15d
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) 2021 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ * Author: Romain Perier <romain.perier@gmail.com>
+ */
+
+/ {
+
+	reg_vcc_dram: regulator-vcc-dram {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_dram";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+	};
+};
+
+&pm_uart {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
new file mode 100644
index 000000000000..20b40b711d4f
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) 2021 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ * Author: Romain Perier <romain.perier@gmail.com>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Wireless Tag IDO-SBC2D06-1VB-22W";
+	compatible = "wirelesstag,ido-sbc2d06-v1b-22w", "wirelesstag,ido-som2d01", "mstar,infinity2m";
+
+	leds {
+		compatible = "gpio-leds";
+		sys_led {
+			gpios = <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
new file mode 100644
index 000000000000..06567a5219c5
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) 2021 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ * Author: Romain Perier <romain.perier@gmail.com>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d.dtsi"
+#include "mstar-infinity2m-ssd201-som2d01-common.dtsi"
+
+/ {
+	model = "Wireless Tag IDO-SOM2D01 (SSD202D)";
+	compatible = "wirelesstag,ido-som2d01", "mstar,infinity2m";
+
+	aliases {
+		serial0 = &pm_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&reg_vcc_dram {
+	regulator-min-microvolt = <1500000>;
+	regulator-max-microvolt = <1500000>;
+};
-- 
2.33.0

