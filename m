Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96D3A8730
	for <soc@lists.linux.dev>; Mon, 30 Mar 2026 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858992; cv=fail; b=Y55dUfWoOAKqGE/94exO46g1D1TimvZN4KOHa2Dfcy5Xceoq1r0vd0v+ODMwN6HPRGMqNyMYZJKOzIaZGolGxr4Po+NpA0odz5YK/LyyF+R83ZI9k2p14MADd9nmjaYVpLT0VLBrSQNFaQN5w45SD7Atmg/73hCwghBh90cjfZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858992; c=relaxed/simple;
	bh=KkFCC7n0WjjBLU79CN9dkcUiLTMqnskxnNLRcGTiybs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MrI5JTuA39bBVfwQYmACMnbnUByD/iEGkmPlDbRSw/65+I9CAICRVCuw9igxUCtp/f6XpKDNvJJAgH+XmdwtKL1uJ2pBhQywwJQ0CEpMCe+Gn0eNUdnpqiIFkmXpry3AeWDsPfrzmZzxqfWdRL1IIBnhh6Jkr7mlab92t1ZLTv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 09AFDC2BCB2; Mon, 30 Mar 2026 08:23:12 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023085.outbound.protection.outlook.com [40.107.44.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AF1FC2BC9E;
	Mon, 30 Mar 2026 08:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AF1FC2BC9E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfivDDkOEyuUV8b80VHJLQyAn4gKVP3ShZNWK5+VAk+E+cdB84HhMZRdO78/nZjU27bpctLJdG2HFhPbXTNMui56DKlhMwKD6xCOs+BcD84CyG/f0vv14KotKWF2DVdzZ52dUUgTQubv0BQCCediwhLi4ycAOpJ0Zu6lB6zLzHnIXjJPFOfwcfF1enowfTL/WDpTu7Re7LHArJv16GM5Xpu5u4gB+UaMgWijaf+zut6XxOEOF0vfXpYgwn8wh0VWjUFDSegTaK1Aceco+cFLHLANqnC7YoGbWSb8WwXKJu9eWb4hFHE5XD53H7wnC7DI5aAVFhVe2iw831NbbH/JCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aSJnd/tkuZyRJVW9PR0kusJ/FqirX5JNT4zr+qdlXo=;
 b=ZPOJfVElHyXt+GSG4C1CJHUk0iaYEqI1ELwiLg6kWt8a8rf+58F2IH0D3ivj4l4Hz20UaY6KKUIPcJ2OKHQkEaSWT7ODQp86avqUM2EPdInA/DAoFxD7uW1HbveqZInuIJXlFBCDi/CP0Oxa/zeDlELte7/fSurpDGOinOyepUpPMJa+x1DOeNPMUAR/B+vnrCcQmnvVpLbZCDuGb7/v+WNXuoTuD+wTiFeDyc6IXPGf57L4VKhKNal5B7UBjc2p4beXkd23IDAUhoX/AZlYdG8m72p99ryVHyosZ0FpVSk5YLs/gE6nrDLdhPYTmQJRlhcNy7pkX588UkauLC4ESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9) by
 SEZPR06MB6137.apcprd06.prod.outlook.com (2603:1096:101:ec::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 08:23:05 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:c6:cafe::bb) by SG2P153CA0040.outlook.office365.com
 (2603:1096:4:c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Mon,
 30 Mar 2026 08:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 08:23:04 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 93D244126F82;
	Mon, 30 Mar 2026 16:23:03 +0800 (CST)
Date: Mon, 30 Mar 2026 16:23:02 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX dts changes for v7.1-rc1
Message-ID: <acoy5sx8l17P9jaI@nchen-desktop>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|SEZPR06MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 6430a15d-e702-45e9-0939-08de8e3590e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zhzdCeBMVAxTxWYzLSdpBThG4yZO+XbcCQZnWbyLzc3/iRgbgCbxA8W+IM9bglYAsUOGFJvP3fOS8XKX0wAc+q6dwQufjAg009Exf+xtTYBge7nHORMtKcfDzjWzZDwrJovGVqhB/hXa6R1zpkkaRWvgGYvuuyaHGppPxvcO83Y+yozkQvWUOlPd5BKF019SbaGHKBxvMr9qlrfTvhM9VYnJ7WQOgjRLftx7XuD3tCDX5oP7OSiJAGfWEPUmtwkSBZe5pnT4ZnKI8X1IqoJbOnqsAvdZAkipyzy8CqsW1lgfCzH3qTmfC0Ioo269bvMib9MmCcBrLtOM2CdX1zOI4R+VJNFgyteXdGk2aNHU0Xgxcj/wG7gpRhfF5Ivzue+Arw5XSp8PXxJsURIRR70bWmQb3VP+jpv71xLC8z4ekCQlZ1ZBSUnRqBhjyooyqHvFFy6ZBZW1awNWCVDQi5mH5nqoq4INUHakqxqPTE/N5sj+JjiHLk7AKIusIKfuHN9Nw5rORRwEBHxOrMUXL5lfo+kxwGkFCBV0dkP/J1Nz9gtOQVGE2rPJkHzzfSs5WFwxl6ZHgo1xWPDaBx1AN9r9WarBb9Eq2IcmzAsn4CvFKP5MXWFxDxgs6RB2q5EiSExLaDPw9ANvGJ42CZe2lPX7tafyhYs8j70zWgi9mbtcv7D3ac0We8FJ+aki1/UauZ7KgcypTN2YfzKRxmgLBVViEzuyV4+QaHrTZWVbr40U0b0qyKleGAwybIohoaq+UZnysrtbI3ebvsPnotiBhS6qKQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fs/cpRI8ooaEIkC//DoD8CtSoKiJiQegQO8t/4cNe3Zxd1uNbLTOXmIxHds5KikNkLngOylgEfPbJv+5e/+u3A3jz7QDnstrYCwbFVh0+EuQNTVPGDFHAPvBlzj+nD5BxDYqJShoTObja3aT0Gw0S3azRC0B1qCq5q/DxuhI1ABxAf97GQYRO+wG/nDkP0DTI6CFEeXrIwKfxLXieL+7RVNf8YRWNTAcJFts/BVIIH5sAOnQl3NspiA+QFWq3Z8YbehEhT93wUmwTourj5XoXyEVvsH1wZ3GY7tyxNXfsckscHkhsJuO3qtnW3DRZ5RuW7q/cCelBdZipq7YV2y8hNvEra0pQB99nC83qQPBsGT3U14JCU3QweJp2K3FCpCaBC2WwiFPLjahkioNBd+vrVo/Q/6TwlJRmTuCA6l8Z+ujYpcV9VXCICdtGawHkwKk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:23:04.6868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6430a15d-e702-45e9-0939-08de8e3590e9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6137

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v7.1-rc1

for you to fetch changes up to 64b00da69ef6e2cb113868c3ecdccd9bbc1fc91d:

  arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1 (2026-03-24 15:37:13 +0800)

----------------------------------------------------------------
- Add power domain and reset for SoC
- Add GPIO for both SoC and Radxa Orion O6 board

----------------------------------------------------------------
Gary Yang (2):
      arm64: dts: cix: add support for cix sky1 resets
      arm64: dts: cix: Add scmi powerdomain nodes for sky1

Zichar Zhang (1):
      arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1

 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 ++++++
 arch/arm64/boot/dts/cix/sky1-power.h      |  33 +++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 152 ++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

-- 

Best regards,
Peter
