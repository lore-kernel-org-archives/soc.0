Return-Path: <SRS0=DjRg=G5=suse.com=mbrugger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC0C197A0
	for <soc@archiver.kernel.org>; Thu, 16 Nov 2023 14:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ACCCC433C9; Thu, 16 Nov 2023 14:37:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E0D8C433C8;
	Thu, 16 Nov 2023 14:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E0D8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/Vxnw6Y3qFs+6zgv7Xtnewo9CG0qBIKQWYXdfoFgnTuU1sF8R0BKKzRTK67iTYrKAvJovMbqDbbf3cfBX8CT/ikcXOKPmgkJhcyaryQaNV1TT84UOmskDEW5E+choCUBYSuF/P8QHdhP9hvzjxccHAToL/6DQpqPlZ8udHq3cQskDRH4M4hJ1gndrky8bn9EnGEWVkfP9CJtRZ7DW352dfeihERvY4Sr8E4yBBeKBo+5TME1vD2VWZmARnQu/j2nAacv7SbmJp7MQIIdAbM4czpA/18RlIoe5lg0C4E6XGQGy+goNv5OnudIvRt/dd2WQ1dU0hT+GxYLeIfh+AvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEPVHjT/wi2RvGLifUhSKasouUoUxgoloUuihDEckT8=;
 b=Y7X4PjvIbQxB6s2zc7I2zAOUHtS+GxGAHeT17CKCfwve3uSC97xZmDUmMirIX+r5NVlw0OONBvm8EP4NRjBF9QcBRuqPYWTc417ILz8eqVo3NqM+Mk4Owdt7WhcWZAjl+EnEXs5JZyw9pxgCA9H+J+C8ohmuieGwhL1gdYo7hBchOIwKBg6bB82Xf8BIE46+DpuNHBzfScWy/3gphABTdhuiXPtimRj9oPfjp62AFFcWDTjCsv4aMxKjZK5IKETzrccz5jwkvPBrGxl8EqMgyG8oUowz60zsAbs0Q+9tVLMVcNyY2MC/5P2OrbVfNnNaL2NXH8vMPu+U3hIiIlT1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEPVHjT/wi2RvGLifUhSKasouUoUxgoloUuihDEckT8=;
 b=hqgU9gWHxKS6QXXGcVOCinF77UbXjDHa9EaAZMkeFmfzqK4HV7HIjFfHH2b/xru4VcbTKQdaIRLK0waujbM2RwZVRGT0S0UNk5T5JJBTDcDDBd4p8dugWSUfzxfJVSMflaOLn3Do3SISzIYEflrWhDnlDWoMlleML1FZjPOH/hKDUFsHx4DNE9e2l5YFwMdZTUHZnUCZWomsmX2FClJUEqmXsBSq4UUtScC//2pq3GRbziOu5UNgVmaLhRg7+0lYq+4FoBOnrZA+tfygkaKS83DSV3H79uEMl2nzlG6uzKPp5PLVsvwCWSFm1JUcJjhxxy5QpreEXoVNinDrmJVkZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6432.eurprd04.prod.outlook.com (2603:10a6:803:122::21)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 14:37:03 +0000
Received: from VE1PR04MB6432.eurprd04.prod.outlook.com
 ([fe80::b220:97ae:22a6:acda]) by VE1PR04MB6432.eurprd04.prod.outlook.com
 ([fe80::b220:97ae:22a6:acda%4]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 14:37:03 +0000
Message-ID: <fbce74d9-34ab-41a0-803b-c38c86baee89@suse.com>
Date: Thu, 16 Nov 2023 15:37:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change the S32G2 maintainer's email address.
Content-Language: en-US, ca-ES, es-ES
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chester Lin <chester62515@gmail.com>, NXP S32 Linux Team <s32@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
References: <20231115234508.11510-1-clin@suse.com>
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20231115234508.11510-1-clin@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::25) To VE1PR04MB6432.eurprd04.prod.outlook.com
 (2603:10a6:803:122::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6432:EE_|VI1PR04MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c4231a-5ea5-41d9-5e9f-08dbe6b1801d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z42bB0e+pkmQ3gq3iZj8vA0rVSwTqhjhcR2P308HybCO/S+k/S1m7gdErwI5gWXwcZtBFLbzkP7QhKetuNTNh2FHBQerm725ozycj9/ga14x6Cv9AD5rY95IPUNC3g0mi3fPzySkcfQIiidgX0dP7g4ck+tRir99JfnF27Ex8sAyXA/1rkB3PMWiRywesT/gwa1sJCoOwoGBiYQ6utlx39Dy9Le1PKG4u6mj4syBku+GiuPxgZvR1Li7caRNjjYnBoTZMX9Q/3wjr0yfkfF8i6Gmir9zTdoQpJCuOhLFlNTjZ91yb1MpIotsFvqGcyYsmQ0tO8UwIG3zuirFgrJ64g3nAiSnMUhnyHboMMBpCSg7ISfipTmyIPchaP0ZGGyphbu/MJ6WwpUsB0HNqWG3a3q0ns5BGfd6oOXLmdE7cQAqtuICi5EbgtHyLXiDmCaD1VZInCAZ3HjTL/D8Zvqe/tYTfSY3e8n/4e7f+jKZS7Hp9kN/lZohozZTzSuVOb8k26U2PEA9dO8wZUBNzWPnpo5MttDnDd0XpWXf7RvObiVf5B5QOJ2WR/Uct/w+hEEtpneiwlgNeDUnTrjEAu4cdcZUVnSLd2T93XilEILusSSVNI1O4dQphMYWhApID4nBYqMw8wHe5boStSJBoHdPSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6432.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(41300700001)(316002)(37006003)(66556008)(54906003)(66476007)(6636002)(36756003)(8936002)(6862004)(8676002)(66946007)(4326008)(38100700002)(478600001)(5660300002)(86362001)(7416002)(31696002)(31686004)(6486002)(83380400001)(66574015)(26005)(6512007)(2616005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHhPMlBEUG1kSFNiUXpxRG9uVkczTHI1eVEvZTF3R0lEaExkWmN0VmQ1QjRQ?=
 =?utf-8?B?dU9IT2xLTHBPWWx1eEJIYTZSZ09nZzVtcmE1RStKa1Y3SGxRY2lmZFhaMGFj?=
 =?utf-8?B?WGpUYlpMbTFmWm9NK05qM3BZVlNsc0E0b1pTTUJocEZWcXBoL0dnZnhTWVRJ?=
 =?utf-8?B?NWQ1NnJMeFdtYW5ab3J2VTQ5T1FlUmVSZ05MbFNBSXo3eGc2YlY5aFVBUFZG?=
 =?utf-8?B?SlZBZngrcVY5RUdRVmQvSkdKbTR2aEdQa1V0OTkwejBxNGRwMGhIR0NCeHYz?=
 =?utf-8?B?cE9kbnFMVGxZUGF5NzNuRnM2bFVmM2U3aWxTTXcwM0FFZkVMWHdhVklyRUFT?=
 =?utf-8?B?VkxHd0JTd0I4c1hrUXdncWI5RHhuQjlERWJ0OHdKcDNta3pzdmtBbGlkeGlt?=
 =?utf-8?B?OFh3bzNsVVBCa0RLWGt2eWRSbXRmMm1WM2kyVkpFckQydVpUMkhvalBCeW5C?=
 =?utf-8?B?eUN6dUlMN1Aya1hlSHlYK2lXRkNqc0s3OGx4TG1Qdnp5SnV1bGpNRi84b214?=
 =?utf-8?B?MFl4bzAvRWNDVHQ3QW5nRHo1bEJPRnROT1pwd1g0Y0Y2QjdhV00rYlk4U1Bx?=
 =?utf-8?B?RExDdlRHVXNNZzBMNHpqdWQ4V054YlVnOFNLbi9YWUVvUTBOdEJwUHJ6N09O?=
 =?utf-8?B?VFFwOTJmK01uZ2VONEpOdXZ2OVBpdkdFcjB6NWtWUWxKZWdQVzVuN1puZC9l?=
 =?utf-8?B?ZGtjcWdhMWJVYUhDbjZ0QmIyc05lYVJWWGhEdEc2cDVucUNmNHJqUnVvQlhx?=
 =?utf-8?B?UHp5UDVXOUpMeUpwczJLZDZPaUt4V2lJVmx2YVFqcDBOL2Fycmx6dXFYYk5B?=
 =?utf-8?B?eXdpbjR4QWRhODhVN2FUVlhnYWorWHhQeGo4YlROcGpyWkNlaWJiVjdHTjcz?=
 =?utf-8?B?bThMOXptWUdheWdDdXNUM3AxM1hhMkF0QWxSc1BCMTRnQUpySjlvWHdaOVhn?=
 =?utf-8?B?MmpsM2w5R2lkbE0zOXhIWFR2bU5XOUorTzEwUW1QU3RQaGIrM0pZYVhTR3pV?=
 =?utf-8?B?aDZ4Qmh2SXlJOW1wNzcwdytzaHl4d0tXckhKUHZIUDdYSkpLSHByU3lnRnhm?=
 =?utf-8?B?NXM4SDUzTlBwc0tNQm9wd0NTUGlnZ3RCdzNOL1NkdlRnVDlVclpsNDNFOG5X?=
 =?utf-8?B?K0NFR1FWOERMT0RRbThXdnRjQ2ZCSWhubFVRSmFzYTFxRDRaelI4N2NNaFpx?=
 =?utf-8?B?dW5ndm5TY0RBWVZJNUpldXkxenRXNlEwSWt6aHArMDgya01kRlprcC8xazIw?=
 =?utf-8?B?TnVpVzV0MEQrN2V6UG5nejdHUE5QTFZ6TEVQRkRSMmtScGF2RWd3U1FsRi9N?=
 =?utf-8?B?WVJVNTJxMjdnbzM1TFA3K3FMbFpuck5aYkQ3MDBpWC9LZWRUVEtRMmlha1Vl?=
 =?utf-8?B?WUJDNExWRXRYTGhrdEdJeGxhOWY3Sk1oZzZRMExqSGhCbzRFR0xPTHp3Y0s2?=
 =?utf-8?B?TUdaSVFMY0RsL0xDVEVpWXN4N0ErZEJHMThCdGkxTlYxK0lNenVKQkhETDl0?=
 =?utf-8?B?SVBTdi9KUWtBWlBYVGFpb1U4QjVCdFAzY2RnZ0NEUDBscEd1VFduNFd5ZHY4?=
 =?utf-8?B?a1NTVW1DeUJ6YUR5OXV6SHRoRFREdWJDVXl6UGV2ZkkxMWZNWmNhWXFZT0NU?=
 =?utf-8?B?MHoyRW1OSk9uWjQ5Q1lRWGU5OHNHTFRUUXNoRTRDY3BMM3l5RXAwMFovNUp0?=
 =?utf-8?B?VEQzeVh5Y3BkRUhzVFdRNEkyeENXNVlPLzJjNkNFcGF4SHdGWlFLREc5SlVZ?=
 =?utf-8?B?eFdCQXRvbDg3WjhJMnhFRnA1WDRITHNRUmhZeUxNcktIVWhwMmU0am9zN2Iw?=
 =?utf-8?B?Z1gyWVNvNm5aRWszb05FR1prZ1FIbmZ0UGJ1dDRuTFpSUk0yV2h1Q2FmV1FG?=
 =?utf-8?B?RkZlZ0VCbDk5V3MzVjI3RldyS1J6M1FvQXpoM0dyRktFYjR1VHBkMmN4UXB3?=
 =?utf-8?B?eGdZYkN3RjBXWTl3dmNobVJSNFN6MFByWjJKV3FYK050NHZGbFgwaW1DQ3g0?=
 =?utf-8?B?WWQ0YzBJMzV4ek5aK0dWZ2huZHJiN0pqOVR4aDdnSDJYcFdoU3BkZTB0enFp?=
 =?utf-8?B?SHZXeklzZWw2RTJyNnJDWlF4R2ordVBwdnBmR1Rvck51SG9QWGlGWW5YWTNr?=
 =?utf-8?Q?qERYskbvGPlxMeMmtcPrBtxSo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c4231a-5ea5-41d9-5e9f-08dbe6b1801d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6432.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 14:37:03.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCby5Y8NjrxF6DR4QDdPWhU7EaxbmlVdMVHrZZmtYPGZynp1n7GsIKIrujJwqTaew2nnbAehI/d7x0wtORDAgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104



On 16/11/2023 00:45, Chester Lin wrote:
> I am leaving SUSE so the current email address <clin@suse.com> will be
> disabled soon. <chester62515@gmail.com> will be my new address for handling
> emails, patches and pull requests from upstream and communities.
> 
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Andreas Färber <afaerber@suse.de>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Chester Lin <clin@suse.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

You might think of updating .mailmap file as well.

Regards,
Matthias

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c9f868e13b6..84de6a1793c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2535,7 +2535,7 @@ F:	drivers/*/*/*wpcm*
>   F:	drivers/*/*wpcm*
>   
>   ARM/NXP S32G ARCHITECTURE
> -M:	Chester Lin <clin@suse.com>
> +M:	Chester Lin <chester62515@gmail.com>
>   R:	Andreas Färber <afaerber@suse.de>
>   R:	Matthias Brugger <mbrugger@suse.com>
>   R:	NXP S32 Linux Team <s32@nxp.com>
