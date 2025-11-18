Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0999D286416
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454909; cv=fail; b=Z+IcliezwD9nf02E6ZghSGln0+voVXMJpGsIu5r1wStER46W0TbMQYWMOcRYUbNBLjUIuhegOoYmBOApVYBRS9tRxU850U1hGNBEYJA0nxpXC4FD4EqW3SAndPxUb+yk0Ea22RTm224kDQJm5c3WRCvuRd41VK4OHBbldqJh+TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454909; c=relaxed/simple;
	bh=P9y1AsSBxGUnVEXKo7RcsEdKG2ugkoUpMBLWXcaPWxw=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=HcOP90bvWKrncPJQcXFPnAcyrGZcskSaSeSIjF6U3/E7Dsho6YIGAlSFaGIsLOac/BtkI60wgiCksyE2tq0RgxotlRnCMREsuozW0Dw2/uQoNYfAhIRNS5rz08H4bOJiHcLVRkuyJUFNgmiJ0+0EuuOrBL0Nj8t+S/PUe+XsXw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=C8iweGuW; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="C8iweGuW"
Received: by smtp.kernel.org (Postfix)
	id 9E867C2BCB2; Tue, 18 Nov 2025 08:35:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7B40C4CEFB;
	Tue, 18 Nov 2025 08:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7B40C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8Ur0A3446146;
	Tue, 18 Nov 2025 09:34:50 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aggb8h83m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 09:34:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhgIOY9V4GULcJWGqRCD5g68HZkhd3e5z9Q1iqTFZt1wa8wAmOMYdI2redc3CIXZ5C1AlzKWvi/jPlfX32Q1i+6w8gE/f9E5/cZCkeYtqX96YfRO9+kLwZaGrEpiTSlHyGMds+xpsYaK8vaOrEoGCXQ3mjYdZN+9P8YptvQp15v20niqNCKI6Z1QpJUCCud6fu3CMIsvZc2yRenJaYeXa5F7KScgsbYW5IGSCBb2zxBXRMiCcLqs//9Aa3y1kZvuKYB6MQjVvh6JwYlomES1pf7sdORm1jnTtcHS7Kf0dJeTH3UDM+wwCW5TdVbEZEBZcsoeRBw7OIdq21rIhNlszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp/ZIR2HSQmCN9KqpNBtDQTuhmqSfEh4nJ9VEz4JuJ0=;
 b=q727ZE/grhO2jrhP9i17ZdNaepcB6TXOU3qkL+ji3/djQsy5H1Pw/C964hA6A4Yj6QDhUceOW05co79scFaR+9AL9YEMEcPH3zu5IGsOxdv1+Jy8SUwKro+BhFg649D3iK8IvOIVYAzYxgLXzhUOC7CBcV5p2+Y+7y8Pira35EXdUuf+B6b0QbQV8LgJd9IOyTc21CiXyCtQ9nyhPPKyWOX3N+aE9b2XxGy4cQb9C9t26Nm0Cc/2VlUe3nyiA5JXveMI0kt2HMqaaUy/1Kdo7s0reidoYyDFJJw3hm/QZiAKxCZ5AGSGIbtUewnR7yH2TcZ0+IVC7wqKMudE8yovQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp/ZIR2HSQmCN9KqpNBtDQTuhmqSfEh4nJ9VEz4JuJ0=;
 b=C8iweGuWjEEuQDeQDBtnD88gmu2uneH5daYTTzb3h1qROdHuZrI/0Te0FAPlZTv7duXgvck8/6pYI+0BvhdMKxU3lgj4vwdkIYj2uNo6WNOUNCV0TQVxjgrjqL+0jDbuXD0jO9ZM6bQJsik8gdMJHq9G2jiLdbJhumevJ2DId9yQHt5lCSyjLAALcNyCstRPsVOQF0v+3iPed5k3K/BKSfHMu1+w6vUsJRJQZ+SHCzh23yerrnVHunyiNBNyBiiHARWnWLj1pmTPG8KCseEXd4DqrtiaSkmY2R+BcImZApGnltiAw4i25yyO2rS7WhbnDv7xCT4j+LeHeM6V1ZkBKQ==
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by DBAPR10MB4025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 08:34:49 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::b3) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Tue,
 18 Nov 2025 08:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 08:34:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 09:35:02 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 09:34:48 +0100
Message-ID: <e5a44767-d50f-44c1-9c74-1eb9c539cc50@foss.st.com>
Date: Tue, 18 Nov 2025 09:34:47 +0100
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
Subject: [GIT PULL] STM32 DT changes for v6.19#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DBAPR10MB4025:EE_
X-MS-Office365-Filtering-Correlation-Id: 714c1d8c-2067-45b0-5d97-08de267d562d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFQzM25ORHVJa0FWaGlDbXB6STVKM3NYeVVhTDVVaC9tTitXZkIzQXdSRXJm?=
 =?utf-8?B?NjU1UzRFS2lRemlUdGV6RnVuZlpML052OGZHNThyK2tSakRsK3JMaXRXRzVr?=
 =?utf-8?B?RVo0bWtRcjhMUE12VUdCcUZpSkpzdFlWWVJmQWJNMUFLNUtlVTQ2M2JlT2Vi?=
 =?utf-8?B?WDN3Q0R2WUxkaDhGVnc5S0RXT0g5ZFRWMm8yN3lpMzd0RmN2OU1uZThxblpi?=
 =?utf-8?B?TWVVV2I4dEQvQmZBNXh5Z1hXdHh2a3hURy9INkJmMU1YY1FkbFdrek93cG5V?=
 =?utf-8?B?TE9aMWVUVkRIdDE4aHM3YVJTM05uWUhXMzRtNHhQeThmR2ozNkFtRFlJZG9z?=
 =?utf-8?B?cFJsSTlrK21ORStpb21VM1lkbmx2RHBrQ3ovOG5OYmpsL2dJVUprTE8rTjg0?=
 =?utf-8?B?aXJpR0dQRVdQRkQrcDRYQTZ2SFp2NG5IdWt0RkgzR3lvaTByNHRuUzhhVkJq?=
 =?utf-8?B?MWtVdk9CVTVSS1crdWhCYjVpdk8yRDVkODhLenM4R1dBN3prMzloSXhjUHNW?=
 =?utf-8?B?dURBcTZZQ1lvQ2YxK0F0OUs2WUQydVNBaThyY3lkR1FMQXlsQU9aY0pVRFE3?=
 =?utf-8?B?SmhyQnc5UHhwY0tLNGdBc0lVcnhZTDNKeWt4ZkRwTzc4c1dEZlZmZEVIcXJO?=
 =?utf-8?B?d0J0Q1Mwd05SQWZNQ3VhdnFHUUdtK2dBakJKT1MrQjEzMGV6dVJtZnVxMHV6?=
 =?utf-8?B?NHlYdUFpM2FlU1JMNExOUk9mQjZXcmREbDFORy9YQmIwMmU0dVdVbkxTRVJT?=
 =?utf-8?B?QVFSQjBKZzErcWQwT0tqTTJOZS9HdTRic0dTcXQyUitvdkhybkxQMmhBTG5Y?=
 =?utf-8?B?MjdTdzhwdXZsTXlCMTJPR0UzTGsyL01SNHo1VTY0M1BiT1pJYWxpc01PdXla?=
 =?utf-8?B?TzVLQkQyanFpRk9heDFEdGJaTFFTZFdLODBEQW5FdEQwbVNHM2pvU3BXaFly?=
 =?utf-8?B?SkRsRXNHaTBwLy8xenJZZnlwSEwwR24rVDRKcFB5ZTVPSEZrbUxEb1RtM2p4?=
 =?utf-8?B?YkljWnNnSmVHaGxnMWZTanVnb0g3eVhJaFNuNUdRaG1SaE04MkhXRGUyd3RS?=
 =?utf-8?B?V1ByU3NYTWlKUThRNENpU0FXNi9CeCtaUFd6Q2tVbFJEVXVBa21keWFIWFRp?=
 =?utf-8?B?b0o0NGRJWEtlVW4xWkV4QnlBNDVrVTBzL25EQUllc2x4UVRrZnVySTFka2F0?=
 =?utf-8?B?QXVsYWd6Mm56QVUwOVNCK05naUJzZjQvRWE3SE5rc2p4OW5Sc1AxajZrdjJV?=
 =?utf-8?B?aTJ1SjRhNmZFNlE2bmlwMVd0Y0MvUjFJY3JiMDhLRHBJeXBvUGZ0RzFVbGxp?=
 =?utf-8?B?NE1EaGMvOEZLT01nWmRwQVI5dFlaSnczWHFmdkxXQmI2NlNiMnBMbDJqazlJ?=
 =?utf-8?B?dzhqSGFyL0MxN0todFJTckxhUktmNGxBRnBpVmpNcFQwbW84OWc2VkpkTVJh?=
 =?utf-8?B?dHRLS0xlWHBaNVltZWFBTDFTdEdISVZzNlBWSGhWdmxVb1JXd1ZrQkFraXV1?=
 =?utf-8?B?RTloT282TUJsZjc2UFJtbDFzdVRKYTdXaGtUY3ZqNVhZT2FlRUp4U1VZc25j?=
 =?utf-8?B?Yzd2cG9lM1lta0FMdHJVZWtlMVlESU1LcGtXN3pRZWlrV3pudVJHamI2bjlo?=
 =?utf-8?B?ZTdtcnFyWGdUN0dZT1hTSDZVNXZUZ1Q1VytEMlV3WlY4R2MzekxKWitsMGo0?=
 =?utf-8?B?NVlIS1psa2VXVXZaVXhReC9ZZ1VVeFRHQllnYWRiSXZUQW9kZ2RQRDF2YmtP?=
 =?utf-8?B?RnhuR1VNT1B5NkJwUmgxdUs2OHpxL0s0UjlScU9tQmZUSHZvNlFZWWo5cGZC?=
 =?utf-8?B?YTFmTHhQam15SlI1NkJJWHRsUG5CYVR3OXhWMUlFcEJ6b0hsSTZYZEo1b2pE?=
 =?utf-8?B?c1RJc1hPRm1DV1g5bXp2c0dKbmJQTXhqQk9ZODlFTG9ycmU4VUl4TDNFR0s4?=
 =?utf-8?B?cjdrYW0rMHBhNlVIemd5ZDRUWFdVZ2RtaFFucFRCNDNXbjF1NU9JdE12Ukdo?=
 =?utf-8?B?Q3ZibUhOb3liM3BCN0JrTGxRT2Z6WVJjY2lvWlJ5RDZsYTI0R3ozdVc2ZlEw?=
 =?utf-8?B?MytZM09oa1JheEl0UW5vaDE0V3BjOEQ5MkJZbEtBcVJPMlRBMkU0WDBpTWhJ?=
 =?utf-8?Q?utg0=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:34:49.0721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 714c1d8c-2067-45b0-5d97-08de267d562d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4025
X-Proofpoint-GUID: oTHT6qD7eN-nOvSGDLJp7IRkWjYp9vAG
X-Authority-Analysis: v=2.4 cv=Q/nfIo2a c=1 sm=1 tr=0 ts=691c2faa cx=c_pps
 a=TGtHJSg9jqUEU2jNioFT0w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=HGBSIf_C_jmVvUwVXRYA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: oTHT6qD7eN-nOvSGDLJp7IRkWjYp9vAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2NyBTYWx0ZWRfX85e7J7Ev35IJ
 ipAgtWAQ07KQMovdYZ8DjEOa0kbbk07yTV3HH2Kw3wEVOAava9DFYFcCRCoGPEym0/40qUVqpa9
 Fhp97ci2hGtCnXxiYCF1a3nYD/H4XrJ7qwyMhZWRwU0KCZgDdAdB0GgutU0IIiLc6Bve9m/5E4Y
 w1I1Cb6dtQTKUCt+Wzesqhco6oXZLynshMLo33y+ZJ+6hP1kg4/MNcrMqW5Q9mG/mSsQ+hSBIoI
 1V/TaZ9N8c2oWgYBUevPvUY5UhtqRkBodilXhORrEkMkhNyA8wwda+3M72L/+cKeu7SCjCVXnv6
 0/ecFPp7kDPagfN2YhqlkcOjKUHqbab3EzxF76cXPqd05AfdWo3oJzizusI/7okvXGB24YBIAqG
 6NCq/e+YxUoqutpbPMj8MI+5StO7GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180067

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.19 cycle.

Thanks
Alex

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.19-1

for you to fetch changes up to a6961e2ced5190c68acd78a7e372de07f565fcd6:

   arm64: dts: st: set RIFSC as an access controller on stm32mp21x 
platforms (2025-11-14 09:48:40 +0100)

----------------------------------------------------------------
STM32 DT for v6.19, round 1

Highlights:
-----------

- MPU:
   - STM32MP13:
     - Add and enable the ARM SMC watchdog to use IWDG1 in the secure
       world.

   - STMP32MP15:
     - Phytec SOM: Fix STMPE811 touchscreen
     - LXA: drop unnecessary vusb_d/a-supply as already defined by
            "phy-supply" and "vdda1v8-supply".

   - STM32MP23:
     - Use the RIFSC as an access controler (firewall) as it is done
       for STM32MP25 and STM32MP23.

   - STM32MP25:
     - Add OSPI memory region name.
     - Add I/O synchronization properties to satisfy RGMII
       specification.

----------------------------------------------------------------
Ahmad Fatoum (1):
       ARM: dts: stm32: lxa: drop unnecessary vusb_d/a-supply

Antonio Borneo (1):
       arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi

Gatien Chevallier (5):
       ARM: dts: stm32: add iwdg1 node in stm32mp131.dtsi
       ARM: dts: stm32: add the ARM SMC watchdog in stm32mp131.dtsi
       ARM: dts: stm32: enable the ARM SMC watchdog node in stm32mp135f-dk
       ARM: dts: stm32: add the IWDG2 interrupt line in stm32mp131.dtsi
       arm64: dts: st: set RIFSC as an access controller on stm32mp21x 
platforms

Jihed Chaibi (1):
       ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen 
node properties

Patrice Chotard (1):
       arm64: dts: st: Add memory-region-names property for stm32mp257f-ev1

  arch/arm/boot/dts/st/stm32mp131.dtsi                        | 17 
+++++++++++++++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                     |  5 +++++
  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi         |  3 ---
  arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi |  8 ++++----
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi               |  3 ---
  arch/arm64/boot/dts/st/stm32mp211.dtsi                      |  4 +++-
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi               |  4 ++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts                  |  1 +
  8 files changed, 34 insertions(+), 11 deletions(-)
