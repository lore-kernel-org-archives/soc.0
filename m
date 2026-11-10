Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335146;
	b=gMuY1dqsW79Mm6zkq+b2MlWZTWlJjv4edVoo9qLqQKCz9+mw/BfDNvc9JW6ZZY3rC9l+
	 jWby46D4cm3iqvs+gI2MLCNaHpTlBaYCxFAoIfUw7RIQ1cnRGaFCTeYp9c+CFYERmUVLo
	 RfOzK5eibr7WhEX2ahgjnedlEvRmDBBbmCVaHStlZXOWxvF2/kFnilhlwLFQlLdT0XmDv
	 JOYZsCWt+O1IIno8UVBVCDeGqisuaJf2rQAaU1nP09HmXEEsjBQkPQWxuKxvvaXxKMlHy
	 3RsZsUZvLJ61CRKlDf0f7YnkDEADl+sg69TZivWAw/Hb5Y06XtOrgydR5FE2eLu4ZlA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335146;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:Message-ID:Date:User-Agent:Subject:From:To:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=egeh9wioXVuyykVZxva0ZCEgPB6rpUyW2X2GvvYCQbM=;
	b=Zn1GCT0mcYAblrK9bu13cl4KC4wURCFCbqgkW7928PLm3KLkaJOpr0vldzpMAlcibd7q
	 kEfbJ/DPRBYwH4lXuGfLH+pBxILytzMekXhGZPK1+95JR26cXxrICb0Ho3PPZs8p/30i7
	 TdKytPduvh6ueMwb+LRrB0FAhGa49YNLSCLGY8P3M4C2Okz2YAEpwKditVmTl0uaaIMbt
	 tMmcCT+zm2aONH2liEQ+siARKD3QspPr5z2q/wja7QZyZmm+FM0RPxBtRR96leywd5iCt
	 zYAYLd4tk7VvcJI9uHv2Auhh/COq1Aw0tZOgX9HrOD8as8QhjVWtHIlG5Oe0aPpIpNw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iVe+7I4x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799F606A321
	for <soc@lists.linux.dev>; Tue, 10 Nov 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iVe+7I4x
Received: by smtp.kernel.org (Postfix)
	id 898551F008A5; Tue, 10 Nov 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.124
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794335145;
	b=BVfDWVXZ3vZAEl6s+LG52xJ/OfgA9brMFpx6W7hU+Qf6nyM/ptfcjMvG5Z15rvEcTtFf
	 NyFh/SRjX5b/L9P/JPi7CSFsXLvSLfhV+IvPLtj9TNd5uvFIUqOpu6mixR0cle1rtz+b3
	 OVZtCY82Qd8pSV6xh9YxgkYker8xXGv57GOK9qm9Tz0EZRsCPTJDR6NGBrPrz1sdmHg9P
	 +rQ+lJtwcnVF1tVnPNzL61Djmk6b4So4Dr+Edmu4SlYfG0TX/OvNF03GDbYCDU1DjBqGW
	 ASJeGAUIENFsk/Ga5HXYdK7whfFCNQ36nXoG2h/hxWWQbqaZ82pZoFP9xTHqS8rZbxA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794335145;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=egeh9wioXVuyykVZxva0ZCEgPB6rpUyW2X2GvvYCQbM=;
	b=L85dNitNsMbs02SmpClZxnLcR8qXyeBqR71c/cT2Lgoit5wCmHM8bbAu9q3HCpQHTQFs
	 WOQRqfl40N5N+wKQAYKpdNlR53cO9fXdgYAlGemkD7MpbTZNNtqXEqmGKUZcI+mHplDP8
	 eQkWnseV2Kq5mMBxEk/W2ukEMf2cnfZHQrjNKQpMJr3bsUZPzDO7P8Gbybk96DIJV0zPm
	 0PPdftmrMMvyMLQuLTiuyOK62QS6lthWrxBCdkAXs7Sw7CzZ3EgNPKHponx7GVdg86dTs
	 qXxEnytwvpPo+YyUISVbZFDXLRXYg09+1l7c44G3qGU1eRlq1dmwvTUKOZKuJHUDVHA==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iVe+7I4x;
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.124
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020124.outbound.protection.outlook.com [52.101.61.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39631F0089F
	for <soc@kernel.org>; Tue, 10 Nov 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iVe+7I4x
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C39631F0089F
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcfZOqXbvsxBTZXXnYaDV6ei0k3AvLgXzPZCNvYlRWwy0KRuPyc+IAFHepQtTaGgFVfjrjF+qKlvT773gXDcZe5P+0sq7TMPMnJAQxF07BensgFmlRoZiEt2d8lsm11JPAk+JPVFfWR5xTu6t4w4S0LqQXvVMU/XPZlfEVRR1nOWrK3oiOBkXQV0/Yt2bZ19f8eH7ahVFYXPo9qQ2TEYhupqZwj0ApFfRYZ2YS0vK5zyksXtfIlSrrdh+xwlCAELyk+WQTVxz/MVdwIdhWiQrg5CLqvA6n4HxMYhyymnP5YWYqagBL2g3OEe/Z7bJ6JUeUfyLuzCSDLuOWP6JsOkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egeh9wioXVuyykVZxva0ZCEgPB6rpUyW2X2GvvYCQbM=;
 b=X0LBhSVuRgDFP/ZsI5xYANMwqJMRmqN1ieusseOf/UPtLLvt27hlAC43ZJzBorcNMV3R7iBh4fIX4DrVH+PMegyxMj2z9BfWpli2syFVO6s2VttTRsoCUgjPTLrCARBuFH6wVOMt/d3l6Q/d+Qq4TR1XI9PfBOPA5XiuVCUYipwokOev7PRRKmlCNLJrpK4WlDyejgeQmFtjmWZb40Fqe8MiRGSU8qSehbQh6xbAUxC1Hk4ZWbrRHrzhR+B3Gt2HclpNKtojAl+qamlN8AFWRrSKty7OUhs9fNy1a1h1WDtjbGh1BxXcIjjCFEc6iEr369cYLepf/6JLVKAiaxxi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egeh9wioXVuyykVZxva0ZCEgPB6rpUyW2X2GvvYCQbM=;
 b=iVe+7I4x7x4AyvRqob1j8M/HAdLp006+fUnR9xrNEjsUwAJTcZziDGP9pQRD6MJsTRlXd9ECEsOkG3egzlDI0TSW/d3pm9rz2FIen3DjPD50+R4reuCcV0tJeRSeYDfzJsbKrO9hCOZhsKpXj7ycDpv2ziV/yKTC63cwZHM2wT5Gqg3SXn6M6wMmVVG69gcKkaWL1+SJb1LMRZns1psOPMn/2I9qk8xNmVB7o3po4i2FRhyq/hNMwyG0ZxwDtfxBV1ESw8t5uULG0xSCRkcrggj1x3637O/afoDxnpi32HMK/6jo2bh5MLNrCiC478gZqqTWZpkhS//XmYvRPmk8/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS2PR18MB474501.namprd18.prod.outlook.com (2603:10b6:8:408::15)
 by BL1PR18MB4166.namprd18.prod.outlook.com (2603:10b6:208:313::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 18:24:35 +0000
Received: from DS2PR18MB474501.namprd18.prod.outlook.com
 ([fe80::a782:2e12:c00:3b1d]) by DS2PR18MB474501.namprd18.prod.outlook.com
 ([fe80::a782:2e12:c00:3b1d%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 18:24:31 +0000
Message-ID: <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
Date: Tue, 10 Nov 2026 10:24:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Axiado DT updates for v7.4
From: Tzu-Hao Wei <twei@axiado.com>
To: soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261028193648.73841-1-twei@axiado.com>
Content-Language: en-US
In-Reply-To: <20261028193648.73841-1-twei@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::10) To DS2PR18MB474501.namprd18.prod.outlook.com
 (2603:10b6:8:408::15)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR18MB474501:EE_|BL1PR18MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: cd96e86a-6167-4d84-76c0-08df3f57dcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|23010399003|56012099006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261028144727099003|10067099003|261102123227099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GFLqTRlxQ7EKK38JO/Qe1N5wGw5r6tqJAQDMLVDO+mZI3ZvSb03u6Y/AwMY0qAVRBKj4wnOReO4gL4JDKBAcNSUKfE8XW5VzRTS0sLOoXAmqf8O8JtFkkGwD8Ny8IM47aa2rpj0m7Azzu/EG9+ADTMoQdpjT2DlpTCgc0sz/E9QIQU2MKbYL7BbqTDBzQggj/2s7/vxVVyNG/TFbplZP4oCp2YJXSomlBZ5pCmQmoXsYeRkr0VzmQ0zKbbEFrZchhBCYBsTqVag1+Bn8ZB2VSbNglCyDAIr+jVNdBJs3FzHbJhwoBmNG/cvHPBSixLGpZsBlBRnMZmOLu7MUQV2RPwJ3w2o0RKAkM03LEfQ6fFbcu0Cqph+eUNBB0mSy477ZQ8nYtcw2nrTu4BSGnsrtyx5gpJh3MccCFFDZd+X3f8Z1fz32v9B+/mXD1TnsQFsVmIRUi4jKNHsJNqCKm/NJH/erMlFRW0cb1k/TE6KpCMArI6ztAN+q20nmpC2beNoZLmgGDLWw8NOp37ClVaJsONlDABV19GjomhP2nwDx9R/Wrf4SAnjsvdj3qWVCiTUFEEtif74IaLZf/lRGRMcV1hF1dLrWGdnrL0dSOw66DHhzMoWgfmH74hVEHWkya/3z7x4u/iMMLMTUxHwvv4Y93oYZKQlJ8BlrJtT/ZaDAU9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR18MB474501.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003)(261102123227099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlLcVhvdmVYUkhtSjZGMTVkS0Y2TUpoTDVtbjRENFZXWksvVnlNVXMvWjVD?=
 =?utf-8?B?alRzbUpFeVhLUjhrOWtUOHN0dXM5TkFjUVpSTERpVFdrcGM1UmlKVzd1S29U?=
 =?utf-8?B?VDlLc1RnTnFZRzYwZC80WktFa01leDB5S09CeGVLVXVFalVsSDVmMGFwaFg3?=
 =?utf-8?B?VGVDV0V5akE2czJkN3VYNzloSzVMTWpoazlCUncxM2VyUHhGMnU0amNDa2Jy?=
 =?utf-8?B?RzJiNG9vSERac0pOU0RNV3J4czF3ZGtUd2Fabml4UDVodWlkc3JiWW84MzVM?=
 =?utf-8?B?Z1JFT3N2eUlBajZEdGhKVVVlOERBWEJBWEJ2bFBrL3Q5SHh2RTZtdGdnSWlX?=
 =?utf-8?B?UDhFbkI5NFZCd3ZaZVRqZE8rN2hBbnUxUzFMcGphM3NYQjBJUUxjY2FRakNK?=
 =?utf-8?B?bzFDNzJseVMyNEUwd1dPYTEvQ21TMTBrMzVwT3U3MlQvQ1kyN1RtYjJjeWkz?=
 =?utf-8?B?UmlCazFtNVpoZmRpTjdqVmo4N2RVMm9RMmh1UGd0WngyekxPNnZZcFlUczBP?=
 =?utf-8?B?UHRlOHVXN3NUd3RBcmwrK1cvL3ZNM2xKMkZRdW93a0l5WmJYK3FrZGJ2SHhh?=
 =?utf-8?B?dmZwQ1paK0c5Q3pWUEdEbjhDZEM5K2x1RXJwQ2RsQmpFMk1FVkhrV04yczQr?=
 =?utf-8?B?anR2N2NSVjlaWHBUUjBTcVJmaFozbXpQeXBaV2xXN1QrMHRSWWtySjVrSVE0?=
 =?utf-8?B?dmVxUXcyRzQ5VDBDaUx6RUFMMWxKRS96N0toUWZ2dFhDQmhvOFZqUVoyTTJN?=
 =?utf-8?B?TWt3eDJFNXM1ampwVzE4a215d21jY1FwVkt5OExCTmxhd1FLTm1hajE3TnJw?=
 =?utf-8?B?SlF2UVRqTk0ySW5aQU9BakVqZjZQemxhRjZjbzc2d0Fld0dDSmJiRXJQT2RZ?=
 =?utf-8?B?cmRKdHhkK0dpQmU3TFBTNzlXOXgyU2hsYW4yMlFmc3c2ZGtnS2R0aDRQK2E3?=
 =?utf-8?B?dTNYNVg1WFdOdTlBSEdlUnNrNkVHWU9lM095bnUrTHVUeEsxRVhQYytOOWRE?=
 =?utf-8?B?N3lYK09PbmZsNFpQWDh1QnowRFlvczlVS3JMaXhRRUpjUktBcEo5cnptUXFs?=
 =?utf-8?B?YktkTEtJQVNKcFhxcFVweW9abVlIZFNaaXhjZ09XSnkrU01vUnJRZ3JYejZI?=
 =?utf-8?B?Z3lFbzh5cEVRcG52R2hxUzBqUXppd3JxWEFldHZ2OGRvTFdWZjZyS0J3amd4?=
 =?utf-8?B?dWdZNE5XVTB2VXBRbkN2YWRYaEduck16U002ZUFqNEVsOUdncnBZeWFWUnZP?=
 =?utf-8?B?UlhFRmg1emF0Nm40bXFxZWZnYzZ0QnNtRjBJNEQwS3J5NUp3ZVNhZFFRVFZx?=
 =?utf-8?B?YzgrYkFyTjFrNVQrUlRzZzhoNzZWcGZEY0o4VHZZSFlSWURTS3JjdjRob1Q3?=
 =?utf-8?B?MDdXU1RMYW1yaGVQdWxzQUp0SWQvYTd1aC9DR09aV21lMkdxRXN6T252NVcz?=
 =?utf-8?B?Ny9PWWVoRWp2QmFWcUt5RjliYXN4S2xvNDNVQ2JDUythajdOUGlSZHM3Z2dC?=
 =?utf-8?B?UFFwNlZLelJNR3RiQTdRNm1JMzZpVjhabnF4Ni8zV1plNksvNUNuaGo1T0Ra?=
 =?utf-8?B?TVh3VzJCcDVhOE1QS0tldFBKZTBFZGgwUklDZ1VZMTUxb1p3bzRWZ3pUN2R4?=
 =?utf-8?B?c2o3Sm9VMTE2M0FKeFlnR1VYSks4dFYxOVZ2Ung4WWxtKzBMZkFRWkw0Mk5o?=
 =?utf-8?B?YVdRVE1yUEwzMkxqWlFaSjFSdGVwWk9JcFVxSHdscGt4VjNHMGUvbytidWRx?=
 =?utf-8?B?ZWlYVTNVdC9qMEJSbGtaQmRXMi9FNkhObjg3ODQ1dTB2ZnA5cC9JNE9vSW10?=
 =?utf-8?B?RkFUTjVWeHpHb2lvdkFJaDFyRU1tOVlBRy9QblVicG1TQ2p5ZTcxUjBuU3FY?=
 =?utf-8?B?M3NOSlRrSC81WnAwSGJQazJIVXJINythUERjQ3N2TjgxdStaYTczUGpKUTVi?=
 =?utf-8?B?bThjWHp5YVBYcjJjb0xuVkNBQTF2czQrYTAvQXFIUXNSbUxvNWZscmczLzU4?=
 =?utf-8?B?OGhEQzF1TzY4M2haZUc4S0ZqeFJuRVdsU3NjTWVnSlFQY0tNRnNRTzlvak1H?=
 =?utf-8?B?cDRZa1NOSjZxUzAyUU9OdU9xa2ZPRXVRcStmV0dENmdISC9hNFJaZzY5NGRn?=
 =?utf-8?B?VkFqSy9XRHhuRmVGc0R3aHN5TWlJSTFheHNLcElhYWFFYWVjQVlNY0w4YmFY?=
 =?utf-8?B?OU8zQjdMTVZ1MjFoUDc5eGpkYUg2TExwb0FmRW1UUGZRbkl1VUhVemtvdSsr?=
 =?utf-8?B?VnBxa01RNjNxYWN0cGd4UnY5Wko1Q3dsRG9vNmZXVXovcWdRSlRFdmtpbUFR?=
 =?utf-8?B?d0dRUE9kc01lOVB2Ty9Zbm5pdG9EQWpmeC94bXVnZVZRaC85MDZtUT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd96e86a-6167-4d84-76c0-08df3f57dcf8
X-MS-Exchange-CrossTenant-AuthSource: DS2PR18MB474501.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 18:24:31.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmVqhTbsHql/AD2MenVYdawtfllEW9U6X5BZy9modA3uH+bUCis92PWMCz6LFdgn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR18MB4166

On 10/29/2026 3:36 AM, Tzu-Hao Wei wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi SoC maintainers,
> 
> Please pull the following Axiado Devicetree updates for v7.4.
> 
> This pull request includes:
>    Initial Devicetree support for the AX3005 SoC and evaluation board.
>    AX3005 EVK compatible string in the Axiado board binding.
>    Minor hexadecimal formatting cleanup in the AX3000 Devicetree.
> 
> Best regards,
> TH
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>    Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/axiado/linux-axiado-dev tags/axiado-soc-for-7.4
> 
> for you to fetch changes up to e728a5b8d68e4b567ea9420667450456121136d0:
> 
>    arm64: dts: axiado: Add initial support for AX3005 SoC and eval board (2026-10-27 12:25:28 -0700)
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>        arm64: dts: axiado: Use lowercase hex
> 
> Swark Yang (2):
>        dt-bindings: arm: axiado: add AX3005 EVK
>        arm64: dts: axiado: Add initial support for AX3005 SoC and eval board
> 
>   Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
>   arch/arm64/boot/dts/axiado/Makefile               |   1 +
>   arch/arm64/boot/dts/axiado/ax3000.dtsi            |   2 +-
>   arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
>   arch/arm64/boot/dts/axiado/ax3005.dtsi            | 844 ++++++++++++++++++++++
>   5 files changed, 1179 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/axiado/ax3005-evk.dts
>   create mode 100644 arch/arm64/boot/dts/axiado/ax3005.dtsi


Hi SoC maintainers,

Just following up on the Axiado DT pull request.

Could you please let me know if there are any concerns with the pull
request, or if these changes should be deferred to the next merge window?

Best regards,
TH
