Return-Path: <SRS0=fBay=KI=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9247BC5478C
	for <soc@archiver.kernel.org>; Sat,  2 Mar 2024 06:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4916CC43390; Sat,  2 Mar 2024 06:59:16 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2071.outbound.protection.outlook.com [40.92.103.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B372FC433F1;
	Sat,  2 Mar 2024 06:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B372FC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obbzivr0la8PO/QVyq0Iq9VzkO/kNi2S2ogA1oz2J6vCiNZ/813/MZwjoRBc74ZFmQWVZahcgIvKNsYtnoC/V5BcZHn4FVddLd9CU965CdKjrQyLcv05ZikLJsXRemvb8ocM0CSmDZMZiBCi5V4+uIknrk4b/sqYfHRGKHqx3N4F3lfbSVuDF2+bAbPnOIh1bKv+bpNFHJzawTmIjohmVa0wJGUmurmVAXPrU9KVHb1TvWSq+Ow5h2qmSjD6G8ntNz+bBy6GE3EZowB8uEJzeFcV3aendtDLKIKBC6Ot/+9drcrwyGKX4co2u90uqAoktUXH0M8VzpI99i+ce7keTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b56zwoPQfW9pL4Nl+JxO9vnBzGdJJFqiKmRydqX/ckk=;
 b=OhnX5DEnuCMVPaLRZFtA4eNxypHm9jIvVsPu83U33WIn8xV5yNWvWUiqnJnIAGPX+OmaI/zc58r+RN11fcWRY3I9eWFBFdkAZ4NyUkpv8UHu0/KvqPDO8H5MyFLXAgJ/KvKeEkEtEd6ncL3cL6D75+IvXAtp6kktPYJ+hkvQO4XFVG+BXY+G8EJfHaTk6orEtA8mbOtjkbI/wzVS6uxeJ3sUKXPY1d2YFLXksEsS6oOR5an9pENB6D6JfMiqH7Pqj/gbEPhBOf3i3Erwq6XeUdyUxe5D47iopPolcTwt5zOORfuxI4lk5zC4rleImN66b+fKG2MwQ519aRTchjEwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b56zwoPQfW9pL4Nl+JxO9vnBzGdJJFqiKmRydqX/ckk=;
 b=jhjoVNx9PR8RNHbZbRJ95pskr0PIJgYh9v3YwhrhOv6NvZ7Nc/61j46OCIgBnZ6a628E3bpS93R8nX1BtzmXvQvLYGUkQ9QY1Y1yBLB3QcBM0b5RuZ2v85gV9v7UMQl0mleeXGocAoC3xbnDIWyV4Hjc6GWNozfiubBrQR49ZIZiryHIPWz/r3YF9VR9jJ2rY+/eKdMVSETMJT/RkOUHMEYRi5ZxAHv7JTa0IGFaJlPfbsc2uMK7/GXZJi7+jyOlI3g3aXDonr954biC4iOr+yuGyJKv0B/DBK0OilXYyLsE6K6631IncHg4IIMOp7gW9l111C73wuq5zOTCr8pryA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0852.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34; Sat, 2 Mar
 2024 06:59:09 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::c5cd:cb7b:1a2a:3126]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::c5cd:cb7b:1a2a:3126%4]) with mapi id 15.20.7339.033; Sat, 2 Mar 2024
 06:59:08 +0000
Message-ID:
 <MA0P287MB28227FF4ED6457FD4C771C71FE5D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 2 Mar 2024 14:59:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>
References: <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <b2bfa163-3695-4d92-9bcd-1e05dd4c6af3@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <b2bfa163-3695-4d92-9bcd-1e05dd4c6af3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [mSlpUsyH/I0jm9G08ehgxH6jJLNnuAI3]
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <bb5df506-a936-4bb1-8b3b-bac109e18da4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0852:EE_
X-MS-Office365-Filtering-Correlation-Id: 84663f36-33d7-424e-4099-08dc3a8641ce
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnp1Zl+T4aq3XJ04gbBGeL9yhLsG03v7X0+/ZkV/GzRoX2w5Vmbq+m09YlM6TYBcloVqQzokki8/PV8y7o0U9uS5gvMC43FGILA6MO5xxW/mGLVCeQuCElsm6pvS40t6BX/wCbc2XzgEm+SXEwQE+6Wdi8TXecKAF6h2aBFRZvoT0tnpvWDTq17xLPd5pdIrySXXacRL4tBWLzSN8oSgeC5YAd2HjxvuTAGvkBNqBNRHr1qRbSAf7xVtc0kxydH/Jgzfe4hyhq73ogABw8++BrDiRb+n3CTt2uF+EpmYIFoJUNb0e76Ft3L7j1YjEDwheNBOjT6CLIMGXUvIVgAqcmXryeY8JmQ/cUIKfi3XS08GmppdB0ozGZCWo7wo4z/2PVUByvbiGKN/Cf8IK8zc0jtGqSnVGBnAONZrzCNM3sSIoGhIy4UU9bpbezPPCiGDvOaJIiIQyo3d+N4YrJeAquTzwaxxNzJKZZpNZs6z1fqMkkPIhR9HMy7fP/ucy1hcA4PdiodRN95qYkgpLKFycq2JNI1h2oHVL6qRPGHBzCHnkXB/89IPiR75pyF73JkdHCe3pyvvDiQT5q91Ow2irJxz0TCBC6adJS3OU2uOPJYYrqzsNMVJ0W3DIdSBQSczaknbSJwgAHdWXKHdENx3N0k77K4G5Cb8+Xzdl5zqsHN2F4OvvI8xey78n1/eSc88Xr3GZcW7xYAzqAe4uRV5kQH1by6xcxRRxzouRGZxAx0PxQlIQFYzdGY0PRs7q23eGYs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bWHawzEySVgNG8/qHQyCDGj9Rj6t3HCv6waOVay9DE/j6r9y0g1dH4rF4vAWiOVjrYB8eKMOjS0xHdAROwufHyUS6Hmaka2R7pvSkZTTqMxvSySfMeqTOgGFDblS91bKMs5iLPcpsDlI/w0mWHqxX5Shj3kBTTd4Ln8LRRUDUuIAy1VLYze09+o4AAawLbJ+a4glsHgq5ENObmqMyxF74YMgivWL01zj53Dvds/H6QgrohDXDLKKi9GPU0umPwsNDQdbbiL+i+msddPTabzDvgjCTbe2FJRqv+EnIxfh1Lsy7knfyYsEKzgXDvC1aEYT8T5F7vk37HqouSNiAjFZ8K9aOd2X/PbgmOIMl7IB+NRdOxofgaj+D6N+7y8egh6sIrwQYelZ8rooo0qCnM5E8On3rYQ9ZBHPBJJa7pQwDbW3spW1FEKpfcpX4SgByhgTxQ7oblhzA0BqMIpC8MGE1vVq7PR2ARXPi0Eu4d5WlJYN7EcnaYVR6GTa0gCTQSW/xaD9x+0gfAOkLVfHArS43q0ViLQLGWNJZjxcI4b3r+tV6ARy0J4nZScvu3vI5Fng
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2dReVIwNnFPdmY4cDVCYm52cnRqZlJkU0ptQnRCZ3Nja3pGbDIyakpTOTcz?=
 =?utf-8?B?RGV5UTIzTHZtZnhXU2R5N2pOT2VyYi9YRnVBdHpCdktXUFZTTGpYNnphcE5m?=
 =?utf-8?B?WG9GZ2hDcXlCMkVsa1U4ZTZNU0xPVm45dWN0MWVPc0lsQXNpdnA1WUdmN1JG?=
 =?utf-8?B?cFkrTE1RVUtSaTRHNDZ3d242dnI4b2dZZlowckhVV1R0WU90b3VGQklwVVZm?=
 =?utf-8?B?QjdOaXIvM1psYlFGYnhObDJGb0tBMk5DbDc1QXREV2NpUXdQTDZmZTBNZW1s?=
 =?utf-8?B?NE4vVGpJcHcrbnpRdkRmNEF4N2tpRllhL1kvZWM2ekNHY1JXeWxxT0FBMWk0?=
 =?utf-8?B?WktkOXV3UjY4djNPYVU0MDNEOXJIc2pUT01nZTRnSnNKRmVrcEI0cll6aThB?=
 =?utf-8?B?S2p5MnU0cHRYNkNUeVJjcGZHcUxkakF3bThuM2VCanNKV0RnZDdQZzM3eTdN?=
 =?utf-8?B?RUcxVnU2aXBCamZWZ3VWeHd0N0RyRkp6UHRYZ1NQR09Nc1I5VlBLL29OaXF6?=
 =?utf-8?B?OGd6MXh5Wmo0akZOSHV6dE5FMGM3YXI0VVU2VW83eHFyNkN3bytRRitjeVlj?=
 =?utf-8?B?dGhiYStjbzFrVGpzWmlDOUM2aWUzRjROQ3R5YzMxczZneUtGYWhYemNhY2VS?=
 =?utf-8?B?aG9RTjBZM3llSkxlSklMb1UzSjNtZElYUkwvcE5GelN3Y3lCSjlxNXpBOE5J?=
 =?utf-8?B?dWY4T1lESEg5RWxnaDNoUzJJYXJXS2luVXNWcWNRR2Q0ZkRiL3JUWWZCSnNq?=
 =?utf-8?B?RGRrMlluZHlvSGdRZUgwandnaGlFY282cWFTd2pKZ3o5SVAwc3h2VlRKMGFG?=
 =?utf-8?B?Q3ZLYlNqZ1ZkcHhhVFBZVDlTcDF3anh0YmdUREtuc25aT3lQMGhacHlvWmtl?=
 =?utf-8?B?b2gyUDd0U0FWMUZDaWt4cWVGSlFPL3ZSZlpndVM5czVZWmRSWDNMckd6S3Mz?=
 =?utf-8?B?enBwYmdpbmt1N3Fkdkp5cU5odUJxcVltNDFWNjcySDlBRVlSbng1MzNSUXFT?=
 =?utf-8?B?VEVGR0EyM25oUmNLNVMxcmp6ek9KK1JVUkRUUWdkRXh0cElzK0oxeURqWFox?=
 =?utf-8?B?aW02akp0ckR3T1p6cWxHMFQ3MkUxaXdaOERmZUxQRmg5RmxSbHI3V1dIZVl3?=
 =?utf-8?B?S0g4STEyYWF3Z2lRQ1hSOUQwRzFQODAvWVYzakx3cmdPK2JaNWVNR3JTaFJN?=
 =?utf-8?B?dHVGaFVlR21RNHZna051VVNGSzF2cEdwYmZTMFVaYTlLZDZpdDNMdk0vUUda?=
 =?utf-8?B?Z1Rvb2dCZTRydXU0YUlXczl6bHN6aWlDbkZYeVhXaVVHb1QrY0ZGY0FQTlBZ?=
 =?utf-8?B?VE84WmNXV2xsWWI4VEM2Q1lFcVlpVFZ2MVlHaTV0RmxDVGgyQVJ4L1hieFNM?=
 =?utf-8?B?MGlUZGtuZFFxSzVXY3o5cXgva1d1V3NqVy9CWjRYZjkxeFUyZEZBYWNYallG?=
 =?utf-8?B?ejR0akVVWGZOR0VMKy9WQUVKSXFJajR4MXBod1MvMkswWVI0cXFJL1ZBamRk?=
 =?utf-8?B?ZHk4Yjc3aWxWYkNuNisxeWo0dDlnNnY0KzBiN0J4QlhzMFc3ZUJ3R0wycEsy?=
 =?utf-8?B?dUJkd0l5SFRmRkJWNFB2OGpIVEZybC9NbFBVbHFQeVlDSXVCMDdqdkk0dDUr?=
 =?utf-8?B?TmtNM05ZNDlYc2VVK2xseE5vNWtoa01lODY0WjNRdlliN1pBd3VaRW5XU0h2?=
 =?utf-8?Q?BXx4KFh+aUuOHQRcmKUi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84663f36-33d7-424e-4099-08dc3a8641ce
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2024 06:59:08.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0852


On 2024/3/2 2:00, Arnd Bergmann wrote:
> On Wed, Feb 28, 2024, at 09:14, Chen Wang wrote:
>> The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:
>>
>>     Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)
>>
>> are available in the Git repository at:
>>
>>     https://github.com:sophgo/linux.git riscv-sophgo-dt-for-v6.9
>>
> This does not appear to be a valid git URL. Can you resend?
>
>         Arnd

Sorry for this confusion, I have re-sent, please check it out.

Thanks,

Chen


