Return-Path: <SRS0=AoPY=QC=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B4CD37BA
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 00:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E903DC4CEC4; Wed,  4 Sep 2024 00:52:28 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2040.outbound.protection.outlook.com [40.92.102.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B0B8C4CEC6;
	Wed,  4 Sep 2024 00:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B0B8C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOj3Q+GYFt/h1u1xCTEcfxHE1JKiwTCfvozanLCIMjo1r0GBZHAhTPvL9Pw4ScYNpmgJwDWhUL+TOkjZIONGt+V5uAJf3/UNWSy1FVtXy6TW6P82gV8SdQQvan9GPPtWFshIhxwatZa/xT2728a+EBArh0tBJ93ZsGElVL+8tyJn+GOaknJECVWIFlX/3vpJRQ/op/nWJSvuuH8ZsZHKOiG8NfYooHsugxDSCbBsq4vWBcdt8jc25x8C8x7BRmeexDUZvr4lj/aUvK59lm388+wNob/sNH6ibfIYozy8rOBp4/L1lYuKzcwpYlF8qRCjCobzQwMBsP+5T1ie4NW8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KewacEwaM/xLrHcbsQ4V7raXOhSgtMrth9N8xCzo78=;
 b=l2DewhGlvDT4nQ7uzNJEnYBFD2m7UBwbZ94iU31mCJvAJ/RNNJ/ipG+4qoiAdQLTp1vzuglQTWEORYUEULHzuJvCjz0/jZxailX+qNNFKm0JJp0G+qU5IezPUn0w5+T27gkJv/9cFoaxPZlDeAF4Ei+BNAybmbUWixHri6/sVo/uuBB76Svq/WJiBIytSq1T4E4aWFQBZXyPP+r1pSxjY1fK8p6KJcospvoSfB20e6Bwb8T+jRR2QNzY+W+yNb1ya6cF4tHTZhsUMSLvZhtD1huQjfhkcDSqO9atiVyFDVxh+A1FuNmV4s4xxtyLy1vksNepNQxt4SlwNax7RielNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KewacEwaM/xLrHcbsQ4V7raXOhSgtMrth9N8xCzo78=;
 b=FoFaxr7TewyKVFt5n7/RWVkPNJmwo6wKKfQfhBM1oSRsHiPvEbVimf6awYRh1IogNybhMIUuLOtu8n6D77wOAUegD6yIvh51nqUIMOYBHl/VIwSNp/KTEpmmDHK+wP/K3y1xZyn5fS3wNreaD4SpEBmK8ZCthqMdFYdOi/hFqI8Cla8ZGFrcVnPBCbaSNY+3BB8JXJcaxPHmER3w/0utxXrY/T9ikIZq77hIhKAfSXtynDkDR1fdzxcjxJ5xHX+z2m5Gov5er4qfrRpr7n8OtiL96OiuoG6hA5gnYWp8e9hgTuDmasVGWo0jwPyNCkNdP6fr6qyj6ECPc406rLz/sw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0962.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 00:52:22 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 00:52:22 +0000
Message-ID:
 <MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Sep 2024 08:52:13 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Inochi Amaoto <inochiama@outlook.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [23j/I9PCUnyOmCZCd01lmI8ah8RBPtl5]
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <2af935e8-9d1e-4cd4-99bc-d8e70bac0c14@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bec92d8-092e-4934-0282-08dccc7bd4e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|19110799003|8022599003|461199028|8060799006|15080799006|1602099012|3412199025|4302099013|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	/f7KSi9jrTzuw1B1btApr4REtiUuStYRWDGHcZNN/gcbSaFJFZ0gveJ6QY4q8unJ9T+gDMGileXvg2uBoJRvptAhPszAr8xpqVYRvrSKWk9TtSj+vDawJ7JQuNVLjQNjbiGeuifqDodYUprER+y88RjESG5CptFAWUQFgZYV7zRtOG9xse636iqMm7/3dlCbQR4nGlHC4bVDDM1pZ7w1o6AlMxo5zgxLlkBTE8GEXTbTWVsLrfrmCwcEyGgE2RM6HjoCorl7h40/MFhsIdOqeNhDjnP+ZO8zEPM/ComFYwL62qzZuyPff7yHtUAFgS/5tgvnZaVJCPyqQQ5/WiN/FTzpygQ+NGR9hF2AZXJykS9xY0Qqlax+a0ZUQXqRxucrC0XkodYnWEG005kZOxsnBfLwsb9IuOyXY3IdbZ/A/BDUPISy4k/WYOxLdAVnN7ablh85CC+mMoC0S9+92HIJKZMwUuw1DlDR3hQMXqV3opjTMg45n7AhxnIvmVSqMSeL1c1BeQu0s0+GGQWmIp3D6YhFAegEgtA9nckOb+IXndqVAicRazto/TPMptg0kGvOiLzS51+mtfln+CTaUwF0GRd0HWehSf3O9sLULeJugTMYmUDuCukLlh+/T4FQBGR5cotmFB7fYlj1cTErFGKoH/M8bpuqSyN8NG0Pb8gaIwYa523TV3pkUZqu4JKS0NPxnV6pDDuiNDoiOT/zDQw9YRmHjxsix54Gf2hT+j4maydjSF/Z6VZZ8Da2jRhJsUalRDt45MgdkgX2zFy01AHeNUykrowlwi+ihe13S/TgvGI/pUe8uss48VqbpVNlE3gwrQDv5KMmyWvlz0OHbHrAvDRDD+L5NKd7blOeI97CTpvKs7hnHW9a7FSGUwk9M/tQv+RKEdsuRMbP8wRh2khopA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1dKZm8wbnBvUVFhalpsVkNRck5vb09WQW1KOWdSb3RYLzF1akhiOEQwcUFI?=
 =?utf-8?B?MmxBQmtGME9LNnhWZzRNRlAyVkRtMUJHZ1FDNkRCNER0L3pqNjJIT3dZZEUw?=
 =?utf-8?B?c0NqNHEvblJRSFlwY2wvbU9ERHErNDdoWTFuR1JYREZ1Z3ZTclptUzh0cmlu?=
 =?utf-8?B?Z0ZHWnFFNm9ZclpQangwNjBWRnJ6SXhsblNqZXlBdUpVeGo1UFRJNlFUOWgw?=
 =?utf-8?B?VU5rOWphSDhSSVZzS0YrbmR1c3ZoUmdwRVBYdWx2cnFZbzFiMW5ZeUUyenQ2?=
 =?utf-8?B?WCtEc25FS1hrT1dXdmNFZzZYbjRjZ1lGcGpQUTVWK015RWdZU0ZmVVNZQ2lE?=
 =?utf-8?B?UWY3ZlYrb3BTM3R6eHhCRGhVejY4dHhTME9xR0UvdGF0N2pZaVdnRlZPUVd6?=
 =?utf-8?B?eUtkMWJ2QTQ1aUpMdTMxanVNdDd3OFE4QmJhOWJZTU9WZEdWMm9qWnhZT1pK?=
 =?utf-8?B?dVNtc0I2Y0doMEVvMitrc2d6dHQxMEd3MkJ4RWZxVEt2Qmo0ZnRkRTFoRU84?=
 =?utf-8?B?VWk4RDRBazVxMG9pY2h3bTh6eGdVeldxTm9WQlVQVXQxYnlQb1JLcXJKVVp5?=
 =?utf-8?B?Rjc1aFFISXBwaGhiN0RhUDU4eXhkNkdRaEE2MG50ZU5vVVlVeEZDazhWSHNq?=
 =?utf-8?B?UWE1UUgwQTdXaFBMbWhaNXhOd25MbzZEaVV3eDdoSlcxU2JJYXBIZkYrTzNs?=
 =?utf-8?B?anY0VGplSEtIZmI3cFhyY0FZcG1NSkEyYWdRN0dtU05OKzRGeUVQMndXdXBE?=
 =?utf-8?B?Tk90MjNnRnNwRUhQY3ArQWxSNWgvQkFpVUhWRU5tUGVKWUkwUWhpaVp0VkFp?=
 =?utf-8?B?Y280M0cwZzl4Y3lCbXBuSFBsYnp6Y3B0dnZncDRjcUdHeWJKWHUyS3lNZkFX?=
 =?utf-8?B?T0dXbENoSnhYVDFoNEtsenJFYkZnWDlYR3RIZU5FQkhCc0VzTTRBUmJ1OXdw?=
 =?utf-8?B?d0Fmamd0R0dCYTkySW9zbzBONUl6SklqS1ZudzJaeEpocTJEZEl3OXpoUW5j?=
 =?utf-8?B?d2VYanB5bENTZjNTL1hWQlhUYUVtWHo3ZjJhMUdnQzFCSjBmaDN1YlZzb1Q0?=
 =?utf-8?B?V1dESHJJMm4vbnp1Y2xhME5QOFIzdWFnOXlyQkpHbjJNUEhLSXV4OGtSUmxt?=
 =?utf-8?B?cVlTRVo4UmRLdXFJZ3ZsUCtxNVQyNXdHbVZ5bmdRWHovRkpIOXlpQ0V0QnlJ?=
 =?utf-8?B?aUdhWkNueW5uekliNUpFdmwxZGY4d3IwV3VHK0tJSzVvTnYrWVhlTy81TGVB?=
 =?utf-8?B?SzZiVEJSSE9sTVlTRVlxa3dXMnZRL2hRTFhabFVvaUtMajNnZFhDWGxQcVpH?=
 =?utf-8?B?UStYQzVOM3FydVY2TFFXc3FGYmlQYUlWTThHcEFpc2tLTjBhY0xtNXk3TE1G?=
 =?utf-8?B?QWp3aXdtRlhQVHoreDlSNUZOWjFqRU82S3Rua2ZaQWF1ckZEZ1VWYVN1N25u?=
 =?utf-8?B?V2UwQ21hR2VDMjNRWno5bkpIMkx5V1dkMUJUNCtVVFRoOXBOemR3emZiTmYx?=
 =?utf-8?B?U0I0WXB0Uk02dTc1QXQyMUtaR3FEa0ZaV0hYdEpvQmhCUC9xcXdOUWdKZ1h3?=
 =?utf-8?B?WHRSMnA4Qis1Rlk4Ui9vMk9WMVdFODJWT295bG5JWXEvR3h2SzhDd25jcXAw?=
 =?utf-8?B?TFRreUtiWmxDb3lKYUZrTkRiUS80Mkx5cjVJK1pVUHlGSjhland6cXkrcXF2?=
 =?utf-8?Q?tRq5+wGjgqYxlnPWSfha?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bec92d8-092e-4934-0282-08dccc7bd4e7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 00:52:21.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0962

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-6.12

for you to fetch changes up to fa1823d4e2ebf05ffe000887c57c40d6f089ee25:

   dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles 
(2024-09-02 08:55:07 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.12

Sopgho:
Added DMA controller for CV18XX.
Added I2C, MMC, GPIO and onboard MCU (HWMON) for SG2042.
Enable SDHCI0 for HuashanPi (using cv1812h).
Some minor changes about dt-bindings for Sipeed LicheeRV Nano board
(using SG2002, and SG2002 is the new codename of CV181xC).

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (2):
       riscv: sophgo: dts: add mmc controllers for SG2042 SoC
       riscv: sophgo: dts: add gpio controllers for SG2042 SoC

Inochi Amaoto (5):
       riscv: dts: sophgo: cv18xx: add DMA controller
       riscv: dts: sophgo: Add sdhci0 configuration for Huashan Pi
       riscv: dts: sophgo: Use common "interrupt-parent" for all 
peripherals for sg2042
       riscv: dts: sophgo: Add i2c device support for sg2042
       riscv: dts: sophgo: Add mcu device for Milk-V Pioneer

Thomas Bonnefille (2):
       dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
       dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles

  Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml 
|   1 +
  Documentation/devicetree/bindings/riscv/sophgo.yaml |   5 +++
  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |   9 +++++
  arch/riscv/boot/dts/sophgo/cv18xx.dtsi |  16 ++++++++
  arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  77 
++++++++++++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 148 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  6 files changed, 255 insertions(+), 1 deletion(-)

