Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DA731ED84
	for <soc@lists.linux.dev>; Wed, 19 Nov 2025 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533598; cv=fail; b=VcnAjYw4a8pI3ajsBqcHDKrYoQuzSV2qszs5gzbiNdWkgYJOySJy7OF84Nm1B2GRGS33JdasLJTrNljlAy9hK4iOoNdOq+VWLgIEzw+pOaMPegNha+vaPxkvgdQZLv6lSkYFmG60HuXpd7eyLeff6TeGKtHlH8rjy/5dyc9o3Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533598; c=relaxed/simple;
	bh=jJe4FzNMtNLABnanxA4HDVtgHbNCXWe7VKIoxyS72/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoHtOXpFtWN77kdv05iVaIl5WJg8my99jWTEaE/7zpiQYuEMYI4BMGety29mhRqAc6zJhJoCiIpUffv/r/3ADXZGfq+Rj4n4jRLpjqwE5HBw0XNnuVoQCE9HphSfmCvsXGSYCpTptZHjgsY5lqU8k5i8tR4DpPUlYKXQpKBN+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1DDE0C2BC87; Wed, 19 Nov 2025 06:26:38 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FF87C4CEF5;
	Wed, 19 Nov 2025 06:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FF87C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLQiDLy4GsSqHgrWt9pOIbOvhcliU6PaeePIAEtjJFPzbG9dMhzclUAYIbuQ9ZRNQb1nt2GohJWFeif5KmyggJsM9ES6HTI3Oh/SAOhjK7rCSZ+uUIttfLXxsnk31fP3cD7FOBLPTs/gyxROKHiOAXQ+cVUDklvIZS7wZvfAYYjFZu4HD+6wgJybLX3Hhup+j4IE1AyiSEpXhOQXYu+aSS82OUTAnL5h8S4w9OH2QgFO92YG4o+aLhhBrH+zNI1DeQYW07wEzSJQlJC42TFX+MIJ1nn2ZXSgqFxDnSScoBDR/Y3a8khHEuz8o8vVIEL3JRP+1PpmLBloAdH+lxexJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHy/G1KGhWalQRN2W5qPAd7XbtTI3iZJoEAQQoNMARc=;
 b=Zec3/5qyY8Y4+oHygzhRvCSnls1d1WYRRlXtAv3wNJzAjy46ITl/HPSV9runJujmgxQ0vRYgoewEDrNXe8ZJyRQef8H/UoYACeF6TrukRJj/Kt44TWs3TzezrIklPIxb+/DahLOAj5xxP0Wuqu3bZ00ZgT4GTdXpvSxASpAPYtk/mZ+is9jmDIej/18H7ylkrqbPxj41cAb2B0u75w5QE97u/ISjyzscHCmS3GShl0cK/ABEevf7/mF2a368J+mx5An1OEhiNJ61TeKNo9C6I66paQF7FaAHX5yrCbuJBCmqfJsyR+mcg+ZTrsceoZV1uAmVzzldoQMdTw5glnKxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0058.jpnprd01.prod.outlook.com (2603:1096:405:370::9)
 by TYZPR06MB6859.apcprd06.prod.outlook.com (2603:1096:405:1c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Wed, 19 Nov
 2025 06:26:21 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:370:cafe::97) by TY4PR01CA0058.outlook.office365.com
 (2603:1096:405:370::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 06:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 06:26:21 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 102DA41604E0;
	Wed, 19 Nov 2025 14:26:20 +0800 (CST)
Date: Wed, 19 Nov 2025 14:26:14 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX dts changes for v6.19-rc1
Message-ID: <aR1jBv4cL0P5u8Pp@nchen-desktop>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 45632ee8-90cc-4220-a903-08de27348e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?syp8RWona3Jo423TlAZ+Cw5dRrmN44zSpmKXrIxAf58XlImEd+/fVKRkQdjZ?=
 =?us-ascii?Q?Yeh1KZrfJaQUJjvqs4nb0cHTxn+6q9calTr4K6qZytCYUy6pqt/YGZFtWKbv?=
 =?us-ascii?Q?4FReZ4iIj44o012ml0n/CbXngAQJK/+/uQwDFGVTWswxhFVlStfV18846KtE?=
 =?us-ascii?Q?4Rc9tqeM26fSVBTxfiSSvJzEZU8/ZJ+b7AVTEQ9x934uyMNZ9vO1xbMbk3VE?=
 =?us-ascii?Q?UHmKaK5AwM28Kha/IaEFboDhwbCEeznTHPokLH7zGhQQIAMKAkEkOpX68+UB?=
 =?us-ascii?Q?4zwECQ5EKl9d6Bsl4vBEbc6PRomY6bpmy9/8Yy/lBbhjNFi4nanbcqHe771M?=
 =?us-ascii?Q?P6HxssaXA/1Jsui7F205twJWFNqpQsjJQIUS4dqBjgL4/eX2SyLEAdC1s3Wg?=
 =?us-ascii?Q?Ki6tJWAIqaE5Lx0BbSHqpyBjPais3Oe4eutXtpmJ81P4k0QwP555iRJC/VlJ?=
 =?us-ascii?Q?+7kGjHrj/4W9e40f4O1cCe+WMSkqodl9bEP+wpm3LhEaxHZQuSkRPTxfIc1F?=
 =?us-ascii?Q?fAjxOU18312xB7mUt4oKjsTkP8L3cJoLnAyQL/VpDchFLFT/RjE8jp/UhbwB?=
 =?us-ascii?Q?dXFiYz/gHHXfNiuVwaO9/j1VJ/ObWyuVsm3mL5HpVvtGHKtBHBiGehc/LmBH?=
 =?us-ascii?Q?RfSQWrXe2iVILHN8uBDEOs3VTCAKpHkDsJ9H4qVozw1Mjl2+b03TwRTeyBpH?=
 =?us-ascii?Q?TwYXLwAIqhO/hveRYOiMvQAaRU/cpigFvUn9gVVsi6gipj+6R1tGbU6TUcMt?=
 =?us-ascii?Q?xdPFj0qQzhMoyRXtQpQS65oFkJzYUzpXuO23UlEe+CgETWFvWexFh0Zv4GVn?=
 =?us-ascii?Q?agP3R33mMkjNwkJzWUGGHRjyjJd1vfm9gxyanB5UNxGKK/xU0DG2Q8jhl/cW?=
 =?us-ascii?Q?p9QiROWVknIsgBN9GOBC+0zscpo7Go86014WCfzzhcVO30WoUFBnjFbLIjGE?=
 =?us-ascii?Q?qOZVu3iye8lnQv7O3Qkv8W9HfRpqqjCBV0M16uZ8gjfdyel9j6zskVrMINYz?=
 =?us-ascii?Q?i3RYzlKFAKV2iI59MMYxifXFoC8nuBmLI5SW6bSV+VoRQY1KOvrjf5OuusXP?=
 =?us-ascii?Q?q3Si6Y85RQ1rU5D4K+16/1UxBXa+B7RLtGoUm8lVkEthPgYwGPzePOi0VW5j?=
 =?us-ascii?Q?XlNDG4d5P0B0MjuTTGsagaGnuDml2u0l4Gyg37FT/11WEH/eCyIecO+4NL6g?=
 =?us-ascii?Q?KriP39I4BVZL891NpgIMQIKBzOxlcCUrceTbUHlsGh1RB7bdZTwhhuEQ88NY?=
 =?us-ascii?Q?4kP8tYuV5SNYJ6JCT3rLgzZFVXC293O1ULF8XUl5Xc1kVLWNfr47Tvzoz6Ah?=
 =?us-ascii?Q?4uji9HoJmxm/xOcsbrwbUPDceU1BqbnanTG442VIHzB29/v9gvCJOzN8U214?=
 =?us-ascii?Q?sSXR38oWkEj2yiRzyNMH0hbK8gBuMhCbNuGK+BxdQRmxPT01jjDFPp5Ak8LZ?=
 =?us-ascii?Q?OmQ2lw3lNKldTcLkq59eE8J3FZcPczSfNLz2DUpg7bnC/4/i8q3icLO1TWr/?=
 =?us-ascii?Q?zPk5AeIb/b/mBcmWrMY1VK9MKIQOHiK66o/nhQHcNpcVnKHnqGuZg1AtMFoH?=
 =?us-ascii?Q?uFFCxr/FjbwTmBQQ/sk=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:26:21.1910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45632ee8-90cc-4220-a903-08de27348e65
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6859

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v6.19-rc1

for you to fetch changes up to 7dfe67ab5a830083d28a072d262c5f6d3df6b39f:

  arm64: dts: cix: add a compatible string for the cix sky1 SoC (2025-11-17 12:51:05 +0800)

----------------------------------------------------------------
CIX device tree changes for v6.19-rc1, add below new components support:
- PCIe
- Pinctrl
- SPI

----------------------------------------------------------------
Gary Yang (1):
      arm64: dts: cix: Add pinctrl nodes for sky1

Hans Zhang (2):
      arm64: dts: cix: Add PCIe Root Complex on sky1
      arm64: dts: cix: Enable PCIe on the Orion O6 board

Jun Guo (2):
      arm64: dts: cix: add DT nodes for SPI
      arm64: dts: cix: add a compatible string for the cix sky1 SoC

 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  52 ++++
 arch/arm64/boot/dts/cix/sky1-pinfunc.h    | 401 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 156 ++++++++++++
 3 files changed, 609 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-pinfunc.h

-- 

Best regards,
Peter
