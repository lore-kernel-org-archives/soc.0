Return-Path: <SRS0=5ZFb=KU=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2A9C54E68
	for <soc@archiver.kernel.org>; Thu, 14 Mar 2024 12:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5D08C43390; Thu, 14 Mar 2024 12:28:26 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2014.outbound.protection.outlook.com [40.92.102.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C8A9C433C7;
	Thu, 14 Mar 2024 12:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C8A9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9/b4C4g7gFNDDJFNs1SGfZEgYmCs9zwwmgI+aBM/EJIan5+hmLCBJOHigqlXiQg5mQEK8mqCHmOKrf7IzhwyUyTog9bhvsF6TxRO/2cH1LiT4u470L8YE78NR3jU1NeaA9PFmZGN8y/xGSOPm6NK7zfZ5ABrqsBia4iHxaNhQONvSNWCb4pMpIQKR5sL8VutnQDBYgnFjtWPPs+EMOKrEtOd7NyBkC68uCqvhrPKvefEWo0X4gWSqDT8gDqOZMoA4DcJrcuKKLYeCaBaHYAqKBsa+j3rXhnCHkzDMlEBoTkyVmFCQKzYJazEZPsku95LjvD/OzXSn5U6u19q9hiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3S5SUuV/rdljPFSNfdioeX7QS8dPq3n2OYmYLc/iAE=;
 b=mvCP/zdO5b3jh9iPZW2bildOAUKr/9TMUuuNypSkn93pB2/C0JKtipE86u9JT0EWnq2PyHUn266TzQzuEBCXRsG92F5+1+ZIH356sAAJNjb9eDvDY1Ivt4upfum3Ewbwf8vzDuW84CPRqcObK9gzBVIjJlFv2cZC4InvOviyh2xQXfpu14c6KJeiEnBlY4vABTYdyEOGrK8ha2xgpNJZXSQwj9Sg/sKtQYsTb2V+KXpGk9V9smzlHvy6nj8f8LfbnfkZ01yScyvlbaiuS+MXPJ3gETflCIMPiyE4Cp43MYpc3CUnXnGPC4096zKtLNgTit2mKveOasDzKsafqoo+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3S5SUuV/rdljPFSNfdioeX7QS8dPq3n2OYmYLc/iAE=;
 b=fP6S4EahdZd+oKJUvqLbi+RrpREX0Z0U0wcW+g+BRI1gWwrRoMFFjUWNfIKk3ZupHm4C/I0e/sQC33To0O61yxOvBjN3A+gootwdyebtGUDC27qJed2bwdBvXnxL7mhKrVasZq4AewElBcI46BRAk5iHy21ubLuowdOAM2Gn+dAoEInuzVgf8/Iu0jDxCoQ+MPB0N57GHTMRQr//o/LnNZj7McP9vqOyXeUw3Jq9OZ00dYf82Fn/PinwZ8/BVRtA//6POkLTimjZw3iIIdFGTy3I1mu40zmSbjO65/pET9fqM4d2jFMNetjFmDXIBn5/i/8cL+diBUBBPIpKwy1NIA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0508.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 12:28:16 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::64a9:47d2:ce4e:b84a%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 12:28:16 +0000
Message-ID:
 <MA0P287MB282228A94119642979A035C7FE292@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Mar 2024 20:28:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>
References: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <87cyrxt6t4.fsf@all.your.base.are.belong.to.us>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <87cyrxt6t4.fsf@all.your.base.are.belong.to.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [T5jcMnoiuDJdZENXgcpcYual/ntBqupN]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <2c5b95fb-8285-4c36-9176-63b2fe6d1be2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0508:EE_
X-MS-Office365-Filtering-Correlation-Id: cc319086-2d79-4586-9812-08dc442238ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2QQ27KkmOaKcHW17lEjMUdxw6aNcwUylQ0QrdsyB4YcIJsgDpwtir+O6jAzkMWdLjEdA7EG2GtLIJh6LCNAefgbJHOuzNAEGEmny/1wrAM86XJkz7jXrOyIy2S1DkOa48Yz/t4UyT6PL5a6GIjwaSH/tygeTZlir65qgNv7O9oly4KCL2FnC/a95+CQvu+S+aDIJGJDuIR2zOs9S1Px3wXxUFPbIEAAxPJpvCtIlIDK92Ie7X6IgRmzNrl7A/mhFdhxLDqYRhJ7My0CNgdpD+a6w4rN5Vy7mCZ30gfBQpDcd3fSa4cubdpwg6nII7F5atxW9tw6Njmq9+qQq8Sy0IDxlsspmxurovK0w2eDBS1ruemFOwLDS7NC9O2skny8BtyhEG43eE1HLPcxtcAz02W5t7nfHJOpEE6lUeM2g2I4kr9PmZzNat9AWx/3MlWmCC960csPXH7yTjr+dHtYq75j/SLAw3W+yYuAiUTTNCylvt0+P8Ud8QJlcjBMCY9t/FgUGB4QvwTsJa3k3732H4adMMrSriRrgyo/qclyN0paPIzR8k4BEnRh1kQCVJXPuGgwF/heQRiddKAuAwOFJBHFV1Jh8II1Gy086XzMz1NhK59coq5jpHfaPmwmuE/0I53YtbIqKDwelA86dX9tP1B9wHDln5PrIirbs/WcZuYY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTBwRzU0azNFZ1hsei9HQVpmUnN1YURFOUZQbzdtSDJSeERNUHFHME0yaDNP?=
 =?utf-8?B?Q21ubmpsUEl5VDJ2RkR1VktEL2Vhd0lRZFMyWk56WW9rU2Mza243RERWZ1JD?=
 =?utf-8?B?bjgwWm9oZXhnT1FBemRVSXd5ajRjQTJNaUZkYTNlTmN0WGhBSTdsaVp1RlBJ?=
 =?utf-8?B?Y2JQZzlNV2ZkVWpSMTRKSTZVckp1bkVrdzdzMkNZSjNBUUdqMjVVSExjWXJp?=
 =?utf-8?B?U25lV0c3RzhER2dLcmF0VHZpRC9LY09iUFpaU3Rka1FwdktxcmFUeS85dnRM?=
 =?utf-8?B?SUtIcWdUajBqc2UyU3ZsUnJWbUhkOG1ESkV6MzA1R3pkMHhIendGSjcrb1ZV?=
 =?utf-8?B?YllYeUE5WjJzMFhKWnVpVDhCYmRCd3JzeFE0Qy81QngyVnVKODEzZmxJL1By?=
 =?utf-8?B?U0grM0hONWsrVVhsdTI1ZjMycUMzVElHZ1VWdjYwOXROQ0hERFR6QjFIcXVV?=
 =?utf-8?B?YmpMZjlnOUxuc0N4NVlMM0tiTzVnc0VqUytoeFY2UHJBeDhJdDIweTVwcnds?=
 =?utf-8?B?dTR5VEdRWUM0VUxwMkFjV24xTVpGY2gwWWpzVWhXMjdOMUxHME1qMExHTDNH?=
 =?utf-8?B?THRoUHB4OGdJclJZOVkvdUo2U3dFbVJNMUJJbDJpaEJvckdiQXhwRmlPc0U3?=
 =?utf-8?B?TXJvTmRXOVRSWnE4WC9oWXdPck1UV21BNWpaRWRiOHVxMFVvOEhGajA1Nlpq?=
 =?utf-8?B?T2NOUWs4b1dFSDdBQ21oeGZ1SUsycDdmUVZPdW5RV0k2Um5GQmlseHNiT1lr?=
 =?utf-8?B?eXFwZjFZUFRNMTl6ZFBjTWJneWVRT2ZTSVg4U0RwZjBub3huVWgyRGl0ZzN0?=
 =?utf-8?B?RE1GRUhFZXRxeWcrMkxpKzh5dFNEYlRXR20vTEE4VFd0R0hyTVJqdWlYdHZH?=
 =?utf-8?B?S21hZWJFQ3Y2eFdtOHlMVkduMVlIQ1g4am45MFBRSHE0TDRldGF6S2hVNGV0?=
 =?utf-8?B?RWloOVBlNnVSY0RwbkJ5ckk5YUFQWTVKWVFjYnhPL2dqV0ZtbWdSS29yNXBU?=
 =?utf-8?B?L2lQOXF0VkFpVk1FN3lBUjV4K0IyR3M0bUhaWXd3LzQ1cnpmd1JwQy8vVmh1?=
 =?utf-8?B?OGg0RVIxRDJLZitLY1dlN2lCTW5PbW9VeFFvb0VTYUlXQnA2c0tKNno0NFNk?=
 =?utf-8?B?YmNoRDRhRGQzM1pySW42bFlEUlRwakNrcW5ZdEgyemVSaUxYZ1dLb1Nvb2ky?=
 =?utf-8?B?QnBtMU1mdHFwanhJTzM3YVRzbHpFcGxkQnBCTVRQbnEwN0M1TzJZSjBES0JY?=
 =?utf-8?B?VW5FQ2NkeTNDSHBRUDFqcnJGaWJSVlZUWkpWaitiTDhTWlArWlUxWkZ0VU9h?=
 =?utf-8?B?NlNLYms1KytManN2YWlSb3ZRdmVuUmptWSsxTlROUVU2ZVYvMHN1a3cwZGc3?=
 =?utf-8?B?ZHNKSUJ5bVJ1ZlFYd3RudUFDYWFiNkQrYnhlR0VqUEF6dW5yb2lPMFprNWow?=
 =?utf-8?B?NTBmQ0c1d1JLM05BNUd4a3owc0o1dU12QTBFcGNOeVVsTlpOdXc0dTJDeVBV?=
 =?utf-8?B?SXdsYWxIM1NBOUtWdzd1TW1heDY1aG9RTEt6eDBIeGhaUDY4aFUvcFNxbm5M?=
 =?utf-8?B?ZXVMQ25ybXJtamRwM2x3c1J0SHk5Z0NmWVhOYkpTY1BGK1FqbnNXSjR6UDZI?=
 =?utf-8?B?Sjc3Y1hvK3NvSHBkek4yVWJUNEtqa1A0UnNCUTY3Y0NIQzdxQm1PNWhzVmJv?=
 =?utf-8?Q?mJUmfn5GHahYCxdp+iNc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc319086-2d79-4586-9812-08dc442238ad
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 12:28:16.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0508

hi， Björn,

Thanks for your reminder. I see Arnd has prepared a tag 
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/tag/?h=soc-late-6.9 
which contains the bindings part changes for sg2042 reset driver.

Hi, Arnd,

When will you submit this pr?

Thanks,

Chen

On 2024/3/14 19:02, Björn Töpel wrote:
> Chen Wang <unicorn_wang@outlook.com> writes:
>
>> Hey Arnd,
>>
>> Please pull dt changes for RISC-V/Sophgo.
>>
>> Cheers,
>> Chen.
>>
>> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
>>
>>     Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>>
>> are available in the Git repository at:
>>
>>     https://github.com:sophgo/linux.git riscv-sophgo-dt-for-v6.9
>>
>> for you to fetch changes up to 0f46e1339ef113f0dedf7ad376452cc722dbcfe6:
>>
>>     MAINTAINERS: Setup proper info for SOPHGO vendor support (2024-02-23 14:21:04 +0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Devicetrees for v6.9
>>
>> Sophgo:
>> Added reset support for SG2042.
>> Also updated maintainer information for SOPHGO vendor support.
>>
>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>
>> ----------------------------------------------------------------
>> Chen Wang (2):
>>         riscv: dts: add reset generator for Sophgo SG2042 SoC
>>         riscv: dts: add resets property for uart node
>>
>> Inochi Amaoto (1):
>>         MAINTAINERS: Setup proper info for SOPHGO vendor support
>>
>>    MAINTAINERS                            | 10 ++++++----
>>    arch/riscv/boot/dts/sophgo/sg2042.dtsi |  9 +++++++++
>>    2 files changed, 15 insertions(+), 4 deletions(-)
> Seems like one of the commits are missing [1] from the PR. RV defconfig
> doesn't build Linus' master as a result.
>
>
> Björn
>
> [1] https://lore.kernel.org/linux-riscv/35c348437b6e18972ccaf90d9c38040caccd1f11.1706577450.git.unicorn_wang@outlook.com/
