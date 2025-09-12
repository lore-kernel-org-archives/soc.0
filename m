Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0E5220F5E
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691303; cv=fail; b=dIu6EOIiM15qG9xAmku6dXh5nHTt9e6BkG80SWlzpKVE4NdW7OEG3PWJZS8FBTCOREgmz+f+tk3URVxdiPG+GkLJ8XZ+JYC/Fc/5Hl0uQtOhYLUl89lh+LfjHVv+eVDYOBEZCHM+mohC8nt60m/zGBSx+jlZvVgM/GAfoXye//U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691303; c=relaxed/simple;
	bh=5XpftaRsrSp/MOf+oJ8l92//XKq1WFa9w+LAComAxBA=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=QU9rhc21RXTq6/4L28T5HU7YNs0f9yYM11QIJrKL4ZQXUKfI2O1eEnMLUodS0+9589VT8diS40w+ljYo5i0NlHDnyv/JfglECcvuYslD3G6Cam3CUpbmN4uH4xfg8QAmtSosVnWJw+sJZwB1zJvm6KG+TRyAGN8StPS4XJHU51Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BHyAIhmz; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BHyAIhmz"
Received: by smtp.kernel.org (Postfix)
	id 71D4CC4CEFA; Fri, 12 Sep 2025 15:35:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B9AC4CEF9;
	Fri, 12 Sep 2025 15:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23B9AC4CEF9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFJhUK006542;
	Fri, 12 Sep 2025 17:34:53 +0200
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9s5qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 17:34:53 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C05curUS4SSLxY4FM2TK7OTKIUGmA+cvhwf/H1voNPJEUUC8Xf+IAiieuZyzUh1rJ+mc1ejoUl1LxgAxhm99NbgbwhGuiwBzqUxCGFZgGxzObToNJd6ycfV40THcQE9FWw4TlUvxaSLu7v0cuFBLQHSsrBVVVZxy03kC+vNWbPFuQk0gZ8OnTFphzq6Q7m21Xc6xuYXr/ndr9PzsUoPflr1Z7xAv2Yg1USbRkmBF3HYNYhvBNUL7uFI5Istd3gwmY+VcwlgRj+ZjSEZOGEKP+lSY20odpSsF/PJ15B/Sr+hzcnYbyJA+5YI4Vt9XaC+hMBBXo9B1+77l1W0MHaOYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j69GULavOUnzd0cHgDLrtAtu8joLG2u4o70GPxD42ww=;
 b=jmYaw9d9awWtHHQGA+KyyzesrIlRwh9qIkfM2q75ekdEdiQOP4thB2MI/hStUGbRYtUX434+5/dXpCffbIl1h3HnARylYL8/N8ninGcJsNDEevSAwRRsPfC6Mh3uRAyXaXnR9Eo747nAGPUl8OgeKeZ+QD9heKAvw17+XUah2jJEAooy0mm0okhGNJzMNJwCD9/LTOgiRuwKv+gXc6yUuFMTCBB3MkyZgzS9SbohK3umqNPD8ST1pfKfPaWS+PyUOyuNirTPhsfOLo7VieipEFIDhGsX0FUkVkguQQWk5Dj+FVjJQoFW8hNBnVmY8aDIZ3GQ4pzwfzE6HBoFQAqSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j69GULavOUnzd0cHgDLrtAtu8joLG2u4o70GPxD42ww=;
 b=BHyAIhmz43HPWteijVF+i2O3NYYwSevh96kNIpd+WyUTQ08OJ/NBneyravb4EehXHpK3F3NUCbkXLYW+qNOsfLfYFSKTTHfa9jWHK05uC9dC10AnFYHqG3BgFalgvNNQh06prXBEdhJDdqNBMPfWUQweEgXeUTjFWUfkccu5t/erE3ggwsklHoGnJ1VZETJPs6as2Su5DI7awuYgWg7WkSTdsnekAo6Vzheqimq0D98ZgmH/Oo2JKu+VgCDWBeeZl5qd9hw+TFkzNWD+YOPvvaatWczFMEpO7Ti8W12ykfaInmSOjQDRgoY+We2/6aQ2+1NT0zqbp1LqzCQH6Z7G/Q==
Received: from DU2P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::14)
 by AM7PR10MB3956.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:34:49 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::19) by DU2P250CA0009.outlook.office365.com
 (2603:10a6:10:231::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 15:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 15:34:48 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 17:27:40 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 17:34:47 +0200
Message-ID: <4a710c05-aeeb-4421-b3a1-5bfb8230d51d@foss.st.com>
Date: Fri, 12 Sep 2025 17:34:47 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        "arm@kernel.org" <arm@kernel.org>, <soc@kernel.org>
CC: patrice Chotard <patrice.chotard@foss.st.com>,
        Raphael Gallais-Pou
	<rgallaispou@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.18 #2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|AM7PR10MB3956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdfc330-aaf6-413f-cbd5-08ddf211e894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlN3US9oK3F6ZWQxQU9FQmIvOXlJOVhCV1Y4ZWJBdlpEeTdyTFRnRHJBMjd4?=
 =?utf-8?B?SlRkMkw0NlNGMDdPY0FIUWlvN3BnMlVxZlRnLzdUWWQ3d052VVdLUlgvNjJv?=
 =?utf-8?B?d3BBMlNjcWxuOXZMUFNINnR0U1o4YjhWS3h2VE9rU0V5Vy81WjVIMk1GUTBu?=
 =?utf-8?B?eHUzalFxK2ZuZXZaWGtiVGxVU0tiR2l2VWNjcTFrWm1Db0JRUUxQODd4SWgy?=
 =?utf-8?B?U3ZOL1pPQkJ1cGxrQzFJQUhZRlA2QndhclZ2RllKanZCWVpuR0tNTHBTZVZW?=
 =?utf-8?B?QmNnVkpCUVFleUhEUnJFMytxVVlEMzNKcHB5WWIrYkdQNkRYdHpMd2VxS3pa?=
 =?utf-8?B?aWdVcHVKSnFTeTdONGt1c0ZxSExpMTBOTWkzeTZQaGhWVWxzRTBReE1hb2hJ?=
 =?utf-8?B?cVRkQUF6SlhFRXdRcnZ2VVBSRmhjamtBVno3ZjQwWHJOS2JFbE16VHhPbXhv?=
 =?utf-8?B?YmhERkttVkxNVEhtOHZ1ZEg3K3BEbTk5cENTUGFWVXFQeS9NSDZvMmFtNzZx?=
 =?utf-8?B?a3lIcWMrVGxDUi9mMm0wMXhMcmlXK3JKRHB3d285eURadDNlajFSbzhhRnpS?=
 =?utf-8?B?aUw4WTVRdFFlSUtoWTg4Szlab0xPcm4wQkNQRURtSmkySm1hVDNsMHladmpH?=
 =?utf-8?B?STltWUNoK1ZGdkVRcVp6TjlCdlVsbjdVelBzU3RVQkM4cWw4V3NIbEhlZjZL?=
 =?utf-8?B?ZUtSeW5TMHgrdmpOUmlPYU4rY1BBU3R6OXJOdWthaVd1M1lTbUw1SUJMOWtV?=
 =?utf-8?B?bVBlYjFsaWt3TkVyM3gvdi9FRWhHM05BUUl2R3VpODBmWXJ5dDdnL002MXJ5?=
 =?utf-8?B?Uk5VdUNybVJqU0xIWmFjWHhEdHBxZERTd1FtQkVHOERFQmZEaW1odUtQMm91?=
 =?utf-8?B?Q2g2RElLZlE2bEM1Skh6UDJla09wU2tTaDRlaUdsOWNaVEZRa245aFMvdzRk?=
 =?utf-8?B?NVgzN2FteEJKL0ZYM1V1dDRGU3dWZVRub2VONXNqU09HOVd2Z2lISkxQMEdR?=
 =?utf-8?B?dHlad2dDbDZqa3NuUUhISHFVUWZkMVc0emNaVllFWGovS0NaamQwTXdRY1pE?=
 =?utf-8?B?TjBVSE5nU0Q4LzBFeGFKSUJjeEVhNitlWENZSk1FY1VLWGNNRlRXYk9zWmV3?=
 =?utf-8?B?R0NhVVg3Z2dQNzVkVk45dWpzWktZalJ2aW0rczdpTjlmSW01Uy83VEorMDkw?=
 =?utf-8?B?VHNOVnRIY2VkMmxvVThVVmswZUZkRzhQQzhvSXZHWURnYSsxaDhJM3dYNXJB?=
 =?utf-8?B?T01ncG5oWU1nK1Bkb2hCRmVBMXpmK3Zic1FIN2todEhGc0hOS0xVRWJrVVpi?=
 =?utf-8?B?a1RMeDV5TjNNSDFqemt2b01GOXBSVEIvMDFELzZ4cnFaWTdQQkhMc1hqUzJG?=
 =?utf-8?B?Y2phNDdmWHJMa0ZXSm8rN1NlYjFYODRQbTUvK1Fqc1lKRWxRbjlYa2NkTmpH?=
 =?utf-8?B?MzI1TWt1M0lvZTlXenNZNzBNanRzVnZpT0YyeG5IYnBkeE9COTV3T1dwYVZn?=
 =?utf-8?B?OUVVUXZvOFpaQzQ2OXUzWmJINlRCcHl2L0ozV3R4bEhpV1J1NWtwK0NDL3Y0?=
 =?utf-8?B?UmZNa1Q4VUJFNzlVbnlFZ1dCaWNnMUtnaUlVVlJxM2owZjhnL05sYTA2ZnVE?=
 =?utf-8?B?SHlmU0c1aTZ6eDNrTkRVUVIxQXAxZjRFd21kRUVGamp4MGthbWxzSWpITXZy?=
 =?utf-8?B?cXlYNFNYdXpOMExaWGZjK3JzaThOWFAvWDV3Z0RjbDBYd29vVXE0a291TU9U?=
 =?utf-8?B?cDNWZEV2RFZzSlc3Y3BEM0Mvd2tCN2JJNlRKVm43TXV4dXlRZ1BhUnFaN2tH?=
 =?utf-8?B?TXRKUjVLODFaOG10R1ZNQlZOYkRmRWQzMHBPZGh3YnZhcy9UeWlqMXBXU1R1?=
 =?utf-8?B?dTUrMm9xRWpaK1oyekZwRCtOTmFZRjFDVFVyY09zSnRCWW1XVHVvMXg2bGRG?=
 =?utf-8?B?OUFMRVNGWS83dWd2dVc1MVpQS0ZXQWNRODg2MGxTQ1B6UVBoS1oxT0R6Y1Ns?=
 =?utf-8?B?OVhLK2FKQVYxeDZYUDhocGhsWGNueVdDTzBMMGNXYnkrQUNTaUZqc21mejI1?=
 =?utf-8?Q?B1oxLZ?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:34:48.5743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdfc330-aaf6-413f-cbd5-08ddf211e894
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3956
X-Proofpoint-ORIG-GUID: hRsgOam1B3gIP-EglV1VBhnO2hDWUeT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfX6Z/83aujAwcN s2QjNKf8bL7pRLokhhhNeaEV5+h6H365fJ9rM1MANaURklJ0nnJpB/jCLNtvAJe5uzlSfIP/cTx iOBsYsjUddK8zVwN9ESwGp5jPLGIvBU6vKgQwzX3WbD+WZr5qKf9FG1O4sWI0ZtoWt7RimM1Tef
 X8ibxgHFs3tutcQxKD6HtW1NCIOEVPs2w5O1tosEpkCgH4gEwOUafDX22fWWmRix5iyy+3iVRrk innTgR/HAXg34YXqpqe0sK/+zIBaJATXUTBp4wPjj/dee5KbKRot9s5wRUWC9IujWpCHmQBg6rY zhpx8lS/fCgb1vcfJb8uoMDAwljF0qNsXaPjBPMDw/TeX6xw4GQcOdAXxyl3TOOIniyGUKiXctj 2BYHkXKK
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c43d9d cx=c_pps a=llX5wPWAi/rMcvepPPXqLw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8 a=TMOZh5pxZ1373zMtKTUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hRsgOam1B3gIP-EglV1VBhnO2hDWUeT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070

Hi 

Please consider this first round of STi DT changes for v6.18 cycle.

Thanks
Patrice

The following changes since commit dee546e1adefd75acf0d69ddc04dc9627d745986:

  ARM: sti: drop B2120 board support (2025-08-18 15:49:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v6.18-round2

for you to fetch changes up to 129d617c60c9101963f0af07dd8edfbe9d346056:

  ARM: dts: sti: remove dangling stih407-clock file (2025-09-12 17:30:42 +0200)

----------------------------------------------------------------
STi dt fixes:
  - Remove unused stih407-clock.dtsi file

----------------------------------------------------------------
Raphael Gallais-Pou (1):
      ARM: dts: sti: remove dangling stih407-clock file

 arch/arm/boot/dts/st/stih407-clock.dtsi | 210 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 1 file changed, 210 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/stih407-clock.dtsi
