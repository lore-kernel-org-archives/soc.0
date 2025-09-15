Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213711E4BE
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953066; cv=fail; b=AynkoFYItCTJDwvTxu3AWvMFbdtT/6lTi218PAc6YWUXMWeaYCrHJSmfQ4p/UyUBq3tM6PF5Nraxfnl37sazM3ChI+G+hd59SoLyd7oaAk4kk4aS+8ZV2IlKhtqASTFnVNHrfctQgcf3QG39x/b6xtelNL36M73hSqQRGMau6DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953066; c=relaxed/simple;
	bh=F8HK9Igilyqn8rGl0o3K9Dyp5mHIYY9p5FHRez7NGQw=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=d+BJQlPRofuMCTFVpQA/J8p0gSkNwwa2hyC4E5FlGP0CNnq7ngmt6Zyni0sH/UwOegxBIY9zezefVN7ahXF/FPgNnD1QHjmeDikCAWxXcyL1s3Y3gFv6tlxezGq4nZYwGm/7wsSDbWBTf///boXb9a9ZXLj+dhCf4YOS6/5QWIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lldr0x03; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lldr0x03"
Received: by smtp.kernel.org (Postfix)
	id BB31EC4CEF1; Mon, 15 Sep 2025 16:17:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CF2BC4CEF7;
	Mon, 15 Sep 2025 16:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3CF2BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FE2E9X006400;
	Mon, 15 Sep 2025 18:17:38 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494yy0yy9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 18:17:37 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDBNM91fPm3mecp1qeXs2eSDatBjey1lr+ze0hdZEmSvQPTYjyop0MYdOjhN5EPjrJjZHKcWDJGbrZ6RvgbnBEpFzQ52fiHDKETOic44OxwmrnLNriEH/Of6RoET+CwFU5HKZRLV9nhCEtxMcyt5nVQSJwfRp+zn2CDD6HH8c2GNLvIjJEvXUP1rjDc/0uxsu2hKUx7QdMrXfuovg9sdV7kiQguxRHIqX6t8f7tQce+ogEh37VB+fmsfslT/vPsbSBiyn5pVMzRvFbw8dyMi2MtXWImUwiwlfBf4gfsBrjWN5u0aFoYOQbll4qwGKssyJP9JIM4cvJaeRSIexkhDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+uQo4AnzMwzsROTEoyJDQq3iCR+wMAqkGdepH0MjMc=;
 b=oUrfdzOLEus1OkDTNiq44CUoHX1FH7HTkEomt/HGkXuHcAM0p0tCxJ14eXgEFFN0KfWAZXaGANpJJ0Zyf6lGITW0ButMNZJTCsPvXelsG10w76wbvDK7yqwPujQO7dDt9A5TUdqkgjM4ImIEyYrXYMybWUw1zCjZRG7+2TJ0Hh6m062LGC3WmW62sWpjLNmowdmOUcBcE1zMFqEI9h3xLhgA683GLEuY9m0ssIJaGFdWXEWQIsxb0dOtu49As7f2SDjeibFVhEzu9fOoWamw6OgdyeRzDGtaIt8JUd/DpkWXTwL1bzrnfZAduzTI5oNVX3hBGogl7319GzqW04xF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+uQo4AnzMwzsROTEoyJDQq3iCR+wMAqkGdepH0MjMc=;
 b=lldr0x03jlOL5zLfRpKz2aZvFcjWrZpV3U6mxgKwhELSF5vdbkcFsMTJE3mxAarND6n0dqi237zbuAvFDcvG27DhJlITJ3RQzRYSz4CuPvjaf/KlAtJMOSIryy8KQhAq/mWcrxcQ2EygU1V5FFxVpd3AvMv/2+AXq90dvdms9wfAewDhQlASqyFuE2NiyOmS/VwpdhDQGbBQA1nDcutPdzIFh2V94R0iJAcv6KoL1UpJiPuQZw4Nxhk0dbgc6TL5gOyNrcJVcO3jCKDameQhGHkyVKMFNad503//uzDP3kgNuSro0Jcl/Wo2O4FB8nCnCKOgJkMK8+4dOGplQnYOOg==
Received: from DU2P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::22)
 by VI1PR10MB3262.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 16:17:30 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::48) by DU2P251CA0009.outlook.office365.com
 (2603:10a6:10:230::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Mon,
 15 Sep 2025 16:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 16:17:28 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 18:15:05 +0200
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 18:17:28 +0200
Message-ID: <13153fc2-1abe-4d53-807a-5d289981a63d@foss.st.com>
Date: Mon, 15 Sep 2025 18:17:27 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.18#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|VI1PR10MB3262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3624f3-7941-4a7b-9633-08ddf4735df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG9hSFNsUVlCZ0VPWEUraGk4MExBS05rMTgyN2xieEpMTUU2SjFTQTgrbThB?=
 =?utf-8?B?T2ZOQmN6OFVLNFdPTjlPQ3RVeXZzRm1SMHhKcUx1eU1VZ0hhN1FDRm5oeFM4?=
 =?utf-8?B?eHZSMGF4S0dVbTZacjlESWY4ODlrRm9uLzlwSXRwLzJxaDdUMXNrQTFnWExa?=
 =?utf-8?B?U09NT2gwdzNoTnBhMHVDVk5McU80VnRpczBlU2RmT3NpMU4yUTN2bFFzWG1D?=
 =?utf-8?B?QmFPNGdoeUJxY2pNUURjTUtvbXU5VFFzRk5Qa3hBTUlnR1ptVG5qT0pkamVT?=
 =?utf-8?B?ZVloMGo3VWRnV1J6WWc2ZGZDanB4UGdqSE1YTmdiN1ZsK3FuMHJSY1dPYjc1?=
 =?utf-8?B?WEwwZGpGdWpaQ09xa3hxNmcrVnJNZXRGZE5vQXBBYnV0SVR2cE1adWlSM1RO?=
 =?utf-8?B?VE1COXlyRUwwNzh1OWszRmF1ekdxNFg5a0dIYU1kMHVSbitmZ0cxVnlnRzIy?=
 =?utf-8?B?QjU0K0Q5S285NjlLWW9zWHBneURic0duQ2dKOTUwYjBSS0pWVFdPZUNkQVMx?=
 =?utf-8?B?cnovZzFnQmFySXJUOHpWRitlS0NoYWFsQksyaG5OM0NuWHhzeDE1QUozeXpJ?=
 =?utf-8?B?UWlZUTRUd08xb0JLRW13NXE2UU1KelQ2N253U2d5UHovZW9xRkxSeWhEYnpq?=
 =?utf-8?B?aEhQNm9DeFgrd0xFNE5YUkRad0hmNnUrWUpBV3J2SE0yNTllRkpkRVhDUTN0?=
 =?utf-8?B?YTJYYWswSGdocWprV3o5MjA5NnI5akhmL2lKMmVHN1JPRXF0Q21JbXA1VzRC?=
 =?utf-8?B?VzhaZEEzd3dRK3I0SVFOc1NxT3FHR21TdCtQcW8vTUpsbXpTMFE4eUtqbUZo?=
 =?utf-8?B?UUptNlJORktHdE9NNmF1L2wwRklGeEh0QUpiNU11S1A2V3F0ZDJ6M0JTTUh1?=
 =?utf-8?B?Y3N4NHFUZ2RNc2pnb3F5UXlpdDVBTHkwMkFoY1FIQ2xvbXo3aUhpVVZtcmE1?=
 =?utf-8?B?OUV0OHdCdmhNREhmZHp3OXlmK1k4Sno4aFYyV3VDSlNoUm9YVGdSNXRRbno0?=
 =?utf-8?B?UTA2VkE2QWhPaFBpUkwyNVoxb2hiNEQ0L3hEN1ZHZEVINXFWdUt1Y2VmNUNL?=
 =?utf-8?B?cHk0TEVnZElzTnhoNFBMNTlKQ2lGZFdzYXpHSnFKZmJCa0VRRGVLZTI3aGRH?=
 =?utf-8?B?Mm9Fd09oQTNvakd4czJLM2dtOFUyTG5yRmNpMzg5QVJiZHdNRWc3V3NKZ1dT?=
 =?utf-8?B?ekRjUHNaU1VKRmpyWFZuYzZqbDFyTjM0UEdEcytUWTlubzRUU1lXYkl3OUFu?=
 =?utf-8?B?NmFNcnpYOStwUHVXQVJublZ2RzdLV1VpT29yMHhucUFlbDdjNURlOGFSKzky?=
 =?utf-8?B?K1ZhUktXWnpGRFcrTGc4d0RuaXhNekticnBkMUR3a2QvRVZycnMvVnk1a3Ft?=
 =?utf-8?B?bG9yUlkwRTAvc0xDV2ZhbUladVJZOXRlTnJXeUMrY3VzYmFPWkdtbGhDODdD?=
 =?utf-8?B?MXJReElDa2JVNEJ4dTBJUUF2eUZ4SlBxcG9xTE1WOTBBY2V5cWwyT0xiM2JT?=
 =?utf-8?B?RXQ4R1BBcXNvNDhTSG5TSDg5bVlxSTcvVjJ6V0JqVDFEU1RIQjA0ZmRRZVlS?=
 =?utf-8?B?bjBZY3FTb1ltdnpwUGxoaVJ5Nm5CbjRJTzJwbm9ucWkxVHRlYkg0TFEyMC9Q?=
 =?utf-8?B?NDFPVkJFTzVLWWpKSTQ5VEhoMjBsM3lNSHlQWGYzVWNPY2hLTUkvczcyY2tB?=
 =?utf-8?B?TGJqdldUSzF5Tlcwakc3VTR3NXRNaURJc3o3aWxjVmdpaFk5QldCRDNkTTBh?=
 =?utf-8?B?b0tKSmZzTTNLb2VDRXFQRnFKMXdMYnhMd0pTeXVJamJQbkVjMXVETWxjS0Rl?=
 =?utf-8?B?dDY0MThGVldUamtiUFRDc3Eybzl6eFQ5L1dJcWtSdkt0NlBZUUFNTUJiRUZB?=
 =?utf-8?B?Q2FVaWRHem4xR1NZdCtWQzIyQnV4UlNtampqTGpGT3pPVjJjeGhRRUt4VGdJ?=
 =?utf-8?B?dm1acmh6USt0NDRKSWFaSnpEMDUwUVIxZUczS0RIZjRSdGt6emZzMWtCVmM2?=
 =?utf-8?B?N29YZllsTk1EREFTUDcrSG5sdHZTVDgwZWxQRXd6MVNlQlU3Y0pkZ09HWDJj?=
 =?utf-8?Q?ggytG9?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 16:17:28.9859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3624f3-7941-4a7b-9633-08ddf4735df3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3262
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMyBTYWx0ZWRfX/r2B//GXnvbl bShiCKpf/LrcoCqgYsgpmv1NMDIaeslr8gbrwy4jYkkNiSauiE+FFjTjy6+0IMX4MSloB8R2tVe w8oegh/QU+LQcDSa03IDtrDv58Fmky021NbZcB1hP7csYj0Ztl29jqu3c3wojum/13S2xEPpQwP
 5SyU9fxT/hPh/i9HeKsM6VuOP1o+pEEbnKpYoLwHg3vurNStwyjbj7dAQbEuv1USyM86x75IWFS wVtQWqlMpymDJPSV0p04BlU5FkCNhuDDgvrmecla3ouPl9pEOVSaLj55PiH2atVTZZbGeBDPLGY 1SV7kxFnUvnJqjlKvw89edtSg+pVfhssIAH/NUOKH+pudI7ik7fKacGQVKUSsdiQBEtqM92tGNF 0rQS4qCD
X-Proofpoint-ORIG-GUID: _ugINwPTdXrZFaQ6hsrqtYq3_tBAqTGv
X-Proofpoint-GUID: _ugINwPTdXrZFaQ6hsrqtYq3_tBAqTGv
X-Authority-Analysis: v=2.4 cv=X+9SKHTe c=1 sm=1 tr=0 ts=68c83c21 cx=c_pps a=QfNz7WxyfdFdmo+E+Fz36w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8 a=_aLy0x8VAUbdkObL9E4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130023

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.18 cycle. 
This PR contains mainly the add of STM32MP25 feature like Ethernet, 
PCIe, Display.

I added a config patch inside.

Thanks
Alex

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.18-1

for you to fetch changes up to 53c18dc078bb6d9e9dfe2cc0671ab78588c44723:

   arm64: dts: st: fix memory region size on stm32mp235f-dk (2025-09-15 
17:51:32 +0200)

----------------------------------------------------------------
STM32 DT for v6.18, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Add missing Ethernet1/2 PTP reference clocks.
     - Add Hardware debug port (HDP).

   - STMP32MP15:
     - Add resets property to m_can nodes.
     - Add Hardware debug port (HDP) and enable it on stm32mp157c-dk2
       board.
     - Reserve leds for CM4 on stm32mp15xx-ed1 and stm32mp15xx-dkx.
     - stm32mp151c-plyaqm:
         Use correct dai-format property.

   - STM32MP23:
     - Add Ethernet1 MAC controller on stm32mp235f-dk board:
       It is connected to a RTL8211F-CG phy through RGMII.
     - Fix GPIO bank definition & memory size (DDR).

   - STM32MP25:
     - Add Ethernet1 MAC controller on stm32mp257f-dk board.
       It is connected to a RTL8211F-CG phy through RGMII.
     - Add Ethernet1 MAC controller on stm32mp257f-ev1 board.
       It is connected to a RTL8211F-CG phy through RGMII.
     - Add display support by enabling the following IPs on
       stm32mp257f-ev1:
       * LTDC
       * LVDS
       * WSVGA LVDS panel (1024x600)
       * Panel LVDS backlight as GPIO backlight
       * ILI2511 i2c touchscreen
     - Add PCIe Root complex and Endpoint support on stm32mp257f-ev1.
       Root complex mode is used by default.

----------------------------------------------------------------
Amelie Delaunay (2):
       arm64: dts: st: remove gpioj and gpiok banks from stm32mp231
       arm64: dts: st: fix memory region size on stm32mp235f-dk

Antonio Borneo (2):
       ARM: dts: stm32: Add pinmux for CM4 leds pins
       ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and 
stm32mp15xx-dkx

Christian Bruel (4):
       arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
       arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
       arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
       arm64: dts: st: Enable PCIe on the stm32mp257f-ev1 board

Clément Le Goffic (5):
       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
       arm64: dts: st: add Hardware debug port (HDP) on stm32mp25
       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP 
pinctrl node
       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 
board

Gatien Chevallier (5):
       ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs
       arm64: dts: st: add eth1 pins for stm32mp2x platforms
       arm64: dts: st: enable ethernet1 controller on stm32mp257f-dk
       arm64: dts: st: enable ethernet1 controller on stm32mp257f-ev1
       arm64: dts: st: enable ethernet1 controller on stm32mp235f-dk

Jihed Chaibi (1):
       ARM: dts: stm32: stm32mp151c-plyaqm: Use correct dai-format property

Krzysztof Kozlowski (3):
       ARM: dts: stm32: Minor whitespace cleanup
       arm64: dts: stm32: Minor whitespace cleanup
       ARM: dts: stm32: Drop redundant status=okay

Marc Kleine-Budde (2):
       dt-binding: can: m_can: add optional resets property
       ARM: dts: stm32: add resets property to m_can nodes in the stm32mp153

Patrice Chotard (1):
       arm64: defconfig: Enable STMicroelectronics STM32 DMA3 support

Raphael Gallais-Pou (5):
       arm64: dts: st: add ltdc support on stm32mp251
       arm64: dts: st: add ltdc support on stm32mp255
       arm64: dts: st: add lvds support on stm32mp255
       arm64: dts: st: add clock-cells to syscfg node on stm32mp251
       arm64: dts: st: enable display support on stm32mp257f-ev1 board

  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml |   3 +++
  arch/arm/boot/dts/st/stm32mp131.dtsi                       |   9 +++++++++
  arch/arm/boot/dts/st/stm32mp133.dtsi                       |   2 ++
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi                |  39 
+++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi                       |   7 +++++++
  arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts                |   4 ++--
  arch/arm/boot/dts/st/stm32mp153.dtsi                       |   2 ++
  arch/arm/boot/dts/st/stm32mp157c-dk2.dts                   |   8 ++++++--
  arch/arm/boot/dts/st/stm32mp157c-ed1.dts                   |   2 ++
  arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts         |   2 +-
  arch/arm/boot/dts/st/stm32mp157f-dk2.dts                   |   2 --
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi              |   2 +-
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi          |   1 -
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi           |   3 ---
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi            |   2 --
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                  |   2 ++
  arch/arm64/boot/dts/st/stm32mp231.dtsi                     |  22 
----------------------
  arch/arm64/boot/dts/st/stm32mp235f-dk.dts                  |  25 
++++++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi              | 146 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                     |  85 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp255.dtsi                     |  18 
++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-dk.dts                  |  23 
+++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts                 | 125 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
  arch/arm64/configs/defconfig                               |   1 +
  24 files changed, 496 insertions(+), 39 deletions(-)
