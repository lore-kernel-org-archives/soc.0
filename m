Return-Path: <SRS0=hDLm=OK=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CE8C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Sep 2021 12:42:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 08ABF60F43; Mon, 20 Sep 2021 12:42:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D441C610A0
	for <soc@kernel.org>; Mon, 20 Sep 2021 12:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D441C610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f52.google.com with SMTP id g41so34097515lfv.1
        for <soc@kernel.org>; Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TgkRR7jceSG3sISw9EtlaxuO+Ca79VKVwo29bAvP5fI=;
        b=s4hLOdYrkJWqU9QfUxcZKehIh/nJu0e950CTAaaT16xIiWxBQdXpw1nrOo5VF4EClz
         08QmuTWf6QlU9WYteW5sm3nc6X49dKimoHADfogLU7n5dlP6BZmGrOZjEkrA4qj8PSZo
         W5zWuO7pqTNTXfj9RTc8jdEfSHWEVnEYRt97xnNUQuseq8Y/t+wh6CR8S5i+zSblV9WQ
         Lh+5isxoSGLrosnXmPBmUvRcn5LqIdcP8rVUJaUZmOWjwX3+BNFRwWwe/pskgO9HTjOw
         Ptc0HA7CY5lpRXeNu8FiiT0w5XI/d2I9kzst6o/DCD77Wx2gVRIek2zlzo4dYCbTxe+E
         1fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TgkRR7jceSG3sISw9EtlaxuO+Ca79VKVwo29bAvP5fI=;
        b=cSDfNrVdMaT5TX6HR5yngZRRzMHiCYI+VcBmPEHUsjcjsGC0+3ZiGTPwEdDoCDg5r/
         A0Mv3R+8fSnHjhvXlUYfvzubyWl5Rw1fGb8koYHIrbkrWjq5pBmc1HZswNy9Xeyecjpr
         olcpXctReyeDRu1EGEz9EaVhlcUVUzQuE8MC5mvtZAf4VfJUtJfEfY6L4g20OKuNIpi8
         T+C5wNwN3nVTx73OrQlEuWSIK/kyyW3mjvSPUnD3gJT5yIt/5Gd4fkiVuk3RwubfTS+x
         zfwtUvnWCLyhzJFsGg+VX+4Gu/+ug/nAfe7rUIHlJ93TyA3d+cGxPSYbyD8Vu7kTip/a
         srXQ==
X-Gm-Message-State: AOAM5304dvPyeZBaDlsqoMIphXYUA3k2+ieeiDMxvFNeceAiTPjUNvln
	vigLUf37JKUjvXrRlkIeUr3uSg==
X-Google-Smtp-Source: ABdhPJwSJoLAEAHr8QbQNcp0H34mI/ghiqdYS6h5Nj2nmS8GtTJaaHhL0HdRSzUvFKGHyuLUNnM7fw==
X-Received: by 2002:ac2:4318:: with SMTP id l24mr18814386lfh.145.1632141729202;
        Mon, 20 Sep 2021 05:42:09 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:42:08 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tn@semihalf.com,
	ka@semihalf.com,
	jam@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Joanna Brozek <jbrozek@antmicro.com>,
	Mariusz Glebocki <mglebocki@antmicro.com>,
	Tomasz Gorochowik <tgorochowik@antmicro.com>,
	Maciej Mikunda <mmikunda@antmicro.com>
Subject: [PATCH 2/3] dts: socfpga: Add Mercury+ AA1 devicetree
Date: Mon, 20 Sep 2021 14:41:40 +0200
Message-Id: <20210920124141.1166544-3-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
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
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
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
index 000000000000..c13f16afa72f
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
@@ -0,0 +1,127 @@
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
+	};
+
+	memory {
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
+&osc1 {
+	clock-frequency = <33330000>;
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
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
+	mdio0 {
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
+&i2c1 {
+	status = "okay";
+	isl12022: isl12022@6f {
+		status = "okay";
+		compatible = "isil,isl12022";
+		reg = <0x6f>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&qspi {
+	status = "disabled";
+
+	flash0: n25q00@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q00";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		m25p,fast-read;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <200>;
+		cdns,tsd2d-ns = <255>;
+		cdns,tchsh-ns = <20>;
+		cdns,tslch-ns = <20>;
+
+		part0: qspi-boot@0 {
+			label = "Flash 0 Raw Data";
+			reg = <0x0 0x01340000>;
+		};
+		part1: qspi-rootfs@1320000 {
+			label = "Flash 1 jffs2 Filesystem";
+			reg = <0x01340000 0x2cc0000>;
+		};
+	};
+};
-- 
2.25.1

