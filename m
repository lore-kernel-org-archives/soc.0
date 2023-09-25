Return-Path: <SRS0=2yZ+=FJ=amd.com=Bradley.Larson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFB8CD54BF
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 19:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B080FC433C8; Mon, 25 Sep 2023 19:56:42 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28124C433C7;
	Mon, 25 Sep 2023 19:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28124C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0Xa9nmmTYg7HqaBX1X6mxq8ghxurij1eFsOYF17SaOp1WUvu6MBlJHE+PZrDT7OOtF+FC+yyj5OV0AySZbg306ajfp9+I+Z2knM+F6adRSPDizj1d99YmAnbKYVNn5ZE0K7bjSqYEq11fCMgdP/9Oic1Zt7YRb7RLY0ytNE1Bw51kA9R1Z+PNiKsbSoFfcx8v3jiF5C/8K3cRDEaZFUUJhJvukVp7+YVMUAzpump5MR/rrq6AwwF5U5Uu0nRIdmZ+hyUrmo766FoysSNrbVfov+38ocfWxe1Mdoy7cG3ZAyCBp29N55PXxEhrI+hQkUsu8PYFLXoEbOFkoeVkvf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRkTpnGFSHf02xpiHVwi9sW83aFUkpqJ/Rho0zIxNaY=;
 b=JpO9MPxdFSb7P4PQfFwCZ0F5vitvap6zwPvWZu1wBtyZpL+gKPJ3B3C9vUW0e5XMfvOmKGBjkd9XcfBLzubNXU00ppiEZPNY+DEArJly6Yt/2cTch/fO25G0JSJHUYaOPnLpD5bctMk6b6b5bsHjL7BT0Vja4S2Hyw7LyNYMkKPVzEVqPX7S1CFDurt0FXxtUJAEgTVadrOUqxdx6z3LHyUob+vJUJCSuUMwe6KHd9SEzXu98TIBptY/MoQt5VIngeRRAU9JMuKd6zqGVkfOh2B4WcMMPeD9x17JN8mXG7kzvYWyGoz1dbSTcsIOwfMg77CAjEat8q9yMLJ1o4yEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRkTpnGFSHf02xpiHVwi9sW83aFUkpqJ/Rho0zIxNaY=;
 b=lr4yvLpH84/zGFjuCCV+WBMubfA0lAqdeuch9xYifhVxg+fVU+FC8w7ogArDIeEnDkLRrhFoY0SDhPOGSajSUgqKXdIka0HNfFzn7mMeKwYD6f7JNfv/xq6/eVlnksKmF3fS06AZgyKYChR4QYbK2ae+VWuiE2wW0cb/TGq8kPU=
Received: from SA0PR12CA0019.namprd12.prod.outlook.com (2603:10b6:806:6f::24)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.33; Mon, 25 Sep
 2023 19:56:36 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::bf) by SA0PR12CA0019.outlook.office365.com
 (2603:10b6:806:6f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 19:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 19:56:35 +0000
Received: from platform-dev1.pensando.io (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 25 Sep 2023 14:56:32 -0500
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
Subject: [PATCH 0/4] Add AMD Pensando Elba Device Tree 
Date: Mon, 25 Sep 2023 12:56:06 -0700
Message-ID: <20230925195610.47971-1-blarson@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 4087f47e-4383-4ae3-0f03-08dbbe018619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TZWYxbIRjsnNO/WX+q6rv/UaGy+CDchGbsUxW8CwKdOwH9d4456OAuxzP60L0Ipq7Y0SbXuVyDbyiURgEiHFxZPvhPGmdTk2PASRM+H8jifS5wPCcMq8vX4InGKG88n9see5ul9ycU+NnHLim48DTLA2DHpN6yiWYSbxTFgKDN1p8Wg5c6U/YMehIGHVi4oC9ZQDdiUcy4JjGfwkUi4FYJIhHzgE+Xp7seBT7lcnijm/JK3po+a31t+yMbQN2X3Os5+vPwHEZZAV9jk3iFpPdkGmfVz6wH0NFzz0n+JHulRVd4kB2BUtKFH8XvDojY/WX7ms5Ho9TyWPvDOFk4I/h2qVRK7Nm6hS74UeN7xy1uLzeMsX85a8k4N1DAFrE6nDTMVTAWQNgkABkyxaM0GTmiAFXzruArWvAcNrhK9hyvhmz1EKwuLF5GxnHn8nr4krB4MWS34KiaYe2TeP/Cq15YhTlC5uQOGHGbywBysObTaLLjQzHhfh4Byp9uSgYBuT3U1US/CPddMOXM+HtPdy2Gd/439hzCT20mtiphY11HwNPP5avzyYxE9FKmAeKhPUX7GYjYMVsOPndYEJCJS4tMsBLCRbL3f5J4d8jM1/bC7rhqx5wC2M53+Q+zbhc8aHudtEEMVK9fL3klKrWWPOxxgg08kGXqF1KqxHPCDQBbljJ8a2Wp3SV7yYv+kJlAVPbTBWL/XDh4gnqclaj4WDWr/qAvWYhAfNtOYddHKy7LRLyClY0YnpmG0KlU9VeHG0tWygZ787Mzks2ojNo18m+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(5660300002)(6666004)(4743002)(26005)(478600001)(7416002)(2616005)(1076003)(426003)(7406005)(70586007)(2906002)(70206006)(16526019)(316002)(41300700001)(336012)(4326008)(47076005)(54906003)(82740400003)(36756003)(36860700001)(40460700003)(6916009)(8936002)(83380400001)(356005)(8676002)(40480700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:56:35.6466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4087f47e-4383-4ae3-0f03-08dbbe018619
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133

The Elba System Controller is dropped from this patch series.  The
following Elba enablement patches have been merged.

f2156989bf30 spi: cdns: Add compatible for AMD Pensando Elba SoC
f5c2f9f95843 spi: cadence-quadspi: Add compatible for AMD Pensando Elba SoC
2c8606040a80 spi: dw: Add support for AMD Pensando Elba SoC
6282a6ceef62 spi: dw: Add AMD Pensando Elba SoC SPI Controller
aad53d4ee756 mmc: sdhci-cadence: Support mmc hardware reset
b5dbcf1f1d1a mmc: sdhci-cadence: Add AMD Pensando Elba SoC support
e095b78ef2db mmc: sdhci-cadence: Support device specific init during probe
d3e32f847891 mmc: sdhci-cadence: Enable device specific override of writel()
82e4726b00e9 dt-bindings: mmc: cdns: Add AMD Pensando Elba SoC
8e993c5888fa dt-bindings: mfd: syscon: Add amd,pensando-elba-syscon compatible

The relevant DT changes from the previous series is below.  That series is
being split into two.  The first is this series with the device tree and
what is missing for enablement.  The second for TBD Elba system controller
support.

v15-0006-arm64-dts-Add-AMD-Pensando-Elba-SoC-support.patch
- The first cell in the cpu reg property is always zero.  Change
  address-cells to <1> and dropped the leading zero from all cpu* reg<>
- Added read-only and spare partitions to flash0

v14-0006-arm64-dts-Add-AMD-Pensando-Elba-SoC-support.patch
- Fix dtbs_check l2-cache* property issue by adding required
  cache-level and cache-unified properties
- Observed the issue after updating dtschema from 2023.1 to 2023.4
  and yamllint from 1.26.3 to 1.30.0

v6-0010-arm64-dts-Add-AMD-Pensando-Elba-SoC-support
- Update node names and add amd,pensando-elba-syscon


Brad Larson (4):
  dt-bindings: arm: add AMD Pensando boards
  MAINTAINERS: Add entry for AMD PENSANDO
  arm64: Add config for AMD Pensando SoC platforms
  arm64: dts: Add AMD Pensando Elba SoC support

 .../devicetree/bindings/arm/amd,pensando.yaml |  26 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/Kconfig.platforms                  |  12 ++
 arch/arm64/boot/dts/amd/Makefile              |   1 +
 arch/arm64/boot/dts/amd/elba-16core.dtsi      | 197 ++++++++++++++++++
 arch/arm64/boot/dts/amd/elba-asic-common.dtsi |  70 +++++++
 arch/arm64/boot/dts/amd/elba-asic.dts         |  28 +++
 arch/arm64/boot/dts/amd/elba-flash-parts.dtsi | 117 +++++++++++
 arch/arm64/boot/dts/amd/elba.dtsi             | 191 +++++++++++++++++
 9 files changed, 649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amd,pensando.yaml
 create mode 100644 arch/arm64/boot/dts/amd/elba-16core.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba-asic-common.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba-asic.dts
 create mode 100644 arch/arm64/boot/dts/amd/elba-flash-parts.dtsi
 create mode 100644 arch/arm64/boot/dts/amd/elba.dtsi


base-commit: 7bc675554773f09d88101bf1ccfc8537dc7c0be9
-- 
2.17.1

