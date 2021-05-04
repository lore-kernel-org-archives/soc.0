Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E7BC43460
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 362A2613CD; Tue,  4 May 2021 19:35:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947B4613C7
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947B4613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id a4so10652376wrr.2
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUE6T8d/N4f3Mv0jX1DZW932G/DmWRKc7vhygQ2jwlM=;
        b=iY+VQNDWOqV/CG0cFNr9CjtsFJKTTbCm/lkfOwHdVMCGDyal0uZ2C50CTS43njVgTz
         OnOVf/G0AOan8QKQdzXf4eiQbi4MwhQayhKyfYUKV3vzFALPV3HQFcP5zfa0UYE58kgW
         b5RtPat4w1Sb/6LGKFS7o9zYw4SKH0OjDoU8mGUva0X3eh2KOutn3cS2aS2jSZw8gOhw
         Y8gFyh+2JkGDKYGsSoRAbegD6y1CvVaym3vVi+Z3WjBSyuvlfkO2bgQcnMac/Rue+jm0
         S3BZNYVA5+pBIOM5uoredT4nnMp3r7vMIp/VsAnvoH5JUg47Nd5/i3j6fhOQZ63Yeae4
         /7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUE6T8d/N4f3Mv0jX1DZW932G/DmWRKc7vhygQ2jwlM=;
        b=qQ+IumqhBkrJUF5LwTK/vAoi/6vWXu/F2nyI4pMAheMTOTAzre8yNNauWee+VHNgHq
         JjIZusyTTGvVlgPO1/tjm/nHHz31MLIz8A+KNqUrs7srl8gn9xWR9WT3/E7qtqKc7mB9
         /+hduHih+d/+rFvFxHPdBPKC29cvudA6ZJZHtdAvMEhsmLNNZtkPCshzeWI9O1e0tZw3
         VmW/kd1Zs43BNmDCdTztc/+TiLMIgKiIOQ/JYub5xPldQl0VoHH4i/w1KfdbFU+LrE7M
         Kh0Xm9rguQ3EFmSG2iBH47Yox6TEBtn9kucwPkB689lY3MkZOPr5pBrafbuwqQiMrOBo
         O30A==
X-Gm-Message-State: AOAM533FYfyUwGUjtGQp/IG3HgkW61bLHlmv3kDg7FV2b+yxLIe+Kqwo
	cZAmLa/9HmWkpRXnuydMMFMR2Q==
X-Google-Smtp-Source: ABdhPJyTc2cvByzqBL/z0VWYE9grFLrwGOUQgAq6tWjFmTXdEdBZNW+9YhAcr6eeRxF8kc5ORG5rEQ==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr33553742wrw.212.1620156908233;
        Tue, 04 May 2021 12:35:08 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:07 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] ARM: dts: add intel-ixp42x-welltech-epbx100
Date: Tue,  4 May 2021 19:34:57 +0000
Message-Id: <20210504193457.4008384-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds devicetree for intel-ixp42x-welltech-epbx100.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/intel-ixp42x-welltech-epbx100.dts     | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1580313eb372..7d0c94b9108d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -242,6 +242,7 @@ dtb-$(CONFIG_ARCH_INTEGRATOR) += \
 	integratorcp.dtb
 dtb-$(CONFIG_ARCH_IXP4XX) += \
 	intel-ixp42x-linksys-nslu2.dtb \
+	intel-ixp42x-welltech-epbx100.dtb \
 	intel-ixp43x-gateworks-gw2358.dtb
 dtb-$(CONFIG_ARCH_KEYSTONE) += \
 	keystone-k2hk-evm.dtb \
diff --git a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
new file mode 100644
index 000000000000..84158503be2a
--- /dev/null
+++ b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "intel-ixp42x.dtsi"
+
+/ {
+	model = "Welltech EPBX100";
+	compatible = "welltech,epbx100", "intel,ixp42x";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		/* 64 MB SDRAM */
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8 root=/dev/ram0 initrd=0x00800000,9M";
+		stdout-path = "uart0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	flash@50000000 {
+		compatible = "intel,ixp4xx-flash", "cfi-flash";
+		bank-width = <2>;
+		/*
+		 * 16 MB of Flash
+		 */
+		reg = <0x50000000 0x1000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "RedBoot";
+				reg = <0x00000000 0x00080000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "zImage";
+				reg = <0x00080000 0x00100000>;
+				read-only;
+			};
+			partition@180000 {
+				label = "ramdisk";
+				reg = <0x00180000 0x00300000>;
+				read-only;
+			};
+			partition@480000 {
+				label = "User";
+				reg = <0x00480000 0x00b60000>;
+				read-only;
+			};
+			partition@fe0000 {
+				label = "FIS directory";
+				reg = <0x00fe0000 0x001f000>;
+				read-only;
+			};
+			partition@fff000 {
+				label = "RedBoot config";
+				reg = <0x00fff000 0x0001000>;
+				read-only;
+			};
+		};
+	};
+};
-- 
2.26.3

