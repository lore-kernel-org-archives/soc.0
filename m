Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7942B730
	for <soc@lists.linux.dev>; Tue, 20 Jan 2026 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913798; cv=fail; b=mdHcjHP97YrFEEKCYkmCgXdCRHF9cmyfPlPIXdr0fJtWh3GD7DpSVizKYvQIHHAgfGJRmuVKc21UqYO+J5D8E6oCUf6toTbcWFzJ2K895MLIhoIXtJTh1Q8OEOayC1UDFFauZgNVxUec/cQF8gH6aIyGzREv2uedvmWt5sYOvx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913798; c=relaxed/simple;
	bh=Ho2coXeYwGa5gXYtMNOCvIVFE3Q9XRyVYTZxL1Z0LrE=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=rz8gk/fbWDf52KSi99yAsSe9tRr9Ttn6m4u2Xx8WVURFDVe1MjgtvJ/uZ7JNuva4LUg++DTb/64uYAG4EC/Zy48vFx/7kA04Mrf2vCoq8RAPlOiCoQ63oRuVi0P9cQDBi2miq/fNRm7nkk/kssfitykcoV8v32gQgiDieM9QEx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MM61J5F6; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MM61J5F6"
Received: by smtp.kernel.org (Postfix)
	id C46F1C19422; Tue, 20 Jan 2026 12:56:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4957AC16AAE;
	Tue, 20 Jan 2026 12:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4957AC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCV2HS2146557;
	Tue, 20 Jan 2026 13:56:21 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4brmv603ht-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 13:56:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJnzaimgz6K2xRcPpcj90OJjxA0ym1Llr3BwB0peykVNj+Eq75ByCAuwMLexW7draaTzDE+xJZgLJXaLq7ZgjQDnJ0AwjUFmALcSOnM/+HF5/l8J9vVgQvdp9UsDujy6h22bUKqtWNsH7/6QOzj9dOB+BBuTt3BvWk/ezf2HfipbtQK2NpZ6WcopKV2X0s5+MYF14VN4FXECy1j5b7cL9sudx172IPM61bRR7boOu8RXndUM/WkfwHOtMutLyXa8CmHFqdh+vF7cZ/Attn1aGI/XYrIL5sVDmG3bWLzntR50RO+yCoLRfOOOc2NPKSDL1ju2vxjtcQuTGzJdfnkvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3p8aBB42zS52uHhClBYqCHvZaMcQIl0iaCXt28PN3M=;
 b=tz7aYyXpNQ1PbhAqOSU58/+lzy9eFfA3ZmccVZ0deqXAShlZHoioTT06XqxIKRxpiG2KlbYORDOZ0VWtsFQPN7t0ow9lyf/YKjnQAHJt7NW8h4z2rC0b3TBDQRts9EARl4xnN1DnXfj7bpDtoXkg3p14SlAw6EcN8cltlz1ynsrNIMQk+wPbiyfR17rwbbcxWl/5N+hx5Y5eQSJYjF2ab2koXM3MxXpTkQ21Guo9IcbUquDzuFcof/HZTynm7CkFf22HoLgHTTtDRFN6I2GW8D9cNQvCcgfhtYYzdC0EuObvKgnCwT4LNTvTsGosJ7RGkrlg3yo9kgiN+bAH92NSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3p8aBB42zS52uHhClBYqCHvZaMcQIl0iaCXt28PN3M=;
 b=MM61J5F62ZAvxdOzswzpQH/h6p1ohtJA4R6ER6QrOEkBSkaJgukwlZY9bqqc3pKUZvGHeKsJ5xfHEtqFoSVoGJCrY9c3/5HFw2973w+drWQyKIkBAYluaXJL3EZc11dqRJdN/ikJ/E24JYyQOujrt0qfrJ/pC6nS6+DbaHZ9jyJUxxAu88QExUi5URYDppRbGB9WbyBiFgSSXFp/DTMK6B+fO0xG25kcsl9ctGOzZAJDVpS99IY31lnlac9rulZRqj736XPKFqAFCvaIXmMAnblmDrvHBkaj3u23q9Vd0aqrOehK8fKPliiF6CHn9/+eww1TBAlBx+LsrNi8sPuMJA==
Received: from DU7P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::28)
 by AS2PR10MB6926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:56:17 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::c7) by DU7P189CA0016.outlook.office365.com
 (2603:10a6:10:552::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 12:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 12:56:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 13:57:46 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 13:56:16 +0100
Message-ID: <662f3c8a-7235-4a3c-adf1-eaa0e4921408@foss.st.com>
Date: Tue, 20 Jan 2026 13:56:16 +0100
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
Subject: [GIT PULL] STM32 DT changes for v6.20#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS2PR10MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ef1d8d-9914-4647-3052-08de58234d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHBrSVVxRCtxT3lrTXRyRThFemdvR2hRRjBrd250dWl3VnJjVjgyVEoxVEVl?=
 =?utf-8?B?bzY0VTNvZk51aGc0eGpnMk9jZFZ1UTd0T2tPbm9FL2Q5aXBLUkZsWFNMZU1E?=
 =?utf-8?B?YUJvZWdpdTVueUJYQzB1aWE3bTZjSitVdlFsV2J4a2dPZ1NWMjVWaktveFRF?=
 =?utf-8?B?QkdDM0VpdUxGY255OEhFdzVZWER4d0NHTTlwZzhIbVRQbW9rN3lkTGVPZ3p5?=
 =?utf-8?B?QTM5WWFxNDFQOGd4eWFBNlVUL0FiL1RlbGZ1dUZQODZVSUxIc1FOdmdBbHpK?=
 =?utf-8?B?QUkzWXk0b0JoaGh3dExMdkc5NXFVbU1EZjBTUnV3U0xUS0grQ1pHYTZDb1hY?=
 =?utf-8?B?QmNTWnVDUDdOL1FTQ0NjV2pPekpjRXg5Uit6N01ZNkhla0g4Ky9IMG1PVXVu?=
 =?utf-8?B?Rnphb0FmZ0hkNlNmaUN0NFRPdjIyaGxmYTZsdXE3TzNyUURCVDFWS2l2TS9v?=
 =?utf-8?B?UkdmaG5TUCtUbzFCNHNXR0NJbG14dUFNN1VjZWIzMkVFMzdXSmp1TWppSXBS?=
 =?utf-8?B?ZmNZc2FQZUtLRG9lTmhjOXV5QlhWNHpIaG84MEJpRWtLNjZWaUNsMllzMDQ2?=
 =?utf-8?B?ZDZZc1d2bnMvd1owN3hvYVh5cHp2NTNxYTNJWFNMUjYyUU12b3ljbU8vUG1j?=
 =?utf-8?B?WjBJSkd1bzdydkh1ejVFR2piQnNpWTJBQy9qSXJxTWt1MmNTT01hRWt5R1hi?=
 =?utf-8?B?Zlo0Q1VTWUdIVmhlRENvWklyOERZNXdGdzZoTTZMVWNVWlRMNjBSR25saWZN?=
 =?utf-8?B?eVdOR2dTVmFBMmwvczQ4Y2JFWFgxdVZteFZzMmd4R1RDVWhQQk1UN2I0dWd0?=
 =?utf-8?B?eThMQVQ0S2tMT1VDUUJyNnplUTlMZGE3aUkyZEEySEVnQlJvN0dYTVlra3Zt?=
 =?utf-8?B?dDVONHRveTg4eXJHekdTdzczZndsQm1paEpGWTRhWUtMckE0MHRZNHcwaFNm?=
 =?utf-8?B?T29HakhGMHpZVnNhZUZkRnRtMTVWcDZoek1DK0VCSERMTjVOZG41cWlGMmZD?=
 =?utf-8?B?enI0SnY3OXpPaXBlMURuWW96UUJYUmdwLzVvWFZkVnVndmcreFFEV0t2NVJo?=
 =?utf-8?B?SElLVHEvV1VackZGS1pqajJ0Nis5NmN4aXRKTFlnb2pIQk9uQ1pzSy9zSUdq?=
 =?utf-8?B?RWZmSHlEVUg4STc3Q0haRkFIRFJxdkJrRnFTNDdldCtUbmJTVmJEencyaEU1?=
 =?utf-8?B?d2FKRk9oTjdKU2ZNMFdOdm0wNzZPckRNVXo1QWdIeitjQ3V1Mno4Uk9mWVNn?=
 =?utf-8?B?VDZGc3VBSWRKSzVFMWQ0QTMveVcvYVpqS280WVk0MktXeGg4T05qeTFIenBa?=
 =?utf-8?B?THZ5Tzl4R05SeWJhdEVPK3NKdDJLVzk5RHpESzkvNDJ1T3grN0xodVNxWEZI?=
 =?utf-8?B?dU13L2hGWWMxdHlCMWl3Mm9xd0R3STkvRmRXdGtVaEx3dWVwSlRVWm1hN1Yr?=
 =?utf-8?B?VVBiK1BGVktuSjNlaGhKOXZ1MDdzd3gvOVlsR0RrQ2kwYWRsODNXNDhiQmI3?=
 =?utf-8?B?QTdicy9LL1I4V3d5bkZTVkZrRUJYakZPMUlvRklXbGhNOWZQTjNGeDJTTlF1?=
 =?utf-8?B?czVIYmM0RE8wRTZIdlJXZGQ4UlM5K01tVElXRmhzMlVwZEFFM3Z2ZSs0VlZ1?=
 =?utf-8?B?OGRUNTBlYkJKS1BzYzJPRThFZy9FRnRhUlVQOXZHTG9EaFVEQWFVL3pPN3A1?=
 =?utf-8?B?U2RBV0dHeTdPRHVtREZ1Z0pHeXNPN0hzUk95QW9oaEFVemNub1U4dmExQmVL?=
 =?utf-8?B?YzRZWlc1RVcwMnM0ODZBZmdzQkpvQVRCaVRGUzF4YUFiekxkMjZxMW9kQStr?=
 =?utf-8?B?U1JVUmdRYXJkVVVUV1VQazZJMG0zUndTT3c5QWZpUXUya1RwMzhaVFVMeEVQ?=
 =?utf-8?B?RGtRMlZtN2hUT1VST0NkNnVUTWlCQmphQVhhVFVEUEdrQzFSLzdDc2N1Nm53?=
 =?utf-8?B?Rnc4WVJ1QnNXWndGRDRkTEFRQWFGR1ZRWFo1anNPOUorNUduQTZtcEgrTEl6?=
 =?utf-8?B?NmRUcXpLc3lwVU8ycjIvL3pCVFhXemFkbndyc3BuN1UvdklYWElERlExc1E2?=
 =?utf-8?B?aEdsNE5WMlZBcngyNVJKaFk1VTBES1VFNXpHVUFUdy9NMERjTm0rNThiR1pu?=
 =?utf-8?B?cGF5TXB5ZnpwdzMzMzdnQ0pPQUZPN1JucmdhS3dsMjBPUU81Yk0yOVB2MUtV?=
 =?utf-8?B?WnhXZWZvSWJ4ZkcxNkJ0UkE0aVFBLzZaanRraFluTmN6MURLdGxPeFNrS1Fq?=
 =?utf-8?B?c2xyMXl1M2x1QWdodUdDUWgxRS93PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:56:17.4569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ef1d8d-9914-4647-3052-08de58234d36
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6926
X-Authority-Analysis: v=2.4 cv=Vf/6/Vp9 c=1 sm=1 tr=0 ts=696f7b75 cx=c_pps
 a=O0dsbvRe/WPT3j730UY7lw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=D-mElihrz8eyQg9S2k0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3hV8wIiZrLhX-76Il3HanRb0p1rf0JAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNyBTYWx0ZWRfX/MUTTfSkUeAB
 IHbKqzk+X4zWz7xaGbqkh2kSjuwRGtB9hvLGowZGHhrFWVJtGrj+x3d9X9p5s7gTCsQ93x2Lh18
 XRUUOmEuX1ImsvqXxlaGUEbBK6IoS39d3eQBoRmCIkda+0e8zNSDGeQHSJT2xW9CqJl03aybMQg
 YYDeFoVQtp7j/UNIlkX8lDsgFmx7gwOPK5IFCYeWhqvfv8SIYUcwmAU4MY55rRiASB5VFjKkKYe
 53zq3hJAO/DxXWzVTvqRgrajF4xyp0njzQDz34qnVnyGsha+Wsuk50+dZtq2lXygPd+S0R03RkX
 eZG+ZHc3CezNGBl/yNvbZLYwOukot2DXg481QAdEa9irVYucmJpWM9S35e2Jrn42E/o1+Z1ZByH
 uxYZ+hjhKDpwWW2ObT+U1D69fnbc9nxrAdWZeIwLPC0p1ddkacybh9fTFsysBogOTlD41p+Rgu4
 SUZQyNfPcEHVtSGnBKg==
X-Proofpoint-ORIG-GUID: 3hV8wIiZrLhX-76Il3HanRb0p1rf0JAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200107

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.20 cycle.

Thanks
Alex

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.20-1

for you to fetch changes up to 1636348aab60830a1bc58a55916b218ce18712b5:

   arm/arm64: dts: st: Drop unused .dtsi (2026-01-20 09:54:16 +0100)

----------------------------------------------------------------
STM32 DT for v6.20, round 1

Highlights:
----------

- MCU:
   - Update/add Led support on ST boards.

- MPU:
   - STM32MP13:
     - Add boot led and red led on ST DK board.

   - STMP32MP15:
     - Add boot led and red led on ST DK boards.
     - Add SPI1 sleep pinctrl group.

   - STM32MP23:
     - Add green ,orange and boot leds on ST boards.
     - Add SPI, I2C, DCMIPP and CSI instances to CLUSTER_PD
       power domain.
     - Enable analog-filter to all I2C instances.

   - STM32MP25:
     - Add green ,orange and boot leds on ST boards.
     - Add SPI, I2C, DCMIPP and CSI instances to CLUSTER_PD
       power domain.
     - Enable analog-filter to all I2C instances.
     - Add LPDDR/DDR channels to ST boards.

----------------------------------------------------------------
Alain Volmat (14):
       arm64: dts: st: add power-domains in all spi of stm32mp251.dtsi
       arm64: dts: st: add power-domains in all spi of stm32mp231.dtsi
       dt-bindings: i2c: st,stm32-i2c: add 'power-domains' property
       arm64: dts: st: add power-domains in all i2c of stm32mp251.dtsi
       arm64: dts: st: add power-domains in all i2c of stm32mp231.dtsi
       arm64: dts: st: enable i2c analog-filter in stm32mp251.dtsi
       arm64: dts: st: enable i2c analog-filter in stm32mp231.dtsi
       ARM: dts: stm32: add spi1 sleep state pinctrl on stm32mp157c-ev1
       dt-bindings: media: st: csi: add 'power-domains' property
       arm64: dts: st: add power-domain of csi in stm32mp251.dtsi
       arm64: dts: st: add power-domain of csi in stm32mp231.dtsi
       dt-bindings: media: st: dcmipp: add 'power-domains' property
       arm64: dts: st: add power-domain of dcmipp in stm32mp251.dtsi
       arm64: dts: st: add power-domain of dcmipp in stm32mp231.dtsi

Clément Le Goffic (2):
       arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
       arm64: dts: st: add DDR channel to stm32mp257f-ev1 board

Krzysztof Kozlowski (2):
       arm64: dts: st: Use hyphen in node names
       arm64: dts: st: Minor whitespace cleanup

Patrice Chotard (11):
       ARM: dts: stm32: reorder nodes for stm32429i-eval
       ARM: dts: stm32: Update LED nodes for stm32 MCU boards
       ARM: dts: stm32: Add LED support for stm32h743i-disco
       ARM: dts: stm32: Add LED support for stm32h743i-eval
       ARM: dts: stm32: Add red LED for stm32mp135f-dk board
       ARM: dts: stm32: Add red LED for stm32mp157c-ed1 board
       ARM: dts: stm32: Update LED node for stm32mp15xx-dkx board
       arm64: dts: st: Add green and orange LED for stm32mp2 ST boards
       ARM: dts: stm32: Add boot-led for stm32 MCU ST boards
       ARM: dts: stm32: Add boot-led for stm32mp1 ST boards
       arm64: dts: st: Add boot-led for stm32mp2 ST boards

Randy Dunlap (1):
       arm64: STM32: drop an undefined Kconfig symbol

Rob Herring (Arm) (1):
       arm/arm64: dts: st: Drop unused .dtsi

  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       |  3 +++
  Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml  |  3 +++
  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml |  3 +++
  arch/arm/boot/dts/st/spear320s.dtsi                           | 24 
------------------------
  arch/arm/boot/dts/st/stm32429i-eval.dts                       | 73 
+++++++++++++++++++++++++++++++++++++++++++------------------------------
  arch/arm/boot/dts/st/stm32746g-eval.dts                       | 15 
++++++++++++++-
  arch/arm/boot/dts/st/stm32f429-disco.dts                      | 15 
+++++++++++++--
  arch/arm/boot/dts/st/stm32f469-disco.dts                      | 15 
++++++++++++++-
  arch/arm/boot/dts/st/stm32f746-disco.dts                      | 12 
+++++++++++-
  arch/arm/boot/dts/st/stm32f769-disco.dts                      | 14 
+++++++++++++-
  arch/arm/boot/dts/st/stm32h743i-disco.dts                     | 34 
++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32h743i-eval.dts                      | 25 
+++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32h747i-disco.dts                     | 15 
++++++++++++++-
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                       | 15 
++++++++++++++-
  arch/arm/boot/dts/st/stm32mp157c-ed1.dts                      | 15 
++++++++++++++-
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts                      |  3 ++-
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                     | 19 
+++++++++++++++++--
  arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi               | 57 
---------------------------------------------------------
  arch/arm64/Kconfig.platforms                                  |  1 -
  arch/arm64/boot/dts/st/stm32mp21xc.dtsi                       |  8 
--------
  arch/arm64/boot/dts/st/stm32mp231.dtsi                        | 19 
+++++++++++++++++--
  arch/arm64/boot/dts/st/stm32mp235f-dk.dts                     | 21 
+++++++++++++++++++--
  arch/arm64/boot/dts/st/stm32mp23xc.dtsi                       |  8 
--------
  arch/arm64/boot/dts/st/stm32mp251.dtsi                        | 30 
++++++++++++++++++++++++++++--
  arch/arm64/boot/dts/st/stm32mp257f-dk.dts                     | 28 
++++++++++++++++++++++++++--
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts                    | 39 
++++++++++++++++++++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp25xc.dtsi                       |  8 
--------
  arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi             | 71 
-----------------------------------------------------------------------
  28 files changed, 365 insertions(+), 228 deletions(-)
  delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
  delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
  delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
  delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
  delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
  delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
