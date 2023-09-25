Return-Path: <SRS0=2yZ+=FJ=amd.com=Bradley.Larson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FDECD54BF
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 19:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36BE4C433C9; Mon, 25 Sep 2023 19:57:51 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8978C433C7;
	Mon, 25 Sep 2023 19:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8978C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgpHfqWKhVK11iodzHvsg7o+Aq49PNR4IEfEO8Jmv1La/GOfAtIqdjjA4TkiFmr6FAhKnhgDjWa2/6h+odyZSiaPSEol1Mq9HifEJSPkr2AbZS42v5mEAe3a+ugwgKznKUMGVRKCspqBxoXj6sFgPtXlWwYoIU7Pt7tENBMT6jV4OiehLrPuTqulED39PJUEwSgvSOvuwuWY3/r5riaHmwH9aXAyHvAQbvTb1rH032xVPOVwwh1xO/7VU9slJAGEj6qgcyToLJhGBD79P1yU/EtOdrYs+gO+fJ9mKh6F0+txyYvQa7UngYf9EXepYrTZotFLYrQ8SjXj4pH5ZzHGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raGq5dSBmvrQ2Dt3WoRgaDYnvMHTKAJ8NaqG/O/mgYI=;
 b=Osf5AocAjg9TZeJ0V4uYNjgF66kAsiezOLXW/Vh9eXRvk9XBAGjE0c/otvU9PMcZ+Nb4Cjr/PqeQ8ltUyaW1PNQdyVEUL6MHBhmWIohI5+Wtq6Rp4mNQj0XUmdgsM02+AH21VgIC+Q6upQdTaQGInupfjelNPVkPRlcQyyQhwxz2Rk5wQPTAqflNH5BzcKsBUZhupC83wBwTaxByyyhgmzWIs4YJa4fo355fUcXO3W4VG/vMAxvUBl25A+xi81YIN4dcyBT5Y54NzLbB+0ajN3KvadOD1M4KaLeTx+PuSg+CahqVnEkFdNAb61/fco0ynJOxoDZL52jJMLrRV0kgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raGq5dSBmvrQ2Dt3WoRgaDYnvMHTKAJ8NaqG/O/mgYI=;
 b=DoITCrgkMAAcgSMIjx8zVs6SILbfJgrd8/o9GkbaeMFujUZuzeSYxiKL1dRMjFNwanAPBICamHcG7aWYZI9phxfRWuTVkZjlLkP05gyrUOaSNiqXoaUvKlrGruanVApjwm1qGcQ6M1kozCvuU4qCFgFsH0ozlnJ1irrTOqV7pOE=
Received: from SN4PR0501CA0048.namprd05.prod.outlook.com
 (2603:10b6:803:41::25) by SJ0PR12MB6710.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 25 Sep
 2023 19:57:46 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::a4) by SN4PR0501CA0048.outlook.office365.com
 (2603:10b6:803:41::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.19 via Frontend
 Transport; Mon, 25 Sep 2023 19:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 19:57:46 +0000
Received: from platform-dev1.pensando.io (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 25 Sep 2023 14:57:42 -0500
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
Subject: [PATCH 3/4] arm64: Add config for AMD Pensando SoC platforms
Date: Mon, 25 Sep 2023 12:56:09 -0700
Message-ID: <20230925195610.47971-4-blarson@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a023e6d-c754-4ce1-6ca4-08dbbe01b036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	US5odTf28bDcuFBWCLLPLpcD7A4Tdf0Fl2Mn44KHDpd3sjn4O2YEWw6Bleryka3ycKjtC6jSi3QajDvVDZofVTSUQ3LpfgEi6s0vWPrLKOpLwkFuMgmn1n05LXg/4Uk0SFyu+P+1dhM1r2O632Yqt0pK+iAXF617sOUU6+fBsyMrLuH03f0mcW/yrc+dXwqoUaN8DOdXoZXxYvcztDBPiMnLj/Ybf5pjqTliqWOncrLd0q77I0boo+dASuMPPJwF2rHyn4sXWmsc3wYLPyap7oVfNZZArz6QCKruibwz8UXcLwVACe/41EkijOfWmNlVHqruHoTi1YM1OWDJMEbLrwwu2i0aJJwoaU081QNmhwpwlc30mnJufATUQKej600r5SR42Rv3OvWc2SxRk7aALUJHkZi5rffdRexrqgoqfHIuEBZCy/9OLD5HE65IQ1HvLdNN9rLjtk9r8Rp5NlRTVFIU12uWUePeMOJxrtro+7kCMa+V2CEHsrsaBit6s676S8P9liTqKmyJl/54ESYMHBmtpWGiLZebrCgs2OKhEn9kx7VaeQj5XYz+TrH2yAdQfs1BKyRPrP8zALrhkcwTHsr20HeMLe9FUyr3gh2ZFzlqxRIqDvj7T84VAJ07HI/VgUj9HCo3pgeHPFQ7/ky9T9grnglc9T3WTotigOAkKUMLrNTf+1Jtm1ShWUMsK7ttNKWDTxURsea5DwfymppJWHdbgJbyEM9Hq2M6BF1B5xNUgcvt3rQkszmSIrcr8g9GZjmglWuc5LotHmched8oLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(16526019)(478600001)(6666004)(26005)(336012)(2906002)(426003)(2616005)(1076003)(7416002)(8676002)(4326008)(316002)(41300700001)(6916009)(5660300002)(8936002)(54906003)(7406005)(70586007)(36756003)(70206006)(47076005)(82740400003)(36860700001)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:57:46.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a023e6d-c754-4ce1-6ca4-08dbbe01b036
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710

Add ARCH_PENSANDO configuration option for AMD Pensando SoC
based platforms.

Signed-off-by: Brad Larson <blarson@amd.com>
---
 arch/arm64/Kconfig.platforms | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6069120199bb..24335565bad5 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -244,6 +244,18 @@ config ARCH_NPCM
 	  General support for NPCM8xx BMC (Arbel).
 	  Nuvoton NPCM8xx BMC based on the Cortex A35.
 
+config ARCH_PENSANDO
+	bool "AMD Pensando Platforms"
+	help
+	  This enables support for the ARMv8 based AMD Pensando SoC
+	  family to include the Elba SoC.
+
+	  AMD Pensando SoCs support a range of Distributed Services
+	  Cards in PCIe format installed into servers.  The Elba
+	  SoC includes 16 Cortex A-72 CPU cores, 144 P4-programmable
+	  cores for a minimal latency/jitter datapath, and network
+	  interfaces up to 200 Gb/s.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.17.1

