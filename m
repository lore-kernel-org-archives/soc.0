Return-Path: <SRS0=2yZ+=FJ=amd.com=Bradley.Larson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B0CD54BE
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 19:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAC8AC433C9; Mon, 25 Sep 2023 19:57:37 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 364EAC433C7;
	Mon, 25 Sep 2023 19:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 364EAC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMblx4OfC8g5y+cxraZf0USqoPEv2p0VnGZL2+hHEGygrn2ySFgXPxkdNcMJ9XsPgZZu5W9D4joI60ttZBWHCHEHwD15bZeLfTE4SvaBmBVdaypNXzH4ZoBBjMDKDqYmYyI0FuEqA2LiivGfj9vAtFAmMzgDLLS86l1p9RihhDM3SadCI7zYdDvS2RjmX/cipnU4qDAw/LgWnngA6YRKL23CMtMHbyx/cX7R+KGRnUpW6WjYF1MyRs08zd2xvKSNPIFFiCee+BzsrQXOUqrErSLQxf9hGCcSIx9vPFzAGdK2gCFoyn+Z//vYz2vA6wcsIVCTVRWkMmUbVwxPf/yahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm5M7XMW+eqZaWmKdSsgIRYFFeAOsU94t+H56eSJFJI=;
 b=SpBuvP+ph2vf+nwqHX/2fOVZ6guO0Es/CGfZM+F39U51z3rQbKJJxpSTEF+6fb6nsFuXv6Eb/NHimyCxr4xcrAj3dh7/3l+1vTtoyJbtrCnXsOpXx1Y9pyR39THgEndiV9Af180pVyDNqJgNA60yU/FJDiZZZJribNSXdCaw2ThoVV5S2EkM+qeJfcsfAj3SifyLT9odkpEIRBwbvKs4rzBsLv5ioiqP/TWhmZdbmnG9QmTuKlS3PL6Cm8luiAbl3hgN6QE2xkjySyYZbkaR4F/8PbVq9EVxWYeMW/MBMs9za9XpWIQnpPRV3DsCabJ+DZg5LGm0DgrQevgjBi8z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm5M7XMW+eqZaWmKdSsgIRYFFeAOsU94t+H56eSJFJI=;
 b=EfTzyf0OStSiN2U9Yjrsjjis1oXgeHeRyvpK/75Glirm7w/Wm2j3Dd1DphLMJUKasc1YWaDwbTZEhAdB60s1uzg6cc6lEZNhfeDQWY+HG/rWRADHKeGEWxP/u+4Oda1twM0mcDcWVWMcW+6cJXR6hSWEi4J6pE/I1RtHTVCYdp0=
Received: from SA9PR03CA0026.namprd03.prod.outlook.com (2603:10b6:806:20::31)
 by DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Mon, 25 Sep 2023 19:57:33 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::1e) by SA9PR03CA0026.outlook.office365.com
 (2603:10b6:806:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 19:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 19:57:32 +0000
Received: from platform-dev1.pensando.io (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 25 Sep 2023 14:57:29 -0500
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
Subject: [PATCH 2/4] MAINTAINERS: Add entry for AMD PENSANDO
Date: Mon, 25 Sep 2023 12:56:08 -0700
Message-ID: <20230925195610.47971-3-blarson@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e49915-e5b3-4e97-6d09-08dbbe01a811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hW8YIO1nhsQLHBnQWpT+FXB7EQ6iRViFYpzQBAvoVHUdHGSwbuIR4EvAZQ3AX0D0EUd3urqcCyCoNVmgpAlMmrtAKnrRKkaDM3e+lLw6+ngygA76xpum65+0r3i9LzdLlDkLaN+hkwKePBEJ8wHyu9H9KM98U0JSwsbsjlqN5HFBPIwi0u1o1OpQ6RSu5tafoEcpyY6piY+H3nMbHoycGAcWxasxE8tfBNRuqAiQnzCJl64Ye4Jjy4Wljd9uoQ+JEwrw2M6ytd9fN7sEcW9ywk9OxhQN8/g+ameUxW8S3+C1WJCvp7XuKbOrBAeRclG7agqUmTyXAr0ntLGACRaM1Kr5q3xZC6F9YPR2CUkgcZ/zT5aT99IWM2Y/DNZLYNZMA4q2AyHDV6JSwuTfnocZ2Y91zd769ADok81aGNYGWdlEVdR55Ve35l3ZVRb08Nf2NYkFY/EDY3I9gfDDSKI5FGZiH0CkKdoq2NtuD4uMlK61Wn++QbQUuQPsmCk7ACUUS7ec7dB8Hw29x7JvqFg2fvwquqjXXIi61qiKQv3GkeQ2C9L1zIlkxKhhz1TIG73XTYw4ar7wj+mgGWRKp91DglF8ZHFd31bMY+HLYxPEmtdfIIJBxC5Hvc4IxeQpAwp5hwLm/c3jfRdwKSEFmnpjx6xGVHfwmaUFDlatkLa9ZRT2y1Law3S/fztIveJGm0wxmqHvKdxlKx7SnLWC0qcm2LkmEDqaLXEAIVTIwYGb77ocsY2BDgNDHftIm13DGpxRcRHKOIYpvN3esfn9q8FNCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(40470700004)(36840700001)(46966006)(1076003)(478600001)(6666004)(16526019)(26005)(83380400001)(336012)(426003)(2616005)(7406005)(4744005)(2906002)(40480700001)(41300700001)(6916009)(8676002)(54906003)(8936002)(70206006)(7416002)(5660300002)(70586007)(316002)(36756003)(4326008)(36860700001)(81166007)(356005)(47076005)(82740400003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 19:57:32.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e49915-e5b3-4e97-6d09-08dbbe01a811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296

Add entry for AMD PENSANDO maintainer and files

Signed-off-by: Brad Larson <blarson@amd.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2833e2da63e0..a58f7b15e84c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1815,6 +1815,13 @@ N:	allwinner
 N:	sun[x456789]i
 N:	sun[25]0i
 
+ARM/AMD PENSANDO ARM64 ARCHITECTURE
+M:	Brad Larson <blarson@amd.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/*/amd,pensando*
+F:	arch/arm64/boot/dts/amd/elba*
+
 ARM/Amlogic Meson SoC CLOCK FRAMEWORK
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 M:	Jerome Brunet <jbrunet@baylibre.com>
-- 
2.17.1

