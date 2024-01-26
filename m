Return-Path: <SRS0=Tt6i=JE=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62967C47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 07:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D135C43390; Fri, 26 Jan 2024 07:15:24 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2056.outbound.protection.outlook.com [40.92.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5620C433F1;
	Fri, 26 Jan 2024 07:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5620C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvGwX4JhJNbglQtW/SNE4U0F2x1XB5Dv8SIncLUQ30x5f2qewfyvZA8r9PHulv9PDFsI1F8gM+czp3MaqXthi8TFgeujjjCnPmhMR+KSUQdjw2lYPGH3PCPlR5qarjdyVUiOJfm1Mi69u4viibN6tJX2L24yBqouN2Nvd9WeQbij80pFC1DYWuuNk0/juJVrFkXl9oiaDp7m4oKC3sTij1azGSjnkFy9d7nAah1xP/nmZU1vddvAmJQg9ZzcFWmso2wFhlrA3RNcqs71yE6ep2bnwGH4F9RQYOV/THbpqiXu94ayGvj7Jb7Gta5IaLkJDyFLfow6R+sxOitWISRBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OID06eAKq60bca4onDEPuQSiOOpjo20QOM2+tInLlg=;
 b=a1JJxn8e2UjT2eRgNgaAztNWjheftBXQIzc++vcgQA6p7tiSk/yPWhOmv4gyYmGt2Ma7Q/0deoYZzkqbQMWRGW7kSszHRHuTR76xr6M0N3nFZbXY46Nlgmw3QfrLJuO2sbfq1gUEz+1SpGBX+2kZy6OUxKrgPLaoZRFOe9XzwVzkZPMaaNEeOoBsYr0BhH+63OUP3Dr9cMv49jkU4ECojXypHYGMaZe1HSSE4M0E4MchI0yUP4Dv283X1Y2BvboyaacKagJvltL+HMYS6ZxL+10ZJoNn1Oy2JCUe8B6+y/y/oSBBj+W7usl2BGMFqL85C2O1vMmXHabY0ApEVD77sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OID06eAKq60bca4onDEPuQSiOOpjo20QOM2+tInLlg=;
 b=AXlLBPevfqC3+NlBGfrqnUktbd5MMAZ1QHLegqVyesUkIT1Ev0eYp1H/2zYU8ahwuPCnZo1usghju+BC0kyabtfbqB6Dt1p+7NtKwdkkdYmETnelk32sUHnL3X7exq/drG6FUNHdw3pciTRSdL8ugVw6P9YmFLt2ZS1QwXW5rLvN4UExvDJUKRTGj+CIPQS7Q6uyP4nqBY3zNA6UVlD/oTWa+JZz29VqARjXyopD4r9LH/tIKCKaC3jJ9ZksfKPEet0SvWwJcRj+s+UBA1vj7G0LA2t1zhIklraIyUXCabFgTIZfBY/bsmW43WPfHxdpSUceKkvGbqQNCu98SPpuRg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN1P287MB2722.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 07:15:17 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 07:15:17 +0000
Message-ID:
 <MA0P287MB282250A029A60B633BEC8917FE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 15:15:13 +0800
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
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [X8dpbhkeNe1WYLINYOVYSfonHwNOTaEl]
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <0141e136-dc97-461a-b24e-8493dcdd9f89@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN1P287MB2722:EE_
X-MS-Office365-Filtering-Correlation-Id: 142c4830-6985-4078-f22b-08dc1e3e8c25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1LiI8L1neV0qbB7vBBAuF9fxRylzRMccbknGHzT9CLK1pWJgBlwNP0hdZtT2sXypr6JMXmrxdlcJPsO2xtnbmm/vsyVlZhfOi6TAsatkJIqAf+8z1VaO3Q0Ih5dk/CM4E5/pgivyLa0K7HXVLVXxbZqicXwhYS5crB1zWQnRvU0L6p/XFsrMrxSOQXv/TqZDFsRyesczyWs/l0tTQvkzzkORKW5vCMRbulDkfKUhe4mJ9IuJk1ySwqcgZEGyQkUF7+VVRwDbwWbTuSwXo4tJ4BWdBYSsZm+yjqnQE8zHeJI38Iun8k18JLvmNLvmE2w/7YbtXn9nG2no1jvlbKggZmESgY12BpsQtfs+NUaSGfKehmVSC0fzZ58MuK7KjdZaBXvNXxMJw4un74vP7EQeVbUbgLK9vkVfAgNzV732XSI8kHew5GuW2vxqVcxPaZsfGP3me44m1Eld7RVGirx9TRh2QrqumkDQUjloWOPCT5ZQLjLAgUrgi6QnO20yvawjnK+RVfN388NnThmYnuKFZfa17n3Xirm3pGyRL6lnRte7G0d/TEXv9oZT2+4GjGxc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVY5TkJyS1Z3djY3MFFCajFKZWFJQTdvVnNybTIxQ2pVR3h6Y3VrWjlxWVJB?=
 =?utf-8?B?MGxZa09TSk14UFVzeHVTUUUwVTJISnhoeW1nTmoreURYcGJCdlIwN24vR2t0?=
 =?utf-8?B?RzFRc1pkbHh2NG1nTVBlVm5kaG83bytEMjFxQTl1dlVMUWg2NFVxejJHWGx5?=
 =?utf-8?B?bU82MkxNMExDNFJwTVFCV2thTWVsL1BUZVFKRm1IR3RqQzFidVFYLzRtM0dy?=
 =?utf-8?B?V2kwcTI2M0tabDUvSllBeHRlZFFmRm02eWMxK0p3OUN1TnhQbGZsbStLZmQ0?=
 =?utf-8?B?S0FWS1Yvb1gvZXlSZzJBOGpiM1NjZnhmUEcvSkE1a3lzQVRCMFJ6S3lxdWZo?=
 =?utf-8?B?clMxNXlUNkwzMkNKTVB5T1JVOUl3Mlg4NU12VFRiUGcxaDZ4cTNaMWNuaDc1?=
 =?utf-8?B?RG9qazF3RTgrSThVdS93NEtWOHh1OTZqb1hncll6cVJ6UkVqWVdjZXdvWmNr?=
 =?utf-8?B?WEloVndnSjR6L1F1TFArS09YQnhIcHA2c014ZXcwdUZFVlZxdXgrSW5yaGFs?=
 =?utf-8?B?VDdFTDJrNjBMMjZVZHZXdldvNUt6Z1hYWi9RcXRPU2hyTTV6aVZ0cEdwZi9m?=
 =?utf-8?B?ajVzeXdvU1NKalhzSUp4T3ZJUWRjbzV3bnkyb2tKeXNNSE5XYzJMREF6ZEZu?=
 =?utf-8?B?dHNpQ0dIVkIycGlyWUsxT0J2dU8yOFE1bTN0RTRYL01PQmg2UFpQRVJZa0Rk?=
 =?utf-8?B?THhzbUx3bGFheFdTZEViTlBMQUQ1SkRPVHA2Z2x4WDdHcWc3b1BIOXhzWC81?=
 =?utf-8?B?L1RUQ2lLbFVPTXYyN3ZjeUJ2UXA0aG45ZkZaSXN4elQ2R0xNQkFhS0NKOERn?=
 =?utf-8?B?eFpyazlMWUNYVDVyNE4xYTlpQzdQdkFlUnhvTm5YRzBheGpSdnEwckVhQ3ZL?=
 =?utf-8?B?a0F0d2lyVUp3cVk0dUd4VFI3WkpoRmk2bElibEJTaVIrVkNvWVJLR3dIaGRY?=
 =?utf-8?B?MkllSTNnd2MxbEVFczVraitGM1UxeUFRNktGNHg4dkIvVm1wSDVKTG9YT0lE?=
 =?utf-8?B?WmtNQjkzc2M1YlNjdUpVR1kvaHVJTTNrSFZ4bnpDVVZZTm5sY3VmYnVEM3Bq?=
 =?utf-8?B?bW9LKzdGby93S283OGswd2lUVFdwQklvbmZYcFpaY2tFYk9Bb3AxSisxaXR5?=
 =?utf-8?B?dGpaVjU4YktaTzlBNDA2ZUtkaEJsbWQ4NWpVclFUeXVFakd1VDZEa2dzTS9P?=
 =?utf-8?B?TmFLWk5wNGp2eVhnQ2NKSER1SVZtM1NrZWNsY0lwYlhTdjArNHJaYXpOeCtQ?=
 =?utf-8?B?cGN2VGxkSTFMMFJWVWhkMlFlc3pRc0I3TzNNVzUrTVUzanVoWEZUR0xGSmVp?=
 =?utf-8?B?dzE5UktHTi95bTZ1WnJyU2FvQUE3SVU3dVhvRWpTK3prK0ZZS0VnNndZYmEz?=
 =?utf-8?B?UXVwM1lTU1FjdWx2ekFqWkdjWG9aUzArSThsSnhIR2M3TkR3cm1LNFpEQkMy?=
 =?utf-8?B?dU1qZGxJOURoRWhocWxkTkh6bU1Zd04xRE4wbEpYaWRXdTVjTzhRQlZrWVMy?=
 =?utf-8?B?UVVISUdBaUY5QS9wRzdiUjRBWmlKM0JMVWNGcXdlMmJiRTFLTEFEVlN4WXdW?=
 =?utf-8?B?V0pocm9LMU1DaVBKM293TS96aVluNEZ2V1pvdG1DeFB4cm1aOW1XWEVOV00z?=
 =?utf-8?Q?p2xdUEJYURPe8jORTAxB1Xnsy9w+vXT1ZEO6mCsa3vMw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142c4830-6985-4078-f22b-08dc1e3e8c25
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 07:15:16.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB2722


On 2024/1/26 15:10, Arnd Bergmann wrote:
> On Fri, Jan 26, 2024, at 08:06, Chen Wang wrote:
>> On 2024/1/26 14:11, Arnd Bergmann wrote:
>> [......]
>>> The tag description is what gets turned into the merge commit
>>> when I pull it, so it needs to be something that makes sense
>>> for the long-term git history as well as for me to understand
>>> why I need to pull it.
>>>
>>> For a normal branch, that would mainly mean that you should
>>> give a summary of the branch contents. In this case, I see you
>>> have only one patch, so it's probably easier to send that
>>> patch to soc@kernel.org individually, with the same cc list.
>> I have one question about your mentiond "send that patch to
>> soc@kernel.org individiually ...".  If I sent it as a patch, where
>> should I add the explanation of what I explained in this GIT PULL about
>> the omission. After all, the content of this explanation is not part of
>> the commit of that patch.
>>
>> Should I send this patch email and then reply it, and then explain in
>> the reply email?
> There are two common ways of doing it:
>
> a) You can add extra information below the '---' line in your
>     patch, next to the diffstat. This text will get dropped during
>     'git am' when I pick it up but is available when I look at
>     the email.
>
> b) You can send the patches as a series using 'git format-patch
>     --cover letter' and 'git send-email'. In this case, the cover
>     letter will be numbered as '[PATCH 0/1]' and allow you to
>     add the same kind of description that would go into a pull
>     request but won't become a merge commit.
>
>         Arnd

I like method b) :) I will re-send it, thanks for your direction.

Regards,

Chen


