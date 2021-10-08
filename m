Return-Path: <SRS0=alyK=O4=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6181BC433FE
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 14:08:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3FEF361042; Fri,  8 Oct 2021 14:08:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2140860F58
	for <soc@kernel.org>; Fri,  8 Oct 2021 14:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2140860F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f43.google.com with SMTP id x27so39740488lfa.9
        for <soc@kernel.org>; Fri, 08 Oct 2021 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gttg+v6XbDIarAgQi1Ce3aR1kSoKgCW6Taf8X2Jr5ZQ=;
        b=OiYiJt/fIyBMC+P3XVgVgk8OtW58yDWtJSv++nyw1MeV8Zo+hmC4r4oUEsAcgEnch3
         FeuJuDRMIDhzRtCOi5h9yjht5K/Yy6xQLNwUnAv+1mNlc6x92Y7DmzbQ3HUpTVqZLAka
         GfzSLcKBhO02V5mlrdzJ7eruTtwGySzqMmtT1/k2cx2rReLZ2HAN8R+AmJlBPOt9j5vt
         Vo/p8kI70JT/jiP2qiy/NvT+6kbGCZ2uJ1qPmYdaY4j6ALxV1LxQFylPzS02n+vpLP5L
         p4CxcKEPJkWrs6HpuoCO0gvZWY2Dmti/PAPwuSt8BCMMBn6zOciVNZvyJFbj9aohl2/m
         IJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gttg+v6XbDIarAgQi1Ce3aR1kSoKgCW6Taf8X2Jr5ZQ=;
        b=zg6vFLeoMZknAyIewysdT4AECW8qnlkVf217OZBW9Wxlw3LKTwNN4Lxdw7eNIEcNFX
         xK9TsPiTmUCVg+w9fNMXjgXAOueyw1wVCCAo4rcpKWCV1t4qyvqsKg9LUmONP6+rtosr
         I7YwHEkkto10OcNvLCDY5UgpGAl3KzsoGJ6HrSrIdLW/A774GSDdQhaUpxA5/zgDdks1
         nIUw9t8tZ3a8yme6Bv/wEvZjTLtTDkVp3HWTW7rglCshIYvBQU3OL2vzYUQnAe7nrkdu
         QUqqHN4LMz7V/4Kbb3gwjQujDXiYvhJy47rdMjhTVqYB1k4u7A2Xs5lUw38vYe75MniH
         V5+w==
X-Gm-Message-State: AOAM533DzvWmBEQc+MpTUHC4vsf2fRizE2hIX6T+8cR/bxxAHbm2kBEX
	aXIYQJdzoD0GTiytT4l9lFvvsw==
X-Google-Smtp-Source: ABdhPJx6Y0vAbnM8Fk95LZoJHxmArUZdZbwbvSH8XCOCNhaj/aRtIkpg+t5fPkZH5HwF8oaz0wq38Q==
X-Received: by 2002:a05:651c:997:: with SMTP id b23mr3885319ljq.325.1633702081587;
        Fri, 08 Oct 2021 07:08:01 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id j23sm252667lfm.139.2021.10.08.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 07:08:01 -0700 (PDT)
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
	tn@semihalf.com,
	jam@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Joanna Brozek <jbrozek@antmicro.com>,
	Mariusz Glebocki <mglebocki@antmicro.com>,
	Tomasz Gorochowik <tgorochowik@antmicro.com>,
	Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH v3 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Fri,  8 Oct 2021 16:07:35 +0200
Message-Id: <20211008140735.3290892-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008140735.3290892-1-pan@semihalf.com>
References: <20211008140735.3290892-1-pan@semihalf.com>
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
index 7e0934180724..0a7809eb3795 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1078,6 +1078,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
+	socfpga_arria10_mercury_aa1.dtb \
 	socfpga_cyclone5_chameleon96.dtb \
 	socfpga_cyclone5_mcvevk.dtb \
 	socfpga_cyclone5_socdk.dtb \
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

