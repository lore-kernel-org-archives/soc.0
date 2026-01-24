Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76807E0E4
	for <soc@lists.linux.dev>; Sat, 24 Jan 2026 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769214722; cv=fail; b=Fte32ceGKNnBKu/wmRTiTiPfIDGtBwVjNfneeDPRW4gMIAVJiNU7PrlavZAgFByyAgG9dWP5vR6Iqr8Y5YJHnzg/47OahLnb75gKkgdZzFNLGfXqF/9h+KYhnbpd7uxG3Zq3tlDqDSYlnphadN9sD1MSZhXqQ2sWFMg8jbEs0F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769214722; c=relaxed/simple;
	bh=o/f0BhkrFkJ0KKdYqagbORfIlxdiF7Wxll/CSM8wF3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjErHAeAnBMo9QjUizTuO76nI2507DSOZCoxBxo/5kMWb/fP0bsuq5/PGNBeJ3QTES8PUtAc0MHijhBE8v7PnQz+Upe/oruCshZ51ZLxturTdwi+LrKlZia0q4tK858E7GUbkp6HgL8rZe14vtwIf5ASI0T3O4LZYgzd//3qCZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 91C1DC19425; Sat, 24 Jan 2026 00:32:02 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022128.outbound.protection.outlook.com [40.107.75.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72189C4CEF1;
	Sat, 24 Jan 2026 00:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72189C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfaxLjU3iMvNOBh4iXEI1N2H28xRkFvfdDHbFiVZyWh0vSywYLTyMN/VKULzxrxQKVoIIfV2/r4zoSyT1sBWCeqcsIzLCMLhhJfOwAoPetx7l5H1emJtJw+bwilQYtygzgDwBrXgWOjwhi939cJjjM4ajgFWbVb0eTygHRDEvsrGdxWK8MF+leAcOKkmcFoHiylOVdkRCB+h9jPrEQX8Y6fpQxYup4T7TvdVqPOyhcgjtVZOfC2WZVMXGVI5kX9uXKEtaBtmMguB1pQPnd4qCZYTiDdj/D+qQfWZ/MnSuFxGNQafhOoAXu/Vs9C43wpFsENL3JApzDArIvriTOINOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsa9lcu3IyYL+HHjxRkw5pekc/Zi3fuz3bnS0o922p8=;
 b=ErkJEI41gwAyfJcsbDMze9rPMYEJp4UP31VajKFUhgl80MhT19/ReKkatz4HgG7aBPSKMizWUUxFVAQAiovApCrS82WZPOJWFQB4aLEx38li0e/hUjdDFlcDcZVNp0waZarVmXiwy6A/7v9Eh9Z+d97qybWG9Ga9YR3yfIR5RXPwx+Ip6ua9CGXOetIxMFpYhRtHkIT3CoMnTk0z72mtZoacPjYTow87YIPWFM6QLpxLCY5BNjjRP4dj71UpppchV00rDyYw/7dVGxG9pCAknzEHm57ftwaA7D95NwpUAYOuau4Pqw8JkSbLp1xxoDxskp1iPFhIBUQPd3tClIiVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:300:5a::21)
 by OSNPR06MB8227.apcprd06.prod.outlook.com (2603:1096:604:45d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 00:31:57 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::59) by PS2PR02CA0057.outlook.office365.com
 (2603:1096:300:5a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Sat,
 24 Jan 2026 00:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Sat, 24 Jan 2026 00:31:56 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B20C24350700;
	Sat, 24 Jan 2026 08:31:55 +0800 (CST)
Date: Sat, 24 Jan 2026 08:31:49 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL 1/2] CIX dts changes for v6.20-rc1
Message-ID: <aXQS9dQ4mwOqzB_K@nchen-desktop>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|OSNPR06MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6a483c-31c8-4c59-500c-08de5adffb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8LmkqTpQIyFbUAVJvQqj2dO/3TkwWlAi7PY145A/51srcf+2+dCx4r5Td8QB?=
 =?us-ascii?Q?pfsTkGkg1UYWN0tg76CqRCvG5xvJf3AlV/ZSAVM4pzlu3O5l/VAehr3PFqyY?=
 =?us-ascii?Q?cmHHVJJCnwfuV+DhbifzrfeR8w7RQiZaEtQ8YUyy5cdFOwZfrQI0ObeWpSlW?=
 =?us-ascii?Q?eyy6h04oOkMOHfcz9V8Tf98UaV2daKikblTQX0BxKR2sayCXseEnxDMEO3vv?=
 =?us-ascii?Q?8cvTbGSEKQW2FGCg+45rIUXLp7DHdYB9ORIgDi0EG9bdwg/qVPyxEzFQCuwz?=
 =?us-ascii?Q?vZLi/P6Xwwxmsnvi5Ywje2yWiLwpFnSHnddAtHWT3/aA0bcNyfSSt9SfRSvo?=
 =?us-ascii?Q?5WVGjiHJu9VPdH0ibAON3J7cnylafzfn1jilwx61lTHONq3lXgPNcWMh7II6?=
 =?us-ascii?Q?Ie0Gj3kw3BJO85Fv52RVXG7tnNFt3PiM6NKBlQjFq1AYV1It+0XiUADAHVfj?=
 =?us-ascii?Q?mzE1Rb3JZ08Kp0tJyWXN1bfHXh6P46XUeaE1TZEdI9mG19IJl6XBTQetXmN7?=
 =?us-ascii?Q?R8pAw89MkNjXVlAe/OlzqI9KsIxa/UCz+Ee5oZKv65hgsLckKFk3bcXuMYem?=
 =?us-ascii?Q?lN+uXe6m9IDu2n5rGU7vKEVlyjkjoCZz8N0EMsSJ/oFEGWOaVlw9MJ+UJbax?=
 =?us-ascii?Q?H4Cnl6/1eN+o0j1vV5K5LL2u9NpZtLuYjtVNcW3GPmLTdghK4zf7EoituZ3v?=
 =?us-ascii?Q?eWIvHdH6AvkZkpa3xl3PlckguG3WBwOvsWP+ylPxjE7GLeQaVS+EKLpLNkBL?=
 =?us-ascii?Q?FG5BryPfkb18ki1DEe9Vvn5k3srjadlCF/WVYlGL0a7DuKCQube86RCj9F9p?=
 =?us-ascii?Q?72i54D+OH8wy8IqEC7neWw/JrHMJebPBw5jyvF0me0dP7VMJws9JyRJ9NIy9?=
 =?us-ascii?Q?Q26YRD95J/x7zKgCvqucCedtZmNv/BFQN7RyhdrAJsoFrkhuIPdNPAvH1yhB?=
 =?us-ascii?Q?5Sqy8FrO3+3DGhLbUZtLz5y6N2d83syeEGQqwVwRfKEfSnubZ77X5x6FBJAX?=
 =?us-ascii?Q?do1lD1Wup7Q5zwtytvRr3bSE7UnkUa34gWUNin5KILf51H028A2K6lOu1eQm?=
 =?us-ascii?Q?HmCM/wQXC5xg39JqSloaNQVy+bijndIoJnNDZg4OfaNHyt6Pq4v9rm0493Vn?=
 =?us-ascii?Q?C5p3612ylOEZax9yaitTOmS2jDHqFOWrM1eNk/CUquP2DoNAv2fy2NlIi+Yd?=
 =?us-ascii?Q?iCL6uprShut3ayuGNX+S1/azLvUEOc7d11T4fPmec3HyIK0waKhRK2TTmMK+?=
 =?us-ascii?Q?/LV0tFvduYlk0oiKUql+zAxmvNilFpCrNqCTcvTxy484agi9ltBMHx4NTs6j?=
 =?us-ascii?Q?uzkmIWWIXCfrT4EiwetnCTxu88f4wReeFu9XUKUqaRVd5yfLyZv8SVbdV1St?=
 =?us-ascii?Q?CvT+1YD8PhV4vt6leLeB+qCkAc3ZxOdLUNwNmzC1Lrz89AIHy3D0yLlL+5Tm?=
 =?us-ascii?Q?+5Rl697/M7HhoZLDvshPMS5RfBl1hR43CmrAuRItLblyFIQJU/Xf/wLioh2O?=
 =?us-ascii?Q?49W6HIM8EENOSqIfATWtADRyXJlSdwCR4bvVdJKzybjpozoz0BbWPNNF+IEC?=
 =?us-ascii?Q?erskhItN6vUuCnP9FDq+UyC8ED2sCLePaIKUcL9dUPDml4jK1PHf7AQlA0bX?=
 =?us-ascii?Q?Ofh70bhYTVf0AcjVA9hgpVNUckS0+caMVg5/XbplRcK64+fIF+6piLsJxpGv?=
 =?us-ascii?Q?cq0G/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 00:31:56.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6a483c-31c8-4c59-500c-08de5adffb15
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8227

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v6.20-rc1

for you to fetch changes up to e39fadd6ef7b797e1db7bb7bf2ed9a1784632a8b:

  arm64: dts: cix: Add OrangePi 6 Plus board support (2026-01-12 09:11:19 +0800)

----------------------------------------------------------------
- add OrangePi 6 Plus board
- one small improvement

----------------------------------------------------------------
Gary Yang (1):
      arm64: dts: cix: Add OrangePi 6 Plus board support

Krzysztof Kozlowski (1):
      arm64: dts: cix: Use lowercase hex

 arch/arm64/boot/dts/cix/Makefile     |  1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts | 83 ++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi    |  2 +-
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts
-- 

Best regards,
Peter
