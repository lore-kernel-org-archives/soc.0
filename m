Return-Path: <SRS0=2yZ+=FJ=amd.com=Bradley.Larson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDF8CD54BE
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 19:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 107A9C43395; Mon, 25 Sep 2023 19:58:05 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D97CC433C9;
	Mon, 25 Sep 2023 19:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D97CC433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpLE4j0FPaDrto+zaQJJVUZOMo4VfEmlXd/WgoRSzghZCwgx/d4jBHIm4JkiJofhtk5/jg+QEAaHh+QH/fjoGfidyZVJrvRVU/bywoBb6gPZb7yGZk9XnGt7XmeZrP8HFN4jimhA1lROjcq4VYgiZsSDR+d/zKt8JCv6VAiibcwMsSPVcF6YE+hWVfna/zva4ltvLQ2IIpCA6ltqNeh4zWzPI5Pr82YDbGj/32bi4J8S8nSeMA1OquMSkDRYY8lHnBvm8LfGyjWIo1O1FZBufZuEvWnEXS9g9KeVBno+ojHTotPNKcXot1QBzVxtL8IU2UZBqBs5mtHzLwudO9H7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52EzHPXYT9nt/ikLhpPw0X9FGaCVtM17Br1KVFEzZNs=;
 b=la8vxk4GFqPrrJHCJ1la8hVq3SLpfncPkzhQgkh9ESVmIoq7SSfMEhAjWeCKYKB1nnBaM9lkx7DmLTvLE9BOs/rfRluzVBTZJ73/s11K7JgAYxNd5wQap+C6z/V3LaWisSIM31c/95+g/+d4TUmaVGKBaOOuSsuXzB8jW+NledKwZlPDlEt+3JIe2KRAqVhMNGGW9eKdxl9YCwOJsJ11TA7Tju1t0EO7Q/wUtuBBT2AW0+CC7kdRQSlVnKnd9TsN/gY+FvJp/kQidoqU6Th+6CsbPhtt1aj+aDK6Gx9nU+GfYLyQJ/jQ4GAvry5E+N9irQW61ufN0gHo6pqyjGhCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52EzHPXYT9nt/ikLhpPw0X9FGaCVtM17Br1KVFEzZNs=;
 b=LRnucRGAEdXv0a9THSTXfLip0pla01PnO5RL2HyBeTeojP4CujIU0hWXXHhRV7p1Eby9qEp/3IXOfjxyHtljvVhsaPUvZFI8YLmgCHFSm5u8be5XHtJLNCe1d31egpBBqMSwXLvN86CIBWTIiU6NB7hkvT/XvogecqMbb4iDKa4=
Received: from SN6PR08CA0009.namprd08.prod.outlook.com (2603:10b6:805:66::22)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 19:58:00 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::3b) by SN6PR08CA0009.outlook.office365.com
 (2603:10b6:805:66::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 19:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 19:57:59 +0000
Received: from platform-dev1.pensando.io (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 25 Sep 2023 14:57:55 -0500
From: Brad Larson <blarson@amd.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <adrian.hunter@intel.com>,
	<alcooperx@gmail.com>, <andy.shevchenko@gmail.com>, <arnd@arndb.de>,
	<blarson@amd.com>, <brendan.higgins@linux.dev>, <briannorris@chromium.org>,
	<catalin.marinas@arm.com>, <conor+dt@kernel.org>, <davidgow@google.com>,
	<gsomlo@gmail.com>, <gerg@linux-m68k.org>, <hal.feng@starfivetech.com>,
	<hasegawa-hitomi@fujitsu.com>, <j.neuschaefer@gmx.net>, <joel@jms.id.au>,
	<kernel@esmil.dk>, <krzk@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<lee@kernel.org>, <lee.jones@linaro.org>, <broonie@kernel.org>,
	<p.zabel@pengutronix.de>, <rdunlap@infradead.org>, <robh+dt@kernel.org>,
	<samuel@sholland.org>, <fancer.lancer@gmail.com>,
	<skhan@linuxfoundation.org>, <suravee.suthikulpanit@amd.com>,
	<thomas.lendacky@amd.com>, <tonyhuang.sunplus@gmail.com>,
	<ulf.hansson@linaro.org>, <vaishnav.a@ti.com>,
	<walker.chen@starfivetech.com>, <will@kernel.org>, <zhuyinbo@loongson.cn>,
	<devicetree@vger.kernel.org>
Subject: [PATCH 4/4] arm64: dts: Add AMD Pensando Elba SoC support
Date: Mon, 25 Sep 2023 12:56:10 -0700
Message-ID: <20230925195610.47971-5-blarson@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230925195610.47971-1-blarson@amd.com>
References: <20230925195610.47971-1-blarson@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3fc6bd-14a1-428d-7699-08dbbe01b849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J4x2H4kxhD9lQNuGhAnROdYjBJQWQ1NZ25PrI2FmnVYhdJXofF8KhuuiDu+RU4GGPYv0M+Li1zlM2Q7/Y7hUmEZKSlDPyq2buKwPa6wJRTDGd4XnIzeVaPRogJef3rZDoJ4guA51+3rw33DanFL6RrqXOIIEopb/NiWHU8NpoOXh02yKRpoBQwiFMYVLXbzReRYgbws5vBBh+Z2+63r0WIs3yKqQv/LSqW3MFl6vCHxJjN9TZ0MFAmip5QWSjPcPFYdq2XgkpNNlJbsGQE0iZ7FTN2GW0FBDqicz9hZhfn43aEVXeWM1tTnT1Xg1S46NIV6yhDKEb4OMDHRbo1BV+arPba9OQFN2gGgxAo6+7KjXd9O+iV8necFwePet04tv90bZjHEn/Ck1N3QkFOBTwpbgSqq5qUq/pijQB+W/+8u7N8B1Z9Rnufd5FLSsuKATAMoce4nzu11L+bmfKhkMF00uhpnEiCvnWerBIryT6sH9o+2hBVH/Fgt+i5AATfG43YGCp/vjlJzEEoYfU8guhPnyBClF/8CnLwQBmGZSTzQ8F20oR9XNVwA1G/SnyDlA6TS2g7PNmVnvq5O8ay5QhqLGG8Rbzh9Wl5GN/2jXDp8J/LmdnT1ObHMtkDOrB3/Vfj9rqmlSuClILs6TMijvzZn5mYfBdbFwue+zvg2fsOW9TcdRy2qu2xQGuIlwWt4mjoHYVnYZscNACz8lCYkN+UAq/KG8E23+ViqZUC96dzjDfpzbEWSKQ/64Y0gAsj9YYEwVztUV06N1kM0pftDcpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(2906002)(40460700003)(47076005)(478600001)(36756003)(26005)(82740400003)(6666004)(426003)(336012)(1076003)(16526019)(83380400001)(81166007)(2616005)(356005)(40480700001)(8936002)(36860700001)(41300700001)(8676002)(4326008)(316002)(5660300002)(30864003)(70206006)(7406005)(7416002)(70586007)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:57:59.8342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3fc6bd-14a1-428d-7699-08dbbe01b849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787

Add AMD Pensando common and Elba SoC specific device nodes

Signed-off-by: Brad Larson <blarson@amd.com>
---

New series baseline:
- Remove references to system controller

Old series history:
v15 changes:
- The first cell in the cpu reg property is always zero.  Change
  address-cells to <1> and dropped the leading zero from all cpu* reg<>
- Added read-only and spare partitions to flash0

v14 changes:
- Fix dtbs_check l2-cache* property issue by adding required
  cache-level and cache-unified properties
- Observed the issue after updating dtschema from 2023.1 to 2023.4
  and yamllint from 1.26.3 to 1.30.0

v11 changes:
- Delete reset-names
- Fix spi0 compatible to be specific 'amd,pensando-elba-ctrl'

v9 changes:
- Single node for spi0 system-controller and squash
  the reset-controller child into parent

---
 arch/arm64/boot/dts/amd/Makefile              |   1 +
 arch/arm64/boot/dts/amd/elba-16core.dtsi      | 197 ++++++++++++++++++
 arch/arm64/boot/dts/amd/elba-asic-common.dtsi |  70 +++++++
 arch/arm64/boot/dts/amd/elba-asic.dts         |  28 +++
 arch/arm64/boot/dts/amd/elba-flash-parts.dtsi | 117 +++++++++++
 arch/arm64/boot/dts/amd/elba.dtsi             | 191 +++++++++++++++++
 6 files changed, 604 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amd/elba-16core.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba-asic-common.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba-asic.dts
 create mode 100644 arch/arm64/boot/dts/amd/elba-flash-parts.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba.dtsi

diff --git a/arch/arm64/boot/dts/amd/Makefile b/arch/arm64/boot/dts/amd/Makefile
index 68103a8b0ef5..8502cc2afbc5 100644
--- a/arch/arm64/boot/dts/amd/Makefile
+++ b/arch/arm64/boot/dts/amd/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_PENSANDO) += elba-asic.dtb
 dtb-$(CONFIG_ARCH_SEATTLE) += amd-overdrive-rev-b0.dtb amd-overdrive-rev-b1.dtb
diff --git a/arch/arm64/boot/dts/amd/elba-16core.dtsi b/arch/arm64/boot/dts/amd/elba-16core.dtsi
new file mode 100644
index 000000000000..568bcc39ce9f
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/elba-16core.dtsi
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+/*
+ * Copyright 2020-2023 Advanced Micro Devices, Inc.
+ */
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 { cpu = <&cpu0>; };
+				core1 { cpu = <&cpu1>; };
+				core2 { cpu = <&cpu2>; };
+				core3 { cpu = <&cpu3>; };
+			};
+
+			cluster1 {
+				core0 { cpu = <&cpu4>; };
+				core1 { cpu = <&cpu5>; };
+				core2 { cpu = <&cpu6>; };
+				core3 { cpu = <&cpu7>; };
+			};
+
+			cluster2 {
+				core0 { cpu = <&cpu8>; };
+				core1 { cpu = <&cpu9>; };
+				core2 { cpu = <&cpu10>; };
+				core3 { cpu = <&cpu11>; };
+			};
+
+			cluster3 {
+				core0 { cpu = <&cpu12>; };
+				core1 { cpu = <&cpu13>; };
+				core2 { cpu = <&cpu14>; };
+				core3 { cpu = <&cpu15>; };
+			};
+		};
+
+		/* CLUSTER 0 */
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0>;
+			next-level-cache = <&l2_0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x1>;
+			next-level-cache = <&l2_0>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x2>;
+			next-level-cache = <&l2_0>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x3>;
+			next-level-cache = <&l2_0>;
+			enable-method = "psci";
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		/* CLUSTER 1 */
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x100>;
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x101>;
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x102>;
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x103>;
+			next-level-cache = <&l2_1>;
+			enable-method = "psci";
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		/* CLUSTER 2 */
+		cpu8: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x200>;
+			next-level-cache = <&l2_2>;
+			enable-method = "psci";
+		};
+
+		cpu9: cpu@201 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x201>;
+			next-level-cache = <&l2_2>;
+			enable-method = "psci";
+		};
+
+		cpu10: cpu@202 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x202>;
+			next-level-cache = <&l2_2>;
+			enable-method = "psci";
+		};
+
+		cpu11: cpu@203 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x203>;
+			next-level-cache = <&l2_2>;
+			enable-method = "psci";
+		};
+
+		l2_2: l2-cache2 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		/* CLUSTER 3 */
+		cpu12: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x300>;
+			next-level-cache = <&l2_3>;
+			enable-method = "psci";
+		};
+
+		cpu13: cpu@301 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x301>;
+			next-level-cache = <&l2_3>;
+			enable-method = "psci";
+		};
+
+		cpu14: cpu@302 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x302>;
+			next-level-cache = <&l2_3>;
+			enable-method = "psci";
+		};
+
+		cpu15: cpu@303 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x303>;
+			next-level-cache = <&l2_3>;
+			enable-method = "psci";
+		};
+
+		l2_3: l2-cache3 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/amd/elba-asic-common.dtsi b/arch/arm64/boot/dts/amd/elba-asic-common.dtsi
new file mode 100644
index 000000000000..46b6c6783f58
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/elba-asic-common.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+/*
+ * Copyright 2020-2022 Advanced Micro Devices, Inc.
+ */
+
+&ahb_clk {
+	clock-frequency = <400000000>;
+};
+
+&emmc_clk {
+	clock-frequency = <200000000>;
+};
+
+&flash_clk {
+	clock-frequency = <400000000>;
+};
+
+&ref_clk {
+	clock-frequency = <156250000>;
+};
+
+&qspi {
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <2>;
+		m25p,fast-read;
+		cdns,read-delay = <0>;
+		cdns,tshsl-ns = <0>;
+		cdns,tsd2d-ns = <0>;
+		cdns,tchsh-ns = <0>;
+		cdns,tslch-ns = <0>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+	};
+};
+
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	num-cs = <4>;
+	cs-gpios = <0>, <0>, <&porta 1 GPIO_ACTIVE_LOW>,
+		   <&porta 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amd/elba-asic.dts b/arch/arm64/boot/dts/amd/elba-asic.dts
new file mode 100644
index 000000000000..c3f4da2f7449
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/elba-asic.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+/*
+ * Device Tree file for AMD Pensando Elba Board.
+ *
+ * Copyright 2020-2022 Advanced Micro Devices, Inc.
+ */
+
+/dts-v1/;
+
+#include "elba.dtsi"
+#include "elba-16core.dtsi"
+#include "elba-asic-common.dtsi"
+#include "elba-flash-parts.dtsi"
+
+/ {
+	model = "AMD Pensando Elba Board";
+	compatible = "amd,pensando-elba-ortano", "amd,pensando-elba";
+
+	aliases {
+		serial0 = &uart0;
+		spi0 = &spi0;
+		spi1 = &qspi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/arm64/boot/dts/amd/elba-flash-parts.dtsi b/arch/arm64/boot/dts/amd/elba-flash-parts.dtsi
new file mode 100644
index 000000000000..cf761a05a81f
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/elba-flash-parts.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+/*
+ * Copyright 2020-2023 Advanced Micro Devices, Inc.
+ */
+
+&flash0 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		partition@0 {
+			label = "rsvd";
+			reg = <0x0 0x10000>;
+			read-only;
+		};
+
+		partition@10000 {
+			label = "flash";
+			reg = <0x10000 0xfff0000>;
+		};
+
+		partition@f0000 {
+			label = "golduenv";
+			reg = <0xf0000 0x10000>;
+		};
+
+		partition@100000 {
+			label = "boot0";
+			reg = <0x100000 0x80000>;
+		};
+
+		partition@180000 {
+			label = "golduboot";
+			reg = <0x180000 0x200000>;
+		};
+
+		partition@380000 {
+			label = "brdcfg0";
+			reg = <0x380000 0x10000>;
+		};
+
+		partition@390000 {
+			label = "brdcfg1";
+			reg = <0x390000 0x10000>;
+		};
+
+		partition@400000 {
+			label = "goldfw";
+			reg = <0x400000 0x3c00000>;
+		};
+
+		partition@4010000 {
+			label = "fwmap";
+			reg = <0x4010000 0x20000>;
+		};
+
+		partition@4030000 {
+			label = "fwsel";
+			reg = <0x4030000 0x20000>;
+		};
+
+		partition@4090000 {
+			label = "bootlog";
+			reg = <0x4090000 0x20000>;
+		};
+
+		partition@40b0000 {
+			label = "panicbuf";
+			reg = <0x40b0000 0x20000>;
+		};
+
+		partition@40d0000 {
+			label = "uservars";
+			reg = <0x40d0000 0x20000>;
+		};
+
+		partition@4200000 {
+			label = "uboota";
+			reg = <0x4200000 0x400000>;
+		};
+
+		partition@4600000 {
+			label = "ubootb";
+			reg = <0x4600000 0x400000>;
+		};
+
+		partition@4a00000 {
+			label = "mainfwa";
+			reg = <0x4a00000 0x1000000>;
+		};
+
+		partition@5a00000 {
+			label = "mainfwb";
+			reg = <0x5a00000 0x1000000>;
+		};
+
+		partition@6a00000 {
+			label = "diaguboot";
+			reg = <0x6a00000 0x400000>;
+		};
+
+		partition@6e00000 {
+			label = "spare";
+			reg = <0x6e00000 0x1200000>;
+		};
+
+		partition@8000000 {
+			label = "diagfw";
+			reg = <0x8000000 0x7fe0000>;
+		};
+
+		partition@ffe0000 {
+			label = "ubootenv";
+			reg = <0xffe0000 0x10000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/amd/elba.dtsi b/arch/arm64/boot/dts/amd/elba.dtsi
new file mode 100644
index 000000000000..674890cf2a34
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/elba.dtsi
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+/*
+ * Copyright 2020-2022 Advanced Micro Devices, Inc.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "dt-bindings/interrupt-controller/arm-gic.h"
+
+/ {
+	model = "Elba ASIC Board";
+	compatible = "amd,pensando-elba";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	dma-coherent;
+
+	ahb_clk: oscillator0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	emmc_clk: oscillator2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	flash_clk: oscillator3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	ref_clk: oscillator4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		i2c0: i2c@400 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x400 0x0 0x100>;
+			clocks = <&ahb_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			i2c-sda-hold-time-ns = <480>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		wdt0: watchdog@1400 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x1400 0x0 0x100>;
+			clocks = <&ahb_clk>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		qspi: spi@2400 {
+			compatible = "amd,pensando-elba-qspi", "cdns,qspi-nor";
+			reg = <0x0 0x2400 0x0 0x400>,
+			      <0x0 0x7fff0000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&flash_clk>;
+			cdns,fifo-depth = <1024>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x7fff0000>;
+			status = "disabled";
+		};
+
+		spi0: spi@2800 {
+			compatible = "amd,pensando-elba-spi";
+			reg = <0x0 0x2800 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			amd,pensando-elba-syscon = <&syscon>;
+			clocks = <&ahb_clk>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs = <2>;
+			status = "disabled";
+		};
+
+		gpio0: gpio@4000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0x4000 0x0 0x78>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			porta: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <8>;
+				interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				#interrupt-cells = <2>;
+			};
+
+			portb: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <8>;
+			};
+		};
+
+		uart0: serial@4800 {
+			compatible = "ns16550a";
+			reg = <0x0 0x4800 0x0 0x100>;
+			clocks = <&ref_clk>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		gic: interrupt-controller@800000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x800000 0x0 0x200000>,	/* GICD */
+			      <0x0 0xa00000 0x0 0x200000>,	/* GICR */
+			      <0x0 0x60000000 0x0 0x2000>,	/* GICC */
+			      <0x0 0x60010000 0x0 0x1000>,	/* GICH */
+			      <0x0 0x60020000 0x0 0x2000>;	/* GICV */
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#interrupt-cells = <3>;
+			ranges;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			/*
+			 * Elba specific pre-ITS is enabled using the
+			 * existing property socionext,synquacer-pre-its
+			 */
+			gic_its: msi-controller@820000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x820000 0x0 0x10000>;
+				msi-controller;
+				#msi-cells = <1>;
+				socionext,synquacer-pre-its =
+							<0xc00000 0x1000000>;
+			};
+		};
+
+		emmc: mmc@30440000 {
+			compatible = "amd,pensando-elba-sd4hc", "cdns,sd4hc";
+			reg = <0x0 0x30440000 0x0 0x10000>,
+			      <0x0 0x30480044 0x0 0x4>;	/* byte-lane ctrl */
+			clocks = <&emmc_clk>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			cdns,phy-input-delay-sd-highspeed = <0x4>;
+			cdns,phy-input-delay-legacy = <0x4>;
+			cdns,phy-input-delay-sd-uhs-sdr50 = <0x6>;
+			cdns,phy-input-delay-sd-uhs-ddr50 = <0x16>;
+			mmc-ddr-1_8v;
+			status = "disabled";
+		};
+
+		syscon: syscon@307c0000 {
+			compatible = "amd,pensando-elba-syscon", "syscon";
+			reg = <0x0 0x307c0000 0x0 0x3000>;
+		};
+	};
+};
-- 
2.17.1

