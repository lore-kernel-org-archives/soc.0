Return-Path: <SRS0=hBYC=OS=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B62C3DA60
	for <soc@archiver.kernel.org>; Thu, 18 Jul 2024 12:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA09BC4AF09; Thu, 18 Jul 2024 12:17:50 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2092.outbound.protection.outlook.com [40.92.102.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24DACC116B1;
	Thu, 18 Jul 2024 12:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24DACC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edCtgsqUr+aaWbCYpkVK06179KAv5/kg5DhbuQ1CNl7Y7jmue2gs4u+IBCZD5dGxAUOFtyt/VFjjBW2t3vXJB4VIAIzLIYHaCu6o0uzMKw4NR1yt37TwPbDs6M1hbhbTDJZKC9cDuAG89lNoTNcslNznJhVv+LQu3FzsFmDUCRptj0T4bvmDDwMVc9njpILU9aXCiDa21n1pVg18tRykuIixjX0hiHSXqu9TjnGH0rAAXxiZ2OAlRSpQ53umc/X3txmObyJZBNVOAfESByz9EmRDpUC+jJdBaplVOdmA6MBTQrtUbAw9eLoH0D7mXm2oZN/xiyBZbj+tJYniWAb3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN6K5crG67Ww6Z2HnBXOEPMVK8sN3hJU5P1ffHrPQkI=;
 b=uuAO9VrsDzmTB4w12yZDsOLRFFWLwC4PR6uQYwZBNahiqfLO/FXOY3NbB0ErHaMZMmSsqQW+wmqPlUtKgpTsGm/VMjX9JT4CWbs9av8uKWZcfWShoX6rZ7V4ipMKm/YffB5Q0E267CsqxBFXr+0oHIw3IpKRzFAv4KvYjZVnwOr7RTdOIxvlVSagRP+0C6PWJiy1PukMXl6pPdWirxQJOpb71GdiarSLJrQYFcvNjRmxf4ewzK/UuHtTFQdfG7bTEx+DV1yuojjIIkI2QhHAiso+LSqqDrqKfMN/SHJM9hZGS19OJjpqi7vUb4aC2Zf2GnPk2SWAspVR2Mi1XKh5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN6K5crG67Ww6Z2HnBXOEPMVK8sN3hJU5P1ffHrPQkI=;
 b=FTZ9NsDteUNXwS5gH2JqYqY/+HHAsrgrlWnU/TlqF6xy+KjEtMsW/C2jNBzA5Wip5pnwcg2nUJEN1dRhLNEt/vK0xE15nrdBVT113p76yQlZXHwBodDRaw/px1xRaePCLsxxOr91lOk8O/dB4MrVMEW93NcyK+YhrX+0sYLeazxqL5FDZr95yPEOToo3wn2YbNMgfYvDRaMyhoi5lwOsIwHPwPJc4UtnCJu7GSk4IXUhht70T2HMY4r0JJJwYggtBR2ut/qAVLk1bAcuSDypmzp4eeRt5Tw++CqLZ15ZnKJmPGVnmwrclxqVJ0vH9nEZ4nkxrR8wAkF+1XsbLaOuoQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0072.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 12:17:44 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 12:17:44 +0000
Message-ID:
 <MA0P287MB28222A76DAD21778CAF69C4DFEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 18 Jul 2024 20:17:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [soc:sophgo/dt 1/1]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
To: Arnd Bergmann <arnd@arndb.de>, "Conor.Dooley" <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 soc@kernel.org
References: <20240717143016.GA94990@thelio-3990X>
 <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240718-unworn-showbiz-2fb68210b43a@wendy>
 <c6722b03-328a-4647-ac5f-d6c00835b61a@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <c6722b03-328a-4647-ac5f-d6c00835b61a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [/+NW9qGt6z9vV8SYSEca24sBIDM4hJjP]
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <7e63f97f-89db-469f-9109-af6224b471d2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0072:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d7ba8c-aa33-420b-969e-08dca723a0b3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|440099028|4302099013|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	FRvhjQNsnaxWYniWY45lkstqopV70v1p99u6NtbC8vcQvnWNgfl3QYJqp+FMtxyMaGGw/eOP0ZnlP7bnpV+hQ9ref+ApvKaUQSimn4WpmfxbhkIEjstUzYFfk78m1JI15rYmHcJfy6ieTNRj4URvRtkF/eFhcHFOVsGNhBCVo2So4J2+FZhtEj53JdduMvmym4pXuoz9uX9PSwws6dfuwum99aag+h3DSosSB+RwYReIjcQC5Cu3FyoRCqn4MsfWjdTzMEfXIY/Zs3F9PZ6fjhapW6EJTkPNunsBijWNBkhdUUyUpC2zeTpo6oC9yEcUQu56qkNFL0leR1CIK9PiftFjh59832D7WKRpsUeDKh05E0wSLeYoycSEiZzfCR8yoLL/fd6Y8e6ocZOnrb4lDpctPg/Wta9bXlJSNq/ylE3idCslHBuxOYcfdd0fIF0DGQOVcj3iUxVz5e9GppQLrR3sOMKzGVJ7J2HEl3KXciXym1RnCHtBxINfANGcVwz7IcRrwJyLQxvnGpikSc/fvKEDBxDi9+NT4YDCD4KpmXIdzzv+bzNR7hCLZ5OVezkeG8m/NKFiLXdLGHbABg5kozCeqtvfsNbmUpL0OIKkEuqIJUnqgjc788Hvb5+dGBdZDtdkm5BX5NWViM0v1QubbcojM+2lJX71oIrQOiPzNIQ23IBzzibWGxXX9a37sLMnV9LS6tAPznjGQKh4sHrb3RXxxNx0P4LsSzODnjV+xK8MOVDCGWERs/MzK4X9J5m/LmPhyiQVTM0/Fo8lPmdkgg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFuZVFkMkJ4amI3SHNoYzEzaXVIRXZYL3EwVmZEWGRxY09ncXR0c2x6MHUx?=
 =?utf-8?B?cFpsTFgyY0RaRVc2QkNPWmRpamJnRWJHZDJqV0ord0FqTXVoT1hZcktkSkgz?=
 =?utf-8?B?SENyamZIVHJLV1BPUDVmV3laSXFJTGNIVVZ4eFFxQk5XZXk0VWt6aGRqMnFP?=
 =?utf-8?B?anU0dXNLd2R6SXdzU3hjSmhZRlo5TWIrNDQra1pxWmltUjU4K0pNdzdkMzRp?=
 =?utf-8?B?SDZ2WEdRL2xpQXFCQ1l0SXFIeEVQY20xVnU5YmEzQnVhNTdlSjR3SkczUmM5?=
 =?utf-8?B?S0s3MEYrN3hmNjYybm5DQ0l4b1dHZjRGekNyMW8rdUgvdjlndDEzKzdwdDBW?=
 =?utf-8?B?MVpYMkVNQ3c1bnR6ak1mVHpBTGV3QVRLdGltTTlTejZWbEZia25vUTdUa0pP?=
 =?utf-8?B?RW9WRXBpdWljTXJJSkJBL0ZqQjFNWnJIN0V3Q1hvUlVURVpNa0ZoVlBUeU5U?=
 =?utf-8?B?RGx6NjR1SVE5REIvTjJoN29LTmFYTGNiQjAweXBvd2Y2VDJvY2ZxbGpQbStx?=
 =?utf-8?B?LzdKdkxOeUFDd0szdys4Vk12V1NVLzBjTXZRSUdOb0VUMDh5bFZaTlBGNTl5?=
 =?utf-8?B?MXRWUmVlVGwydVJJWFFScFd2YjRzUlgxRTBVcXVNeXZUckcwQUlSUVBjQnNi?=
 =?utf-8?B?dkFpa01OMCtudDNyOUN6bVRXNGFWYzNRT1VWV1FqdHhLdFdtQTNlbHNtcmdQ?=
 =?utf-8?B?NE1xcFlNKzdyenJyU3B4TXhtNEUrdkZpWS9aYW1nOXpJdGJXaXB2dXFQTkp0?=
 =?utf-8?B?TDM2QlhvVjY2Y21ydXRqUk5ISGxmY2ZsWHhmUWxla3RjZFJYMTlyUUg5azJk?=
 =?utf-8?B?UU9VTnJVUkorWkV2VFI4eFhBbGdNcnZtTXFGU2o5SWxqY3VnZ3Jsc0VTS09x?=
 =?utf-8?B?QUdFSHUwYll1a0NFZjNzeURwTEpUNGpSckszMXNraEtTVzBWYUpQLzBvLzhP?=
 =?utf-8?B?ZmtuU1ZnY0pNczdjQkVRbTk4ZHFPNUZFc2xydTRJSGxCaFVZVUsvb0EwVjZ3?=
 =?utf-8?B?eFhMQnVqVERZV1BueFpDMUhXcmQyeDA3K3dVQit5TzUxcWNtbHBma3lBaTRh?=
 =?utf-8?B?NElFa1BBamNHTm1uVWJpNGREU2tmanpTc09LeDZvVVptM0Ryd0MxMG1OSGRO?=
 =?utf-8?B?MFpFcUsxVGtzOXNPaHQ1aG1pUDYxNzJEbGVyUkJMdjNXeUJVRGV2T3hzbml1?=
 =?utf-8?B?L0c4elk0ckhIMDNiRjRVZm9hN0V4YnpnYTNVSVZhOWhEd3lyMkYxT2pneE42?=
 =?utf-8?B?ZFBrRU5pYjJHWUJFUDhqQ0Z6eWZPZEcrQmhWaVMxMW9VK0F1SG1pMHRHU2h6?=
 =?utf-8?B?UlRGRDRWQklJbDFrQm5vSUNTVVRLVEFXSTdtTWkveldkU1ppMTdVM3RPK3Iy?=
 =?utf-8?B?ekpQSlZmRjh3ekw2VS9yZzF5ck0zaUZSSFI0cTBTZldWZlJhbm9uMFR1ZFBC?=
 =?utf-8?B?UEd2T2lKZk5YMVMzVXNjMHVibDBEdThqZm13dndZbTBzcHIxd0I1bzNmYlYz?=
 =?utf-8?B?N3A5TWNnOENRWll5UnY2UVhZK1BvcUNVM0FPNTJtYUdJb1YvSjVvNXBUSFll?=
 =?utf-8?B?cFNsUEx0MWJqRnJCbHFsS0RFR3NVVWJ2eU5lSnhwT01RR2VzQTlvSUJyUWw1?=
 =?utf-8?B?NjVFbnJpNzlIS0ZWQkEyZkozaG5BanFFNzA0QTIwOUVyWXRESlFSWExYTVlq?=
 =?utf-8?Q?boO3M+KwLQsgzYs3YfB3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d7ba8c-aa33-420b-969e-08dca723a0b3
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:17:44.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0072

Thank you Conor and Arnd for your input, I have learned and will notice 
this next time.

Regards,

Chen

On 2024/7/18 18:10, Arnd Bergmann wrote:
> On Thu, Jul 18, 2024, at 09:21, Conor Dooley wrote:
>> On Thu, Jul 18, 2024 at 08:49:33AM +0800, Chen Wang wrote:
>>> Do you have any good suggestion on this?
>>>
>>> DTS changes are submitted through Arnd, clk driver changes are PRed
>>> through Stephen. DTS sometimes depends on driver/bindings, when this
>>> happend, how to avoid the syncronization issues when merging into upstream?
>>>
>>> Actually, I have seen a simiar issue on reset driver before, but this
>>> problem occurred again on clocks.
>> What I have done in this case is to apply the patches with the binding
>> headers on top of a -rc tag from Linus and use that as the base for
>> applying clock and dts changes. The jh7110 stuff is an example of this:
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-jh7110_clk_reset
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-jh7110_initial_dts
>>
>> Both of these branches share the exact same commits for the two
>> bindings. I have heard that previously that may not have been acceptable
>> to the soc maintainers, but so far Arnd has not complained to me about
>> it (although I have only do so sparingly).
> Right, this is the normal way to do it. Some maintainers also just
> spread things out over multiple merge windows to avoid the complication
> entirely.
>
> Sorry I didn't catch the regression as it happened this time,
> I skipped some of the testing I usually do and relied on just
> testing linux-next, which in this case had both branches and
> did not fail.
>
>       Arnd
