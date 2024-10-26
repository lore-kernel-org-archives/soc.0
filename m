Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A25661
	for <soc@lists.linux.dev>; Sat, 26 Oct 2024 01:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729906280; cv=fail; b=EGg9loZkoUlcJlu5p/VBO55AAK9/Cpcs+dclzGBRWagOdThBZfk4vwB5JLu2/FrY3/GuBpVjr4wka6KErm/A2u86BeXmjf7lDxs0/u8g8QR26tNnJwvNGNTFHyK9mg0igGC91ZwXQug5ao2Go4UZVdDJ4kBXF+OE4l3KPjCQtwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729906280; c=relaxed/simple;
	bh=uKqcsYco5bKQ8ARsmbSmKTXofj3LQa+eZ9iBBMJe9PM=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=JZWTR5fX3mb4zPfVJ/9Hk6hv7FyuLGteL/zZWqcLQPSmMPEcnTgADFYUhvCQpDJ2hnVSYsMJknJp0K5KUMhtT4w7u0llw/pVxjhMM83fPTGvD5BuETxYcFhYpzhpE0Sfi2g6PcyCiBnjZv4HPflzgBqm0OFaUKwP/DG9RvFeyl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cNCP8BYn; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cNCP8BYn"
Received: by smtp.kernel.org (Postfix)
	id 0A2ACC4CEE4; Sat, 26 Oct 2024 01:31:20 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2058.outbound.protection.outlook.com [40.92.102.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91AE3C4CEC3;
	Sat, 26 Oct 2024 01:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91AE3C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+yAlhBddx9kxpAAFlGFAw1FYWI7/frOTl+BILdTxZ/ACybqFUK+iceJMVLVfFlnxnKMyx3+7pbXTfllGGl50Pw64ZWNvf9UBmqZ1BGnRxjNcqt1BTuf9NVuXTJANfhqA6ai1jJKNjdyPIEmmSd8kezQ6ONXUcTEmtTQqat1jcX8RsHj9WDAAsxwi9J5tGWsBISX3+4rgcYdpXIly9KIbEgmEun0VF3wEIXXFaJ7C9j8f+1SyFHAdwEeIjth5ZJo9ngGPcOfg3XVeNwtjql7XrmF3Y4ChRX2FJI8fP6jzGHAOTvBp3kBZfT2+hDdqh8nnCYhAjw65VrjOlgg0+WTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah8V5+l2+bNQl5w2WUVPf/bRj70BL79eOnkwnZ62TtE=;
 b=OlY/61QJ0mN9F/HCRmQPXDx9bMNC9bPhKC3F6eXEsV5bAadRlVVm3yF+4XK+Dxg9cJ+SeNt9p2Y4B+JracxmWW/GKquEeJIieJrG4/fkTRPeWDCTdvk6KF3zwSZwwnY9ifAuQnW8pF6qy0/gEkoNH9MI2fnlQWjXCKlFmJ0Yh3kPzHND2L4coE6do97OttFMJd85NULxCAYnc0+6/XmSM7Xyv6FKoUAJ/6mgAOxwwzahPad5MKyQ11+8DTV3+IeRUKG39jWH4rUojyQg0B2jK3t6at+hiY4lrNrF40H9HRZEQsOZyVomcIBRfu7VOhlWwQVeL/nqVe6H5nFvKoQ/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah8V5+l2+bNQl5w2WUVPf/bRj70BL79eOnkwnZ62TtE=;
 b=cNCP8BYnUkWEy7k5SvE+TQ1QbIizfGTU06UQ7BbGfq1lcRwPUjoHuwRTvHpAmEB8+6CMhKDbgQ8GiwgsRamMlOtuDYiMs9vMJJ2eFsIfRWbCl1e/SG+HXyAihMX4V2Z5FRbIH8pxIh/CCYQCiQxYQUei7RsBYCYrrmEtYNdYaY9HwRj1aPaDzUjIe3/l3tZlmI7WcR3Q2i5GJupssReeqZNPrF4nWgzx2h6/JWhuoTo0HctOhQftKjWOaMgPNQ6TbbCjoFS0eQiz77Ck8p9R9k+xMl3o9mrAnhrHSlUei1+MKVBD9IOh0SM73D3vccODm7O0MKuxLaAkxHU7QAy4hQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0835.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:177::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Sat, 26 Oct
 2024 01:31:08 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8093.021; Sat, 26 Oct 2024
 01:31:08 +0000
Message-ID:
 <MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 26 Oct 2024 09:30:59 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Inochi Amaoto <inochiama@outlook.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <da4778d7-8706-4f7e-8b2a-20420a4412d6@outlook.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0835:EE_
X-MS-Office365-Filtering-Correlation-Id: acb0a132-0fc0-4f66-41eb-08dcf55ddc83
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|5062599005|6090799003|8060799006|15080799006|8022599003|461199028|7092599003|440099028|4302099013|3412199025|10035399004|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHE1K1JYTDdmejc3Vk03YkNxMW1jeWZHVXpBa1MzV3FNMk92ejZBWENpdnZq?=
 =?utf-8?B?ZDl1bWo4RTViOVB0UHp2eHliZUJmTkpHc0paSjFZOWdUeXNIYTd5Zklrd1BW?=
 =?utf-8?B?T2dXa1U2Q0JxNGFkTmdVY2YwQ25Yd290dkQzRDd3NVJmVkdNdFNKalkwKzVv?=
 =?utf-8?B?aXlQVngzOHlOR2NSakYvSFR5NHJMdHJDMGZCeFJra2IxWlNiS1hVZ0plRWd5?=
 =?utf-8?B?MzRWUWJxS211b1c0SGZPMTZjbFk0Z3M2cFpUUUdodDBWblB5SzhuZUJSMDhP?=
 =?utf-8?B?MVRmNFlLZ2k2RVB2S01ETVlQSVkwSHh0aHo4Mm5oM2hPOFVFQkdaTWo5Tkxl?=
 =?utf-8?B?aG5ueG5JVXFCcFB6ZUZpdU5MOXg1M0l1MHRCdnRENk9WYXhMb0RXSTllc1Yx?=
 =?utf-8?B?TmNGbWxjKzZBc2RFVWR3OUIvVnBhbXZJNFIxTUU5MUJNbHJnRk11K1lqOEZi?=
 =?utf-8?B?ZnhMdXBCbmxQZSttU3ZwWjJuTlNHRUo1MmVLaTZTcTA3dUtURGZkR2lvRTdM?=
 =?utf-8?B?MVNUTDFNS1V0cFY5Um1JMWpMV2lCd0MzWmV4V29mUXA0TCtlQ0hKVWVEMDZw?=
 =?utf-8?B?YzRtV29lR3hkVmtSSGMwWHJFVjdaVUovc0tYb1YzYmVxaFlvOUxhWGJ0b3JT?=
 =?utf-8?B?cDFpdjI1NmRvY3ArN3krbS8xOEJPQy9JWUk3OGgyVlN3NGJPRHMrUDFmT3Fw?=
 =?utf-8?B?MUNaOE5jMHR4Sk12ZzRTWGVVRlJnM2xiY3JJczBOcEV2bGRQZm95THBRNExB?=
 =?utf-8?B?WFhreGYwZzBXdTNaYXBoa1NVTDkxb0g2SmdnYXRSa1FEaHlqeEFZR3FKMXh0?=
 =?utf-8?B?VVZmTHVlRVZHQ0RXSVJ5aXhYNTFkUDlDSXRabjJyMDJSMjZDOUZiWVdhQ213?=
 =?utf-8?B?endRNTgvSC9UWnN3OUhtUzVQT3JPcjRqMnJ4bVF4RlBtU3A5WU5nWlRZWWZT?=
 =?utf-8?B?UlNka2JTd1ZUSU5PQjB5UldNM1pzQUVUaFkvYUJtSTJ0MEcxOHM5eXpja3Bo?=
 =?utf-8?B?ZGRLeVdLL1AwZXllenAvbVhwM2h0eVllVTBaR0luK2gxVGlud1lvc2RuUlFO?=
 =?utf-8?B?bmhHTC9QdC9CSTBoaUlTNUpJWXhtd25tcHBrcnNSQS9uM0hPM1BPZHluOUFD?=
 =?utf-8?B?QkNVdEsrWXdHMDhMMEtvVlFFc1hKVW1WeUxZL2FlNFpYQllwMVVFZnJLYVhm?=
 =?utf-8?B?aEZUYTJHNVRkMnpQaHVMZENVZS9SRDZmdGE0T2hncllRV21QajF3Nm1KcnM4?=
 =?utf-8?B?anBER2RXMGtIRDYrak9PeThYbGZaeUZUeVhsdGNqTmdxTWdNWWtrdFdqTzNT?=
 =?utf-8?Q?KwoGpQlt4EfggZufk2tKjLphNLwzZu4KX/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnQ3L1VhaWVUTFEwMEgxWHVoa0VLcUNJMkxsbEx5S2NvVityVkR6UkhMMFJY?=
 =?utf-8?B?QUkvL0JtMkRlRE80aE1NZVBFZEcxZWU0Rmc1VjFRTXRvQSt4bDhCd0RFZE1K?=
 =?utf-8?B?M2s5NFpNaUFUU3EyaDNVMnJkbXVrR29WTklRNTdYd3JnWk1mTmN0U0FDbHZM?=
 =?utf-8?B?NTJleEUzeER1bW4yRHd6RWYwVkVNcGdLenhFWWJPbWNObjJDWitVSWgzL2lm?=
 =?utf-8?B?MEYxOU9uRGt5M0xseTJiSWtDendoUit4YTZqZzBMNjB2RlYrQkt5UG9GcTB2?=
 =?utf-8?B?SFFLdUJpcDhZQ041Vk1UTkllNG14bVh0NHFBdWF0eE4vSmNIM3o0V0NSTHAv?=
 =?utf-8?B?S05qL2UxTzlYSVk3cER5cG1naHR1VEVUWjU2cFNvczU1V09DRHc3dFlNODdt?=
 =?utf-8?B?eFFVa2VBa1RrcmhVaW9oL2kycGFSZEd5c0ZaTmU4bGdIbkd2SFpCZ0s2cU8y?=
 =?utf-8?B?R1U5T3o5V2syRS91R0dTc2ZyZUZYWkx3eUhuSEhVSXc5eldiZFY3S2FZamlQ?=
 =?utf-8?B?WmtTd29HSzFOczJ2cXJ1OHpoNEVjVWxXZG5zajNTVU12bGZiZldiamZkaUhJ?=
 =?utf-8?B?RGdFVC94REtLdDZTZno3ZERGa0cxc3ZhdGZQNUFwa1dLMFN1eDB4cmFqVjhQ?=
 =?utf-8?B?Q3ZGOGNxdnFsalM3OTRHMDFpcUVrWjkzaG5mN3QxMEhjanVpOFR5ck9YdVVa?=
 =?utf-8?B?cnB2MWFlQWdGc3M1dys1SnhxdEk3R09UTmRaSnppL01ERmwwN2ZYdmNNbzZH?=
 =?utf-8?B?T3lsdUlRanlBK2ZZUmJEY0QwZnFoYml3VEZobjc2VkJVSExia29XVmc1SVlz?=
 =?utf-8?B?VUpxdG03V1VPMHkvWWlzTmowdnM4NmU4UDdpaWJuM1R5U0x1WDdBYmtXb2VZ?=
 =?utf-8?B?aFNtSGRpQktnSXptVDhnZnJCZWFhRFJWUkVhVmpSZ2k2d0FMTkZabnVjRDVQ?=
 =?utf-8?B?NmJhdXpQWks5Q1lNSTlSZE5iY2pqSEduUFhzby9PYS9BdjQ4bkU5SjZaYldC?=
 =?utf-8?B?N29HbmVtSmxXbWFtTnd4dkdsY1ZsblhaRnA2MzFrZndlUW0zZWEvM2ZuRkJE?=
 =?utf-8?B?T2xhdldMQks5ekplWjVIcUVTR2QxS2lHN09EV2hKS0RpRGJiQlVMSXlnM1F5?=
 =?utf-8?B?eFk3Z0VMRU4wUU8xYzIzR1hyTEE5UjJvRndodUk3MW03M1Z5WUlEaTY0RVlM?=
 =?utf-8?B?UHUxdUg4eC85VXNCUHVBQ0FtWGpCdHBQUDlLdGk5SkZkYVFwUG5aRmRqZG0x?=
 =?utf-8?B?ZC9jdzJ6WmFXaWt1bU54R3Z1ZWUvOFlmbmVNTVpXSzI3K0E3T0s5VTF5S3hs?=
 =?utf-8?B?V3NSZklaVTM1Q3NJQk9kdG80K2hUeFpyQW5OcDhPbnV1VUdxU29NRE8yYlZy?=
 =?utf-8?B?VHhvYUZHY01jcTlSMzBYUURqS0pyR2J1TU1ObzU0Mnk2WkF3RHpXV0ZCR1Bp?=
 =?utf-8?B?WDV0NDAvOVpJYVpMeVJNYjlPN2kxRDFxU21pK05WR2tNTGhlbE10L1hlaUh3?=
 =?utf-8?B?b1RLdktRRVVMVkhzbXg4ZzVFeFAyS2YvQnBHL0M5emNaK3NkMkt6VHNxL0Nj?=
 =?utf-8?B?NlVldDJCcXpTUzBoVG9uRDlKZWRqS2JoMGlUalRCV0ZMQ0doSlpVZmM5cFdM?=
 =?utf-8?B?cWRreFhNajIrbUJ5d3BnZjh0OThwVnhwMFFVdkZBYnF6YXpCUnZGbzRmVjhY?=
 =?utf-8?Q?B9PivRnnb9OzOfUeU46r?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb0a132-0fc0-4f66-41eb-08dcf55ddc83
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 01:31:07.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0835

Hey Arnd,

Please pull dt fixes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git 
tags/riscv-sophgo-dt-fixes-for-v6.12-rc1

for you to fetch changes up to d99913e1b80b51a058020835e7ea1a44397cb4d7:

   riscv: dts: Replace deprecated snps,nr-gpios property for 
snps,dw-apb-gpio-port devices (2024-10-25 19:32:16 +0800)

----------------------------------------------------------------
RISC-V Sophgo Devicetree fixes for v6.12-rc1

Just one minor fix to replace deprecated "snps,nr-gpios"
property with "ngpios" for snps,dw-apb-gpio-port devices.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Uwe Kleine-König (1):
       riscv: dts: Replace deprecated snps,nr-gpios property for 
snps,dw-apb-gpio-port devices

  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

