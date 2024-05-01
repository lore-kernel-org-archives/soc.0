Return-Path: <SRS0=vxp/=ME=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD479C4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 01:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A3B0C4AF1C; Wed,  1 May 2024 01:31:38 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2083.outbound.protection.outlook.com [40.92.102.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FEE2C32789;
	Wed,  1 May 2024 01:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FEE2C32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFZ4gYj/X7qUKWRSIWbMsA/Pq5uBIjfrQ1zQBgvkebcWUM/PYv5sJVZE6RUOCbvd1+q7ZBHVVD2y6nQtY19566aK+2gsnHU2HXa9NKF0xJVWHQ0x7cFS/0aPvNfx/YQo+6B2cVXN9B6lUwxhnCws+w0EAENb5e3X9MtcyEl80yiHRArcxQX6CxJ+HTJTcvPoemuu8ECZ4iRDDE4oZeCEQZdEzht4aMT2sn598syRxfkXcjA9pNz5FzIW/ovd6r+r4ZB6TffLrhV2JTm+zH7iWAv7NhhI2vt8Ny8WFGyBYddyVhYlxAM6kVYNK4EI6K3gsP9TqoXFG9JXaUAxk/nAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alvjw9KL/T5GgEmRBdQMmxinaeSv24nXXncZPQFpX7I=;
 b=hvSbpFrhgwvTCqiAmZqziRlTj/Jd8x4XAeCXc/IHhSM6D3z8N/LfENcLMP6+vuWg5TWw9CXUuMHXIwRmc5Ikn6OON2KMSRUdYYctJzyFqqFytFB4GBeoaTYV3lUvV256cTYWn/LY2zquIbDPzPUFy/46Xi01KhdwSxAoOjod3CxTp1OUUDMsBh7aNGBiec2mwh4umvue0PjX7TQpkCTHDM7gGSkFmRJjrnRUux8C99UzCjn5u9dDEAD481o7Pldp4HyQW56QawJtv2ot7Ixt1N+hWzMPonFD2rYIAqHccQlswd0e9ry7QA3WxPru9BJ3KR0PkjfGkoQF43Q4ButCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alvjw9KL/T5GgEmRBdQMmxinaeSv24nXXncZPQFpX7I=;
 b=dvnPYwjj3RGVm7N4+aXDFdoRKF++6RdeUBoWxlymHE1Q2i2vs8B3nSVhTxXy1ivH3F2szOfD43ZkO+tnk3evdKb9NMPWIxLSwBUdFgCsPMDMEaElk7dsO1FwLRczwNBVMBSwI/wKz3fj3bJSlD1Cqsgw1asGiDbThAhRX8WGSs0mCjwwPzYQJEKtpJqngNXcChaqjtCf5bVLixLHQGhfzgNrqHUu5fbTNtU0B5KC8/otZwqqERpg9wDOANiJG6eaS/imHHHgCUWbKTwvEEeon04SPPNJj3id+6uY14r2LgO3CUUZyHDfNnkNuGTLSUAXHQfI6mjPPZjtfaxe9GIp9Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Wed, 1 May
 2024 01:31:30 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c%3]) with mapi id 15.20.7519.035; Wed, 1 May 2024
 01:31:30 +0000
Message-ID:
 <MA0P287MB2822CA2DE757787D6EA3B1F8FE192@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 1 May 2024 09:31:27 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv
 <linux-riscv@lists.infradead.org>, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>,
 unicorn_wang@outlook.com, Jisheng Zhang <jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [+eMMbRyzxATB1wdUfMf6ue22vGJVPS8T]
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <2a228454-7d12-4ab5-8bc6-d307e4a9b9a3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: 854ab0e0-2032-48bf-ef94-08dc697e6d4e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info:
	bMx4bBH3VeU1SVXlCDyAAhC92y3gm+/AFvt4/XUaeAcB0xu6eX7CIpT/uz5jZk+WVZn9GbcDk2IkALxO6u32ol/feMYRx+31jwxDEevau68xjdII61xgirN0VMnWD2T0VZdI+72dh5XRN2Uox+cKVOWsub/sFTK0EPwGgrqbUhydWhWMB12OzGBv1cFrSNEku9T/kKEFoPs/2AId8rN6sr6bVbZirmnbiqj4CVsydRmaXUYDnqqCjwH6dq0vIUd4zfWb+3u+R/AYT58U+NukMV4t0NkKuQVixO1pmWInvbqed+mxgwHuOI0okddzrvO+rcdk2mPlm7EOgfRfG7ajAYVPxiCGJvUeE3pHNi66vyYmsvahlsj3MIWn7MVyDIQJzaBhQ0w2YZnHJYahuysDdshePOg83keGWV9TbW1dFGI5vDa6Slien1Y6VMHzmkOE45y6eiK03aVJjHdac6UnWCREvyXtZcJvaVNZ37dQg1lRxyEJmRYEntiaEWoyiy8PHh41rcSyUqg8cPQOIxvIFjTmrzV2GtS0mMvNiSS4aW/dIqVr8pis8JNgzmXFo/FgAfKIZmnoUCQjriRojV4SKXz1LvQoDkPyXpKbPfQR/7II7YH/mCTtL7259YonEREMP1HXsOyBlXyzRV1YTjTUpPSjNu8NMjunKFTtKVmeGM3n1MbA3nowU2cmgjiehtdr
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWFaNHFxdkhuNkV1UFN0VWREY1VEcnUyRmNOWXAyTjk0eHRDRGlQRzd0bFZ1?=
 =?utf-8?B?TmxnVU5QbERFNWF1TVhvQ2pLTG9YTHBuRlBLWHhqc2VTdE5ydlRQdzJseFMv?=
 =?utf-8?B?RWJpZ2IrcG1NTG01TFBKTnZlcyswZXlmRkpZUXlVNitKSUZUUE1pNzF6VXc5?=
 =?utf-8?B?NDRza3pqSjNkV21VU2xpcWl2K0E3Um1QWWpGcGhLTXE5U0lDREZIYkljYlFN?=
 =?utf-8?B?VlF0Mllnb2hGazJ4bTdNNnh5cVBMYzNrdDVyb29lUnBzTHNleHRyaEhaNUZR?=
 =?utf-8?B?QkJSZzhjczBMTEd5SW56ZHA1YXFxZWlaSlRrTDRvYmt1RVRLTG1kNXhVZ252?=
 =?utf-8?B?NHlzSFpTZUFXNWhSeWY5eHJyYlpQL3puRG5HR0hMbERheVJ5Q0x5MXU4V1pG?=
 =?utf-8?B?YzM2d3BCNVp6MEM4SVhvVnc0U003enh2SmE4dFFGWkRGZWlnQXJmbjhnanNy?=
 =?utf-8?B?aHFTQlN5dWVIeWRJeVhHdkRBVkduQVRwb3V6cDlOOWV1RXRxTzV2RWVSeWdO?=
 =?utf-8?B?SjRKQWNrR0huVjJBUjZ6QlVzcE9WbW5vKzc1Rk5tcW5MNnhVdEdJNmZSUk1l?=
 =?utf-8?B?dXVHdDFzTUlwSGI2UkxhSGhKN2FOV0g4QWNSTSttY3k3VDluNWRZR0xDVUdS?=
 =?utf-8?B?bXdJaDZlSnNLRm1jUVcrZUZ0djdzWUpIRmZ2Y044NHZyUGJKM2RhMWdGRkZi?=
 =?utf-8?B?aS9YVUZMNjZmQ1dYYUt0aWg3c3hVdXpVaDJFa2xqUmRESytHbUd0RjFKQTF1?=
 =?utf-8?B?MHlBTFdEMFIyVmdzU0t1TFZoakJ2MEsvek5qaEJySmxFcGtWTnBkUHgrd0Uz?=
 =?utf-8?B?M1FvdXpwSVU5YmQveEdPQy85dlJXempJZkdlZTdRRFA5R21iNXJCMkZpN0pz?=
 =?utf-8?B?TllFaHlkaG94dDk0dUxsd0Vsb2xQVS9JcU0yMFN1amtyNkQ5dU1CanU3MEU3?=
 =?utf-8?B?U1hqNjNGSFZCdldBb3hFb2RlMEphU1FnQ0czdWlqQjErU2lkSmZuSXIrUDJn?=
 =?utf-8?B?SWVWamZvL3FiY3RINTZMVDVtY29qSEpaQVZNSmZuSm10WDYrM3p6ZTJzdkhk?=
 =?utf-8?B?ZXE1cVIySExNRit3aDRodzFITnh4U1dVSm5yUmxpRlJwdWRldXlxV2JiMzda?=
 =?utf-8?B?YWY3ejJRSHQxRStHc1Y2dk1wRzFicVpDN2NWeTVTUVNEcVdqdTR1VjE0djFC?=
 =?utf-8?B?eFB4d2hMZFhJRTJVMW9OeUxLK1V4TC8wS1JGcE11aDRCSldEWlYzbS80Tkhq?=
 =?utf-8?B?alVUTGY3ZFJoYUhLQUxoNlRFWnVhajZ6OHZ5aFZoWUd1enR0QVRGc0Y3dVZw?=
 =?utf-8?B?SnhDbmpRWWE4VTB3YTFIVEptMFZPemUzVCs2L3JReG1oNytBTDdJYWMwVFFS?=
 =?utf-8?B?Z0ZKdlRZWDlEV1NDNzY1TytCeUFWS280ZDNqckpnMG5lK3N2cmEzR1BVNUJQ?=
 =?utf-8?B?cTMvdjFscmc2NytMVkdQeTBEaHZxWkpseENtaUJVbUN2MEt4TVowSDM4VWwy?=
 =?utf-8?B?Rkd1NjJOMzRJOFd1YndJcGtmK1V2Ymc2dlExNXJ4VC9sWVJacUVZdFQ4TEd5?=
 =?utf-8?B?UFRNaHpqdXhhdDNlOWltb01wTVJZbURBYXVtejVqaGxqY1AxQzhDb3RoV3pn?=
 =?utf-8?B?dHRBeVg1OUFUYTlFY0FEdXF2TCttVVgwSER4Y04yd1pJR0dQS0hwVWNQbUFX?=
 =?utf-8?Q?nRClX0SkvLb+nA15UbK0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ab0e0-2032-48bf-ef94-08dc697e6d4e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 01:31:30.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.10

for you to fetch changes up to 1eba0b61be72506549e79dd11a132b5d73aed094:

   riscv: dts: sophgo: add reserved memory node for CV1800B (2024-04-23 
16:38:09 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.10

Sophgo:
Added sdhci support for cv18xx/duo.
Added clock support for cv18xx.
Added clock for uart/sdhci.
Added spi support for cv18xx.
Added i2c support for cv18xx.
Added reserved memory node for cv1800b/duo.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Inochi Amaoto (6):
       riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
       riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
       riscv: dts: sophgo: cv18xx: Add spi devices
       riscv: dts: sophgo: cv18xx: Add i2c devices
       riscv: dts: sophgo: use real clock for sdhci
       riscv: dts: sophgo: add reserved memory node for CV1800B

Jisheng Zhang (1):
       riscv: dts: sophgo: add sdcard support for milkv duo

  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  20 +++++++++++++---
  arch/riscv/boot/dts/sophgo/cv1800b.dtsi          |   9 +++++++
  arch/riscv/boot/dts/sophgo/cv1812h.dtsi          |   4 ++++
  arch/riscv/boot/dts/sophgo/cv18xx.dtsi           | 132 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
  4 files changed, 157 insertions(+), 8 deletions(-)

