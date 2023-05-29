Return-Path: <SRS0=FmVO=BS=foss.st.com=prvs=4513b8c82e=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A5C7EE2E
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 16:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E74CC433A8; Mon, 29 May 2023 16:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA6D5C4339C;
	Mon, 29 May 2023 16:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA6D5C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34TBP7sc014194;
	Mon, 29 May 2023 18:22:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=yXr1dO9hXYb6Yp4qjold8WTPHoK4NgmyAwHDuDbtzoY=;
 b=xmnoX2JXVinqQXVT5JpsC+01w9e0co10TCGaacZOyRXlt7NtSli9PZ/2Mltc18iYwTLU
 terkFcFoZfV19qMicUeiGZlaX+ITG2Oo//1RuJYUlissW4d+TvVYGCBiyqCDnzMHgyV9
 76t8mxH+lOLYvzssRNMnq1Lf0p0cuI1ZCyV+3as7zS8RdetnaZ8evi0/fpUx0aum1c2p
 JQ2x7HJek6gn/rK4rHR8pVf03ogyL9zwZNTHD1u8dfX0RRjAwRiBKR4NdwJVeS6CfI3D
 LFuSFra+nScksGiwxlPKYf6jMmEbV5cGCFggd/crxmfw65ORooLVqCDI0oSQDwYL+lb2 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy2mha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 18:22:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39130100038;
	Mon, 29 May 2023 18:22:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A79FA233C7A;
	Mon, 29 May 2023 18:21:45 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:21:45 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 07/11] arm64: dts: st: introduce stm32mp25 pinctrl files
Date: Mon, 29 May 2023 18:20:30 +0200
Message-ID: <20230529162034.20481-8-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02

Three packages exist for stm32mp25 dies. As ball-out is different between
them, this patch covers those differences by introducing dedicated pinctrl
dtsi files. Each dtsi pinctrl package file describes the package ball-out
through gpio-ranges.

Available packages are:

STM32MP25xAI: 18*18/FCBGA 172 ios
STM32MP25xAK: 14*14/FCBGA 144 ios
STM32MP25xAL: 10*10/TFBGA 144 ios

It includes also the common file used for pin groups definition.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
new file mode 100644
index 000000000000..5bd27767fbf5
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
new file mode 100644
index 000000000000..abdbc7aebc7f
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AI>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@442d0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@442e0000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl 0 160 8>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
new file mode 100644
index 000000000000..2e0d4d349d14
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AK>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
new file mode 100644
index 000000000000..2406e972554c
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AL>;
+
+	gpioa: gpio@44240000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@44250000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@44260000 {
+		status = "okay";
+		ngpios = <14>;
+		gpio-ranges = <&pinctrl 0 32 14>;
+	};
+
+	gpiod: gpio@44270000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@44280000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@44290000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@442a0000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@442b0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 2 114 12>;
+	};
+
+	gpioi: gpio@442c0000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	gpioz: gpio@46200000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl_z 0 400 10>;
+	};
+};
-- 
2.17.1

