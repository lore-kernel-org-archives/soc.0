Return-Path: <SRS0=sRvu=KM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8227DC433B4
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 19:32:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4FE176135B; Mon, 17 May 2021 19:32:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883D961263
	for <soc@kernel.org>; Mon, 17 May 2021 19:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883D961263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso182796wmm.3
        for <soc@kernel.org>; Mon, 17 May 2021 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMQVIiAtd4R+eX9A5kzaFE7n4k/GD8veZK25Hsqb0Y4=;
        b=YNahRo2zUE2C6Cd8aNbuIEI8966LR5td1XBG0LnPYE+z+Vb+r3enGiK0DH9hY/yzv3
         0K+yDTRmdDnZ8mVCVNolbl+iTm56KS+66CBpl2Ab91IrkEsezGm9mKJ3w7MMElBQfZ64
         X3XtEBCsWmnm+IFOpKiS96BX94n8wT5gAqnPulzO/N+lWn0+zpXtiIg6p45yn4NQJ4MM
         7c4KPHX2usg+cCjm7bZb4L0BGvrs/KpdOngKY0l0LacRyOfQaOfXzryk4Ne/F7cgQfHV
         1Ngcs75/RlnB6zf8MPR4jPn/qglSfVXxWccinvkW6XTKSDTRRRM1BmXSWNUfggLCVw1t
         mDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMQVIiAtd4R+eX9A5kzaFE7n4k/GD8veZK25Hsqb0Y4=;
        b=OCRkvqUWZoufLOcq6BlttjkVOg17Yfm8LTw/dggi3L1QsCdb0OmsTI5+7WjqsUs1pv
         2rlSjItW78P3yASZAzT/arjgqZ4hBH+wqwodH6LsYRBIXUnz2I9Ugfm2VMfSVYVYpuub
         78nX4puVzS/gRrTrbqm/apQePwOo51yf6sr0LCI/p1jDiRWTu/GxrT+74YZ4juxD7X6L
         tKTxYvBjEFpB5XibsTHcUajSlvwpAfxdgu9DV2z0XfvzgfB1KNQUQEKp5bLrRPJN2BT4
         BrIv4mEFku7WXmpXmdhV9TRo5+m0yZJ7hyT/CWvtkUs6+N46wkvcy+Z8tW7o2YSJyPhB
         glFQ==
X-Gm-Message-State: AOAM532rNYt8qKk/k3jzCp8owfeZq5e8YovfyygjLGLrd3b6BRXTylkj
	3sujgeyZn5u6zG3Fzr2MCQAtTg==
X-Google-Smtp-Source: ABdhPJyZcZrbvnM5hmc8qpXvsEUWNK+NrDQST6l219mVNkTo6l8+jPkki6KSDmP8QpPYNoBo9iBBuw==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id l18mr1152164wmc.142.1621279941272;
        Mon, 17 May 2021 12:32:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:32:20 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	linus.walleij@linaro.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org,
	ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] ARM: gemini: add device tree for ssi1328
Date: Mon, 17 May 2021 19:32:05 +0000
Message-Id: <20210517193205.691147-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SSI 1328 is a NAS box running a SL3516 SoC.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile           |   1 +
 arch/arm/boot/dts/gemini-ssi1328.dts | 162 +++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bb30d13c9c60..0a9f6001b90b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -220,6 +220,7 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-rut1xx.dtb \
 	gemini-sl93512r.dtb \
 	gemini-sq201.dtb \
+	gemini-ssi1328.dtb \
 	gemini-wbd111.dtb \
 	gemini-wbd222.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
diff --git a/arch/arm/boot/dts/gemini-ssi1328.dts b/arch/arm/boot/dts/gemini-ssi1328.dts
new file mode 100644
index 000000000000..1112007c9d6f
--- /dev/null
+++ b/arch/arm/boot/dts/gemini-ssi1328.dts
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
+ * Device Tree file for SSI 1328
+ */
+
+/dts-v1/;
+
+#include "gemini.dtsi"
+
+/ {
+	model = "SSI 1328";
+	compatible = "ssi,1328", "cortina,gemini";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		/* 128 MB */
+		device_type = "memory";
+		reg = <0x00000000 0x8000000>;
+	};
+
+	aliases {
+		mdio-gpio0 = &mdio0;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,19200n8 initrd=0x800000,9M";
+		stdout-path = &uart0;
+	};
+
+	mdio0: mdio {
+		compatible = "virtual,mdio-gpio";
+		gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>, /* MDC */
+			<&gpio0 21 GPIO_ACTIVE_HIGH>; /* MDIO */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* LAN Marvell 88E1118 */
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			device_type = "ethernet-phy";
+			/* We lack the knowledge of necessary GPIO to achieve
+			 * Gigabit
+			 */
+			max-speed = <100>;
+		};
+		/* WAN ICPlus IP101A */
+		phy1: ethernet-phy@2 {
+			reg = <2>;
+			device_type = "ethernet-phy";
+		};
+	};
+};
+
+&ethernet {
+	status = "okay";
+	ethernet-port@0 {
+		phy-mode = "rgmii";
+		phy-handle = <&phy0>;
+	};
+	ethernet-port@1 {
+		phy-mode = "rgmii";
+		phy-handle = <&phy1>;
+	};
+};
+
+&flash {
+	status = "okay";
+	/* 32MB of flash */
+	reg = <0x30000000 0x03200000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "RedBoot";
+			reg = <0x00000000 0x00020000>;
+			read-only;
+		};
+		partition@20000 {
+			label = "Kernel";
+			reg = <0x00020000 0x00300000>;
+		};
+		partition@320000 {
+			label = "Ramdisk";
+			reg = <0x00320000 0x00600000>;
+		};
+		partition@920000 {
+			label = "Application";
+			reg = <0x00920000 0x00600000>;
+		};
+		partition@f20000 {
+			label = "VCTL";
+			reg = <0x00f20000 0x00020000>;
+			read-only;
+		};
+		partition@f40000 {
+			label = "CurConf";
+			reg = <0x00f40000 0x000a0000>;
+			read-only;
+		};
+		partition@fe0000 {
+			label = "FIS directory";
+			reg = <0x00fe0000 0x00200000>;
+			read-only;
+		};
+	};
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio0_default_pins>;
+};
+
+&ide0 {
+	status = "okay";
+};
+
+&ide1 {
+	status = "okay";
+};
+
+&sata {
+	cortina,gemini-ata-muxmode = <0>;
+	cortina,gemini-enable-sata-bridge;
+	status = "okay";
+};
+
+&syscon {
+	pinctrl {
+		/*
+		 * gpio0agrp cover line 0-4
+		 * gpio0bgrp cover line 5
+		 */
+		gpio0_default_pins: pinctrl-gpio0 {
+			mux {
+				function = "gpio0";
+				groups = "gpio0agrp", "gpio0bgrp";
+			};
+		};
+		pinctrl-gmii {
+			/* This platform use both the ethernet ports */
+			mux {
+				function = "gmii";
+				groups = "gmii_gmac0_grp", "gmii_gmac1_grp";
+			};
+		};
+	};
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.26.3

