Return-Path: <SRS0=/5Mf=OU=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A01BC3DA5D
	for <soc@archiver.kernel.org>; Sat, 20 Jul 2024 01:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F07D3C4AF0B; Sat, 20 Jul 2024 01:18:11 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2065.outbound.protection.outlook.com [40.92.102.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28CD0C32782;
	Sat, 20 Jul 2024 01:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28CD0C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9ZLpkrjwHxwt3AA3P8/YyXQ0C/zSVmMjcC+B66+5IuwK8y8uke5h7/wXB79RDh+saMqXM8lAG6H8EoKjz6MHdrWqwZ2JLGAAbenmFNoI+x1gQgHm/lYS1alUFz5085CrtjofsvCfDJbjaruCcevUgqDEkpN5If0i3l2nWmZdNVPKoZykAnzfWxwYxsnT7fx/AOFnUX7QFUH9dEXFxv/cbmWhx6H/dh8YKDNfOW2mhprsAyJ2WBT+z6EXN+fUkTKqNZ82ZCa2dd0vD9/p5F2Gk/x82ESCS/M9vnvpLmu2imTEbZSKierewJBmI69kmcnkI2Ofn9LZOiyjF0Un44fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8VNnkIOGbMxqHTbIR/RUFGPcAaudtjuoZm+85Q2MS8=;
 b=S8nBpnsPW51WrbviTSJpsG5tZQ44beO/2jvbafh+XBgKVoKoClROcxbn5evhyIhGHK8by9H1wav1LDTP5bOlHu+UEibwOA4mdUoRFH61ZL51phKZGAmEG01NNW7lizkyqcjw7gYqOl5t4b2DIwAuLsljwIGTfhKCypakdWM+E16XmtHYQmwId//Q1DMD+bNBooVOQL1yTQz9tBsyiONkILLyoK2NQDkkKuYKjHHVFc6d7OjL8bJ3drJ5z2WRwta2NFON3qt6TX1Yhq194Mcq3Kjtmk60Vjx0Vp4OrNDJFfwj0GyMvvk+onk0Id+Ig2fPviqXkruJzXo7X84vVcWxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8VNnkIOGbMxqHTbIR/RUFGPcAaudtjuoZm+85Q2MS8=;
 b=kHNK7vBpQgBDyNM0DBoKpABSkHswkZOg/5ZCTI0L3pXQGkGedi3289VUrLLeHbYM3E18Ufwz6Cjix9CbRbwY8hHtZfHmJTr1qqEdX4tnqX4SzJJwZGGOmDQpUfC06dhQRmh/3gfdZnqD5oRAEBMekla84S2uu5TlO+jvMRUo1RzCkNIOmuzenwCY+Vfp7zpdtT1/3/ytJv6WkD3+xdy9iZbzou6nkhy+2JvPHoEEr/1ZUFK2VCZRv9FZP8Sl8szuLucHhfbBCTPeCWh+yK2zrw9zGBmEI+ErBNxpMD55SBpUjagzv1mQv4iRT22+asRCQQmJkia/jMI+tgk5p9s68w==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1637.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:192::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Sat, 20 Jul
 2024 01:18:05 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7784.017; Sat, 20 Jul 2024
 01:18:05 +0000
Message-ID:
 <MA0P287MB2822E262E322C6519F05C553FEAE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 20 Jul 2024 09:18:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [soc:sophgo/dt 1/1]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Conor.Dooley"
 <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>,
 soc@kernel.org
References: <20240717143016.GA94990@thelio-3990X>
 <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240718-unworn-showbiz-2fb68210b43a@wendy>
 <c6722b03-328a-4647-ac5f-d6c00835b61a@app.fastmail.com>
 <MA0P287MB28222A76DAD21778CAF69C4DFEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240719-species-fastness-a7030e42d314@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240719-species-fastness-a7030e42d314@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [+IRmAfxKMjsvpXYQDCSGgMB0ujgu2pX9]
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <1022d567-f63a-4ee5-853d-c27cd64f428c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1637:EE_
X-MS-Office365-Filtering-Correlation-Id: 2282f741-d27f-4253-5638-08dca859ce76
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayGRYaI4Y5jHNKItMGAuH0khK5wtDoyoJe6Ytk5zRHoAowqG3fYNRQcK3Ll/A9C0GLcn98Kxgcmgj+q2u+yjlLCLv8oMMbFi5wMZ1fe6d8CZpIbAphyrt2IuZ3NJlX7KAiXzGoTbH03bzp7LmjR9WaAsAHJL+3HFiOjOaPHHxCG8n4P86RYRPD7S+Ten8mK101dgjFv+AArhSb5oHqerEgxJW0c0wtj41ulIMbCtqgU+2saYpGv0skLmntqEp9fZo8jIE9ef2qxUTL9iVlaNVwsGXXaQVXVwdw6XCSL5v82l5kyz/v+1cA8Ldo+dBBiwbcXrtYVaGiBonWerMgfIhQs76HahsY7vTZL+4p0IKbA0EyERaK5msTiYqy84QI6zP1WljN2JjmUdcPY1cHDhrdNB5+Kyi61IC/KHgkHFhSylhZopcGN2tXnOKkkiXn+DJgVxnNZfdJzvXP+sidCotmYUN/Q1UTuK3MwElyFnxQdSFr8zL+Y1fTVNjr7qaAwEhyTNsObtmAvDyzlPG0kwXbw34R223GPLBsjgMV25U/fdqRqCWVJyrbAkmqihAi46y/v5NStPpuLL16hCd/QK/4LUaA71/zMcBJs9kMiZ1Eo2FIERprWeFXmUwHEZ6jWPtr7mpyxeIcjNIfAblyK8N3CrQm6L1cFlHH7Fo/6O6g0HJDximRt54dih0AagJRQilgupYbTAzx+RogBn/MEnZRLhT7NJw5k2Gc8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|4302099013|1602099012|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	H1y+0+IWaHVaf8yvJvMqRPR2s08nqmnl/2DrCaBegnuSctsZ5LybFRuumUxMEQ9RGNsI9nZ6tWa7wKRJiQCAAcP7edUYbkl5x9MvCxTSNh2emY9NVson5i3rEKd7is5thXSm6P9lVQ+PuKWd8Uv2nTZQcrhzQkq60ogfxNmcPK7P5aL14LqJGAZCqQ3itNQBlVh+qEQpFshMp7uEZ6h56++xEoc3v6zQiRSCQFchdzvWC1tsfRVTixyiBBVmDnowGO01lkxmoGYdS66UCqrIAMMo3ttdckj54sFQLkI07xGJFFWtG4pKM+E0k8/8WBem7mWp6m1QUrTDFaP/fUlqPpGFcrwpRyz3bIWMVusELA1+FSlzCdSu0OljUVsjfFI/7uQwG5JDxc4T+EIdU+bmVepdhGmPGWykFxgE5LChphaF8SkHEp5tlR0/QThJamMXnZStPRnKo3IwtVJXKpouACsvGk0TSmBVcxJUgEmG/8+9VlZPWGaN7l/dX21eGyQvgH/+T7h47nWQzD8VeWfnU6Fr+0Z4VaWMtU0UlZsDx6Az+ujTzTyb+Qq15i+uc2u7jiO7aUMjhIQx74zV3zPBiz9OjRsjYuy519JJj+JMct8fsN66YwRAbcfKRLG5MMH1jEYp/HAm/p3nheP2COOqzIgdglmVXKxdiIcKpLhWYjP0dnHX2Z2dKA4n8MELvdMy0m8V/f5f2jPEoAcWaajOpD8ZtSaHhrTf9R7cB18GEssf3WcgIh9T/1d0ZXxEVMN5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2xhSTRpMkpFT1c1Vm1lakxMZ05xWjR1RTgwLzVkYnlXdHRLZGlxb0lwN0tV?=
 =?utf-8?B?OGhON29oNGVoR0EyL3VuMGtUK2tIRHNNQVVYR0VyY29jZStPREw2UEovNnIw?=
 =?utf-8?B?T1o0Vkd5eXl5b1p1aldiZ1JDTzVETnZqaGRheVRyYllHNFFROUh6Y1h3MkhX?=
 =?utf-8?B?aVdaNjU5SmVQODRqdHBqcjNlRkdMdGM3RFlFVzdYc3hpT280Z2lmdE1MZDFE?=
 =?utf-8?B?Nk5GdmpVNlB3QmJ0L1lLNTd3bzFpMldIdEFrYTllam9BbGZoYlNoalZwUlVz?=
 =?utf-8?B?ZXFURVdrNjVwTmJIZUtzRmZvQmlydUQvZEpBU3JtNUJRYzV5aSsvbnZ6b1FN?=
 =?utf-8?B?dEs2UVpocWNoK0hrYkhSNEdKRW91TkdsT1ljRW9Cb3YzZ2x2Y1R2TG82OG84?=
 =?utf-8?B?dlVzcEYrTm40VG93Y3FxaUZmVjhYYnpZVjc5WG9Xb0orbnEyMVhtREJlSzNm?=
 =?utf-8?B?UHdrVGNuajV4cXVkK3B0ZS9rbDdkdWQ3WWtGTHlNUUxtZmRPZG5kSm9ZNGpM?=
 =?utf-8?B?UUV5clpHNlFHZFcwajNxbkNTOCsxeWFlRnBLQ1N5TUp4clRjalRuS0o3L2di?=
 =?utf-8?B?SW9TSjVRRldTM2FUbXQ2ZVRYWEJWS3h5eEtMTVNCOW4vWDZnZSs3UWdUejNn?=
 =?utf-8?B?c1MweUk5QUx3STBDd0Z4ZlFEbmZoeHVHcWEwVDREdTVQMmlGTTNNek4zZ0Ir?=
 =?utf-8?B?NnNvSk5NMHMxVUk0RnBNcUtPek9sSDRrUEJzZU1pTDBoYTF1VTJPRnBFRWds?=
 =?utf-8?B?RUROckJ1T1h0Wm1pYXBuNVNvN09KSk9ncllCbG9uUDZmVnFxU1lLSXFReUlU?=
 =?utf-8?B?dnFzMkFia2IwcHdIb1lFWXV1K1E4cnc0T3JKUWV2VlduWG9xVDhGd0Npd3Y3?=
 =?utf-8?B?M1Y5ODladXk5d3RuMEw0WWtnRXpjb0xJMi82QnlGNkZIK2tmaHhaR3pHVVdY?=
 =?utf-8?B?M2NVM2dMTHdIRnpGS1R1bm1YaCtFbFpRYXZaMUtkblc5Z1lnYzBRNWcwZjd0?=
 =?utf-8?B?TUhqV0xWd1FFdVhsbHBnaUI1OXVJNGJxV1BBNDlDK3diclcyemN2akFtd0M2?=
 =?utf-8?B?UEltclBVRlBvRitIYWpKNm13T2gwZWxXc2g2aVIzd0FvS1JaL0JBbVJ0NHE0?=
 =?utf-8?B?WEdvMGUwa1M5dzErdDljYWthT250NllxY252WlU3b252bG5OMTJIeUo5S1dT?=
 =?utf-8?B?NENPWDZheWFPamJPUmFtQS9hODNWanE4ekg1S1ExZlpoczBYMnBGM3lIZlJn?=
 =?utf-8?B?dUpzUGpKS0J0Y1hxZ3gzTHJoVkJYY3ZLeklRT2tIZk1UZkUzek9RL0JHRlFx?=
 =?utf-8?B?ZVZNbUM5VTRNVGVzNXBSK1Q0cmxDTHpHbWFxcUtBVlRERWs5WExQdGV1U3BC?=
 =?utf-8?B?cWcwc0RqN0FpajE3ZythdFRZelJBL3A5aCtuZkpPMU1vQUxzYnB1TWMwUTVM?=
 =?utf-8?B?OG85WHNsZmxxQVFKakRrWERKL01wOCtNcHVhSHhKdmlIUWRJUmp2VnhmQzBt?=
 =?utf-8?B?QkczT1ZQbW9PbjIxZVZBdmpvNURhS01wbUl4ckZpRFFSOFU4cVBVeUlZN1dl?=
 =?utf-8?B?S1ZmQk5mRzRLeW02UWMvZkJWUUFrSDBFRmdpUzVqOHp4cVZwV05ObGJFaXZj?=
 =?utf-8?B?UnB4S1dyb2dpN1pZdXVob0VIbG9BWVhXV3lGazhlaVQrRU5maFNlUU16dy9w?=
 =?utf-8?Q?jKOp8NLeaFZysReoKdnC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2282f741-d27f-4253-5638-08dca859ce76
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 01:18:05.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1637


On 2024/7/19 23:45, Conor Dooley wrote:
> On Thu, Jul 18, 2024 at 08:17:41PM +0800, Chen Wang wrote:
>> Thank you Conor and Arnd for your input, I have learned and will notice this
>> next time.
> Something else worth mentioning is getting your tree added to the stuff
> that the linux test robot builds:
> https://github.com/intel/lkp-tests/tree/22f5cf2c860a5604f182f966b1f105ce1c0becb7/repo/linux
>
> That will build your branch in isolation, and will report if it is not
> building.

Thank you Conor, I will try this.

Regards,

Chen

