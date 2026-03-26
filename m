Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D72D061D
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774530916; cv=fail; b=o69pAf7K2csLmbBVn/s1Y/eEJd4vYLmmGk3noZxZFoNQNqPH1KF7Pm5bCELq1SIgP3y8OkMIrzl891kksYfopWwD19xjUEKI0d/rjUMDBJCFcEkhKSTKqAjUcjpmKLXe23ptEPzDM2+0rTK15mDgndhYPOJp2mTVTA+DUjRNem8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774530916; c=relaxed/simple;
	bh=AuNYVIf+wEtBS14SDrFYwYkpcSx16AFEHvnt8rDH8HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sc88wGASWre8sTfNfx4hOdVOflha38UzMy5Eh2Y2gb0vEnkmJx7SonPqW749dsRk2R86Cuh4X2554I/19VDjlsih244WvbJMV/Bvx6jbRY3Qv96halt25i0KyWaqy9CidWeD86Wg2lRPb0zC89LawgVz3fTdmIyIyAbE3LMkhq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TPYe2BqA; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TPYe2BqA"
Received: by smtp.kernel.org (Postfix)
	id 00389C19423; Thu, 26 Mar 2026 13:15:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB523C116C6;
	Thu, 26 Mar 2026 13:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB523C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBQBdyoProyV+Fd7nPUHVuk86LKhNXbkX/rNmB2SBmMxQGQN+azbehWXF3zLW76ofBUjC+YS1DBqnQAtMTxsq3jlRMjX1iT2x47zoPoFgcjDw2lPF+laXpLS8aIoJDtmAwDsn6r7jm00dPRc1q64vY5WhbPrZQ/pqY4u+IHSLIKgr3sI7JUV6RoMFSeLFdbAh23U4oPYvuzRgzys6vjvhCE9LFF7TIsrGAdpq+ud8lVfkX6fDLg5grYlzykcHZvYW7LdjGY5rmPzVKS+5peO20LukUqSyxUkCbJyLfoee77m9/rRXNHxSBtAt6qzI530J7UykstqPFg3VUPm+xm4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J4JiCTuMpzL43oQlCp7uNuWDPFJSSdAoLZNsa5areU=;
 b=qnF+rxw80JrRHhbcT0X+u+zSjisXUSyzHanaodzSs/CV8DGuQCcWMCCsZanrtdXnr72PoO+f37ttVKIOoYC2SMaHr9yyp6sgCxe2wAC3YP/aStft/YjKRANYMWqMaUxlc5596zNeUmYAM+8ZS6H0sjeJpHeAXz3TPxzYeeo7kURqSMfnj20FsByvXspKSAxIAGgoK4Un+F1OBSOaf9Ed/l98GxbjbFQxXjikdQxf9ptX//y3RygkzWaNbOSWaozulacZBBKW+mXzgDtpjBAbiyVRAXvN2hMpTmml7tISNKE/hUY6yzpW+r/mbdyMuQxUW+ar01v3kn4agsEs4kQMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J4JiCTuMpzL43oQlCp7uNuWDPFJSSdAoLZNsa5areU=;
 b=TPYe2BqAMgI3VqDGPRYe+DcLNEoPRN/eJjSLvzOnzcNdhaH9DEVHD7TRJI5887eMgGVcQdXQ3XeyS1JU4JtviuDcvDCIKW1P0b6r0K1d0NvMRK1NlY6mmn5vwxLQG5SPmYU8Q0wCYYRDdKo2A7R0bogTkUw4V0BtkVfC2HD2k2fdPNKcpS57OJJCgJvLkgSxuIqfU43gYPAZK1dg3S3hxbXzxCpYzkpSAssd1xABnQxdIufkDYvHOJRIsxQdLDcHuHUjNTTv9kx+i99Qsj6bZ9IU3W6OgVeY74taQ62dAwxX0P1IjNQkmXuTm/UWB1HQ6BW9h+s73BgH3SFLTvId9Q==
Received: from DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) by VI0PR10MB8790.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:232::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 13:15:11 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::5c) by DU7PR01CA0022.outlook.office365.com
 (2603:10a6:10:50f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 13:15:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 13:15:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 14:17:48 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 14:15:09 +0100
Message-ID: <ebad7694-72e7-4a99-8f55-d8d0b3c4591c@foss.st.com>
Date: Thu, 26 Mar 2026 14:15:09 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] STM32 Bus firewall for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@baylibre.com>, <soc@kernel.org>, <arm@kernel.org>
CC: "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
References: <c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com>
 <79cd2b07-40cc-4a74-a12d-b2b50999696f@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <79cd2b07-40cc-4a74-a12d-b2b50999696f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|VI0PR10MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 5168f0c0-ee60-494c-c83e-08de8b39b5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fC01+shW+i1/VtdZKbuIgAeJvPdFmGUcwErZc5g/ZIToigGjc6U/YKIQzIfXk86Na2PiaVp7acsJKffCUoix1N33Qc65nRq9fy9SEtiJkgjGeoJnbsv3ZNPKpXkp8ZlRwOmgzs16LCGQ+HQpd3a9cjPiq6V8bZmH4DUPhLeWYtbyeIB/MRiAp+aWd84yyBgQtgFqCxm0rUfNeQnCvb0RSAcDBSQwaAY8/KgDvIr4w7x9lAw0UX3+CdFqYU4udh7mbfnIwpFVvRrztKmqC8+l2BwOIcHqjUbzW8kdw1DOz5FWQDviWuoSaedJlEnv0YUCfcXtDL6W2IrzfodRRjzXP8uz0v18JZw2smhtM1P1QV3XibC/MPKrRWIYzbzialoe4sT/qGHWq6qMR4LlTyra4GckBvSD8wb0VGd5X6BSlq6nsDJ20QY6iKoKRFM6Gd/e9+eMSxx84Dyc4B9x9yhozEOdV/2hKzHGVqPdqaQaiFEMUpPGoD4pWBj9uAo8nkttKneOqJZ1v0q2HrXK1ZHe2BsRSpNg8ae4ncYle8qdZcxlu1RO60zLQLEyGesxlyQkrF74y1qcu4//gQbu5lBxGpQfAoblhIBdWNv/DZC1caQPK84skAOwWtfQZSt9IvMh1slk8YPNRv6KYZ/0EWQprAiM56NX34bOjOfcThPWw6aKytKZCpiLvR4JKvbtZMmt/1IaGUrBTfdxxaFi3eUJQW0kD8L9CC78IyjZQup21/rV5OxRAJ72ITVfvFrW5hWyccV+0FhXy2FzERJyw8ZYng==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R7Wbyr7VNoYf6p2nSQkUtMeMLPHlGXmywwgS4GQIF0SN6pwZloUzzv45QAgsOajq0zejtcyvRXhWLam+kBK3U6mN94CAGBncqlhwd3LouAx64OdWQXX4uJndLOCje15ptOYYThd33PabSvSElZozcWySCvmtGwGh/VkGKpKFagnaiU/tdcOUP4FL6fJ+xuR1zcRcVEUpjIzi1bLX4J6+adtLXwXbfxvT41sE8bqxVXf9KTEwD2V8LOt3rV5a3l5IexeZlDIjvBSQozL6r9mqSfnNILhz6XbFGWMVxF39vasqjgh75Waxa9QzLILPbVUEWZ3TeQBqcwikgvnoeBT+bFOueHNAHYlhFy6p48We7sRKfS6qdwjSecIt7hnsrNV6tW132EAxAgij4xO9UV/mh9c0wM+sIzblF5WXhJx2GHtcDXO4J2mVRsSm72ep+/pX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 13:15:11.0570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168f0c0-ee60-494c-c83e-08de8b39b5be
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8790

Hi Krzysztof

On 3/26/26 14:03, Krzysztof Kozlowski wrote:
> On 26/03/2026 10:04, Alexandre TORGUE wrote:
>>    drivers/bus/Kconfig
>>    |  10 +++++++++
>>    drivers/bus/Makefile
>>    |   1 +
>>    drivers/bus/stm32_dbg_bus.c
>>    | 250
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>    drivers/bus/stm32_etzpc.c
>>    |   3 +--
> 
> 
> Hey Alexandre,
> 
> Might want to look at your terminal settings or scripts - it creates
> pretty unreadable diffstat.

Yes strange. I use "COLUMNS=80 git request-pull v7.0-rc1 
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
stm32-bus-firewall-for-7.1-1" since a long time.

I think it's linked to my mailer (I just saw the same bad indent on my 
device tree PR).

With the same command I didn't get this issue for 7.0 cycle. I'll take 
care of it next time.

Thanks
Alex


> Best regards,
> Krzysztof

