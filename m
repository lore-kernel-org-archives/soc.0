Return-Path: <SRS0=0T0Z=PJ=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE798C4332F
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:17:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B7A7761052; Thu, 21 Oct 2021 15:17:46 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9337D6112D
	for <soc@kernel.org>; Thu, 21 Oct 2021 15:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9337D6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f51.google.com with SMTP id t9so1214403lfd.1
        for <soc@kernel.org>; Thu, 21 Oct 2021 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mny4aFnqq/so1rrWHGvBW/GWX6no1JZVgdILHmhID4=;
        b=qCyIicNoOv2HmN+x6ltBwRdlqrlSY/ubDGsNs3WhSC/T4W3ZOAg5v/P4t3K0bBfz1s
         BWIWPdVTGAI28ncppEoEPpbn/mLVOixk4WKzJfjde20DCH54uQthho0iKsBf2+l4OvGG
         xPbWiQaYytnfX+r4wKzDhE6yQMecFQmiyEV2S1XL4tN72lxAw3r68n5pm+vCzIFT2Fws
         bRUXEHPED8+k5sJKn3BE5EjUT9Ezj5cw5u4NbX+CpKOU4MBZvwblvmpvdkWL3f7tM5uk
         0YM9yPw197JtQ6qW3J1PCpgPO8bWGq1HVasT0KA+8nmy7dwoRdIpAYxQ3KAq0DjaVYkX
         ZCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mny4aFnqq/so1rrWHGvBW/GWX6no1JZVgdILHmhID4=;
        b=SEie6tTrkB8nnUzbeVeGO2lONJLJZokQHaf4T6CQmnoSnqEGQb/D2Dc9EBcUiho+DS
         0/W/f2OveTtD/sExUSHQaYPUoAL5RlWl/TKpsFiiVTT2E+JgCOv1CU0rCM4PDuiE9ZVd
         ET+TKY0Z8aPHlKWWvqeXk8CT2R12aCBxXo0WCHjrgEhYLJ2IZGogOp+we0hatugXY2Lc
         6X75gWV+Ei2sSZa+r9GlO1wftsjDBkXBj6KRP+i8ZaWm6h8F87q7Hl2Rw/TH48UgBnef
         MjtGmjJX+jn5PTnsOT9O664eJXLDaH2iO2zrIx/5kR9Cz1CVLTpya74Kc6nwYl6j5WKr
         6m+A==
X-Gm-Message-State: AOAM532IkA1ulU/ERq8oGs0kdBDoXg90su6kr4/Hkbj6gLXU5TIQz8u1
	OLRr69jfZRFaZFcLZbpHFJNVIg==
X-Google-Smtp-Source: ABdhPJxHrJ3j7jtB38SX81sCzp9UWPik7BjA/bBTlE7m9NlwleHAlYDX4Q94f/nNjebP/hCxN/Nvkw==
X-Received: by 2002:a05:6512:12c8:: with SMTP id p8mr6167371lfg.42.1634829464947;
        Thu, 21 Oct 2021 08:17:44 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id bt10sm91113lfb.193.2021.10.21.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:17:44 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@semihalf.com,
	mw@semihalf.com,
	ka@semihalf.com,
	jam@semihalf.com,
	tn@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Joanna Brozek <jbrozek@antmicro.com>,
	Mariusz Glebocki <mglebocki@antmicro.com>,
	Tomasz Gorochowik <tgorochowik@antmicro.com>,
	Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Thu, 21 Oct 2021 17:17:36 +0200
Message-Id: <20211021151736.2096926-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021151736.2096926-1-pan@semihalf.com>
References: <20211021151736.2096926-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the Mercury+ AA1 module for Arria 10 SoC FPGA.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
Signed-off-by: Joanna Brozek <jbrozek@antmicro.com>
Signed-off-by: Mariusz Glebocki <mglebocki@antmicro.com>
Signed-off-by: Tomasz Gorochowik <tgorochowik@antmicro.com>
Signed-off-by: Maciej Mikunda <mmikunda@antmicro.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..803702883122 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1075,6 +1075,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-torbreck.dtb
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
+	socfpga_arria10_mercury_aa1.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
new file mode 100644
index 000000000000..2a3364b26361
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "socfpga_arria10.dtsi"
+
+/ {
+
+	model = "Enclustra Mercury AA1";
+	compatible = "altr,socfpga-arria10", "altr,socfpga";
+
+	aliases {
+		ethernet0 = &gmac0;
+		serial1 = &uart1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x80000000>; /* 2GB */
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+};
+
+&eccmgr {
+	sdmmca-ecc@ff8c2c00 {
+		compatible = "altr,socfpga-sdmmc-ecc";
+		reg = <0xff8c2c00 0x400>;
+		altr,ecc-parent = <&mmc>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
+			     <47 IRQ_TYPE_LEVEL_HIGH>,
+			     <16 IRQ_TYPE_LEVEL_HIGH>,
+			     <48 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&gmac0 {
+	phy-mode = "rgmii";
+	phy-addr = <0xffffffff>; /* probe for phy addr */
+
+	max-frame-size = <3800>;
+	status = "okay";
+
+	phy-handle = <&phy3>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy3: ethernet-phy@3 {
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <1860>; /* 960ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+			reg = <3>;
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	isl12022: isl12022@6f {
+		status = "okay";
+		compatible = "isil,isl12022";
+		reg = <0x6f>;
+	};
+};
+
+/* Following mappings are taken from arria10 socdk dts */
+&mmc {
+	status = "okay";
+	cap-sd-highspeed;
+	broken-cd;
+	bus-width = <4>;
+};
+
+&osc1 {
+	clock-frequency = <33330000>;
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.25.1

