Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB4C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12052C433EF; Fri, 31 Mar 2023 09:58:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CA06C433D2;
	Fri, 31 Mar 2023 09:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CA06C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRxHqffegYQRj/HvHSaa/05EBMfIcgyKMMGJTGI3KtdrXx+5bJ6pZ1syeAMt+KSz9xVGhRpst+XPLdpoGGTW5TFXopquhMJblDmBwvo05qLpLobSxnTFed6mC2p+Jwhn/UPQTK9q2xb2240D376wqme78uUJkFS4oG1lk0slG7YSjF8yYchY6sAPa8nZfJIbTRSzaOfm81FOTkclc0LM1jUtAigUzLaRDFObXuhB0QrVdM4B2hFkeE1G2i9Ab51LFsvr80k85bS8vsJ2fKPHrSMmsUhjDbgTXG23dImOTqwc6GAd7+/DzbV+mflJBKFmVDN+goQECvZgUNbI+tvnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5QsMdmGNqmZlG+rviZ5Qx4Tan3RCAgrjmZj8jSiWNQ=;
 b=WS4D9JHRk4rLbD0XxpiRft1TYwd4JtUeDZAbftmVbuZ37nagf0nQ8TE7Ok/4LDSlH3ajQCO9qqDJW9288U/3sVCc7UILxUcZk/vCwNr0Y9cJGJw3DRbj7ECF43Lr0fkFnjJ4X5Q2VHJT1VrLe1iomH7oKz5c8ejhlP/O48egcXtvjjdr//llT5/IVn4cmFTqpFoPcxuAFxJGMmAJpB8odZWFG0yMj9apy3NvlbI/tLLWjb2cb4yTlVLepDvcUIMwtPAFfHwiAuGfsfRHZ+nebcpVTpjwGic+aV3hN65TS0jPL0QoNDUQYH/uG2VClicnyMdmS38rCCNqWNiHvsw/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5QsMdmGNqmZlG+rviZ5Qx4Tan3RCAgrjmZj8jSiWNQ=;
 b=AKL0xXo9StURo8BLUdzbHe9p10vAYR2zzMcWCBn2EUQDXFswc7sbtwJ+8ubNBfgXCuO31UhU0c/c0Qev4bmz0znYaePhIAdZfYOIC38+K1YOP0it2kmrcp5fZ1dT2ZtOQYphTaWgb4EjELSl9bwXI65Bm1kUVQ2DSYddxnWkP7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM0PR10MB3539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.14; Fri, 31 Mar
 2023 09:58:12 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 09:58:12 +0000
From: Stefan Wahren <stefan.wahren@chargebyte.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stefan.wahren@i2se.com,
	Stefan Wahren <stefan.wahren@chargebyte.com>
Subject: [PATCH V3 0/6] ARM: dts: imx6ull: Add chargebyte Tarragon support
Date: Fri, 31 Mar 2023 11:57:09 +0200
Message-Id: <20230331095715.5988-1-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|AM0PR10MB3539:EE_
X-MS-Office365-Filtering-Correlation-Id: 626766f2-0e49-4a87-3a77-08db31ce70a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/IxY/bQg5PLR/Hq4rXIlWaiYkpdVWcVAIWjGafDFlM7hgDH4L1qTJlqDXgZNJrfbGU/7RqD4bpWLYsh33fIHF8y1l3qX1QQzq/m7HipPX8KsKi9P6X5GlVzl/hVVW5ZrxE2Hk00ONOcFT5prNsgPt7iiWrjTsk/P5SM+dDewGGJ/9/eIShSCGrYYch/ofz0LNm4yQrNUr/9jdqKdYz0bdWlS3x7hAZHh5TZ5oBka71ceeb4f9sXkW1oI/FGuQtEHzRKOhzuOSu01PjPmeXkdErRQBBzQPUuA/o5kCylsZanu/K5+eHKEPAsIiIcBu2g31J9AFfbbNOfhMFygwXrv4ZLHVNfwnJ8CqdOLQx4yu3FGsyPfC5wGkabJ440D0ZOxkOrHvUshM+kEXLyu2nzx76NK/yfe9KK+Nrpe6Iu1c7Cczj2lQT2EkXMgqufs1Wa9x07fnJiSL1BkGiQSBVNRVHBWdxHgW/c3NY1wxQrjy+mWEq+uMxVzygE0sKRY8cNUbHZN+Bo5yOYi3pRh2YhedrxoBFy2Y0QtCaBVG9EOO3tAfBmJ82c9j1iuSRcfg8TczhyZFId3lREmP72OGe+fgEw56kuGiFlsQjywELOooVGyOfV240qJzxfzZVbZI8H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(6666004)(107886003)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(7416002)(36756003)(44832011)(478600001)(66556008)(110136005)(316002)(66946007)(83380400001)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(966005)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2j7UdTGizKBngQkQGKpody1lQYPGMfs7+n+nw6l54MZkfVnWodAj3DLbeH5n?=
 =?us-ascii?Q?zr4cm+e7jynK8wuTBx5vKW1CRIV6ibslxszY65oLqOqfWtr0+sqSTiSqZVQN?=
 =?us-ascii?Q?DuGtMynigRzk03LdUHex49c2SubLYJ3ecsVvhQA55Gc1pzHsFEIP6nDBPljU?=
 =?us-ascii?Q?Sr6yutr4AT0av3FKBIdCRdV1t0eL767kJy7Z3CutC5Ff13Cf+hKrjVgn4CFi?=
 =?us-ascii?Q?Y7QzlZChh9yhQ03gxS+1JEjoTycU5ishtmDVkUc4pNOBGd/aZnD2M9OUce0V?=
 =?us-ascii?Q?4lYwxZyzWzt0+6y8PNDH/IcC1+6lY7ihmO23iYo2aU/UuIdgaKDLAigF8KLF?=
 =?us-ascii?Q?BkivvfDjrULx0ISfrMjo70BKO+RYs+9i/LL8Ap6bWvOlMRUketTMiweT6NrF?=
 =?us-ascii?Q?bI7SfgiK0H0hO7HaqGxf0275A1AnvENNA8ucHS2GbG1+THLkVJmGx/N9T9uZ?=
 =?us-ascii?Q?HHaKeJvRn/lTvWOOM0JH1xJHytHHd+LZ/M6s6v2pijnl8DGPGz5gTq1cqdwO?=
 =?us-ascii?Q?apXNjuce9is2F3jC9mRzNw8weC2vdD4x5kA+Btg43qp5UDMFTEIt0IAd/MtV?=
 =?us-ascii?Q?TitB8uKnSgbT10VZbaOhsKMBJAHzU7ztn3C9mEd5Nt4jZC2AQdswFYwk8CsA?=
 =?us-ascii?Q?dZMbVps/xOurVgnXVKJixN0c5SymHz7ehjrkKUGz0i5uCx5GPytBE/T6HJD/?=
 =?us-ascii?Q?Ilx/jQrqxad46BxR7oWekatpYXHOh1ZhuvhIMDClY1SBY2GMBCE2IoRYuTTl?=
 =?us-ascii?Q?/EluvTdIyLje/CHUrtQydjUQD1UqNvqvFeaLqYjamO6VRmOB0sDDNeWYLY1A?=
 =?us-ascii?Q?e+h0Bhn6QhPeM+8pZMYe3JAxQh2cO9LrhnTs4kt2cJn7kmJgrWnthQIfEHU4?=
 =?us-ascii?Q?h5eMJEkZjL3/wNajXGHalr7h0FYa2jXM0+8mwRmcBnQpFCxpeWuZiOFNhWVf?=
 =?us-ascii?Q?ex5sTYude7C73Jpvhss8CU9fRUVXYFJMbfVtueJXxQqpWahWIZ0G8mirBrkv?=
 =?us-ascii?Q?MY4Gr4AB9q07BIlXgImXJxjOTsqrmCkw5vs0pkAvogQryBqyawdu9kY0mLJT?=
 =?us-ascii?Q?JldZEMLF9j3HYeXxDfW571qtM4TtPvF+svc9aHZ2hbTnDcllQlF0jrxTrf02?=
 =?us-ascii?Q?uuPM03un0I/bH29I5C/ku1B5C9TF5AzfrtyF+M9vAs43kEswmugVXlt8t4wU?=
 =?us-ascii?Q?OztZj8hVNbPhMEm7qpmWJQQ2bGPXWEcXvVr2OMHPiVz2tCNGUYooQ/F+aNe+?=
 =?us-ascii?Q?sP3UUUeYZEswBwpT2TSog0flovCVhAlHdy325S4tGWgMJ8f1HvzWVDxtgn+2?=
 =?us-ascii?Q?B1eBApis3A9jINxOVFnWA2wCx4EdBPNsBVx5PvMZ3HLa3YqEo5hiAFyVt6BN?=
 =?us-ascii?Q?FUM8iZUftoerV21J0AhenskOU1oKASALvLKWJY46hAQhSMo5JUlAcoiY4po6?=
 =?us-ascii?Q?2uxKe/2xzkzMiPieJiaKFpXS/MBxDJnumpgz99zYvE2Xtr2pTdbJUSnh5zXU?=
 =?us-ascii?Q?czptuwPL5weIqUWtSVTAX3p7GAslfNiPzU30TErD938Csg4wg+0DQlhfY4JX?=
 =?us-ascii?Q?/zjNmb5DtvgdlAIbMaMza5bhKzBKG7p32sV2oTWbzKqhOJGMioUIP5O3PWId?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626766f2-0e49-4a87-3a77-08db31ce70a6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:12.7379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DxKNqHYrtOmyLqT5Z1+AMCixVgFdHVh0YXeyBL1YOH6FufhH2SHUmBottmwJm2HYkQHwg1813iQKy/GF+CLJxKOtJXu8AzglohlCdmVEro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

This series adds the support for chargebyte Tarragon, which is an Electrical
Vehicle Supply Equipment (EVSE) for AC charging stations
(according to IEC 61851, ISO 15118).

The Tarragon board is based on an i.MX6ULL SoC and is available in
4 variants (Master, Slave, SlaveXT, Micro), which provide more or
less peripherals.

Supported features:
  * 512 MB DDR RAM
  * eMMC
  * Debug UART
  * 100 Mbit Ethernet
  * USB 2.0 Host interface
  * Powerline communication (QCA700x)
  * 2x RS485
  * Digital in- and outputs (12 V)
  * One-Wire master for external temp sensors
  * 2x relay outputs
  * 2x motor interfaces
  
The Tarragon hardware is bundled with a charging stack under the name Charge Control C: 
https://chargebyte.com/products/charging-station-communication/charge-control-c

This series is rebased on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git?h=for-next

Changes in V3:
- dropped already applied iio patches
- renamed pinctrl_qca700x_mains_spi to pinctrl_ecspi4
- dropped Tarragon container nodes as suggested by Shawn
- sort the pinctrl groups alphabetically also suggested by Shawn

Changes in V2:
- after fixing technical problems send patches directly from chargebyte address
  and drop the related signed-off-by
- add Krzysztof's Acked-by
- improve commit messages (patch 3, 4, 5)
- make iis328dq fallback to lis331dl as suggested by Jonathan
- fix order of Tarragon entries in FSL schema
- improve Tarragon led node names and drop label as suggested by Krzysztof
- change Tarragon SVNS pinctrl settings after internal discussion
  with chargebyte hardware team
- drop broken-cd in Tarragon common DTSI which is not necessary for eMMC
- add no-sd and no-sdio for eMMC interface of Tarragon

Stefan Wahren (6):
  dt-bindings: vendor-prefixes: add chargebyte
  dt-bindings: Add DS2482/DS2484 as trivial device
  w1: ds2482: add i2c id for DS2484
  dt-bindings: ARM: fsl: Add chargebyte Tarragon
  ARM: dts: imx6ull: Add chargebyte Tarragon support
  ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   4 +
 .../arm/boot/dts/imx6ull-tarragon-common.dtsi | 852 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-tarragon-master.dts |  82 ++
 arch/arm/boot/dts/imx6ull-tarragon-micro.dts  |  10 +
 arch/arm/boot/dts/imx6ull-tarragon-slave.dts  |  32 +
 .../arm/boot/dts/imx6ull-tarragon-slavext.dts |  64 ++
 arch/arm/configs/imx_v6_v7_defconfig          |   6 +
 drivers/w1/masters/ds2482.c                   |   1 +
 11 files changed, 1066 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts

-- 
2.17.1

