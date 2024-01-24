Return-Path: <SRS0=lVhs=JC=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DEBC46CD2
	for <soc@archiver.kernel.org>; Wed, 24 Jan 2024 07:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 424B2C433C7; Wed, 24 Jan 2024 07:50:55 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2017.outbound.protection.outlook.com [40.92.103.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88214C433F1;
	Wed, 24 Jan 2024 07:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88214C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHxOg0oOBpbe/iXhtHmRYKBhxcYVZZv2Pcx4yHj4OmkDVxlqbUKPmc+T8Nl/nY+9GwOncoj3lIOcx8KuCqF7SIp9IckSA8Esdnhtpc0HJTMcnQ9jApKYtc6U64uJHvCBVbxQdnnd3iu45UFBgPw43r1jYiDyE2C4/4tNIQFzXMf9i8QD0//O+QXO3tNT2Qiroq5oezat/T9GgppXp82/z/SXTZ1LCGCxm1ZMis8Av1n2zM2g2Ze3Hkj0TBuzBrPMdyhfaFTxAS/+iq5sA41kVpnmkoiT9K7Br1H4fKmjEH8YNLG2/C3FO5heb5F8O4hKQN6BuJt+nY2HHEvn6HkkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij/+loR4YO4tUQ+DbSFFSmlvHVO6lUF3XW+pY+nIfMU=;
 b=chMiRHQtCNPRaDnawuqMIObo6VV5/W8F1SvJusH+MiCDL2ngRv3gh5zpsQtYgY5ApDb+UmfnFibPhcWNJ7nTjCzL3C+/OKa+zChMgdyQ4HKYLKVo2jmrL79+/EZAP9LRrXqLmmrO7cW7L+VMb9hMagQXuA+RMsVM/GNCTvbhkZlf6t83il5W4FkLScyeNroDRbSKFZZJfHF/4GbNiTNAYYpjfUyvoNhsg6WwY8fo/YQLXpRrGsG0WCUcGLwUxgxJQ5Dl6EI9b6V2v26hwYt8t4NnWs5iZD+C7x538v9SDCfKJd9RiqQgVd0HhhBUq3fF3ccECUlHdfW5mtemn590TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij/+loR4YO4tUQ+DbSFFSmlvHVO6lUF3XW+pY+nIfMU=;
 b=pnzJdMAR3vWaYa2K+WjorE0PlK1d6BSu8YPLgN8qz2fFT1dzr8wo4/8cHweMbxBVU6QplkYMj+izYcyxHDvN8s0pQiEXZu3CUVd7nlg29kmnwJ2zVatk5dBN7UH8LjFrIm3DLbenx1HzT8/UqLxMj/mtX/i/TjZn1Ea6n5n4LH3fkbWt2kgnstjZ6C6GEEtAArUw7Z9iRUyKrMDexVBcQQNmKJV5zCLXWzL083goSiPfYPqSd1NWbINw1aLupoCmiBTvorqvfOt676xqTJBWdwn1xYA4DFOuoyMYaaNPmavGYFkY14+HGdivchbvSCJ2RbeDhmCZyif7Aar6cVa+rQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1154.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:142::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 07:50:47 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 07:50:47 +0000
Message-ID:
 <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 24 Jan 2024 15:50:44 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [b+f6lx+Oo62ew/EpGBEWKoI0ykSdycZA]
X-ClientProxiedBy: SG2PR06CA0185.apcprd06.prod.outlook.com (2603:1096:4:1::17)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <e897fa5d-8b9d-4781-b349-2c357a5f71cb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2dd1a9-9ecf-445c-12a0-08dc1cb12d57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BnS7FPs9yosOoM8Z1oLNJB58ccoy7SkxiSzssUAjbJlnmZkeA300U+Hk/oqnuWdC8cEDERxjsVRfjbYw0BGOsV5/6gBGiZ8a0nrze0S3/io/DV4USp07jxnSQBYkopwnXOstEOv0DGLJs75tejb0wA7QsqCCk/08ENRLvSHmI2TojMF+HdQhbhAMkpIedNaozPKES8Fw5G2jNQwze4YDKViqzby0S13zG7Khi/VdvOAaAjrsE71wMzb9URB3twQOW8f85xCfgpTCWVgpOK9UwUmk5Ns7WL6fQcfqdeP2okgxyO6kql7gUfRCgwGHnmDXCOr7ULLD3SauqCdVUfrs0vAZT+WYTX00E0lyN5VNg6XgKuV4UsnhFoFG7PL5lGDwPm5+0zcFW2D1QVMSJ8icvZHpzUo4C2y5wdwUXACN0rGU6zz9J5nGAsrKxDDBpgtdC0dmUcm/hH0n714H1ksXhKaVAu9iuHwDQ7+OkPOSIh/XX/xE9OOK+gPd+BgUFnYS4d76th1JOdpcvVAV3dD1VkSMluMZTVvCiEsWZehNSJLGzR6mLvILs39ZYM/BL+rr2NP3fhJF3xSwy7VCtsLsIS3QqMUvNXkz9bDymNnI61LCLIY5xSWW5KjTuunYbDYCf4uXpEQZXGbVUQOm1T9e5sTn8O1dhoYElZ4d56oZUmw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnBJUGdKZW5uYUdyTG9URjlZS0xkZTl0OWg5MjQrODhlSmxQdlRFNTJpRXdj?=
 =?utf-8?B?S1FaR2hjS0dsRkFQNkUvUTU2aW5jUW5tZVFZM2IzZHQvekhJK2lwSVN1N1g2?=
 =?utf-8?B?V0NtUnNPTkRNeEc2VUY5REJqa0lkY3V6ZVRuZ0NsamNVVUJyTFhvMTNqenJO?=
 =?utf-8?B?Q3VGWDFVR2FZRXRJUUVyNk1nb1pxRjczaVJQczg5NDFQRFNxSXpRNnFJOXRa?=
 =?utf-8?B?eXNrQ0tHZjZnVjVPMDNLVHo2ZW4vUDFRS0pqblI2S3JBbHREdzlWbnU5SytH?=
 =?utf-8?B?N1o3bVl6SE9Od1BTSEIwaEM4bWRXanJjd20vQ1V0QmV1Y2dvdW05aWd1NDB3?=
 =?utf-8?B?U2loc0k5eW5NRDRLYUM3aW1wK1pkQVZtdlB1bHJLamdPKzZXdjROOG9YVjNF?=
 =?utf-8?B?Y2tlKytVT3BzS1FEOVVHZVZ4KytVTVNsbWF3NWY2S01PZDZLU0dFelpYNW5E?=
 =?utf-8?B?RHZ6ZzlKeGhZWGZTcW1lU2RSa0V2MldLRW85MElNUDBTbThjdFhwR1VzRjBi?=
 =?utf-8?B?TWFWMXlTbHhmVFg0Vi9yU2RCUSt5cldzZEcxZkFhNkR0bGdxdGNBOVhmOWwy?=
 =?utf-8?B?bHQ3VWZ6TlA1RkpwOWlHYWphVDErdFJ3ZGMzREJoSGFpY1pDL2lSZkJWcTdn?=
 =?utf-8?B?eUZaMENocjdTVmNFMUZlNmZIbktzNHpiWkZPZ1VFWWR0OVgxWCt6RlZQL2ly?=
 =?utf-8?B?QVp5UGZiYituclo4UWt2L1g1V1dDTlhCVHV6TVFuQllyRzNIa0MyOVZiU3ZT?=
 =?utf-8?B?bGFwWld0c1J3UnFtYThLaVNSUnpyTFlibGtUWkF2YnZVQmdlc0oyZTdEZy9D?=
 =?utf-8?B?UG1zRTI1ZmVvQy96SitCWUZHNzVndCtBVE5qWDJvc3NMa25XYlRobE1yWTRV?=
 =?utf-8?B?cDRLcXNWN3AwUnplTngwQmZJbXRTZjh6cGUvYUtScWg4Z2NOK0VPYUJQMmhS?=
 =?utf-8?B?bmU4b2NWTTFGYm1QVlRqTk9wczhjRm5wWmZsWXRKbDY5SmNPTnR0cHhqTW95?=
 =?utf-8?B?L3ltSFJ0bHE3SXRJd2dTYVA2TUxvL0xrNjMvMUJ2cEtqdHp1K3JKeUVXVTRi?=
 =?utf-8?B?QTRVMlN3NFhlVnZEYXBFalNxK3E2R2U0TXFPbWNyZXdFaGpvUkJ6NFhOSURZ?=
 =?utf-8?B?Y2FmN0dsV2IvNER2NHZ3ODhqZmxPVmYxRFRlMmVRWkQxaHd5aC9COUlOeGE3?=
 =?utf-8?B?YXRCbStLWWJNWXJTY3ZVMDBFaVlVWVlTNnNJaEZkRlFuZDRXYVBxMHdsTm9V?=
 =?utf-8?B?TzR2Q3FNNG05citjTEt4UlJEL0ZVQ2lVRVhJNFZGSmtHVjEwb2w0N1RYTTc4?=
 =?utf-8?B?YlA2MzlUemluY1VHZE9OOFQ5UFRqMzUvNWlnODdjZ0pKSUd5V3R2MnNESnBP?=
 =?utf-8?B?TGpQeXpWK3hXVE15dDdiYmxyMDdKNllUYlFzSGl5a01zUG5VbnRrSys5ZVYz?=
 =?utf-8?B?Z3AvOG5aRTJIZXVWdm1kR3VjVnB6dmlGVk1lUUFaM243c0RvRWpYMHYzL1RF?=
 =?utf-8?B?QlBoR0c1ZGVSb1AxelJvR3RGSGFvVlRVYVdlbnM2SzJtbmFGMXNrR1VmaU0w?=
 =?utf-8?B?MnI4VS9wcWlyTndIeG93cW9xdzhncUxoZmlOREkvQVNCem5RVkZDaHlLeVkz?=
 =?utf-8?Q?oO4q3JiO2F38L3KNAB/q1HmV+9Q941u9ZDxEDHuzxrQ0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2dd1a9-9ecf-445c-12a0-08dc1cb12d57
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 07:50:47.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1154

Hey Arnd,

Please pull one DT fix for Sophgo SG2042 based off v6.8-rc1.

Thanks,
Chen.

The following changes since commit 
6613476e225e090cc9aad49be7fa504e290dd33d:

   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

git@github.com:sophgo/linux.git 
tags/riscv-dt-fixes-sophgo-sg2042-for-v6.8-rc1

for you to fetch changes up to eb37a1537da8c92eadc6bde026c18988b00892c1:

   riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint 
format (2024-01-24 14:20:51 +0800)

----------------------------------------------------------------
RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1

This patch is [2/2] of [1]. The binding part [2] has been merged in 
v6.8-rc1, but
the dt patch [3] is missed. This fix add the dt patch.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Link: 
https://lore.kernel.org/all/IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ 
[1]
Link: 
https://lore.kernel.org/all/09b2fc2f-dde9-4f43-9704-d8053bfc85cf@linaro.org/ 
[2]
Link: 
https://lore.kernel.org/all/IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ 
[3]

----------------------------------------------------------------
Inochi Amaoto (1):
       riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit 
aclint format

  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 80 
++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
  1 file changed, 48 insertions(+), 32 deletions(-)

