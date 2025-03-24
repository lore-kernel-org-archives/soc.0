Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5E190057
	for <soc@lists.linux.dev>; Mon, 24 Mar 2025 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797469; cv=fail; b=Ror5rWMja8CYn+MUjMwq5YfkeWnyav85qeupPs+2T6YL4XMyAjBB+PRHpEVBRlK7dDvJCQsJ4xu/4rRPmtNWy11EnZopu1cGmVeMAjuRnL+0KUDq4GYlIa7plzP9IJ9T1zB9j1cuBLR11pdDXmtnW/at+Y3kwvC4bAXY5M3bGvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797469; c=relaxed/simple;
	bh=S/MKWfZ3FuIwldazVP6l3KU8tFVscROnhbdXGYZTSf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6Q/VKDeYa6CiPTdUWhuHcbQXygXWn1ps5Tuyfk0MG+WNqiwMcfl6G/ruAR4ea8h0cfizmtGfLykOW4JnTPXw2GNlXxaOGJjsExomluCWMGTEY6F1f7DkHlCweDT0+llQ5FV5Ue1H+Gorwxt2eKW6jR6vZBL8dEb+WcBXlAdwvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 92825C4CEF4; Mon, 24 Mar 2025 06:24:28 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2095.outbound.protection.outlook.com [40.107.255.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57F87C4CEDD;
	Mon, 24 Mar 2025 06:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57F87C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqK7A4nRqTBT3bcHhF50iZwuojBpvV5yxY79Zc9GDSyaPqR/uUDpycLPb03oac1w/FCrmicS2zqJL8LlbPTQ3vkNg5BcVgVAc1vUO0IcWhm7Cl5rzjmFAOv27EHCWniJMvHoz1xrV1P5VjVNBbYyFzqRO7HED3hX0op6qd30eQIXhfH6LDRU96cUPPYbppFF1i1e7KRbffuUAI/FOfab+40gdbKlcRlu93komx0OaU3BUYAI2xkK14hi/WoixxGxLwjbk5i4PE9rgMlB5aHl674qKCRUibVD0GOWpLXdUB1qnnMRdfEgDmrw/z5UbLAPaVHFu/w1TZfHhgsgpF4Vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGcpDc6Obj5YH8wPejzDe8upIjBAAPRo3tVcY1TfzwY=;
 b=IPTObg5JwJ2lxTaNu5P6AN2u5QW4lPuAomsaTgx7dRQq38aJbx52HxGK7uYk+HTp5vNQptQAB9Ms4UdRp2h6HE+AxE0ckhfmTPkr1JmeXupvyKx4PLS2MCEtJvCS7dU/+k8a2aoqzk8UTq7kA3gflBtjnsBu5Gm9o+BRQZMhnUBV+TTF3E6QsWUVYQj5o7ww/xYNzoe520HLseWM143ya4BdfibKSZmhf+jMRo4UQoqzley1x5v+6JP5uRo5/0ml5BQVWV8KZJyXZZduWuraiMo96lt2BicpsiL/lZsL7Zq8I1KDacusUSCjSF76XZqV4mjJaOjUp4hpQVHoWiv+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::27) by TYSPR06MB6575.apcprd06.prod.outlook.com
 (2603:1096:400:480::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:24:22 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::74) by PS2PR01CA0063.outlook.office365.com
 (2603:1096:300:57::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.38 via Frontend Transport; Mon,
 24 Mar 2025 06:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 06:24:21 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D07BF4160CA6;
	Mon, 24 Mar 2025 14:24:20 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v5 4/6] arm64: defconfig: Enable CIX SoC
Date: Mon, 24 Mar 2025 14:24:18 +0800
Message-Id: <20250324062420.360289-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324062420.360289-1-peter.chen@cixtech.com>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TYSPR06MB6575:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a93fd03-11b6-4562-7669-08dd6a9c842b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QaLq31hn2DF5tyHLSHrfXYK3blXWMZmSdvXGs/C9M2RpOCnQpyRz22LXMWbB?=
 =?us-ascii?Q?6FqaA4HBv/NDYv6RfMr8/YIRopD+9m1cE46iCs80ZkkoNJLpgEwSjwF+pScp?=
 =?us-ascii?Q?YMK3Vye2rpELi7ioH4bR6hBHb/rol+jcZ4DWKUpenq+ia1/dAPEWcazbnpx7?=
 =?us-ascii?Q?NAuyZous5DhD03ayIuok9POX+INZZ1k7/e5sdTWGyaVphI0ZNcrU9DP/J/EX?=
 =?us-ascii?Q?HBU6TJ/gZ/FJObBR3fJSjmodyPOG5fbhZsfan8uPSPgg8E4JsdbKjvMbOlIc?=
 =?us-ascii?Q?4/aw7z1SbnPCZ0oT7Yc9LgmTLa2DuiSWYuQNmmXVG/22eph4OG1JHYZFuurp?=
 =?us-ascii?Q?sfGcOLfo2t3Y3y9xgW3NPnnlWxY+YXI1yLv5DzmW6QHEQGKSS17jfxJU37aY?=
 =?us-ascii?Q?b1kgNRPKISHsimaee1HTgfjHCqVY7otdnCrWykQECzFJf40Bqid8EbCHDdzT?=
 =?us-ascii?Q?ZCq1goloACg13U6Kb2L8AgFhyqLXHxMjwKqwTQ5O9h3dfEueedsU5l/A2HFi?=
 =?us-ascii?Q?MwttfcNdP9aD4RF/ofyHrg7emgO/n9PoDLK2fByutH03BuvhJn3nE3e3SWYP?=
 =?us-ascii?Q?mrWCrhoizBT2mft1DF4EmI+iT2rHlQXKyQP6IOWvUOeYC7jUV4BYTgyi8Ge1?=
 =?us-ascii?Q?MjjHI+4ihL3D2/rPStlWE1vQUOmFteE5PP9LgDsl1ELpHvceCWr4Kk8yk503?=
 =?us-ascii?Q?x+KiL2cFi1L5TqA5Lky0nXvHo9wVgnoR6Rg6cf8sANKFMXWrphuci5dtRB4X?=
 =?us-ascii?Q?dr11cRAPF0GQfCWkMIo6HFdpqtfUg+DrXXrpgi36QL6TvgyHgWJIqU3vopNO?=
 =?us-ascii?Q?3kpW2HxC+Xh53IWuTGQ6zgV+6S37IjTR0zDOMwcGKX/UPWM1dlZTL6naG9Wc?=
 =?us-ascii?Q?W9LKSVVO7S4OB4hKd4XpQDQ3+7i6SEbp3N8AXU1+wfvFktSa651d/0BxL2/L?=
 =?us-ascii?Q?npZMTAxy7RkaVS4sYsmXgyd17+c3hb+wxd5Fv13ztl3bQvgpCoDujU85MIjX?=
 =?us-ascii?Q?ew0osX9VUELaCPZbBJRz0aPP6IAx5Fo54jE7ny4VFcpPlRwOl7dxEsj6sdiv?=
 =?us-ascii?Q?77jffzkQMfS0LnCPmsvyVskx9/oGZwT6GIaSUWSXrcfRobdjwdN+DzLccRR9?=
 =?us-ascii?Q?EJog43Gz6kKqD91K1k34Q+weJqweWcJgYTxleMcfwuTVDDumGA9CE+G8vL+V?=
 =?us-ascii?Q?zKu66v6r9RS4tMTToH4ZQZhhK6IAuSp69Ea3kYK/JWAP0vBfRS3DbqAukvH2?=
 =?us-ascii?Q?5l5jfmkkB5ipBwJGRHHMoaIlUpRJPaG/aEJkZq/+KRasV6UvHwufyypRRhOW?=
 =?us-ascii?Q?khYmyaQy+rfQH87bebvH/7snUm0QRr7u00SvfjF20bZssNLSevQaSxPUahvv?=
 =?us-ascii?Q?orwRF+iguOzyHPlzuN8xJ8RpPpZn9goJS2RpiOXFOtVuqNWgLwWXVzdO0k/Z?=
 =?us-ascii?Q?LpAvAq3rRDIEqdePNf4xlAGEkS83pSfZB6wo5AqNpXlCPSFouDBE6miK+47l?=
 =?us-ascii?Q?NbfsVQe0VE7KJtY=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:24:21.8705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a93fd03-11b6-4562-7669-08dd6a9c842b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6575

Enable CIX SoC support at ARM64 defconfig

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1dd46d200401 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1

