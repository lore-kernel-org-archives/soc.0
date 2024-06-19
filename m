Return-Path: <SRS0=84ct=NV=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF30C27C4F
	for <soc@archiver.kernel.org>; Wed, 19 Jun 2024 01:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE737C4AF48; Wed, 19 Jun 2024 01:09:43 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2083.outbound.protection.outlook.com [40.92.103.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05E1BC3277B;
	Wed, 19 Jun 2024 01:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05E1BC3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaDeBUZnXrmvSHwsA65b3HE2RW1Q7rfoLIWSGDBw8ifOVY/FfPqEEjS+YHaiUjZ6n6l/CS+NH69eiNRHT1S6PFj3vYtzDF5FjcbdX6JAbmzBifWDEtWpX7OZyYBFyoeM5M9ACKAnOpXXVIx6rwEC69Diw8P4uM4ztlMlNJ8Sr70b+L7E6rgg4M1PgMTlgTuTUQ894LPbHyIOb84xO3M7VANvRSsMoo23r64UqGUz/Ig8JGmw8YkMcgsprZCXC5nmUaANyMqBk11Xes1hfGeBEeuN8lfZu6aEJntS/DDpMLV2Ekd6JehtmAbZm0HmJgDdLecuILl4s+gSqjebjHJgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xirb7JEcdcZmIUnD4U5mmxJc7/Q6KbsP36kMgAQ9JL0=;
 b=N5XjYMX5ebHXdjheLX+9Wh5CBmasdnuBx6RKjo7SXf8XuuDw9AlqBphC2dPcThyGdabZ5kX0YUBrTS51xCiRM7WaDz9V/Saayy8G5fK1HXj9q8QlSPbFetOb9zYVmtjO7dAxFHo5QhVQuUQepkk2Hv1xaEs5JiVuVcESAPE2rRwYjeY/5MxMIUIJQTCMql1MMcbj7jM8DO6CQL5M8ld3ToHEqluf/B5FOGEk5UQcQ31Euqz2XnrmCFCvwsjtwxuzUg4+eUvQx6bmMcEvEffu2GCBDLv6yt0JMYGjdpNnKwqLEqMcjfs1sv6p0m82SsHf6pONQ/8d4nU2cxmn8aau8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xirb7JEcdcZmIUnD4U5mmxJc7/Q6KbsP36kMgAQ9JL0=;
 b=Tb4oGI3K564ZxQDVYrgTJD+8s5PiolwhfFR8IVcA6dSq19EsBN0UXpEIUquM/xcSCQF6u1FtOQn1LFpek3FYJDEal7y2+53z2ne34gHVhnfjWpE1i+yQSPfsBlRr80wshRwqsjkBorT2lxcVLsWk3Y22xhuODu14+iv4Do1KyIwVrZW7M+205CW4ATDQsIksp7sujK2/dGhJG64swXJ75TMPx4eu5BANUDcuxV5YQY3zh5KHOKhq4zu+sstN4R2FFeL30dBgR3686KML1wZcqfIKRbr20Xb5xkKXsf3HpMpWVgiYTLIZI5ypPzkSWuE+Bt3wlNAlDWhz0JCicJmkIA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0049.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 01:09:36 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 01:09:36 +0000
Message-ID:
 <MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 19 Jun 2024 09:09:27 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
 inochiama@outlook.com, xiaoguang.xing@sophgo.com, haijiao.liu@sophgo.com,
 chao.wei@sophgo.com, kenneth.liu@sophgo.com, unicorn_wang@outlook.com,
 Haylen Chu <heylenay@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [+VpwrIkV95iL1sOAV5KX3P2XZeHH2C/r]
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <f123e484-1703-4911-a37f-9be4ac65d738@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0049:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8750e0-5182-4764-7726-08dc8ffc7b42
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199025|3412199022|4302099010|440099025|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info:
	DgiGLkeikyIDqJqllgC1EAQUGcYOfgY30ojzg8obLr8o/GaJW4p1KC/2CCdFuTv65FJcqyKiSTPCADdYtbjmnlGctphHxneiJ4N8AFeSSBlrhmMHnujkZWguoW623r/4RMfHIm4MflC+2l464Fz7E+bHAAAzx1aET4RyNEOjwlnR355BDpjpj63jso/YJCFvQyqVRHjc5TfR+DKTvpenIk4u4oZimow8yXp1dTM6Ta8oUqOZRLLKdo9Qaf0yTPqLHAbU9r/9tS0T1IF0mWDIUWsYvL7nCVA37u8c4Z8wN1/bJ1ABCuvDMkdDnQVZxhbHS9iFaciGLI8TL2R/kHUvlOVtii17ycEroxEZLeZIMZ/P4Jbdgm38XYmBfMZIx9gjzrpWJK1VfwibhjYhyDo/3SClw963WIkWf2ew4TkupPs0Wu9aG80AbTA/rpiGoD2Th9K/qm5yEiNKV02yTGIyndRe6YvHF8P/lipMmsGXFlXlntOoC7OQvvd1FvSM6LihZiogTCvnBOWrY49KDwjkFBX9ptCTvS5NcPYeOgprJEBzLUSrVGZvU7IhfrEvcGCQzJVnCAkcvusrZKVYwcvNdRoD55FYclyWPnvbkaAZAlMQxMAZ7Rl2owlenU6lMKWfMEEHesNIysiIwKbyoMnV/FxiBTOQHTJOgsE92pDFqIp3yGWXHM6N3HteUrHglb+fNJ2FH1XAubJRN+JMTOKIhvgtMORgyVqK2fLMOeURXXs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWxkekI5SWxNYU5HUHU2aGlyKzBIblhWNG5xaVY3QlpFT1dpNnVmRG1veG9R?=
 =?utf-8?B?OXNISUxXMnJwcHN6MVh0Y0ZuemhNaDVlelhRblpQVmtYSzZ4WEh5djZUZHJ3?=
 =?utf-8?B?SWtLT3g0K1NQYndrcFk0Z0dhbzZMM29sbzVrQjVSTEtROUZDZHlkaGNsZ0Qw?=
 =?utf-8?B?RzcybzBhZVpOWjB5TGlQek9xNGY1eUloUk1wYlVWVXcrMkYzOEIyaWVEV3Vl?=
 =?utf-8?B?Q204MWt0ZzhwTmlXb0I2SzRrN2ZhNkFrNDlyQVZtTkJHalZ4WmY5MUNjT0VP?=
 =?utf-8?B?REJlWVljQVN0Qk1Ec2ExcEplQTBJQTlWdzlkZGNuZmdpWmtZemxxREt2a2tT?=
 =?utf-8?B?UTI3a0tLVFhIam0rOGRxbU94ekFORzI5V0s5azlNV1YwK2xXQmhaRWJwbndt?=
 =?utf-8?B?cG1Ea3pVQndQMmJ1bSt3UGJNWlRzL0M4SVU0Y1NZQmM2VC9mQ0tJQVpPTDdD?=
 =?utf-8?B?ODZkb3NDaFI5OXEvOFZBM2RxTjRIYXpoTE8vTTg5b1haU2ljRGQ0SEdQUjVL?=
 =?utf-8?B?Q3cwMVZrS1Q5K0FNU21JVUhRV1RHUDQxeHBaYzdKV290Y1RmT1NPTFRQenZZ?=
 =?utf-8?B?YUZYUHNFMkdoUWN3VTdBMjE0NkhnQU5wOFFTZ1hIU1hvUWlmM3YyZFRTM2Vx?=
 =?utf-8?B?cGdTek1FVmloZ1FEelBQY3ZjcGkvOFByNURCRTY2VTJpUkkzZThTREZNTFNJ?=
 =?utf-8?B?Z1VaNlBnaHJ6Z2k1czE1dUlkUlpTTlRMY3hsUUROOFpGUVBvUDgyQTErSHA2?=
 =?utf-8?B?MStvSURzQ1o4M1BLSmlpMmtwL1B0YzFWMTQ0QVZ3aWl1R1JzdDFNWHFLUjJv?=
 =?utf-8?B?ZmZweEplTE5DM2FYQTEzdWIxTlRiRm5QMnF3dGxDenN1UE5zWDJ4aHkyQW1N?=
 =?utf-8?B?REt0UWRIZzBFbXpVbjNOQ1VZdUdQaFhKUTVLK1RxbUNNR3hqcGZHOEJ0cnNL?=
 =?utf-8?B?c3JZLy9pYXc4Um41RjV4R3FkS0JHaG4zdndXSE1Fd1Q0endBMWxMY00rMTNJ?=
 =?utf-8?B?ckZKNm1pRlk1Ny90MmExd2xHQTFoa042WmthUXhvMmJJV28rYTIvcktnRmRr?=
 =?utf-8?B?bmxVZGU0ekdNL1VUUDFkL3Jiaklyakp2Qkg4SnRFVCthWjhMQmhJQ2wyWHBh?=
 =?utf-8?B?MitnblVldUxGK1h5emdsN1I2QW5Na2w4V3hGTnVJSUovR290ZDlyc1hNbXB5?=
 =?utf-8?B?NnBFb2lCclZlS2g5R1lLQjNwQkZQcHVOVVRFUVYyWWNPdi9BYW5lZ25LMFV6?=
 =?utf-8?B?ZTczSkxlakRUVUZXcjkzK3duT3FjWU9hYTFNM2pnZnR6MUh0OUtUeHhLdVVE?=
 =?utf-8?B?M09QSmZWeGNGcUJvYWRJc3Q3WHhScDBZVjVhYkt2SENRQldXYThpRnFGaExs?=
 =?utf-8?B?Q2dZcmwzSTZHNXZkbFhYZlBMZytrbzZtb1lGWEhBdEVHbnN2Wmh0NXlSazlu?=
 =?utf-8?B?N2Zob05wL3dSc0VvUUw5NHRoc3dmdlF4eGM1UFBEemNhNFhRdDVqR29mWWNh?=
 =?utf-8?B?bm8xNmI3dDFrNVhjZndXZnQ5bFIzend5Mm1tUmpVR05TM1dIYTl3U2gvQmlq?=
 =?utf-8?B?YWNVaFBEU1dCNDl4bVUwR3NKUGZzNy8yNzA3TWNTdG4rQlZSWW1nTGF0MFFv?=
 =?utf-8?B?SHNFNSsveGs0QVBvREllSWZEKzNTR0JBalBmeUhMSFI5TkxQMzZzdmQ3ZzBo?=
 =?utf-8?Q?QFl4lclmuaJOMyTMv16b?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8750e0-5182-4764-7726-08dc8ffc7b42
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 01:09:35.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0049

Hey Arnd,

Please pull dt fixes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

   Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git 
tags/riscv-sophgo-dt-fixes-for-v6.10-rc4

for you to fetch changes up to 890182bb3d00d49ccd70b0d651ad8342745a08e7:

   riscv: dts: sophgo: disable write-protection for milkv duo 
(2024-06-19 08:46:03 +0800)

----------------------------------------------------------------
RISC-V Sophgo Devicetree fixes for v6.10-rc4

Just one minor fix to disable write protect for milkv-duo because it
does not have write-protect pin.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Haylen Chu (1):
       riscv: dts: sophgo: disable write-protection for milkv duo

  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 1 +
  1 file changed, 1 insertion(+)

