Return-Path: <SRS0=Xofb=BP=suse.com=clin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FDEC77B73
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 14:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EBCBC4339B; Fri, 26 May 2023 14:03:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61433C433D2;
	Fri, 26 May 2023 14:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61433C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjNoN40poKvU/VWLPtB0EcPSuCDGjx93v3+OP9vq+g4JA0nEk8atVxX6a9/I3V/N/IbFmz73AnMWOqXvtGqHwyeNirCvFZs67ycMCYDM8sDkpCYw5Nagy/+8ATP2WGx+1dDqjXc2FEdqbn35lVqbLDArtbij519dTbGhwHtd4AERG2i3prd6eA6Iv+CynmYdGBdeoiYRpBOIN+0AzsKVqhtiPsBAqjM6D8mzf5VOcbRPHKu3P7OHUDOeXiPOXS3dkCroYOz/RUAQa5cqerG1EVZLbllYhDYdJ8dvaNcBW9IXHZMat/uZNG8rHhHUw99zBKkiGajftyAdcKUnW+qYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMEyVoqwEJ+veCsHd9DUKu4J9um+3Bjo+LHrruF35yo=;
 b=B/YVaso/b+1hgu3DQj3T6uP102LrisFCNjNG22bM9DtD2STtSfxdNzcRI/w5FgSnXq3DkM+XnyxvQIk6B0gw91dAaWLFO3KvVf1ZD2vBrpFLlsR75D3/uDdijZHJ+lDsKcXW5brR2ZTmP+br5flglim9YTTZamV1lsz4TVlj5T3WwgJ3ijDLVxNgPgEsBt9rhnfkb3CGSaAjgA47hJWpDHEAkvdYWuEqbqeQmfd00tCSX8o7Jo1VdxmiiKaG5JFKCANfZ8hedNKuOp/PYC5goFg2GB/+dCAJDttRoV3evyfLSJ2FECeq4fXSwp4yQrrheDwp0Gbj+G/ISB10+kKQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMEyVoqwEJ+veCsHd9DUKu4J9um+3Bjo+LHrruF35yo=;
 b=ljuJeyLRSjCGkiZlUd6/BpN/S0LjIMr5v5KTCGRkJvieWXokTeWn5Bma8efbufElQHM3Xm+Xt1y1KDqApJk1Iv/T2Ca0fQ+pcrzh0RXO78kpTUqWGw/yLHkP+NDW46aHi6hHHycheS2nLsmmCWQR2z1zAOqP0yaSi0aRHJuvU0eeJkjmcdDwPZwPJyn2/LquaodHFU35wBNV2sGIohLRfIk2zq239oFe+3t3Qwyzd5276PvI/KNwDOJvmjc6ES9MwpJ9C/oOGoNQoN8EfB8psT9qCT+HUD8iCFVicpwl0mvnene2q3+dj/ofmDuqAQgJVtd7zHVvDSxfF4nsf6wYvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com (2603:10a6:803:4::13)
 by PA4PR04MB7791.eurprd04.prod.outlook.com (2603:10a6:102:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Fri, 26 May
 2023 14:03:50 +0000
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::7840:68b7:3d49:6bf7]) by VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::7840:68b7:3d49:6bf7%4]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 14:03:50 +0000
Date: Fri, 26 May 2023 22:03:40 +0800
From: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: s32@nxp.com, linux-arm-kernel@lists.infradead.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Matthias Brugger <mbrugger@suse.com>
Subject: [GIT PULL] arm64: s32g2/s32v234 DT changes for v6.5
Message-ID: <ZHC8PO8lDjTae7nV@linux-8mug>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VI1PR0402MB3439.eurprd04.prod.outlook.com
 (2603:10a6:803:4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3439:EE_|PA4PR04MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de4f187-bdaf-4ea8-464c-08db5df207f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/OBjT3bN4azJbISKrvg3B4zsn5i+/NNdylZxQdsZno+YYMEy9p/X8Q6JDipr6NArZyCG7fyNmxUD8bodz1mdc4Lyh6G9fJ3+SzLgyKXGTEolqnDH/4ckBUOsleBNkJ4i+5bARxFjF/R9tFFQmU6AUKmWOmYqILx/8uQnRpvdI/7Gy5E24UuMMstTE8BTb7zpuJEUTOlKDJiF5N61yWNPuMFIIO+/9JycMpKgvg366kUhMnzYOQZY6mkeb7C4igp74fiF0bMTvm0OWTdTZLNmZ05AhS0PcuQi/2actLaHn7pxC8TLHLkY53Hu0irvXMmGKNfM9+SSclnqAvzhrO1fr7IdI21dktuxWqBOJZwo2GLbHGX2go3oDmWvetEyXOsugjFum8vtBoUxqJrEJq7Ofr6+DKXjDTXtzW25bMsK7zyEKfvAeDV9Ho9TvlCXKopac707hOUjgIQo4xxStm6gbDSzum56khhrEABUKjRMcnvz6zaH/8SRr/qn4XDBPkYyiyRaaCFrwLetv26uDbaZlDiommerlzZOB8u3AGsYakQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3439.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(66556008)(66476007)(4326008)(54906003)(110136005)(107886003)(6512007)(9686003)(6506007)(26005)(66946007)(316002)(6666004)(966005)(6486002)(41300700001)(478600001)(8936002)(8676002)(5660300002)(86362001)(33716001)(38100700002)(4744005)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWE7bTXXkx3aa25EhFzbpdHzR2EF8kgvlz8FeT9K10kdtBFDqckyNiyGigWo?=
 =?us-ascii?Q?4qnrKKYbWjL1V4+ipLLrWg3l8jFq4ke8x7o3+h6Ssp0iwpy+Ob3ezrEVymNt?=
 =?us-ascii?Q?f4C12GuQ3YU2TyTyZGHUGIOlvI8sLnUqIVywkgp7Ed+Po51M6NZbMhZta5om?=
 =?us-ascii?Q?ccHXrYIRKjeizrK8NgTeNf1MWO4t2tACxcsPIVnie1AVNqDdJoktrUatXcqW?=
 =?us-ascii?Q?JZnPyrREHDk89VKAq1eMvEVVOOZQwZeGWiCejZQEy+u3mcThKmIn3jryEcad?=
 =?us-ascii?Q?fWvir9qNtZE6mn+qG0bdriK19E3JYnGy8hoaluYoOxNLGjIHwLHIDY2WEQ3H?=
 =?us-ascii?Q?R7FZnH9P77Uyb8AFTen9M173pJotXVPHepPFgvZGYtNRD+SaTZp35Zbxn13k?=
 =?us-ascii?Q?PdsY4OmAstsfyCKVimnIBUH4I6Y0m6enJK415B8f5RGpNeOTuFTP2oQ76ETN?=
 =?us-ascii?Q?liyeiSXhy47+4dizDa+DwT4SL/L4Bdy27d12bcj46+e2aQOfH1byMCShfnlR?=
 =?us-ascii?Q?EMd6+EEqvhmzW2/3gFdIZTVR1tHrQVcK9apaRrv5ZKMFHa/yOALg62Y3LMlI?=
 =?us-ascii?Q?vuq7b9vm55ezUfo2SlbzZ2qH8fMCfDqrRAxvQAxTOFxWfbH4LXcipv1DgyLw?=
 =?us-ascii?Q?kSwbDxDPhwqp0dZd+evpExt4oSkSr+nelMRqQwKSE5pnq2dAMbJWbNFY4hFe?=
 =?us-ascii?Q?OhjfXdc5MXN1VZwR0sZnLa5DiUZjYHoBj6pWhNjI8ZJRL+8WgmgiFyplFWGX?=
 =?us-ascii?Q?iTfH+eAljlkY7Fh2hhX52FT2xVQMB3tx9uzUf0H3uQIejvQaO+fNmy3I8ygr?=
 =?us-ascii?Q?KhOMazG7a1EOF8PSKXAlfmnQI6qFLaXCamq7qXa/nXwMoDAsEMxodtO84ldm?=
 =?us-ascii?Q?AsqI/uua6JUWyQI7DfvwnSAAz8LplyZm8dAKNEb5mwM87r7TNyQoFPaFmVTS?=
 =?us-ascii?Q?9C9xnlqk3419KPHhCn5xcRtGEWJ1D5JlsZaTWf9c/e+3/b45BymxN7csKTgV?=
 =?us-ascii?Q?vFdqgZaBHb7FqKKoJQI4SaNGp+BTTKR79r6EtFH7otbCaRuS+hRb6wYnRTXu?=
 =?us-ascii?Q?WCelnkOjp8ZrYmBQq0LWZf2wk295hNybAjBvdymqeTkSWhTmS6puqGH7Hb71?=
 =?us-ascii?Q?xECHQL0GOur9DuEyDw13jStSFSjscjYAVVVb40AweBY+JSXq2/aW7EKY4Zxu?=
 =?us-ascii?Q?kxTV6HLsWAyLieLjYH9EQUeuPkI+YFxeYvI6ks7zqjuyJu5skOdabr+TTXBG?=
 =?us-ascii?Q?12CXOPadD9wlE9FWcjJ4jOojr4Pov+8D/hRCh+Z8taoZrX6lKrxt4/tzAcA7?=
 =?us-ascii?Q?z03c/eNmTM64Jxq1iDQ0T5LEWX1vWgT2ibZ3tiiGJYucMFg9IKoO0Mys+FEm?=
 =?us-ascii?Q?VlX5QQopH/uXKx3MmSFvtHi+MsIZngJRoMhuEW/xlVAlJjlXV1jysn2ckjsy?=
 =?us-ascii?Q?MrqSZL0WCyb6b1libV3TssVudfMJbryXHgvIH9mLx7Nwv4br9m/TTZ5hTAOL?=
 =?us-ascii?Q?GjGN12nnyGG4jph7GV6ARygblfMDkSiVbVT4G7FRaBPGuQJmkU4oKLdjJJpy?=
 =?us-ascii?Q?8Gu4Wb3jRcC8NNx11Ac=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de4f187-bdaf-4ea8-464c-08db5df207f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3439.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 14:03:50.2657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0Gyim+XJS9RrtaWa63G0DU/AZ7huPprStDdzGLgqaF54EyGHEeBtt/Ug4mHPk12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7791

Hi Arnd and Olof,

Please pull this small s32 DT change for v6.5.

Thanks,
Chester

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

https://github.com/chesterlintw/linux-s32g.git tags/s32g2-dt-6.5

for you to fetch changes up to e2b96ceb554ec964e536dd443217d514684f6c49:

arm64: dts: s32: add missing cache properties (2023-05-13 01:58:20 +0800)

----------------------------------------------------------------
DT changes for v6.5:
- Add missing cache properties for s32g2 and s32v234.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
    arm64: dts: s32: add missing cache properties

arch/arm64/boot/dts/freescale/s32g2.dtsi   | 2 ++
arch/arm64/boot/dts/freescale/s32v234.dtsi | 2 ++
2 files changed, 4 insertions(+)
