Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A8176AB7
	for <soc@lists.linux.dev>; Wed,  6 Nov 2024 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730855563; cv=fail; b=sakglP2IeYYyf4HC4UogXItB0g9rFfRX+R1cQvypNIHIZUc/EgJ5eBkJYrX75ZvBSt/G1HSM0BYBpy0kroKtrL3P3Hpp3BqC3LQiN05JQY2XgrlY2wXH0ylmcu2pqxsRl0IxSemiDzYDrgRGDwMillN3kj0CVKiz+5Thw8rtnZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730855563; c=relaxed/simple;
	bh=1qjU8aTuj2fJ4qm8tFw7wTxNkwHdOiuP33+JvinJe1s=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=oUPnuYj6MIzxJLVeo4EacJhoeSPkU/sL0SAdhctbQ8bil4Lv6Xeq6oRZkf+jwVhyqiDKqURt0/hgvUWtSZ3BjZ9i8OF8onuWuNWVbh4L/FMjMr6r4W7H4laoqXjJ0Fdztuvb66HeBZhFwNhLR6+S9vpHlN8Su1Iu3D4udDNw/LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pFvaQF5I; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pFvaQF5I"
Received: by smtp.kernel.org (Postfix)
	id 67899C4CED2; Wed,  6 Nov 2024 01:12:43 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2081.outbound.protection.outlook.com [40.92.102.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAC96C4CECF;
	Wed,  6 Nov 2024 01:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAC96C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdgbItpK8RMK/ZdgfNc/ymY3ydG3bsW6+OLeNdWPSeMKOU0pwjvFUFosldMp5yfN/DqtH3Uzoc+MgOD/0eRO2AkOiAsF3UYQMr1Xn4vLwE0k8k6YMPCxEk6WOq3aRPJ/bB2ugEfxmrT0oSkjTKZUaOIiXqfkvF2ix1gRFVTlCyWO/5Jrdq7UNdyjZFQlaVCwoydkC3IdrUlsnqNhuQaonhtwaORNmkwvxpNxaXhHPN/jV/IeMjBrjJnd5Qpk1mDlXh3fn+eJUJUd+op/ZgnxnwhN0CKweUbGYTyNK5QE3mmovdk5R4n7zqGZIqiQVXkGm7BKiGfOJzYRzdQdaTtFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDf7RZ6NDrMb8Wz1SnI+mymzjV5vwXKhpVzQZYf5chk=;
 b=sdS81GU9i768o6a2xFfQ3sXKanTL0gIl54OVwkAU6rn4ap+I3fpF0LOiCz2hWM1Dul5q4dPphZVbl4QBb021oX33sBLVVb3eYhWv9wABI0YsbB/aRYQHAXVuH3Jvgh5TIqMY3rz/EjSPLCAslCFtvA0Hr82nTRtw4xjbfRbk9EVWqcUJO93eegVBMQPUDleWt4PpGVT0k909lnFoVOCxr8yvMmZbObpYV0XxOz18sGJwl2IhbG4B9gTlb1+y+rbvacDX6LqxhcUZ6pQIzTi0LFqg5m/fb/dylwJdSq1fihjO8v34ZAGyGYOz9vSiCymkGNrsIyE7W2XGTTAwP96Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDf7RZ6NDrMb8Wz1SnI+mymzjV5vwXKhpVzQZYf5chk=;
 b=pFvaQF5IbCv9Wru7yYWrkU5me6C36pU88MQiMPviwOvv/eyYMO6RcFz5kpW3mhaHSLeTUxekghVlDDglVyGetLr96F2ItMCH6OzSO+5n/xpRKMRK6Oc4s4QI93KILbmMKZaEvNXFgPXZM6IfFaIa5LXayQhJcZ4vGSLOx1OJmdOxb8odKIyikfkPvc4dNKRXRvtpgZxtMYubtC+ByDNLxsDwe+X76fjVXXj32d2YmUiDMPNh9oVv5hZHYncLtJ2LqidJL1+UTtRFeUUJ6odTR9LsbFQ+D25ObcvcK2XltfGj5GjSzKf8jAqQR1TYIa5JdXWpphV4BTEuPKo0i+4FUQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1618.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 01:12:35 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 01:12:35 +0000
Message-ID:
 <MA0P287MB2822DC23E1EE47A5C7D41476FE532@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 6 Nov 2024 09:12:30 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Inochi Amaoto <inochiama@outlook.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 Liu Gui <kenneth.liu@sophgo.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.13
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <e31db118-da5b-4091-9647-f61143e98359@outlook.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1618:EE_
X-MS-Office365-Filtering-Correlation-Id: b08c5186-c44d-4411-fffa-08dcfe00184f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|8060799006|7092599003|19110799003|5072599009|6090799003|5062599005|461199028|1602099012|10035399004|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGd4ckFZTG0xTVVkOXYvNjExUnI5NXhOcVBIelBqNzR2ZmhiWUhpQm1kVVJW?=
 =?utf-8?B?VU1LQzE1RGFFQ0R4dUx5UzZkSTVScHhwSlFmYVBEWlk3SzEyS2hwcWlwMHRP?=
 =?utf-8?B?QWJiUlZGL1BpcTR5bm53d1Y0eDNPZVRTc3VIZFcvM0szbEs0cHk1TU1wK2Mw?=
 =?utf-8?B?OTVLbjdxaDBpRjUvZk5JblIwckg4eU5oWDU0NnVxSGVsVm01clZnbitjanJn?=
 =?utf-8?B?YzJlVm13NUVhcTVQOXdzSUZsd3JJcGxYeWhhMnZjN3dXMy95UFBacE41UlQ0?=
 =?utf-8?B?STBqTTBlVEU5WGVjTlZDalQwSWdLQU52eGhzS3ZmOGpIYWd0Z2VDb1dZelBu?=
 =?utf-8?B?andrUjExeVFmUTZab0dkbTEwUjlHVnUxeTFzT3FpU0tKZ3FTWk9JRkY0a0Vh?=
 =?utf-8?B?RTlqeWFOdTlMTzJ3U3l4cC91L3NjdW44R3dlZDgxa1ppeFdYdmJ0RVhMQW1O?=
 =?utf-8?B?dDZMRmVnZC9XQVBLNWkzZTU5cVpmZ3dsRHlTODlLeVBCRmRQKzBLK1c1TEhq?=
 =?utf-8?B?VDFncHZkLzhGdG11biswWU10aGlBcFhCT01UR3hLQk1RampqZUxKckprNmxp?=
 =?utf-8?B?VitCK0VKL1NjRW4zZ1BJRTZyR1h3WkJvS21lTGJHOXdUb25hTU5FU2hybHZW?=
 =?utf-8?B?OERoRnJpajNaV2NiRGdIbVRoYnYydE1hMVlma3QwUGdNU3djZkdXL3FqQ2Fs?=
 =?utf-8?B?Ylg5QjNSbDRXVktIQ2hSV0d4ZjdKcHRCVTBpemZ3NkhxQm5FUWhkc3hEbU00?=
 =?utf-8?B?ZHArYjltek5IWlVTRDFGRUxHVkRTdkJHNkFYQmJJMlo5bkpyVGRKOGRTa2tJ?=
 =?utf-8?B?cVp6RmljUFh6ZkNZcHRWU082b2Nyc0dCMkNBYUhpbzZZR0RURHZTQXZlMkxq?=
 =?utf-8?B?MzZXTlZlL1RMVTI3aU8zUStsZDdNMHhyZUdzOFVqV1dYNWNRNEpNN1hyMkdo?=
 =?utf-8?B?TUU4T1ZWaWZrRjVyRkxTVjhDd3RFeDFlV3RCMXB3ZGU2OTdCRzZabVpvdUpF?=
 =?utf-8?B?YW5vcW9JU0N3cWZjZHlnZUtDQWhQbmczWEZQR3lpc0c2MkJSd2FWVzg1MXRR?=
 =?utf-8?B?L1pZMHd2VE5yUHN0WFhhblFtdmZ3LytEb0hRejIyU1MveXVuVkxiM090eTU0?=
 =?utf-8?B?TmNlazBxZVhxWjZnRy8rdjFObWp1MGJadnpTY1lnaGtWMnRWN1cxSVNEVzZ2?=
 =?utf-8?B?c28rNVBzRk1Dd1dCbDVXSWpyeUlmV0RuYTBrVTVDQ0hPVDRwbEpKOW1vTkh1?=
 =?utf-8?B?NGlRYkV4SEdrUEdJeHhqaGdEMTZLczdUaWNqb1pDOWRtWDFpR1VzUHMxQTF3?=
 =?utf-8?B?aVM5aWtzMTJZSkd2MGZrMFFEOGdHbmQxNTIvYklNMlRaSzhLd3BBd0xNUHdP?=
 =?utf-8?B?UGpmM29JZmx4ekVUaXJiUEk5RmhSazlVYTNUUk1kMkdkRzRFcE5jMVdtMmh4?=
 =?utf-8?B?ZGdPN3Z2bzdMbnpVNHZibkVtbEhsVHQxUzE4TTZTUmFWWnBWSlFobXVDL3dh?=
 =?utf-8?B?SUhQTDVBWmRIc1VFdXlaYmowMW9oMFlDUkEyd25lbndoNkhGQmpBUEkzQ1V6?=
 =?utf-8?B?QVBuZFI0MTBCeDRBb2Y5YzN5U05aMmZxeE5EblZEZG5MU2RtZm1pRjhjbmdq?=
 =?utf-8?B?SWpzU1FhWTVoWUZaeUpUYm5tK0RtN0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3VzRHNIOUNUTTlxYkxrQyswY2Y4TVJpYmIzdjNabHQzeTdNelhaVSs2N2RU?=
 =?utf-8?B?TVI1bEpkZ1YyVTF2YjJhNkIwSndmZDVZT2FTNDhRc09iM0MyR29OWUFyUVNV?=
 =?utf-8?B?Y1NMY24xU3B1RXJ0MU5kQUZEajljem56dkw2Zk42QXJBZzFIRmtjVDlRWU02?=
 =?utf-8?B?UU1xckl5OVJtUndPdUFzS25mYkpJVTN6RFpvRjZ1ZlhYb0NtWS9Ub3gzZ3cv?=
 =?utf-8?B?dms1NTdvekxqdmpyV2tCVEEydlRtTjJlOXNVSXplSDZERUg1R251Njk4MU9z?=
 =?utf-8?B?ZEVadmg3MTc0QVlvdmY1VjZSM1c5UG5UdGowYVBaNkRFUitweXBvUzExNTQ2?=
 =?utf-8?B?cVdBK1c0engrallKNG5Pb3ZFNXpFRFNnOTg5WThsRzJHOXVRQk5mUGJUT3E3?=
 =?utf-8?B?ZFlwVWd2dUNXYkpSOHhwbFloWS9hTXZxTkdMZkNVcldTUGh5VmxuSEZFdFdo?=
 =?utf-8?B?ZnpCekwyVE9WYmQxdGlNaGxIUkk0U1ZsQ29XMjFUREFFNldnaEZ5WE5ZYk9k?=
 =?utf-8?B?dnZzUE1jdW9FTVh2d0VXek14dXVEdDc4MU9ncjVndXcyWTFrZXJ1NWVDbWd1?=
 =?utf-8?B?dTdRdXhCWmp2dVgrRzI5cmxCWGF4ZWo1RHhyeDNrb0xEakZhVi8wblZuY3ZD?=
 =?utf-8?B?RW4wMURiY2hOcHBJMGhWbEp0empoRC83MytDcWdSZnkxamYwZDJmUEo4RUxu?=
 =?utf-8?B?N3FyNUVpTzJnOEVVM2RRbVVrWW1TMSt4amhnWm5nbGJCT3lma2hIRlVnb0lk?=
 =?utf-8?B?eHk2cGVsMTMxa3U4aDh1VHlRUXJEcFJvbllOaSsxdURXMlZjWXFIbjVpc0dY?=
 =?utf-8?B?N1A3K2Y3QllKQzFubUNyUjIyWjNNRTNlaWpCQVlZL05mL2hQTithYkxOekNX?=
 =?utf-8?B?cTFmS2wzNTB2c2Q0dWEvSGozdTlHSVRWcnBWeWVVL3JSNDhmWHRzUStoTkRE?=
 =?utf-8?B?cmFkUTFaZ3BhS3ZpNlU3S3J6YUJqbHdmajliL3JjdXYvMWRSYVJSNUVqRzhk?=
 =?utf-8?B?ZTQxQ2ZEeld1eWNtV0FlMUJJMVBkTXZ6SW5YNjRqZm0vdzRqZVJiajRNbmNF?=
 =?utf-8?B?cEhXYWxHRWk0WExNYkJoYnJ6cE1UaUd6aWVBSi9IMmZWQXBrRUErWWNTZk1C?=
 =?utf-8?B?TTFGcTFVckpTb0hZdTA0dnNoV01FR1VhRDRLWFBpR3MzWmhPWUljZnFYVkpu?=
 =?utf-8?B?VTQ0ckFkcmtqUmMxcERka1NCMXhrcHVIemY0VlR5MThETDhFeCtDeWZwbEUy?=
 =?utf-8?B?WEFVaEdxc3RvQ1hQdE15V3dZVHhhY2c5NE9CT1NEUVBmNmJlcmQ4TFlZb3pj?=
 =?utf-8?B?dlhmVEFoa1BiT2JDdTJUMTRUOEhnM1NuVlg2bGhEa0VCamJlVGw0aDQ5MjR0?=
 =?utf-8?B?TlFaTTc5VHd5dHJ2SytveTF1MnNNOGdXaTRxd0pTRjZvNGZrV1Y1YXJzWkRE?=
 =?utf-8?B?M2ZJSDdGc1N2OXRZS3RlKy8rQzFiNENIT0xDTC9wTGJSejdsdXBubUNVcDhF?=
 =?utf-8?B?S0l6dVVqVEI3SFpLYmltbjNEdzlzVTQ5RmZQWTRoaVlQeDdYc2FidmYrZTNp?=
 =?utf-8?B?OFFPNWNNNkkrQjgvUUV4eG1pNzdVcHBMbnVnbmppQ20vTGdOVXluMEVtSUhi?=
 =?utf-8?B?b1ZXaDJVVURMMkJwMHp6bk11ckRoOU9YZ1pCdXlTK2x6YVJYdmJ4RG0wRVRE?=
 =?utf-8?Q?8F/WcI0w9mHZ/1EBcRAl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08c5186-c44d-4411-fffa-08dcfe00184f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:12:34.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1618

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

Thanks,
Chen.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.13

for you to fetch changes up to b5cf65cc0fd00aa30ff218ec8170dd48e3cbe78d:

   riscv: dts: sophgo: Add emmc support for Huashan Pi (2024-11-02 
19:19:08 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.13

Sophgo:
Add pinctrl support for CV1800B & CV1812H.
Add SARADC support for CV1800B.
Add initial LicheeRV-Nano/SG2002.
Add emmc/sdio support for Huashan-Pi/CV1812H.
Add power-key support for PioneerBox/SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (1):
       riscv: sophgo: dts: add power key for pioneer box

Inochi Amaoto (4):
       riscv: dts: sophgo: cv1800b: add pinctrl support
       riscv: dts: sophgo: cv1812h: add pinctrl support
       riscv: dts: sophgo: Add sdio configuration for Huashan Pi
       riscv: dts: sophgo: Add emmc support for Huashan Pi

Thomas Bonnefille (4):
       riscv: dts: sophgo: Add initial SG2002 SoC device tree
       riscv: dts: sophgo: Add LicheeRV Nano board device tree
       riscv: dts: sophgo: Add SARADC description for Sophgo CV1800B
       riscv: dts: sophgo: fix pinctrl base-address

  arch/riscv/boot/dts/sophgo/Makefile                   |  1 +
  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts      | 49 
+++++++++++++++++++++++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/cv1800b.dtsi               | 10 ++++++++++
  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts     | 23 
+++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/cv1812h.dtsi               | 11 +++++++++++
  arch/riscv/boot/dts/sophgo/cv181x.dtsi                | 21 
+++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/cv18xx.dtsi                | 32 
++++++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts | 95 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2002.dtsi                | 43 
+++++++++++++++++++++++++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts   | 15 +++++++++++++++
  10 files changed, 300 insertions(+)
  create mode 100644 arch/riscv/boot/dts/sophgo/cv181x.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002.dtsi



