Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAC191F75
	for <soc@lists.linux.dev>; Mon, 24 Mar 2025 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797469; cv=fail; b=eoskBZ2hkp7LBRWdV6vsN4uUY6+K61JsSYfVkftSM1dra9M8Cdl3CZjg12ndqoI/zsVu19zQ10M/6YJVNF7/Z2H4Sp1RnwYHI5ufqKyqfJ7VBJpY+0Olmj95RZMp2H4UdxRcdngz6ysXrArF79Hr0PmcLsqWgwfeRyi0FSDTPOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797469; c=relaxed/simple;
	bh=xq49y8daz4qabydrwkR09VZd87V3XODdM8/aisp+9+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b70M02YBiedtz7WTmadcppczSStePyByk9e7xLYALP0g7YL/Mj2neVzvIr3Wr2zLOYNhwPreKsuqlnh137+ferVFXB6j+SVzMreaZJAHWh7+ezzm/EukPKEp3raq74CezKZvcszon2ZyrqVIrcK7nMMI3se0rtJ7/ZyKM6qLqLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 30CBBC4CEEA; Mon, 24 Mar 2025 06:24:29 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2110.outbound.protection.outlook.com [40.107.255.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C198C4CEED;
	Mon, 24 Mar 2025 06:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C198C4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDPigH9+b9b+hApBt27OYwMuJpdAoOdsLuuIhsVB6ZLS/f3eyHKkchM1bYIn4o+t8EsOOOp4DycXKlIlh2UjZVz/t/we/OO8M4OguO5KFBgvDDv+ziU+hlcI5Ye28JQMjjeL4HHh9R9qIuv7CQgzkiMPxlcqKKosNfLXTQxxU8oK+iSwrd9RFxtkISW0OrXtRLSrakKA/wB2/4Z0epQ/XhF2cGWKPGjgo+3wNBNs8LDO+9AVQpiA6TewKIiBUZk0UjaNiaYvZhk7Zf6ZDI2182fnYBhPWv76BgaC662R8/ZbAygY9uPGLCdnSChLHuhD/letj/s+oYjLNToYzUl5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsfvPe3VZW33TbQDwrtBE1kdZUvzUA88lRqr9T9UNvg=;
 b=OM7RpisWdxbbjYpk8F4Y4E3FIdYDf7jirTlvUTRzyAtiqzUGI+iQmRI9pzzMPEZChsz72eNYmitXxOfCgS+ECrPmPQJtPtffpS6d7ffZSGyKZFEPmNxpwpE62P423eliVP81pawVgFem2Q7dkclrfS98Nv1+fEbcFJAGVCJfogg6UbO7ULJy1Vdu+kAXia2OXLo8BVADd6Sk32XPjBA2b1aSxr6Gn626ZIcF/Lg5Jw0TBglXVsLcsjJNH7Ar4CuCgX8VKyC4SBP/8yE/Bf09yAiKMkyLQKy/B+SRkhBGeUKSD3ZQqkP9dMxPsB1btD25xU52STaqfm2BptlvO/Blcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::14) by
 TYZPR06MB6282.apcprd06.prod.outlook.com (2603:1096:400:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:24:24 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::77) by SI2P153CA0011.outlook.office365.com
 (2603:1096:4:140::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.7 via Frontend Transport; Mon,
 24 Mar 2025 06:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 24 Mar 2025 06:24:23 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 02AE24160CA8;
	Mon, 24 Mar 2025 14:24:21 +0800 (CST)
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
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v5 6/6] MAINTAINERS: Add CIX SoC maintainer entry
Date: Mon, 24 Mar 2025 14:24:20 +0800
Message-Id: <20250324062420.360289-7-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TYZPR06MB6282:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db6cf92a-ed8b-42fa-2241-08dd6a9c852f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A/zKM1vDDgxeMXfz3z5DGzaKj5oHMcx3Lx0PGIDi/7sJzqRa/YfyfSKA1sik?=
 =?us-ascii?Q?I0Kz/b9yfl5WweAVUgvZHSVtlZbcMnU6cRdo8JSkq1pV+m3d0kQj1++hUMI7?=
 =?us-ascii?Q?GHkKjunWzRrg6OQAdRJ/aHNytHo/J9cZBzvRwhntMwkaBdcEkv8IwPQSx03Y?=
 =?us-ascii?Q?87Z26ENyNysRMP5kfHt6plD0haghbHbi7UE7pvlQA5L/FUOFtANzlPDTmfFp?=
 =?us-ascii?Q?R8JmwogzbqdWYo9hk5aXlT1+bEB4tujYvSnRCDFGs0ayFyWx1Phfi3ZLXO+G?=
 =?us-ascii?Q?v9nA8n/aUsVhr6DBS3mvFKltLjwIV9zJsrgKFjfy4WEVSu/31MrMb7QQDtaD?=
 =?us-ascii?Q?7ABVCMnatHAT6ajOlqKgDnTjsjR/5kcEwjdUK3sAV8lOuZdUAwluuMvXK1zg?=
 =?us-ascii?Q?svPpjW6/16u50ajvkrySowHUYydyUEYjCAJrsrUQE2b6vY5+ta3C3biYvSId?=
 =?us-ascii?Q?1n72UkSK5sJ5M3UDbvNiyyutZXhSzi75PcAxLFG3fmDJI89uhzAcjXGqlHzL?=
 =?us-ascii?Q?BqkH0bdC9UCfnN7Yv048JgUaTVRzev51UATX08B1136prO9OlhjGLC1FlN0O?=
 =?us-ascii?Q?dtIm/T5AYgxZ82FUFqizdiXBR7AriRVarrPzeltPJNpybCBokJY2sdbH5Ht9?=
 =?us-ascii?Q?JjW9BUjIyoUiavfNz5qusvBYY1wqjumMJYwctJZ+NWcq8o9QSKjoSJOsQ2Bc?=
 =?us-ascii?Q?++bAce4gMtqplduQXqLqgJ6J7JLQOniou6ffIifu0iW93SRoWcbtVSeyZZsC?=
 =?us-ascii?Q?tBrcaEZqcnJRNppYuB4WVoHIwpWbRIpYdd6JtPIbPNmgobMH5FQ8ooZKa9LM?=
 =?us-ascii?Q?xjALuhKvL68h6pi9G3i4/nJ/cXT9DbNqcgFak4hSoHzn9D4V+avmpM5wqWIM?=
 =?us-ascii?Q?hofL7/2s+vNg4efuFGe4FE4/OWix1oZWXMUml99bS4Qdqq3y1GSPdkHsgdK/?=
 =?us-ascii?Q?niGPk6q+XVqdejVLtUg4rex3lwWcpfwJK6ZQ5rtQjstlx5phLhdQkryoYBX/?=
 =?us-ascii?Q?7QpuI+dw7r3fuftumQ+ujxROD5WTWG9CVo1MFO+g4cSS9ZcRBcWTeltv0Fwy?=
 =?us-ascii?Q?WvNUgaRRoOD8PRZ9+4lvhlOA7Ea0rCzBjE9y+IRFNqUbXzNX1K72veP8oXGU?=
 =?us-ascii?Q?D1xaqMjY6XitjA71oxdBhxyvQvJGylhkLaPGDrsrlWf8VD/2Vz3g5QHY7dOi?=
 =?us-ascii?Q?8UccON5pCtb7VhZlL4tjw8rPLPsPI6GB1u3Zqmo9Vc4NXufuyIwaM5xexc5g?=
 =?us-ascii?Q?MnWIIStNL/sIFB9hSOh0nFg2QbowQB988p0ZmqBWgQReXLCQRcBte9XV0hFJ?=
 =?us-ascii?Q?AhbdasQPPlk/2ptuF45I/xNygFsiNx3L3ePO76pFQpKi7BXM4wpmZTJZa4aZ?=
 =?us-ascii?Q?tOpkuyF9nqZwDQ4Z4aByDjj59Hodb0gT34F1b7NbHpCwmvj3A9XxrOMgJiiP?=
 =?us-ascii?Q?MOoKL6W+H4L+QGsd3f3W00qyApyJWTU5Yb8o4oki8NctrXqEO/PKernQX6Vy?=
 =?us-ascii?Q?8mXuxZvwvZqd0kY=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:24:23.6348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db6cf92a-ed8b-42fa-2241-08dd6a9c852f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6282

Using this entry as the maintainers information for CIX SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v5:
- Refine MAINTAINERS for all CIX SoC
- Add T for code tree location
- Add K for Content regex

Changes for v4:
- Add two dts files as maintained files

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..f400e2de573b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2354,6 +2354,17 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SOC SUPPORT
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+F:	arch/arm64/boot/dts/cix/
+K:	\bcix\b
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1

