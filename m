Return-Path: <SRS0=QFky=KL=oss.nxp.com=ghennadi.procopciuc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67345C54E41
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 09:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13771C43390; Tue,  5 Mar 2024 09:11:21 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2043.outbound.protection.outlook.com [40.107.241.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38AEBC433C7;
	Tue,  5 Mar 2024 09:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38AEBC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgikyM4zfbiozHl+oVyXYmbSUAhMj/v/+e0lRkH5nhXfqM2CHUlearoVTe+x6iGJMFHZl82TC6efVAD+n+2lbK3LbRUc2Ussg41RiSDMHaauGTvWEJbP3ObK36UM7jlOoQaj20PptJgRDH+sEmdvJpTEzvJfkTtBRek8MsoGvQ2BiUHE3gfMoqP4rQtucM72UM/sx1ZXHxZhQRSlsS6mM8d6WPEXGRF3IZ523UFc3T3orpiUToqqhYrX0Z0S4fNYlqnRAmvqaqZtRmHj528vr/k+Mcykl5KgrOGpOpq/ALeNO5bnJG/TgThCALETk5Hm3WPx49GPyeOoFQQslt6YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq7+njpzRxtRLM/mjPB5SPAdtYuc4mLvnOm2VbuolEQ=;
 b=MZ0basiOcLuj5eYHvFtAYJjb6a+u4LjVxuuSma6JisWq2RAfyxcc/RkooQwrIyVOmN8KvS8LLIZ8zs1LE35oCFZG9yLKAzsLr9B2AJBODh4iAalx/k83MKB27e1wODWey4C5JAD17DPQ2er4LUz+RS68V4yiDcLnt8l1LeLaZCNohwcOTICewaw6vZ7dabjLisCp0BPGp1QCNj4csSSeFXV/dqPTGllFNxwPZe1inJoBhRhFjH4mfaCgJNzb5OjPksRhHNt84auLslLINIboCFcycF+C5wUtzMqwsM6U2uPj8vsep+4WR0DWVJY27WP09rI07r4kJy/e22K4sPIB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq7+njpzRxtRLM/mjPB5SPAdtYuc4mLvnOm2VbuolEQ=;
 b=Sn5OAIUZGEqt4TRrcVa/jNwubRkrle//k16oEuYYrhTRUgfY1pS9xAtjdnSfrmTWPLhmRhOvjjMN2EJ7uDyx8a+K2VW9lPXpoEdwvWAVK7RCcUrU0culVkCj8yjNJG5uCqptaCuW5rCcSm4WVT08qSdJE3Eyer3zH9K4aX74YQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PAXPR04MB8205.eurprd04.prod.outlook.com (2603:10a6:102:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 09:11:15 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::195c:9861:96a1:56ed]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::195c:9861:96a1:56ed%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 09:11:15 +0000
Message-ID: <534aa75f-74a2-e4d6-4723-b36432fd33db@oss.nxp.com>
Date: Tue, 5 Mar 2024 11:10:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ARM: s32c: update MAINTAINERS entry
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, NXP Linux Team <linux-imx@nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240304204249.936140-1-arnd@kernel.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20240304204249.936140-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::16) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PAXPR04MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: e94b65e4-3193-49c1-9b70-08dc3cf435b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YPIuLRiPitJEOV9psDyBGXf0jm90ft21HlZNEeJuJ1mhMROdOyRhcP9gLcG7e3Q3GYhM08JRryrYRIEYkK9ulDB6xHF8cC6JSeRuMl2LT5+8uR+e9T2WmT4+1X+20OZe+xNxxKPjA/O1JALPO0CWw2j7lmN3OnMzd7uJZ6QNuCAAPAgf44nzVc+/G/uQQCyYqvCLHQYC68UOCBXFBezf+p5Sebz2zGo9Yy2FEpgsw57T92vOfQ229mpM/Nay6PWthToGifvWk5YcaUcZJubNxQ+LxsdtNaMubZfVBRhgywfAR7YctCqFNlTwDdgQ2B9BtnYA9l7+Hyo1R9274Dw1lKKWGokbpjjUBCQBGTo9YOd9AU3zIq5O5KoRkOhT2r2wmllsgBTVJ8XhV802pSDOJt3/2jfBj0BSwPQwoIrQYGdOlsUmwTtuc1TNcx/Y9DX22pLDpzeUaLGYVzI9oWXWr+iNvjJzxdxctw8U+nOAru9yiP0riQaOFXsQgrdf/VZeEKtK+F7i8P7R0YxP8/4YJW1IogYoInuaP1iwcEv70BmoH8cLkwKJbQVunCpaIhpI9CpytormsJIyh7i+enlk+nPJpuii/G7le2wz/fpdqvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRhby9FS2FWK0dGMll3WmUrbVk4bWdla1hPcXRvQVBXRkUvMzZpeFZ6WDJi?=
 =?utf-8?B?am5UbG1JRVRyTmd3a1VVbGFORlBKSW1mWjFCUGVMc0RNdEFNZlNJcUt2QmxV?=
 =?utf-8?B?UVQ4RmhrS0tTNGFUcEl6S1V3ZE1RZkNWZlhMelYra3h0blRGOHVSREs3R1pa?=
 =?utf-8?B?QUg0MHhHVW5CMEw2YlV3Mm8wNzdUK0tPaHZIYTdXTEZKM3RjaEFsc25jcEtM?=
 =?utf-8?B?ZG4rMUhORGJmWWdlZ2ZrTU12bWE5QnJmbjRUbDR5bmlkb1NmYWFzZ01xT0ZK?=
 =?utf-8?B?YUw3aldyVzQ0dHVieHhIeE9UbEI1UXlFcHp3VjUyUnpkdDFNTENEMExCeUI3?=
 =?utf-8?B?dFFMd3NhRjh1dlpmNzEybGs4ZXJvaVNvS2lPU1VVTlRUaWp2WHAxWGFXcVRk?=
 =?utf-8?B?NXRDNnU5WStRU0h6eEJoN2dlNTI2YjhjV1hYNjJXb1RZaUlleW1RcGVrd25T?=
 =?utf-8?B?cGlsZ0RHdmd1bWw3eTUxZ3Z1ZmprQkZqUVdudmFHeHJrcGJ6TTRZdjV2cjBW?=
 =?utf-8?B?WjNEV0Z5MVpGUEZtdlBaTTJ5SjRtcXBBZm91QXMxU1NSV0gzbUJ1Rk9OdSt4?=
 =?utf-8?B?WmN6VnBhVkZZaGZVSkk1NEJkc1NGZW5GTmRHOWo0TWgyUExLdUhqazhrdEQ3?=
 =?utf-8?B?RU1TM0c5OGVPak5CUmNSYjh6UVZUYkFZbERWRDhPMTh6U000Y2JMVjlIWnZU?=
 =?utf-8?B?WkU2QnNoSXRtTzNDbGp5djhxUHZneWZnTG4wQ29rRE03Wkl5bzJramVKWjBP?=
 =?utf-8?B?QVBQTkowSGlWNHJtM1JXVjB3TUNLUUFkaEovbTR5VTQydW9hSDJMRjR1d0Rl?=
 =?utf-8?B?L1dnaWVZZDR3Ym54dFRGNU9TbnVzRFNCTDVOeE03RnNIQlFPN3RzdVVMcXEv?=
 =?utf-8?B?d1ducGFIZnkzZDc4eWlhMVhXTkt4TDg1WHhhQjlqdjBEc1hvZ1VIZmdyR2Qv?=
 =?utf-8?B?SVlpQW4wKzZQNUZaN0YzTzJldkJIZ3I4SVBjR1RxVDAwZE5nbWp6cFhzU0d4?=
 =?utf-8?B?NzFKOHAyK1o5V3hSTm1aYTN0cW4weFFxVVNPNGVyRUwvNmlScXA4aWIrMm9k?=
 =?utf-8?B?ZktoL3lVcjdWNG5ONVI4QmcxR244dy95T2hWd1NSbWtja3dWbUloVUlxQTZ5?=
 =?utf-8?B?SUh3ZXBNb0F2Yzl6djFCZ2tYVnRheHhvMmhZWENYaTUyS1BGMkFwSmlnMGRH?=
 =?utf-8?B?ZzllaDY3RDBiZTRjckc3dDRtZS81UVNveGZIL3QzTE1UUS9LY09PaHBFT3c2?=
 =?utf-8?B?Qjcyc09ZUlFmb0p1OTI2SHJleDZ0ejYxZ2syV3FYYnZRaEZ5aE8valFqVXU3?=
 =?utf-8?B?Ty9rRUNKZnFaUnpkN0l2bk9HREFjYWxJdUM3eDdxYjlQNVhkRU9lRkUzVng2?=
 =?utf-8?B?Q0ZDU1dPQ0x1YTlUeVBNamhxNHFYYjRMV0U5bzhvUnc2Y3V1YmYyZmZVQmxT?=
 =?utf-8?B?Z3F3dFE0TlRVTGxlcHQrVU1EK3JXZDVpYStzMmpYVmNEZjBsRmxrNHVMaW1q?=
 =?utf-8?B?VkRBb05jQWwrcjdGWlVLcERjUTlndkx3cXF5bTNFUmN3c08vL3lwYnV3OUJr?=
 =?utf-8?B?eFRMS0Q4bHpXZHg4V0p2SUVjZTYrUnp1Tnk3OEtqRE4vb2FpbUFoSEErNzV6?=
 =?utf-8?B?c205amRFcWdjc2Jwd054N01KV2ZlcTZ2M0RVS3JpL2x5VGdHbkp2cXkxR1NG?=
 =?utf-8?B?d3A3bG5KWnc4UHhmRnhWU0l5WWZMMHpLNXRDdmlzVDBTdE8yb08zblpZcURE?=
 =?utf-8?B?aHUvTmVLOElwWnlNU01rSHhYMFJSSVk5cW9DT3RTZkcyM2xoTXdZZVBWR0tU?=
 =?utf-8?B?NVUvR0Jta0VFeVJTY2ZCTEJiOTV6a2lYa1B4eVhlUnUvY2IwVE1jVVZqODEv?=
 =?utf-8?B?bENBeFZVUUtGMW9qWmtmN085RUpxRnNNVnRlVE5URmdDaTNBdmhsQkhYMStC?=
 =?utf-8?B?V2FMQTVnVXZiSmxNSFZBS2gzeU5MbDVHOGVaN3RtcVJCVTdXUGF4bXkxRDc1?=
 =?utf-8?B?UzYxVDhyQnVXbWROWDRUbFp6aEtVMWtUaFYvdU1kOWxhb0V3NTI1aGVDTmZH?=
 =?utf-8?B?ajY1ZXdrWXpRd2djb2F2VzdaUUp0RlZOZW14WjdQSDhVUHY2RjVCaUhnODho?=
 =?utf-8?B?L1pXcEhMWTZVbzlDbW85MnJsOEZUVW1ZNXo0QjBsTWVwbWQ5dmg5Q0oyMGFH?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94b65e4-3193-49c1-9b70-08dc3cf435b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 09:11:15.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6GiY1z82WmIUStGX+BvZHTPFOz6acurIJQZ+4mHoD3HFSW4x688LhGw3KfGhGP4nuf/OG/z1y4gOz5U0nV3TOzkdpJMqIXX92QrOkGL7Fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8205


On 3/4/2024 10:41 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> As discussed on the mailing list, Chester is stepping down from being
> the primary maintainer for the s32c platform, and Ghennadi becomes an
> additional reviewer.
>
> For the moment, there is no full maintainer for s32c, but Shawn is already
> listed as the overall maintainer for 32-bit freescale/nxp platforms
> (except layerscape and qoriq) and agreed to merge s32c patches as they
> come in and are reviewed by the remaining reviewers.
>
> Adapt the entries in the maintainers file based on the discussion.
>
> Link: https://lore.kernel.org/all/20240221120123.1118552-1-ghennadi.procopciuc@oss.nxp.com/
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> ---
> I would merge this into the soc tree if everyone is fine with this
> version. Let me know if you'd prefer any further adjustments.
> ---
>   MAINTAINERS | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 209e6f45a0b6..87e9c8282742 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2542,13 +2542,14 @@ F:	drivers/*/*/*wpcm*
>   F:	drivers/*/*wpcm*
>   
>   ARM/NXP S32G ARCHITECTURE
> -M:	Chester Lin <chester62515@gmail.com>
> -R:	Andreas Färber <afaerber@suse.de>
> +R:	Chester Lin <chester62515@gmail.com>
>   R:	Matthias Brugger <mbrugger@suse.com>
> -R:	NXP S32 Linux Team <s32@nxp.com>
> +R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> +L:	NXP S32 Linux Team <s32@nxp.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	arch/arm64/boot/dts/freescale/s32g*.dts*
> +F:	drivers/pinctrl/nxp/
>   
>   ARM/Orion SoC/Technologic Systems TS-78xx platform support
>   M:	Alexander Clouter <alex@digriz.org.uk>
> @@ -17260,9 +17261,12 @@ M:	Shawn Guo <shawnguo@kernel.org>
>   M:	Jacky Bai <ping.bai@nxp.com>
>   R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>   L:	linux-gpio@vger.kernel.org
> +L:	NXP S32 Linux Team <s32@nxp.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/pinctrl/fsl,*
> +F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
>   F:	drivers/pinctrl/freescale/
> +F:	drivers/pinctrl/nxp/
>   
>   PIN CONTROLLER - INTEL
>   M:	Mika Westerberg <mika.westerberg@linux.intel.com>
> @@ -17316,14 +17320,6 @@ S:	Supported
>   F:	drivers/gpio/gpio-sama5d2-piobu.c
>   F:	drivers/pinctrl/pinctrl-at91*
>   
> -PIN CONTROLLER - NXP S32
> -M:	Chester Lin <clin@suse.com>
> -R:	NXP S32 Linux Team <s32@nxp.com>
> -L:	linux-gpio@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
> -F:	drivers/pinctrl/nxp/
> -
>   PIN CONTROLLER - QUALCOMM
>   M:	Bjorn Andersson <andersson@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
