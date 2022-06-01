Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB8DC433EF
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71F73C341C4; Wed,  1 Jun 2022 15:47:44 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B872C3411A
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B872C3411A
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f49.google.com with SMTP id j10so3408744lfe.12
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfwBRuu4ZM72mhs6ACHC3c3G4LBBG//hhQB7GRYTpTo=;
        b=gsAcBGGYZlDrxc1w8U/I0RGQZyGtBlacpi0yu1+HVT6FE10pI8btlK+E36lu517qr3
         ITWdbD7iEdtqqg1BahkjmwOBh+QDu8nK1htTgWX9S8X18IyY+Yt/sGtPk1TW8s9W9frF
         ybKCcZerXQKJdbcF8MshulmkBkzafVgiwxqjV6ob54TUkmet+CgA74pxTRc45bkFr+rB
         VvAiIoKLhwtD7oyUHoFWiqOWwBhAMkgA8sLZW17qHqhWrZ3xIaEcBc/Xqwk60N2qHwk6
         PL9gcvmMho+PKv/haR/HSSBbDYbPuZ/1e1+G2sFjxQ9833/zw2j0p0zyIZb7exRn/fTu
         E4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfwBRuu4ZM72mhs6ACHC3c3G4LBBG//hhQB7GRYTpTo=;
        b=0r7gK4K1uP5F/obeeKm6q686gATbqYVNfvvjYm4cWN5O2yx0orpGrzoH0YD0LFfjBP
         1IOKQaHlLmsESZwHNz+jh71sA56K1SmBqV+vl48Zo+4Yh8J5sr1dUqHAVzPqMWurrsu0
         e11siFXcL2mJZ4ztJxapqd+B1JW1n24He9F5KNUn/N8XVyARHuyx4PWth6BRDgnQzTj4
         +Z3fVsvPlMLaObUI3O8kq34sAMiCuiKg/uFzBpqoT1ca0nseex9R1HPX2aCZEd2euPBB
         hTVrpcochCz5jEA/W1ct4NRwujy1ZqdNVedtsHGXE6t9h8gAlvfsHY5QP58Lo3cZHYUh
         zDhQ==
X-Gm-Message-State: AOAM533XnnfDeFn6G8ueRYN7tQxM56cGL9g/jcgTss9Q/6ar/EOZ4Drl
	4r6AuwQQ50G+RnSlHdEF47UKCfS9VXY0QA==
X-Google-Smtp-Source: ABdhPJw2YqAERwhfHBUEzSKgK8Qry/TcdNJe+5LBYjVk0PezmPnVZkD0WfINjfthvl3P4PpyLWKaag==
X-Received: by 2002:a05:6512:3f05:b0:477:8ecb:4fbe with SMTP id y5-20020a0565123f0500b004778ecb4fbemr49162017lfa.193.1654098461732;
        Wed, 01 Jun 2022 08:47:41 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:41 -0700 (PDT)
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
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 1/5] ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
Date: Wed,  1 Jun 2022 17:46:43 +0200
Message-Id: <20220601154647.80071-2-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
References: <20220601154647.80071-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Mercury+ AA1 is not a standalone board, rather it's a module
with an Arria 10 SoC. Remove status = "okay" and i2c aliases, as they
are routed to the base board and should be enabled from there.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/Makefile                    |  1 -
 ...1.dts => socfpga_arria10_mercury_aa1.dtsi} | 28 -------------------
 2 files changed, 29 deletions(-)
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (84%)

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
similarity index 84%
rename from arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
rename to arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
index a75c059b6727..4b21351f2694 100644
--- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
 
 #include "socfpga_arria10.dtsi"
 
@@ -11,8 +10,6 @@ / {
 	aliases {
 		ethernet0 = &gmac0;
 		serial1 = &uart1;
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
 	};
 
 	memory@0 {
@@ -43,7 +40,6 @@ &gmac0 {
 	phy-addr = <0xffffffff>; /* probe for phy addr */
 
 	max-frame-size = <3800>;
-	status = "okay";
 
 	phy-handle = <&phy3>;
 
@@ -69,22 +65,8 @@ phy3: ethernet-phy@3 {
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
 	isl12022: isl12022@6f {
-		status = "okay";
 		compatible = "isil,isl12022";
 		reg = <0x6f>;
 	};
@@ -92,7 +74,6 @@ isl12022: isl12022@6f {
 
 /* Following mappings are taken from arria10 socdk dts */
 &mmc {
-	status = "okay";
 	cap-sd-highspeed;
 	broken-cd;
 	bus-width = <4>;
@@ -101,12 +82,3 @@ &mmc {
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
2.36.1.255.ge46751e96f-goog

