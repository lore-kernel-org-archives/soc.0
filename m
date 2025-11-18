Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7327F163
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455446; cv=fail; b=fhhc5d8jgBSUbnbqg1OBTj+DqmabJcfYNCoUkl62KwntSEM4TBt6QPg7lBq+csw7OhUx230ht4IvFKrG3ixr3eHW/k1xJ65eLWANvwR4hDc1kGkKlA3GSYd3BqeWKoDxtzyrAo3KdlTJSeIUx90p3D+l0fOY1YGWADDzVO32Dis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455446; c=relaxed/simple;
	bh=zs7yCmY8z1niQ+4mrow3+kCst7uhLMEafkVS+ZLxh8k=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=UknGm+p4h6vbiA52vePnAoRZsVCtksjIaqmJ+j/bszram7AeVPfqnOvjdLXFFMf9eCB5NEhgLP3tSbE1nPPp5nGaGGoMkuwtjrbXWC/jb59jNpFD0tD8zw5WVgHzZ05V4TDpfvpmiqoq9A8n3pYADvZ/02QF7dWz0nm8yHecICI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Nh0smA59; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Nh0smA59"
Received: by smtp.kernel.org (Postfix)
	id EBD71C4CEFB; Tue, 18 Nov 2025 08:44:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F5F4C2BC87;
	Tue, 18 Nov 2025 08:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F5F4C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8Yqer3712648;
	Tue, 18 Nov 2025 09:43:53 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtg1e9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 09:43:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+3vflB5U83MI+CeSC9sGd2QfTfJcZAFdAzvxshM4Ae9EA/tEUy34wStrk+cTe7qo0N5WzkvBDJo66kLrxdgY1+htZg5H9wRrGMRZHf04fpok7+rTMVTAW0aMfwB4dvB4yjmRZRh47dw/5aDE2eTM1eQc3rAlHSzRhiLA2/MvnIzpU3QDDka+V7eth2DzocEvD0W5Jn/PDs0VbHru4bwHlGA6F1mJyPVto6oFF1azV2DlnS+llFodH/sDEmDfpkx9q7dDStkXhPOeDUGg4zNZ8sQaG/mPKzeJxL85q7LiypGAfjnbJpje2GX0MYp/w3Y6viuB2VRsfwVdc678o0oKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/DkU7yVM9hateq/PpG8hKF5JvTQIUGKdF8Tuw+wAFY=;
 b=Jq8z/Caa8CfDqImqwhmU0Zuc+zxWqiLu5wPTvumPbHKY947lke6YNZMDeKRdjA+p88ytprn+qpVmykqbMJiSJpv4VoGznGxHFDNUJR5x5LelW5WnPbW4hu1ieQk41bBj1wqBm/nCcSrOq7hFjuFvuyKMmxFbJ1cTX0uBOD5sh/veP60ONP66da36279n6Dr0B97sU688/FxFyxMdS5A+RXGeJ4OEbJ6ckeM/EZiCxoZ4EgqrcRrrIu2P7M+l83PNcyOpYBxp+3HSq5lla+tjYV4jxKXqULU3EXVPSh03vkT+BDu/y9GtTJoG1VqABMdLtI/VBtJrotaF70mNWdvzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/DkU7yVM9hateq/PpG8hKF5JvTQIUGKdF8Tuw+wAFY=;
 b=Nh0smA59hceRntDb+N7KhvPlmjpieYkOmAs+Igs9XUCtinQ69EDFUYJV8lgI/wstqNL3r0P531C8jkJOtvbtEagreJ3Eit6N0NqNwcFR1oYQA2ZAHKd2UvsZ//eHmNtTupXNBTd0u4rbS7CzXUrLy3VnnWqq6kCGdfbfKAhNYm/agFfo2/Mvo4RUW/M7+YcVDKmphXUJNOPAq95B6lA3g/kUAPDfM61M6w5fNBbxIGLXzgLvNOOb1FL7nkfNZE37mdfd1W37s+bFPHVHxsgswXvlUJ9eG6pakn7f3EY5/SMODHBO1SNKjT7Gy+9XL4OoYnaL1vI6ePxANDU0ug8F+g==
Received: from AS9PR06CA0601.eurprd06.prod.outlook.com (2603:10a6:20b:46e::24)
 by AS4PR10MB5222.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 08:43:48 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:46e:cafe::21) by AS9PR06CA0601.outlook.office365.com
 (2603:10a6:20b:46e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 08:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 08:43:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 09:44:01 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 09:43:29 +0100
Message-ID: <745d50db-7d68-4789-808a-c5ed88819a78@foss.st.com>
Date: Tue, 18 Nov 2025 09:43:28 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Gatien CHEVALLIER
	<gatien.chevallier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 Bus firewall for v6.19
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|AS4PR10MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c18664d-b325-483c-5fce-08de267e97b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S01Ebm80VXZ5TG96NUNIaEhTZGpETDZVbHJJMlJBdTR6a1NRQUV5ZDVxZG4w?=
 =?utf-8?B?WjNOVm1CNjVYQXNDVDZaOHIzTWJoVFcrdUMybkhGVVNUYVJOaEkwalVMWVEw?=
 =?utf-8?B?Uy80UmF5UWFYOFVUWW1hV0kwZFh0cHk4SXBTREhUMFNvd2tDeVlBYzZDMHly?=
 =?utf-8?B?ZFNSVkFKZGtiZjdvQmIzdUQ5aEhVOHBjNURUY3ZncDdvcUMxN1htZExORDNz?=
 =?utf-8?B?K1pTeHpyc21NYTltZVZrS1IvVGpGMmpGVVMwQ2YveTZoV3BySitXTlI1TDVJ?=
 =?utf-8?B?NUs0WHdISjFTVHdjOCs1ZGtCTkMwQzROZHRrQzAvbE5acUVyOU1LVFAwUG9G?=
 =?utf-8?B?bGsyUmppREJpVUlTaXh3UUd4ZmUzUmxsNlNDczZkVUtjKzNZSHd5TlBxbFFw?=
 =?utf-8?B?dG1Ib3hFUFVNeXhleEswOGpSYTEyakxha0tGU0tHZTl1RmNmM2d5YTFIUWlI?=
 =?utf-8?B?bXZVVlM4eCtkUDZ0STc3SVA4VXpEMVY5eXdJbmpMYlJJbTVXVFFXZ1UzWThV?=
 =?utf-8?B?eXdySjNuVWZlOXl0eE9HRG9sdXFnQVE4d0NlbGJBNU9SSHRrSGp4YUpLdjdS?=
 =?utf-8?B?VXBlZTM1MWlSWGR4TmdWTzAzcGNyUDRoQmc4bHFQUjY2c0dYclljNTBKS0U1?=
 =?utf-8?B?YzVXTjFrVVRUVU15QjJIdm9YT0lLQ0FDV21YenpGcncrOFZDNXJUVEZQQ2Vk?=
 =?utf-8?B?VW9zM1lpelhERFdvZVk5VGNxNlRibTFiZ25pdXloMk41Vm5jZmVMaTlGUU43?=
 =?utf-8?B?QWIvQXF2Z08vclZTTnU4UnovL0lkVTRYYkdTb3BuSzZUYWdRVXYxV05MbFg2?=
 =?utf-8?B?VjdNK0lNUkR0MzJGMHZQVjdCZkNuaDBOc0c1WlVhem92WitJRlIyUVVKbGxo?=
 =?utf-8?B?Z0FSbUhHY2tLWFBmb0pKK3VGUld1V3BxeVpMVDhLRzFYQTRoUFFRNTlWaFlQ?=
 =?utf-8?B?SThRdEQzN3JqLzJ1a3FzN01DaXBOR0VEeTNkVDFmN2dUUWhkWExUdXVZTjNY?=
 =?utf-8?B?THlWUW5wV1NtT0tPcHRQVmVhRFp3N3hKbFNGeEdlc0lhT0UrUUllMUpNSDha?=
 =?utf-8?B?T1A4OENtYW1ZZDNNS1QvY1ZFa3Z0OWp6cTRHT2o1OXphRDZXaUd6T3BzV0ZS?=
 =?utf-8?B?YjdzNTlVU3VlNndjaHlMK3FzMk4vOHBSWnRtWjEvcmpjY0pObGszY0cveWhC?=
 =?utf-8?B?eHNoSFdQM3JrWlhkQ0tYbkYxUGpjUk90bGlNQVRiR0Z4WEV3WTgrc1ZnMm42?=
 =?utf-8?B?UUZFRzB3UUtOU3V1OVFBcW5GN3NBR1NDdVUyWHIydk1wVkVjWS9TSkYraVlh?=
 =?utf-8?B?bFhlZWFzNFZTeHVqc2Y1TE9XYlRMdDgxZ05pQmhhODJ4MHdIQmRJaDhyTytj?=
 =?utf-8?B?STROTmVIWnVEQkFhZXJzQlVpY3h2NnZ3M2QzZ2RHWCtiS0t3OWF1Rm56MEsw?=
 =?utf-8?B?QlZTeXBtQXl1YjM5TWVtc1k4WmdVbmdnL0V2cXNueGZGOU9hei9lSW1MWkhP?=
 =?utf-8?B?dU5JS3NFczlxVVZaMGFMaHQ0VEE0UWhrcEllMnltUWRZb1ZFT1l5OUhhNDJh?=
 =?utf-8?B?VmwxMnZWRzNRRy94N3pmK1RVQm1LNFpvUkhKM28xWWJsNUVVK0pkZVVBQ2tD?=
 =?utf-8?B?NjJuUzlXZDJQZ0F1QTlZRnFUYWwvcXJnYlZxNkNGUEZrS3ZEOWhaaUpFQW1H?=
 =?utf-8?B?b09CYXRzV1cxM0w5UzZML3ZUdVZCYXBVZklLdlNVUW0rYnBHYVVGSFM0bkR3?=
 =?utf-8?B?Y3lhMHBLTXNYMWpYOStZR0ZCeU1WM2NqcFVJOXV6YUhrczl6MUtBNkVMTnEr?=
 =?utf-8?B?cThPOE5DcGlKZ00rNFNSREV4TlBqS0pVTitKaHptMTFmb0E4UStJMHhrT2hs?=
 =?utf-8?B?SlhORy82bU9RRXVaWjBvVEpzblhpNUVpWm8zS1JjWDBOVEZBeHc3SjhGb1Iv?=
 =?utf-8?B?c1Zwc3FjdEdoSEkzNjJlZ3VLOUtPUlp4TVRWSmg2c3RjTVhPdElLcVJmY2FH?=
 =?utf-8?B?UlhBOXdoWFpzMjVzb0wxcFQ4QXhHY0k3cllOM2ZIQkZpU21tV1ZKbm1ValpS?=
 =?utf-8?B?cUVFUlFkTE8zUk5BTDZ2YjF4NUJOaHBUN3YwTDFvNnFmWERJWVhNRUVZeDZO?=
 =?utf-8?Q?00+Q=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:43:48.5145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c18664d-b325-483c-5fce-08de267e97b2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5222
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OCBTYWx0ZWRfXyWE23bbj6NN1
 yqFjqv+FhO98i8dIjBoKaSKTacn9YZvnVGhQAuKfAqJchL+i1mnYagB30IeXqTSkhsoQyFrp8Hc
 5CX+gKvOo4ildLKao1FgokVknKynnDOioOSMkl84aUSM0ess/LmKeKZHvV9VqCHqVEzlwGulMzG
 dEGtQIgMuYNjwiiNrurwuellJwAknrOaGWCeqFqO1WpMlfQPxnzjfZxxs30YkmOPadSrX9g8hwW
 nUkluX9XoQVjtR75byhHCLPGTV73hKL7B/XOlMszcaU/bDXm1I25rczBbs7Bktt2hlH/KBcbZBt
 BLCEMKn6DOAPLV8hC14+GaZKvNjoytfP7Umb6gd5c3t0V1aKTZQsIc5esmFfmhPzsBqmKG3hD/K
 BJY6yiO4L5SXwL7GFo78gS7+bQWUug==
X-Proofpoint-GUID: YWDZRWrenVhe_eZbm9nEbyTCAh08X5fX
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691c31c9 cx=c_pps
 a=c8xD8z7KdWRTBxs7AuUi+Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=09PnaG-bEo98w1FavZsA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: YWDZRWrenVhe_eZbm9nEbyTCAh08X5fX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180068

Hi Arnd,

Please consider the first round of STM32 firewall bus patch-set. DT part 
for STM32 MPU SoC will come with the STM32 DT pull request.

Regards
Alex


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-bus-firewall-for-v6.19-1

for you to fetch changes up to 3bae4748c1cdd51f5d25b6c2fcf5a5634ab686f1:

   bus: rifsc: add debugfs entry to dump the firewall configuration 
(2025-11-14 09:49:09 +0100)

----------------------------------------------------------------
STM32 Firewall bus for v6.19, round 1

Highlights:
----------

The STM32MP21x platforms have a slightly different RIFSC. Add support
for these platforms.

Also, the RIF is a complex firewall framework which can be tricky
to debug. To facilitate the latter, add a debugfs entry that can
be used to display the whole RIFSC firewall configuration at runtime.

----------------------------------------------------------------
Gatien Chevallier (2):
       dt-bindings: bus: add stm32mp21 RIFSC compatible
       bus: rifsc: add debugfs entry to dump the firewall configuration

  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml |   8 +-
  drivers/bus/stm32_rifsc.c                                     | 597 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  2 files changed, 599 insertions(+), 6 deletions(-)
