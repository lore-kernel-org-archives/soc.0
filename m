Return-Path: <SRS0=aH48=KF=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC15C47DD9
	for <soc@archiver.kernel.org>; Wed, 28 Feb 2024 08:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A1E6C43390; Wed, 28 Feb 2024 08:15:12 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2091.outbound.protection.outlook.com [40.92.102.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2809C433C7;
	Wed, 28 Feb 2024 08:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2809C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHaxAThhaY7yhbz8FKEUUskA2bSyWefO6qh3+aYy8kWR5pubQ/3wIETSYz+S6Xh9buZIQMjEMUv90RIUAteKbhoq5gh1VjZHSxdXnmJY28tQCQJDTQiT5WXIT+OJM/oH5wJ4Vvnz976+XwlN9yY+/d14ltfI3W70Lp8wCYB9BNdlJpeMVcjFtx3wBt17ftnC0QTkZdANw5EnKxqkHc9IhbIfqnUmW/nFTZ3uDv6YeG2yCkYR2YlmahD4Esrus1PiQPYqpE3TAtDG8OXUF5te4t1S10q8TLY19HiIFzHIzjMb5iPtF2EbMIh9ibF9bFEexkGtX9RamUA9gyLZiKuXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIv6V6h7osPR5EK+O8E2glrLKN5dM7/fSLOPIpkjjaw=;
 b=QSNyn8R+slZQwrKe8tJVDYH2PZIjHMdEW5fCebhP03xvzPzwoEk/Wz+tROKrOSVxWSQWEgKUHZO7+zup281fx15qCzPi3oheapVFF/4ArjkSDoqMUiFmiOZshW97ceJjKXyhXtq8uJXxy93+qB/diaH5kFg6J0oWzFJ1Q1uMrskGbblBZEFQgr70p6aL8N2qigzQa8NZMYZ7AzUaUU/6+SW2HARlDejMMJrTNq9Ogtsq/OEnnLMHgot+uaQXP14j6odhQ+dj2V6w9GRHQiEmJvDlFbcCo4p1c6pAwYA6qNaQwdUusFZ8b+y4XgrdzM5gohNHKiByponlvPOVk677xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIv6V6h7osPR5EK+O8E2glrLKN5dM7/fSLOPIpkjjaw=;
 b=pfZevayGdOgXa4ra/NzQ05pZXz98bhGICcGzgVyPBd8rmn6hjrjIv/t+dYQxpCU/0fSrjD3A5cUHTtCVxSsVSbO+RB8njdB4iQ+yPQvK5H+ZlM1oE/BrScCW1O7FYXYqF1GVSk3jJ2R8wKUxQMHzgpwsgAZNLuEmb6Ljq/dmzVw14xfk4cEefNz6aH66s9VWVytoll7lAmriu+QplItCcA8uB6hdvgQx9MIcySG2mUjtkAKQf38dVaOWRK/HEZ8bcAPTNrKYDAruCGizmNJbrlW2wL8Prpal1hreS7ePAIt+jJlcDox9+Emo6tofwBcjMMIUH57qQJq4ix0gl8+XHA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB3259.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:21f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 08:15:04 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::51c2:e96c:1a61:81b6]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::51c2:e96c:1a61:81b6%4]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 08:15:04 +0000
Message-ID:
 <MA0P287MB2822E853325154E87EAD3DEEFE582@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 28 Feb 2024 16:14:58 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>,
 unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [9vQloVczIxeG4AWHljXK6QNKj+Sw8Ofv]
X-ClientProxiedBy: SGBP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::28)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <b57442a1-6e8b-48c5-a2b6-11a5b59b92cc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB3259:EE_
X-MS-Office365-Filtering-Correlation-Id: a6da45c9-9e7d-47cf-7983-08dc38355d19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E250gmwgf+nbUn3/0XjNH6UQ74PvtP3WxQ0JdiZJQ7r4SRVQs/SwdIGUbm/BB+YK2XYQOkiJQdzN0xWcn0bCL1s5TyeCuL6i8EdOQdJ9wacgTwtnNgVBSx0w0cb/PQKhaS+Ak7ND7TQ+YqgPxNeZDO1WCQy4/QGOWul+2ZkFJCp8RwADfGsyaAu60KMdyEIkfAonWRvyqKeuoYpSsuuRENOZAca1Asti4YUKnqUXAqf7XjBROT8f/7wPROYZo6hUpwq4So6HY66qFl8FBJ3jJbDwsaNW4OrGYMfQ0zohz71LF5Q0U9TonXLhp0RYwh8FjtyQAPwd4SD2u/bxg9xmeNvl9q/F9zfbXJppIiK52O7jSCFWntRoHDNYM/6xPkzD8yyDZMkWUgQDKphyTpL/brRJ8bwL+E2JLvNqGJhCLrxwiyvl5W+J0suk4vSYIQ9SNYGcoSm8BCK1AvXmnlweU73zDQqYvr0vKv11YzxSMi40siBL682GIgEgFEqtST9lWSFg1gbhVijz44oDDg81C0uoIISEc23cO3H10kmrOA7rCxQB/Cd6gPZ2Klfzz/GMcDbe4bfJ8+qY7SShy4uhod1OXBvlOYd2PEypgOAVPNJDrJOYvLURShII3BD4U4HS
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukd3UlorRmpxaXBFV0IzUTNYSCtMdzV4NHJ1Ymt2VWdaQ2FReTNCNWZwdU1Y?=
 =?utf-8?B?ZlcyaUdMZVJlNDBhYW5jZ2huNXYrbUcrUkR0emJyK2ExMlhHeUpzOER0azlM?=
 =?utf-8?B?MHUwbnlzeUdIb3hDMVBiNHNWTlpPQkhXdkJDVGF0V29oY3IzQkpoU3Y3cDFr?=
 =?utf-8?B?VHpoYzlwUC9uRXlwa0x3NVlDNUxnNXZVbFpQdU91dUNzbWR6VDJqMWtOMmI4?=
 =?utf-8?B?Rmt6UDYvQUxEVEI0Z3RXbWMrOFAvU1BGQU50V3NrbnRvNVFhUXRQblVhK0Nr?=
 =?utf-8?B?dkJlUVV5cXFIL21rL0svdENQeFJudklxMXRtc1NTRng0eUttcjBQdmM1ZnN2?=
 =?utf-8?B?R3pFSkZaNmRvdEhLNW1yeDVSTXc2b1NjQ211TWI0MmxWODFYNjgyVmp0K1lG?=
 =?utf-8?B?Skd0YnVBY0QzaitWa3RpcHdKUUZOam84cWtWK0FQeklLZnB5dlZ4NjVPZFQz?=
 =?utf-8?B?WUp1cXo2K05UTDhYSjZ6MW9FYVpCaGxqV0swZzZmZWFmREpOcHZlODVrVTZn?=
 =?utf-8?B?VkEvN0hONXNKSE5QU0dEZmxUdUNjZ1BvbUM1MFhyOUFIaEF2RkVrWHAzdVRm?=
 =?utf-8?B?Q0hEbWI0d3NjYnR0STg2OTBTMEJtL21tc2dUZVhpUmxGNkNycTRyRHErQzAr?=
 =?utf-8?B?cmtCVHZ5V3NMVWk1MDNRcjJjaytlUjkvSFNTTFRiN1R5VXk4U2Rid3dVMk5y?=
 =?utf-8?B?K2x3UzhVak5TTk1tbDhZNFdvb2gvRUtkT3NCaklDYUZOWldySGpPMWthNUFl?=
 =?utf-8?B?RFZoUDE5amRIdmZMbXk0Y3F1TDk1SFNRSk1Ca2JHakxyUE1uQ2s0OXM5OFFP?=
 =?utf-8?B?SHV3eEZENWN5SFpGVVpMa0xWNTlHYTJRNUdiSjFyUytqMkYxaTBiM2xNa01B?=
 =?utf-8?B?Smp5MkxYWHhUa3hOUTZWT2x4cXVOY3dlalIxZFIzNnhjYVh6VStEa1ZLT0Vh?=
 =?utf-8?B?aGxQR3RBRW5VWkQrSkFnWGoycU9QQ25ZZ1hhM2pyUC9xQ2hSbGw5YWhzMnd4?=
 =?utf-8?B?cWtyeW9MN3FIVnRCNlh1NnFraVQwOWpaYVVFVEQ1dk5uaDJDM291VFdtQ01H?=
 =?utf-8?B?UzJkZHdkT0s4WGhKcHNyZTMxVytKMDJiNzZ6ZitIQ2g2c2YyclliK2ppKzV3?=
 =?utf-8?B?U1hRSmphYVExWlF4YXpMVWUzd1NVd1JEVEhPT3AwQkFDZXFnbllsSmZjU2h2?=
 =?utf-8?B?OGpoUGFhT0szY3FYRlhvN1piSzFlb1JXZ0xpZVFlQ0RoeTFEclZiRWFPTTFj?=
 =?utf-8?B?UUErSWRveG9oMFB0MDYvL0JLTmhqbFN0bVVrYStFbjVQT0ZQL3BZY0hLTlEw?=
 =?utf-8?B?Y1dwcFcwcHpMU0grdFZsU0RpQzMzQkhzcmlsd3hXQ3YxR3dFZ1l4Nk1xV3Bs?=
 =?utf-8?B?T2kzMkhCWWNQeVVhbWM0UjM3MnRBOHBzeVJwVzgwSERkVEFnTDB5K2dEclVu?=
 =?utf-8?B?ZWE0OHd1V1k5MXFJbFBWVjU2TXI4emlnVWo5S0orNjdDQWtHWFovU1V3VEdU?=
 =?utf-8?B?aWFVSGl5OVExd2VBM2dmVzg4aWhlUXl6dVJjZ0FWTGwyTkhXUDJ0RGRITmE5?=
 =?utf-8?B?QW9yZXNrdnFaSFIreU9wTXIxWjVmaTA3Vi9qaGJ1eU53dDNUNXJBU1ZIR3o3?=
 =?utf-8?B?NHFaTWVQbTZQUFlnRHVRUUM0M3BsQk9WbERyZk1qQzJTMVhmNWFkdjA2c2Ey?=
 =?utf-8?Q?CKUyJPVbPtYVW497nBKY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6da45c9-9e7d-47cf-7983-08dc38355d19
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 08:15:04.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB3259

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Cheers,
Chen.

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

   Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

   https://github.com:sophgo/linux.git riscv-sophgo-dt-for-v6.9

for you to fetch changes up to 0f46e1339ef113f0dedf7ad376452cc722dbcfe6:

   MAINTAINERS: Setup proper info for SOPHGO vendor support (2024-02-23 14:21:04 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.9

Sophgo:
Added reset support for SG2042.
Also updated maintainer information for SOPHGO vendor support.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (2):
       riscv: dts: add reset generator for Sophgo SG2042 SoC
       riscv: dts: add resets property for uart node

Inochi Amaoto (1):
       MAINTAINERS: Setup proper info for SOPHGO vendor support

  MAINTAINERS                            | 10 ++++++----
  arch/riscv/boot/dts/sophgo/sg2042.dtsi |  9 +++++++++
  2 files changed, 15 insertions(+), 4 deletions(-)

