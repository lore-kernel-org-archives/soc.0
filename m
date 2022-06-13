Return-Path: <SRS0=83pi=WU=foss.st.com=prvs=2163e75478=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD85DC43334
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 07:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E347C3411C; Mon, 13 Jun 2022 07:19:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95459C3411E;
	Mon, 13 Jun 2022 07:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95459C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D78Sav015146;
	Mon, 13 Jun 2022 09:19:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=kdVZYAd0tDeUovCSDpA/Yy3+qR3t4oBUZfPK8nPFW/w=;
 b=mQ5OpWw8/TLbsDrmjkksDg4B1/t/OY/Y9MZB3OprONQnJZdDLp24cSa9iwoQ5aZzYVtF
 DTXqRe6MiaaD9psOCO1hFczDgFoI+GMryfH9lsT6W4TOY9zqAq2xCFVL80GHc5l32/Sz
 zKQK1Gqqf34SvFYNRLe1UuPjTGX4afCeG+8Qe9Fw+0yRzCYeRcNFdaci9ptyah8VAsmb
 yPCq4pRMN4NA8gRoCIn3XIpx807JeHAQdXnr/hk7LikiINEy5d3CwV1sK18TMD0BXo9x
 0YsWfzuQE9MMUkR03SFQg8t6AcWq5FNwoTPJ06yhjn7lYRZrPFkGEUvUaLFsMr9+1OfP 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmg6a25g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 09:19:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A141010002A;
	Mon, 13 Jun 2022 09:19:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84C66210F8C;
	Mon, 13 Jun 2022 09:19:21 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 13 Jun
 2022 09:19:21 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] ARM: dts: stm32: move SCMI related nodes in a dedicated file for stm32mp15
Date: Mon, 13 Jun 2022 09:19:20 +0200
Message-ID: <20220613071920.5463-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01

Adding a "secure" version of STM32 boards (DK1/DK2/ED1/EV1), SCMI (clock/
reset) protocol and OP-TEE node have been added in SoC dtsi file
(stm32mp151.dtsi). They have been added with a status disabled in order to
keep our legacy unchanged. It is actually not enough to keep our legacy
unchanged.

First, just a reminder about our use case: TF-A (BL2) loads and starts
OP-TEE, then loads and runs U-Boot. U-Boot code checks if an OP-TEE is
running, if yes it searches in Kernel device tree if an OP-TEE node is
present:

-If the OP-TEE node is not present then U-Boot copies OP-TEE node and its
reserved memory region from U-Boot device tree to the kernel device tree.

-If the OP-TEE node is present then it does nothing (this OP-TEE node will
be used by Linux). So U-Boot lets the kernel device tree unchanged thinking
it is correct for an OP-TEE usage. It is the case for our legacy boards,
the OP-TEE node is present (although disabled) but the reserved memory
region is not declared. As no memory region has been reserved for OP-TEE,
the end of DDR is seen by the kernel as free and then used for CMA. But as
OP-TEE is running, this end of DDR is already used by OP-TEE. So as soon as
kernel tries to access to the CMA region OP-TEE raises an error.

To fix it, all OP-TEE node and SCMI is moved in a dedicated file.

Fixes: 40b4157dbd8c ("ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP15")
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC Maintainers,

Can you please consider this patch as a fixe for v5.19 cycle.

Thanks
Alex



diff --git a/arch/arm/boot/dts/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/stm32mp15-scmi.dtsi
new file mode 100644
index 000000000000..e90cf3acd0b3
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15-scmi.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scmi: scmi {
+			compatible = "linaro,scmi-optee";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			linaro,optee-channel-id = <0>;
+			shmem = <&scmi_shm>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	soc {
+		scmi_sram: sram@2ffff000 {
+			compatible = "mmio-sram";
+			reg = <0x2ffff000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x2ffff000 0x1000>;
+
+			scmi_shm: scmi-sram@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0 0x80>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 1b2fd3426a81..7fdc324b3cf9 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -115,33 +115,6 @@
 		status = "disabled";
 	};
 
-	firmware {
-		optee: optee {
-			compatible = "linaro,optee-tz";
-			method = "smc";
-			status = "disabled";
-		};
-
-		scmi: scmi {
-			compatible = "linaro,scmi-optee";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			linaro,optee-channel-id = <0>;
-			shmem = <&scmi_shm>;
-			status = "disabled";
-
-			scmi_clk: protocol@14 {
-				reg = <0x14>;
-				#clock-cells = <1>;
-			};
-
-			scmi_reset: protocol@16 {
-				reg = <0x16>;
-				#reset-cells = <1>;
-			};
-		};
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -149,20 +122,6 @@
 		interrupt-parent = <&intc>;
 		ranges;
 
-		scmi_sram: sram@2ffff000 {
-			compatible = "mmio-sram";
-			reg = <0x2ffff000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x2ffff000 0x1000>;
-
-			scmi_shm: scmi-sram@0 {
-				compatible = "arm,scmi-shmem";
-				reg = <0 0x80>;
-				status = "disabled";
-			};
-		};
-
 		timers2: timer@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
index e3d3f3f30c7d..36371d6ed660 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "stm32mp157a-dk1.dts"
+#include "stm32mp15-scmi.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157A-DK1 SCMI Discovery Board";
@@ -54,10 +55,6 @@
 	resets = <&scmi_reset RST_SCMI_MCU>;
 };
 
-&optee {
-	status = "okay";
-};
-
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
@@ -76,11 +73,3 @@
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
-
-&scmi {
-	status = "okay";
-};
-
-&scmi_shm {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
index 45dcd299aa9e..03226a596904 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "stm32mp157c-dk2.dts"
+#include "stm32mp15-scmi.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 SCMI Discovery Board";
@@ -63,10 +64,6 @@
 	resets = <&scmi_reset RST_SCMI_MCU>;
 };
 
-&optee {
-	status = "okay";
-};
-
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
@@ -85,11 +82,3 @@
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
-
-&scmi {
-	status = "okay";
-};
-
-&scmi_shm {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
index 458e0ca3cded..c1a79272c068 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "stm32mp157c-ed1.dts"
+#include "stm32mp15-scmi.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157C-ED1 SCMI eval daughter";
@@ -59,10 +60,6 @@
 	resets = <&scmi_reset RST_SCMI_MCU>;
 };
 
-&optee {
-	status = "okay";
-};
-
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
@@ -81,11 +78,3 @@
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
-
-&scmi {
-	status = "okay";
-};
-
-&scmi_shm {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
index df9c113edb4b..7842384ddbe4 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "stm32mp157c-ev1.dts"
+#include "stm32mp15-scmi.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157C-EV1 SCMI eval daughter on eval mother";
@@ -68,10 +69,6 @@
 	resets = <&scmi_reset RST_SCMI_MCU>;
 };
 
-&optee {
-	status = "okay";
-};
-
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
@@ -90,11 +87,3 @@
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
-
-&scmi {
-	status = "okay";
-};
-
-&scmi_shm {
-	status = "okay";
-};
-- 
2.17.1

