Return-Path: <SRS0=Tt6i=JE=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FEDC47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 07:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9490C43394; Fri, 26 Jan 2024 07:06:55 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2061.outbound.protection.outlook.com [40.92.103.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 600E6C433F1;
	Fri, 26 Jan 2024 07:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 600E6C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNkStyTyfMyuSI6t94NAsR2xt4dGVnE4WkP9WWdrJbQIJdoOGH8M7kg0753W9rGDCwsx7MvoyAnHDCldPTPVZgFZAWYRp91OmCeVd92fJjTWsLnALrw8JSPpzp8EMPfRt8aEeOjZCp67KcdR3NIhH/DtNTjL6LBr7fv41Z5PTt6crZpb2VjJk3EZBN5d0Y4WkxvluBXtcfthJUfMW6ed6GLPyYoilzJaoKBdWGWiCxgSvJUemHfsdWPNqNm5AphhhxsG31pY2KdeXzWy+KT5moW74zaKMOl2KGRUWwg9X86AwExAfE8xk3rWEF3PKKBXsl1UZw80CD7TCgk2KW/Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCDsXbW7KBnY7ctSClAh3A66/cb8zqpJh5ha0YjnYs8=;
 b=QH+KqfnxC1dXpTptju6dRqTQs28ATxqwWNM/6wFDR3BhGt2QQ/FW3LhXHTE0sZ/Pwz0Wt6aoFM1FFj+kYmDE+J+hxUJCJimb/rg1gVAm4PY0vrOtZ4PCK97aI5BjbDzXNp7nOTM3ysN4lSS84WQja2VBtK6jdKMxG+XDMKClpOswwXBf2Q1BG0EssR1Hx9nrqGAsj6N+U7Gy3Dg90HYyeP/4p3e4tdc0zR9J1m0llEYozeaBP/fp/Bc7Lp571ceMLVVbF/EnE2QHoYHoSWWNaQNFZajSCY0/KMwGvofw0qw5YcpqtVuNpE4mIugGf+4JNPAaTndyzGhZBlot8yvDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCDsXbW7KBnY7ctSClAh3A66/cb8zqpJh5ha0YjnYs8=;
 b=cobusD8axCkgU2H9Lf8eNoQGy1eW1uGYjSnK0YIJ87fJy1pYw2Lir+DhDJkHo34zzFkqULMnGNH/F0Fe7podaETyoVUji8h3diwQRnU8D64W/JUl45DYGQloHOLq6WCv/1s6jwxyi2RV24fD/8+O5yFe7lgQnBnly7wFvipORiYzv7HowodkFUNmem8ImR1mv812ANlcSLieu6r0hlkJ6qHQDihjcSvlOb9Hf467s91CcceY/ZhNs8K+U3iIdHrkgZylIaasf4eQbeV65SFkUxyEIN4HRKobNOD7np2Hd1C1GBlO7bo7nwO36P/PZRXvBxn2F1Gup2uKfPZVTbPwlg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1568.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 07:06:47 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 07:06:47 +0000
Message-ID:
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 15:06:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [BKzZsWfVOdrrAU1idTvw1OuVjH4pGDcd]
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <84b1bdc8-be81-4853-a12e-cd214c972510@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1568:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cefacd-00e7-4798-1bb7-08dc1e3d5c4c
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TUAJ+JYdVcoszb7/aKzjE3jRM5/NqZC/AiASYGYXNzmm+gZNcDdF3i6c5fjmEv+eiX2jSRmNv1pJbJ4TBP+4iy5HQu23/499xgdq2lXT8uCZxjrhzQKw1p3dm633EUptKw1cSp6mTuOoLISRoWVw0DPwAHHP9iSiZTp7IFgYzdfWu7Dk6VECMDd+t0vRpJejMSELLkRcrZIJBDaYvG9M73zHECQOPs0JEDV74MRXUJZqYwbAXv/gxS0wR61gq/hccUctGNZRE5MwBwID45wB2AlpVhMUUL0N11wQ/AqjmgpLyI/dZ48fG1JD3tpVlDc2M8yzjsYDRqQBi8AxYQnvkqi++DvmQEgnIgfWV2B8mPHJh3czziKtyCbi+DWV4868cBfm9BmNCZt0RJknVGdic3C8bc4AFmmkAoOqN5/0XQfm51iQQaJD3pB0ap+P4/IRcsYdKR3h5uqq2P3gmg+mbXFYBILukgzA3DzCXpjjUsJ/eiISqg44I1rnASHnUcBOAadA3kqZ8BdgghnT6Mnslu7YGqnTgAus9cxJi9nh1XmTdkrCMfWXpAe4VmFf/5QpCfSpNslKMEspC2p0vNCyiikZWyK37gtFjibohhqKFdxFvp3vRVdjrn3gbB8RvQmu4shg0qZOJslVroVJbvJ3JOl/0vDvbzx0vnJgEEgUK/J8IDHGNg7Pj3y2C9ry+EYRQY7tbV5aXXDOQ93sKwS7WvOQ/gl7+BGd5ivYsFU4ulZ2GRCl7Bk4h9qwj5pcKX/03gNeIM1xvWtqAvEXSY0BqHcBdx4xi55DfI=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcwiwjoGWj8xRHkmbAMpPpmlb2+QhXHyQjC4vvziDaYkN9I9UBiIq98WskZnCpKN//67/di9ocIVgHEriMfcIiSeD79i6hypPjtVS2rl/rtEEUbxKz2PWXH44M0RuIGqbcsPiR0OZlohwayXb9S6mpJHoJdoUxXwtA/m52dkOHZ6KSLMK9S8PvnTQE8KwuqCIcKRD43d/F/E9+cdewmHqutmaN5PxR9JAOYxE+iTHQTKcW739eq9u7oug0IIEYAO75FAs3+qZZuk+Ygyo/YXShBr1Q134uu7j8BKCfPgCizr690dFwNhqDdF9TL4v99MX8bsuxDLpdIfzzD3Kf9aHnra882GRJCmYkeO+A77NbtVOuUox1A25hIVx6dCAVj8JZ1TrGMbeambHMjbSgff5wZkQaFadPS/BD9BrXnP0YiSheOOztbz32yXh9iMuUld2L15w6CmKSq1cqozk+dGGGvtu0I5EBLVEsfCjYMpJbDlH2qNKilMergiFE6KrrDT5cDK1AOCumzUmsnCg28cLhdS0D//uVqw8+RjXMFIl6uiQ4DejjzYlgLrl+BF1GI6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1QaGJSU2F1RUtqQzZUYU11a3hDQjZLeTNvZjcycWsyYkJkMUJST2lSbXYr?=
 =?utf-8?B?ZFlubmxFTjB1ZEJQMUJaVkl3UWtYb2JKdTdCdkY0ZDcyclN6TTV1UnNXV1FC?=
 =?utf-8?B?OUZqRG9LbEFLWVpqWWtMRzlEbHZFVHJvS2M2VHBWbVJHN3RoanRkNFhmdVds?=
 =?utf-8?B?SzNWQXpnaFFBLzE3eitleW52aHRXTGloN2hSTk1XT3lpZjlrTklSWi9VVTVr?=
 =?utf-8?B?alp5NlNENmk3eWdYL0E4Mzg4WnlVamQ5ak9ObFgyRXpqaXZJQmF4QklzakZC?=
 =?utf-8?B?MXRnV3I0ZTNzYml4Q01sQjRZTXg0K1JBanNGT0dWVkZiNDFKeEFaWmRqZHk1?=
 =?utf-8?B?ZDdieFdrOGdCYXhvQlNtek45Rk92RWJsdnJyYWRZenRxWTE4REN5TVpvK1JC?=
 =?utf-8?B?RU16SVNETWJRRzlYazg4cXUrWmovTGYyb2ZUdCtFOEY3UXRvSlZoQXJZMXh6?=
 =?utf-8?B?QTdNdXRNaWJKWUgzWjFuNXZmdjhLZ0ZNckhlZ0M0VG5NNWUrR1hoTUNkdlFU?=
 =?utf-8?B?MGtqOGxKdTdVUTA3YkJ6ejkydDZzNHpVc3pvaSthT2d1THlUYjhiWWlmNkxm?=
 =?utf-8?B?M2RaT1dFbkp6QUx4cWliQnNBQnZ2cW1rVW5NWkpQYUhkWjZHbC9PdFg3TDZH?=
 =?utf-8?B?bERBbWxRN1Blb0tCeHlnNnFUL2tXRFRxMmQ2OWlFVHF0dDljUWJIRi9rVSsy?=
 =?utf-8?B?M0xtVWk2MmVOOTVqRzJzSGkxM05CVFpqblhGRzdSTjJFdHZJUkVIUDgweStO?=
 =?utf-8?B?N2tJVHZFMmRva3JtZjV1TFN6Ukt0MG9ENFlneW9XaXV3U25oTm5scU9Ed0M0?=
 =?utf-8?B?TWZNaGpDNTFZbTB4anEzUjB6UllaWWltRlU2Nnh1dDNERU9idGtiWDZ6L2VU?=
 =?utf-8?B?SlV2ZFNHbzJqSXc2MGFMWTZlTHo1RUNiZ3lEb1crNlg4YkpYbDgybUJlSnpj?=
 =?utf-8?B?WDk0REYvN0dpQUtzTUVpNjAxWjlqNFQ2d3M0b1VhOStpb1NDT01hQ2NHUkwv?=
 =?utf-8?B?cGk1dFNBdlNzZ2h6d3U5bXM4Q2RtZ2dyVC9rcTlOQ0tOT1Q0RUdTd1JMYlJn?=
 =?utf-8?B?UzBnbDB3V3Z4YkVidzlYaEx5L0RBZS9FK0R1cElZZnhYNjF0VkRGRTIwM0Rp?=
 =?utf-8?B?UitLVE54b0k3Z3RCSStHUGo2TGdIS2xPRGpWM2NCdnQ5TDBZYVl2dlR5c0RZ?=
 =?utf-8?B?d09CbCtER3Uyblp5MndCZzJyRFY1RERldVF2Nk5OSjNLVGYxa1UwZC9JV2cy?=
 =?utf-8?B?dTB4SkJDTXhQVE1sb2JGNWVXWWZpcFAxM3lUaE05eHJpaC8xNmQzQlBiWStJ?=
 =?utf-8?B?WC9Oc09nRHhmazdvbUVKaUdxSzlXd3BVdTQ1dWxONFZDa0FZNng1SXRLbW1z?=
 =?utf-8?B?eWVPRVM1YkowaEw3UGZEMVg0ME0ycTU4WkE3bUFXMnc0NGY2VnlKb0M1UHNM?=
 =?utf-8?B?U0dWV29LN0JldC9ZRUo3ejM5RzZMWjJ3eFVLY3JuK2dpam5QT0ZSaDE0OFF2?=
 =?utf-8?B?TUJ0NkpzaVFCSUE5aDNMWHlGZmVwK3llRjJoazUzK1JteWk0VGgxdDUweUFy?=
 =?utf-8?B?cTYrNUVKSUZBTjlCSHFISkQwNzBsQmh1bkNJTHNOM3pJUnVZU05wQ3dFWTBR?=
 =?utf-8?Q?rN9Ub3u0aMv++l7mvQUqIMCakwEncL3IFTWpUa4kMaEU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cefacd-00e7-4798-1bb7-08dc1e3d5c4c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 07:06:47.1922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1568


On 2024/1/26 14:11, Arnd Bergmann wrote:
[......]
> The tag description is what gets turned into the merge commit
> when I pull it, so it needs to be something that makes sense
> for the long-term git history as well as for me to understand
> why I need to pull it.
>
> For a normal branch, that would mainly mean that you should
> give a summary of the branch contents. In this case, I see you
> have only one patch, so it's probably easier to send that
> patch to soc@kernel.org individually, with the same cc list.
>
>         Arnd

I have one question about your mentiond "send that patch to 
soc@kernel.org individiually ...".  If I sent it as a patch, where 
should I add the explanation of what I explained in this GIT PULL about 
the omission. After all, the content of this explanation is not part of 
the commit of that patch.

Should I send this patch email and then reply it, and then explain in 
the reply email?

Thanks,

Chen

