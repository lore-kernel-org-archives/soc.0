Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79919C7EE24
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 590E7C433A7; Sun, 16 Apr 2023 13:35:59 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CA8FC433D2;
	Sun, 16 Apr 2023 13:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CA8FC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id xi5so57466977ejb.13;
        Sun, 16 Apr 2023 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652156; x=1684244156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Daq90p6qrczMZk89cBam/kQAHCGL98Y3xxZQBJA/2hY=;
        b=JdyJtzg1mPJKZLWloB4AdzyfRPZqN+bEpQ12NixoS+Me97tKAttDlyqq7HUCxRQ+1v
         v9Z5HBoG7mOB9bVkThpXHzl+2yV5KsrEAiy0qpoX0bqPYieRYuiJEkvnDgbcQjNed8X6
         ucBkXUDv75ePKNA8z27uxkJLe1bxLilzQ5SPMNdXYTVweWk5b7bCqEWtyd+XPQJToa39
         m/pG8wvjAD1ritFEKoFkWrjYcj1zbZlg3jOts3BYthPdQghXtVbV/d1HiWd/07yqilm2
         dkPOAL+TFuG+WZGJJtifZiEeD5eyKQAwrFoSp6y+gp8acVeKeT75CHskrmmPpb9bl52s
         xBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652156; x=1684244156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Daq90p6qrczMZk89cBam/kQAHCGL98Y3xxZQBJA/2hY=;
        b=UOjpo4PIFgtQVwtAS9zBE3I7QoI9spCpzo0ImLrYRiltL0KB2aXfOgb59SeKCfca6m
         ihX8GHeGkRgoa3fF4BrcUmVDnK+JrKPhL27Nl6YtvTCBd7J7o3Rvn/f43n51zDm0K7zx
         xgyutpv4UqiVuVFx00hz/KqNyxZos0Zkz9oxMbc7MQOaNWMewcqYoZN9KdsiTyY17S+L
         ExAD9Iuu3MZbhSRJ2Dco2ZtZ2Bp3m9ZOIfExVmvGGDDYI7Jmg8niQHo7p+EAwIQ6qbrg
         FcWzB4wWc8DnMn1sTgizLB93HnCDcJOFaYCcp69BTFFeqW6LrerTPUCLi1PZuqE/vsnt
         bYVA==
X-Gm-Message-State: AAQBX9fkWbcEvEmg38UDTyFfsmc5aYDPTdnx911nBrM9Pj6h1jFT261L
	g6acxnoU1xxZycfvV3XCjUY=
X-Google-Smtp-Source: AKy350YvqfmFSWkKt+Nc/8zQRr1Skw46RS13uJ3HUwVg0TMXAaJsvx1W6TU9yGC+D1uSawH51zHTDA==
X-Received: by 2002:a17:906:d047:b0:94e:116:8581 with SMTP id bo7-20020a170906d04700b0094e01168581mr4758908ejb.5.1681652156503;
        Sun, 16 Apr 2023 06:35:56 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:56 -0700 (PDT)
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
Subject: [PATCH v2 10/12] ARM: dts: Re-introduce Exynos4212 DTSI
Date: Sun, 16 Apr 2023 15:34:20 +0200
Message-Id: <20230416133422.1949-11-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
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

