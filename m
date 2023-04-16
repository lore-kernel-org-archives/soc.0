Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73006C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B2D6C433A1; Sun, 16 Apr 2023 10:18:31 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54734C4339C;
	Sun, 16 Apr 2023 10:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54734C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id fy21so13838480ejb.9;
        Sun, 16 Apr 2023 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640308; x=1684232308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Daq90p6qrczMZk89cBam/kQAHCGL98Y3xxZQBJA/2hY=;
        b=okCnUFUVYcKcBnxuGO85xXyESOLr7/haQlIajZZuDWUlLJ5Yoh6J6pq7SouGTuzY/R
         wN91hmUpkhd9DMyTBXAZEoA7DeWakR+7yJcru2JpVMGmAxRnMcu4AuoRF1VbSS2+2wXl
         8PtVAI8MH6FfciGFY2s4YXngR1iaUaw+CbbuQzfGrM+f38kvqT4vrzIrIJlEJKJw66Y6
         HHkBFWxpcuZkgE26hNiJgCPc2FtwpqQHbm3ATQi/poroipVZ1J8WDhBLtKSU+qM9pVfe
         6w3f2eniTeEBCYJiUhJpBPUR51b/NdA5Kzt8XuWzCxncQibGG76fvTjFfGXk5YcRgUNf
         DUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640308; x=1684232308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Daq90p6qrczMZk89cBam/kQAHCGL98Y3xxZQBJA/2hY=;
        b=O2HuIHXcjjAzvrxWVAXbe2dwJr+MW4Khut7GPAExPgfZjv/v86Yx9dDiqy5+n5Tp8y
         2f4J5h8q3ESUkCkXTGvzyE+BM40Q6wfaK2g2k5WQUGEZ8FEBvU4L7TI+YYbaX6Um+KVV
         ZQttozcy4PpOXmyEFsEfSE+52Od+KsfWh0Q0im1FTmRJSnQT8cQuG7+0+1WGDP0SNc7J
         HzE16TyQ1oGMkD8wxJ+Efqgp0fBGRJXINIg7iDIs+YB9VtHcPYViKvsY3FK2hQSRHnpU
         8PRt0KvYjZextZTaRNXqvJJQA5jqGsNowkIvrK8Sd5nt80KApO6cExbRwdx37JALRte+
         3Tdw==
X-Gm-Message-State: AAQBX9eRAvv3lu6RwkoQzzxUfqvG1/b7Rg1z2QyzeFeh3NtIuod/o8qo
	WdlAJ2qpMQkcIp5SITNpnGM=
X-Google-Smtp-Source: AKy350bC0Ffjgx9yHHyWLXVl19/OfrGLF4yIZtpo7LQsvpr4YAdPGrRsYD7MUM/bBfhKBRvmFCxjsg==
X-Received: by 2002:a17:907:6d11:b0:94f:6218:191c with SMTP id sa17-20020a1709076d1100b0094f6218191cmr682586ejc.18.1681640308461;
        Sun, 16 Apr 2023 03:18:28 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:28 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 10/12] ARM: dts: Re-introduce Exynos4212 DTSI
Date: Sun, 16 Apr 2023 12:16:22 +0200
Message-Id: <20230416101624.15866-11-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DTSI file was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/exynos4212.dtsi | 157 ++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4212.dtsi

diff --git a/arch/arm/boot/dts/exynos4212.dtsi b/arch/arm/boot/dts/exynos4212.dtsi
new file mode 100644
index 000000000000..9261c14a4489
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4212.dtsi
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4212 SoC device tree source
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Samsung's Exynos4212 SoC device nodes are listed in this file. Exynos4212
+ * based board files can include this file and provide values for board specfic
+ * bindings.
+ *
+ * Note: This file does not include device nodes for all the controllers in
+ * Exynos4212 SoC. As device tree coverage for Exynos4212 increases, additional
+ * nodes can be added to this file.
+ */
+
+#include "exynos4x12.dtsi"
+
+/ {
+	compatible = "samsung,exynos4212", "samsung,exynos4";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@a00 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0xa00>;
+			clocks = <&clock CLK_ARM_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>; /* min followed by max */
+		};
+
+		cpu1: cpu@a01 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0xa01>;
+			clocks = <&clock CLK_ARM_CLK>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>; /* min followed by max */
+		};
+	};
+
+	cpu0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <925000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <950000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <975000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <987500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <200000>;
+			opp-suspend;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <1037500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <1087500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <1137500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1187500>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <1250000>;
+			clock-latency-ns = <200000>;
+		};
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <1287500>;
+			clock-latency-ns = <200000>;
+		};
+		cpu0_opp_1500: opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <1350000>;
+			clock-latency-ns = <200000>;
+			turbo-mode;
+		};
+	};
+};
+
+&clock {
+	compatible = "samsung,exynos4212-clock";
+};
+
+&combiner {
+	samsung,combiner-nr = <18>;
+};
+
+&gic {
+	cpu-offset = <0x8000>;
+};
+
+&pmu {
+	interrupts = <2 2>, <3 2>;
+	interrupt-affinity = <&cpu0>, <&cpu1>;
+	status = "okay";
+};
+
+&pmu_system_controller {
+	compatible = "samsung,exynos4212-pmu", "syscon";
+};
-- 
2.40.0

