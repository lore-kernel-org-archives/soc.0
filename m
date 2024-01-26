Return-Path: <SRS0=Tt6i=JE=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A46C47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 13:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAE9EC43399; Fri, 26 Jan 2024 13:27:30 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2031.outbound.protection.outlook.com [40.92.102.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91439C43390;
	Fri, 26 Jan 2024 13:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91439C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io01kx8BpogXc4ITrwLkbbAA74zc+NmLgRKj3H3G4PJelSm9Aop3bhgGmIGGIGWPsHcA6QkFqJ/R429wfdjEM6821S1AeKro07875/PMvp3HP9JlU/6jk8wkT5FdgNBkZjRnHTKxVgzCqlzhaf4EHZS+KVwtGJ/Rd1yuRIxmimySrOtKrmuDGfQhE/biiunEWe3p4Y1ruOG6x8rGvj088HIpSe3MUDqXjyu2I5ETE10iFdoISZIKZndX2PxknSSBlH188uzu/oCWFQ6fXkzthjwhxITEUNUXrZSdCt8BI7MTydB+dX8AfCYMlF52ELTiZ+uPwcIBBfKpGxWH0A4VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/rIwS8D0cE5/cCIscO16Ssh+tvKF3uX1m4t+sXOR2M=;
 b=So2wg+4AiezD1RmrC8c4/JNil5so1kaSgco71IzxxC6KFe+vjzhsjvgpQHaL7XYn8BISXsLMLX1YyLeTpq6ZDObCudc8rO0i2srr+zawLT7rvla0YOAvAmCV/lo3GOkUd/OOBJ+C72KSW2VGuWTBtR849exOIw7zjXIxDcwwtbg5hiJTu+c8i3egYV8rkKBcU2FdZlMVPZYUkqne1ZjhPC/L/vRrkwuIHqZJsgi9q2d/mDrPQFW+LiEu2eLFsVVQ6oCKOM8xlSTwyt0OF0SrSsIYzdD2nruG2HHmneVOERh9XKfSiPLc0U8tJ07FZDLtzRxeesZ/56EucyqwPaWUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/rIwS8D0cE5/cCIscO16Ssh+tvKF3uX1m4t+sXOR2M=;
 b=gz/afA67fRnwZxfGPc6Y4F91oXkRgt4F7N74h9aTO72BTizTyZQzlNIlpyffKlH4OrABhqpSDtdXBD8a6ctgMbZ/GzOwOgZs+DYj498+DrvSYhpe/VKZbAfXZoK6imFo4gCUfH3SOpWkF5bAPyHxjkEneb1dmYpl0y5C0w2G/etiNnT+Q+tye1/G+JccxQP3eOvf9IACNIreMMuDcXnFlFo/xN73lC4klu6NGAdqbndVQhsbcw0KmHCyIus1A272LSQUKQLY+2CjcWAG89ebvmS73sMCJwxrPP58groEzBgoP5btBkpLaMcIiDNxnuEeuiwx/wF0Tn/305p++jxu8Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB2685.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 13:27:23 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 13:27:23 +0000
Message-ID:
 <MA0P287MB28229735F58BBC99AECB34EFFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 21:27:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
 <MA0P287MB2822632A358DFEF21FCA333AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <82f0b93c-d73c-4c99-87ec-d289fb43208e@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <82f0b93c-d73c-4c99-87ec-d289fb43208e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [wSNBAkSitIocw5Sxo8JRAELgwBVt//ba]
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <b0267dc5-f131-4e24-bef6-2588ce271b07@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB2685:EE_
X-MS-Office365-Filtering-Correlation-Id: 44773cd4-7ed4-4f53-6832-08dc1e728788
X-MS-Exchange-SLBlob-MailProps:
	9IecXKUgicDt8hO2Qoy4Kt1I3v2GXv0Z3PuIqYOcv251szoRIOeHlDm25RyRwl00RPzZ9aOif3HV8AaVYglTZxk8OGEqGXslrtxd/sV7qdMc68TKqINiaSOr5SbUXFcY/sebT/tnAAdJaftKSDKYWvEq4LWaJWZGbPDp21Ruu3mMl4FgzSVd9V39IticqcdTY3XM4OXZ6eiusCyyHMEtVIl1qntbTNO9LRZLdZqpwY2pQFJCi0ZGhkUJk4xHIMTXmA94b14BauTbn1A+l5xoy//vXwIi30DTsJWcOedVxws5chivd84PRhiYC1ncaCw3byLAuHmeK9RiDBV0oZYa14uO4sp6Jo1+7dryAncGKCq6dKItSh5ZNGb7feaUtzGRHAv4b988MY9XoVCsa1MSgMWK/UNaaUg0LUEYf9ra1Hnh3xxNLy3Pq8AV4WWe2l6oWOzl7/G/ZVu+JOuKPWB+CItpH569Hr4t9xghNkDdfRMMSJvH2FgzkdTMBBFVqlnJU38yTbnA9AHM/un9LdFK8mQ5XOAHUIbRPr/KFF7f56zMe5/LSV3yn9TAoWZKzMy6VJpMs6FAtwLCPSbaXatyZ0RFcbAILULLxQL6yjXp9zhmOBlwNIrwc1N8EXMav25j8vz185hqm1xPN2FFBanTeRFMBYDQ109AuxjXXrnXQV2UQ04aoHtirQDqOB8FSKeRPKV9wVxjqOwzQV/8tPI9fFiOuFSQQUeN0egFZ/feHAVqbsNy6KbHaA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WnrivMnk/bxmgWpWJHwGVO/c/3PthS2x45bgOVFHCe179I497teOnOWj8exX9yR6IwYtYGr9ZVdR3UG9/ZdQdapWQ4cz8fByi02GKj81SWiVlcGX2WZIljbfAazoYF99Vi/zL7MZVuqE5KSS5eNORi5ecQ3TFbVfFlToIOd95ngEl5+/mphzBauxzSQkBot0RTefzEnVCCJnXxemjZvZ3tF8hj6MH+lPHhHIImld3Qg8owVOsLYztrW3jfWNVFJKMMt/NvTnQr9WDvILKe3BsO+XHXE0fpeSWBNKU74q8rCVWZpB4KfH/NyL5mt1+LotbSJAjWtE1CNouTo2u4XamuIW7LeRaq4oY5xP9n8y8qnF8zfOliplV+m/0RuP0AuWXGKu/qMMf0TfaHFSBQqT1Phq8vlsxwraLViHruu3BqLzMZ0ycvJWavD+SmhNa/S1coSmU8dTnW0S89djb5H1ef7X8qUtSRlUkwbxg9zQc+/ZfjrB8517/qdYXheXnvkcO8YfKbNjlhlRjpUi9M1ROaVnpguUvV0zc8jjbSfFRhS7nFe1a5iT327qs4ty6pyr
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG9oRk5NQkJ3enJwQ3ZMcVhFbDZ0NjlWcFpXSlNpTUZCR0I1NXp4WDAvY2RY?=
 =?utf-8?B?QWsvYVovcU1oQk5IUmlSNTNPcnRBNzFkRUtlUE54bEtLUXFLd2hmM3ZhUHVW?=
 =?utf-8?B?N0JVVFlRWlkwTitBWDFMSmV1Nlk0VWdrUm1Tcy8vY2ZQNnlhdVBxZFpWZjRs?=
 =?utf-8?B?ckZTOVhiRE5xSXE1M2haSHdDdXBWVEtWWitKOWhtbE1YbVhqVkpXa3diQlN5?=
 =?utf-8?B?WS84dWZBRndSMmFpOHNCN1hRZG1XaW0yR2RkcVlMWkllYzdXN1NnamVKdXR1?=
 =?utf-8?B?cUM1SjNzaGwvU25ldEtCZUNURjdibG9uL1UzNHhFMDdBek1LWW42ak1ZSVR0?=
 =?utf-8?B?Q2hvZUVtakJSL0t0YmpZQ3pPbEpiUytFQXorRFpUbXNSaFBIT3FRN0RBTlUr?=
 =?utf-8?B?OVpCWmg5ald5Rm9uZkN4Z1dGUjZzcWJNUnUrV3RKUTBYTlFNNzUvYlVLNzVv?=
 =?utf-8?B?Z1JTMnR4SElWT1kwNkpIMFRrdmpib1IyOTIxVXVOT2hrMmhqRElJSHB6MmVP?=
 =?utf-8?B?ZzlRUXgwbGtpc2V0WlZHdWtNa0dsMzRpUnUyenJFY3d1WWcxd0Q5V2MrQ3o4?=
 =?utf-8?B?M1ZOWnNaNitTZGs5RGFzWXlqd0hNSkhBd1R1aUQzbmNXM2JYUndtTFp0dEdp?=
 =?utf-8?B?b0xMbHZ2aUxiZFdUa3RObTJ2VFQ5OG15WEFsM1pXRTk0ODV2N3FBcU5YbG1j?=
 =?utf-8?B?azR4cTA5L0IxQlZyQ3RObFM3SkFsdDlWWG5aN0FNRngzdmZ0QWpCcitzVVht?=
 =?utf-8?B?V2l5SlpQcy84cjR4Zk85SUdNN0dkcWVaODBvS2tMOG1TM1haQ29NOXlUVERQ?=
 =?utf-8?B?ZENjSzV2SkwzSzYwWFRFVk9Pdm5MVytJclNOMmNybmMwd0JWNUh6SzJ3MFFt?=
 =?utf-8?B?MDBWUTFMRTRQODRMaXF5Wmt0cnBBb0pHZTJFKzZ2UExRSjdPZFBwU1dhb0Rk?=
 =?utf-8?B?bnlwWDVyOVpscTR5VXBFUUFmd0tnYWlXa2I1dUNjQ0x6K1dhd0NMa2JxR2Nu?=
 =?utf-8?B?UG5MN1hoWGRvRzFTOHR0MWQvaGNZRWV0ZEFaVUNhRXNUVDdxaDBBTElXSXRt?=
 =?utf-8?B?YVBmVjdEeGxXSTdISVZWK0RPaXFkaktnWEhVSU1HVGNVTExlRThralk2dDgx?=
 =?utf-8?B?OUViRkNtU3ZMZHExaVJUSHBRdWIyZnFiS0FtL0VITWxBaGpFLzRISTRrN0F2?=
 =?utf-8?B?OFIxUlhPREE4VTNVNU9BdTFBcVNyQ0NFSk9wN09rMjFkamVuTnl3VFJ1VUoy?=
 =?utf-8?B?QnN6TW13WjZiOXo2NVAzL3hSWTBoMm9LNTYrZ1E0R0p4ZERiZGJqYmlHK2gx?=
 =?utf-8?B?R1FZRU1XbUVtcm5YN1BxWDVCbVc4VHRUS2Q2d0txMVZZQ1dYV0dCVkVpT2xH?=
 =?utf-8?B?dys1WUgxbWxtaThRVGdnTUNkcGhTeEFCaXRJSUU4eWptNk9aS3pKQ01zZUls?=
 =?utf-8?B?NlNWTkZxeEJJbSs4VlVZMHNnMlZiSWZySVFjdURmeFNPSWkwRVlTQytUOHVR?=
 =?utf-8?B?Q3NMK1pQbW5pRGczb1pxM3BoWU53SGxqVjhNRk9YdXVRckJ3b08wczE1QUlR?=
 =?utf-8?B?RERBVnJvT1RtQmhIUjN3UHplM2JKbXluRExwcElGd0pDLy9KVWR4b0E1N3gw?=
 =?utf-8?Q?Nm/mpQFhI3MX4iACUlHhWn4BapyNIPKNPnksfXJxJcrQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44773cd4-7ed4-4f53-6832-08dc1e728788
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 13:27:23.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2685


On 2024/1/26 20:59, Arnd Bergmann wrote:
[......]
> Yes, you are lucky as I'm just in the process of sending out
> a fixes pull request.
>
>        Arnd

Great, thank you. :)

Chen

