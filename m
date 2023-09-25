Return-Path: <SRS0=2yZ+=FJ=amd.com=Bradley.Larson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F7CD54BE
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 19:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F518C433C7; Mon, 25 Sep 2023 19:57:26 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80C69C433C8;
	Mon, 25 Sep 2023 19:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80C69C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLHbm6DXT7LLCwuBfyogBMfr4hf315WEyQxnshqLwnTRMk2mG+VyyFMMkEKYPYifUx5X4URfaIv7H3FGAHMHkaU/kXvyKkkpIFBKOi+IMQH3UEmoXS3bUVSaPcs9bPcmOw/NDAhos4WzypbZXvh950K6UuYAzPWeHbrP81RYpvzB0dEaCx/2qRb5QDKHGObbnbiJM/tqIuROwoaaEv51IWXYz8biaYfNB/2lHGSgpQY7qgV9F/EENK98uE4w85PvCWT9NyxiGsLn284gNsRIXBzNHSt136Pb3XsHinwHUYv2LcMJ1lJ1oIJKlO1NOpW7yBk1rbK4UcXBDsdU6Co9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy28TcdtatfE39iP7KmaaFwO5+MCnCgUUyAylO9Y+RE=;
 b=Sjc1DZjgrqsY1iauVHWohUQtJ5MCvi78NnUJclG6PL0Kd3tRlVFCU1n+jcUSBjPtCB5XWy0+N58oezSrgjSKagjX1oBb5PAFTC78Yh3+8mXlM9Bxc8SYcZUnYCX04gZpjxOqupndvByB26w+APIz2tb8RDA9IUxi0dSiG++EdSZ0eNGT6Z8jBr27Lb8h5ncb8ifmXd0J+L468l3sj3Yppp9sSNqoLWATNlYM+DTtJyBTe0ZN9PCfX6gcCA0+5zFL/Wbsj5pccF2TUvKujm7SSGEHdeZmW0fDBX0PP8ulgkpGMLkyosT50Gs1foIZOEI244u0h6LVSUoVTnv5d3i/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy28TcdtatfE39iP7KmaaFwO5+MCnCgUUyAylO9Y+RE=;
 b=EkUkrVc0yke0hoy6eOiCIELZvt15yZ3/m+Ry4ybsmTc9o1MQweT5lIHqCyeiopvdE9n6MAmn+waodkmOaRpyPejNZj5EoT7JtQXZB+RfE2Evh2FMyrTLwCh3sGUPlR3yYRy+My26tc+V/l2gS70T7Ulh4UjA7K3PyhdRt6MPMKY=
Received: from SN6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:805:66::21)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Mon, 25 Sep
 2023 19:57:20 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::8c) by SN6PR08CA0008.outlook.office365.com
 (2603:10b6:805:66::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 19:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 19:57:20 +0000
Received: from platform-dev1.pensando.io (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 25 Sep 2023 14:56:42 -0500
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
Subject: [PATCH 1/4] dt-bindings: arm: add AMD Pensando boards
Date: Mon, 25 Sep 2023 12:56:07 -0700
Message-ID: <20230925195610.47971-2-blarson@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f9c683-91d1-4a67-e15b-08dbbe01a0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lssGVWTst/+Tos+Sga7ISAZIaWZILYX4Rh0ReqQkkVyKEuPbBZgFk91p4WcDxSdqAhnYC3nPd9B0aKvU53bBRKB7S8FNBwq00Wvndta3uipg0JHXl2PmP+KaizUyk82e6EqP40oskr5pRKbnijdA53XQEUh2ZI77GRYJcP7NAyKR42RsMvFC2WDx1M2sIFWBdf6kLpNKBkjr+U+xXP2EeJhm07PsPbXrrBxQr3mLaE3gRXNs8dWHeFkEpXEDJq66pCl5s/fTbPiVXi3HpowEGh4Hkh7VxMkszSUjR92zX+SegqviqUHYp9F/lcysgOTKcG3UFcua7ZFdJDz4WXDRM5uckD117hszlX7H7tOn5G9pImAk5TQh6XJ51GZbkzYRMaPkO1q1fIYAWkSB5AtX6tQYYbmTUbMCrhHBptcBYzAFPYpiPy+KYvQdE1amEcIiaFOKgR/gd+u5T09YkiZdPEYoes5XsDUcUy/YXAJen/l32gBLEeFEAuBcYyqhUL3VH/ymgqeyPT5cFANsTFBT9l36++uKxqyfC8BDoii2MBksY1NtZXlUhXn3ioojbeJcEuZnu3Lc81/7GXtV/FjHVFxYOpK/v+kQdx/xdgWhON5criZrgxg+xxDol3IHznF28QgWmtHbZ3vLxn8S04y32n7bJgpzwylHMQE/3KL5lNS8pp98bhZJCeS0MezybSt0lpyX9jUP2BlPlmsC0RNyD0M/TimNxfkr+Vr2A6KiLSMdPhM64FsNYR25mVRZqYjKCg5t/WYhokG4bKWZ6bH31IpTZPrXBdKXgY/7LHJ+PHo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(6666004)(16526019)(966005)(40480700001)(1076003)(356005)(40460700003)(336012)(82740400003)(36756003)(36860700001)(81166007)(2616005)(4326008)(26005)(8936002)(5660300002)(47076005)(478600001)(426003)(8676002)(41300700001)(7406005)(70586007)(316002)(7416002)(6916009)(70206006)(2906002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:57:20.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f9c683-91d1-4a67-e15b-08dbbe01a0bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809

Document the compatible for AMD Pensando Elba SoC boards.

Signed-off-by: Brad Larson <blarson@amd.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/amd,pensando.yaml | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amd,pensando.yaml

diff --git a/Documentation/devicetree/bindings/arm/amd,pensando.yaml b/Documentation/devicetree/bindings/arm/amd,pensando.yaml
new file mode 100644
index 000000000000..e5c2591834a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amd,pensando.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/amd,pensando.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD Pensando SoC Platforms
+
+maintainers:
+  - Brad Larson <blarson@amd.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+
+      - description: Boards with Pensando Elba SoC
+        items:
+          - enum:
+              - amd,pensando-elba-ortano
+          - const: amd,pensando-elba
+
+additionalProperties: true
+
+...
-- 
2.17.1

