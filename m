Return-Path: <SRS0=efRH=WG=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1CAC433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 13:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48E53C3411C; Mon, 30 May 2022 13:08:54 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE542C341C0
	for <soc@kernel.org>; Mon, 30 May 2022 13:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE542C341C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lj1-f180.google.com with SMTP id q1so11578702ljb.5
        for <soc@kernel.org>; Mon, 30 May 2022 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7wlrGz5nMoJok/x4rKN3bauAru3HDzS70uyMws132I=;
        b=6xoD0R6lQSSz/q4Y2RcYGBXEbgkNI35pCoAb5P5IIslJEpYkGkhST0ScwNFDRRRcfW
         6iiePZpxAkxv6RyunQyjrb27agFhk2YvfK7B0Ov74c6d8T+lmvzz9XTctuby28u5URzR
         rcveBKbXfsCJo8QUmzSz+KksD9vkk7ZCGNQlcVzu4ZT3fIeZuDGsgrmHR7uZEDPJUKsj
         cxqmHFkuxZl09a4AEDnWL+L5sMMiU9rj7A6q/krXcwEPKHwucj5y3I3X3M2ATO3o/FFh
         jMWEbon1w5TwW4Acru1yMjfSVPIoENrZoe2fNiVJUZg6tk96UT3fnIb/Rbe7QT8qw/Qq
         rHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7wlrGz5nMoJok/x4rKN3bauAru3HDzS70uyMws132I=;
        b=wD251bPNDB5uEu5JoI0p3du8zXKrFIL+UC5PGA0JdbLXRtA0txUDOck/WgTRFpeC4z
         /KYWnR8ENXIMOWAnuryDZnIHmLPQlxTemEbvUc1P49rpG/wrFcWDYicg37gkL7fRZw6k
         xa+jrtaHIe8dgn0LG1Dq4rWwcMA6ueKVAZAKzQeOJ4cfm2y8pxV/bs3UIkEkH4d8zBkD
         dwmHb0lEPYQ6KMyObLbOIGress1UAxwiF+2Z5ufwnKvk7VyktIge55vor9zu6FAHEw2c
         GbfCEMAblj7rrPm/8tJXDH/izMxjv96F5jZ+jw/EL7bh+jBmuM8YCIBt8nI4jDIZRfN3
         jR5g==
X-Gm-Message-State: AOAM53185QefiDyHSoorrN0iPjzxZhZGJ+h/k5hXcLbmK1wO/ktiibmq
	KHu6Bz0gtyQZcyW4fGya7x2FgcyOzqudVA==
X-Google-Smtp-Source: ABdhPJwCrCUqf4SJX9u7W3uz3INKBxqXBgnfz7JN6Tkf5SXmbJji6JiyA1Sb5l+Hn9KfhRzLFMY9+A==
X-Received: by 2002:a2e:954f:0:b0:24f:4457:950d with SMTP id t15-20020a2e954f000000b0024f4457950dmr33069308ljh.35.1653916128919;
        Mon, 30 May 2022 06:08:48 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id d22-20020ac25456000000b00477a7c8a0f0sm2295701lfn.295.2022.05.30.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:08:48 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 1/3] dts: socfpga: Change Mercury+ AA1 devicetree to header
Date: Mon, 30 May 2022 15:08:37 +0200
Message-Id: <20220530130839.120710-2-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220530130839.120710-1-pan@semihalf.com>
References: <20220530130839.120710-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Mercury+ AA1 is not a standalone board, rather it's a module
with an Arria 10 SoC and some peripherals on it. Remove everything that
is not strictly related to the module.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/Makefile                    |  1 -
 ...1.dts => socfpga_arria10_mercury_aa1.dtsi} | 68 ++++---------------
 2 files changed, 14 insertions(+), 55 deletions(-)
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (58%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index edfbedaa6168..023c8b4ba45c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1146,7 +1146,6 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-torbreck.dtb
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
-	socfpga_arria10_mercury_aa1.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
similarity index 58%
rename from arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
rename to arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
index a75c059b6727..fee1fc39bb2b 100644
--- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
@@ -1,57 +1,38 @@
 // SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
-
+/*
+ * Copyright 2022 Google LLC
+ */
 #include "socfpga_arria10.dtsi"
 
 / {
-
-	model = "Enclustra Mercury AA1";
-	compatible = "enclustra,mercury-aa1", "altr,socfpga-arria10", "altr,socfpga";
-
 	aliases {
 		ethernet0 = &gmac0;
 		serial1 = &uart1;
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-	};
-
-	memory@0 {
-		name = "memory";
-		device_type = "memory";
-		reg = <0x0 0x80000000>; /* 2GB */
 	};
 
 	chosen {
 		stdout-path = "serial1:115200n8";
 	};
-};
 
-&eccmgr {
-	sdmmca-ecc@ff8c2c00 {
-		compatible = "altr,socfpga-sdmmc-ecc";
-		reg = <0xff8c2c00 0x400>;
-		altr,ecc-parent = <&mmc>;
-		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
-			     <47 IRQ_TYPE_LEVEL_HIGH>,
-			     <16 IRQ_TYPE_LEVEL_HIGH>,
-			     <48 IRQ_TYPE_LEVEL_HIGH>;
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x80000000>; /* 2GB */
 	};
 };
 
 &gmac0 {
 	phy-mode = "rgmii";
-	phy-addr = <0xffffffff>; /* probe for phy addr */
+	phy-handle = <&phy3>;
 
 	max-frame-size = <3800>;
-	status = "okay";
-
-	phy-handle = <&phy3>;
 
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
 		phy3: ethernet-phy@3 {
+			reg = <3>;
 			txd0-skew-ps = <0>; /* -420ps */
 			txd1-skew-ps = <0>; /* -420ps */
 			txd2-skew-ps = <0>; /* -420ps */
@@ -64,35 +45,23 @@ phy3: ethernet-phy@3 {
 			txc-skew-ps = <1860>; /* 960ps */
 			rxdv-skew-ps = <420>; /* 0ps */
 			rxc-skew-ps = <1680>; /* 780ps */
-			reg = <3>;
 		};
 	};
 };
 
-&gpio0 {
-	status = "okay";
-};
-
-&gpio1 {
-	status = "okay";
-};
-
-&gpio2 {
-	status = "okay";
-};
-
 &i2c1 {
-	status = "okay";
+	atsha204a: atsha204a@64 {
+		compatible = "atmel,atsha204a";
+		reg = <0x64>;
+	};
+
 	isl12022: isl12022@6f {
-		status = "okay";
 		compatible = "isil,isl12022";
 		reg = <0x6f>;
 	};
 };
 
-/* Following mappings are taken from arria10 socdk dts */
 &mmc {
-	status = "okay";
 	cap-sd-highspeed;
 	broken-cd;
 	bus-width = <4>;
@@ -101,12 +70,3 @@ &mmc {
 &osc1 {
 	clock-frequency = <33330000>;
 };
-
-&uart1 {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-	dr_mode = "host";
-};
-- 
2.36.1.124.g0e6072fb45-goog

