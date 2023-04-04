Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89251C77B60
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5571BC433EF; Tue,  4 Apr 2023 08:03:12 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82464C433D2;
	Tue,  4 Apr 2023 08:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82464C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loaSpfDoqKmiCJR4FE5bV7A3vPy7RK0eOxENG3Y/eJyBGncdrERX3plBfJF5TV0w9OgK5CA01e2l1Hrotw7j702426pJITH7Oa7mQf8auAghY1zOpK406AFdO7vQMkkF0tUwKNyFgYryDIN5vHTFpMqDIN55U7aA03kfQfAaYJDWFlabL+AtSC4wLaMWfnVAjtLbghXcLdUozzpSFjFK6Ko/dc02LmRRSYIIAtUbiKb3ia52AQpTiTytuwQiYWTPEgR8XUEThllD0SLZfj+f+R6k1GWgtnrYSqEv7HzFAWsAK7YxGKom3exMv4eI0wi6tY5SEeJMQuoPCY4RSKgRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpPfMeGRpyaVNGvT4PQdFcNGklVtN8+Jb7PWT5ng7Cc=;
 b=FcvsM/GTJaS2QzpGo3v4mlmbAA+imz6YfJhoa4qa+MO35PygX9fOHgHhfjP8zz/Bs2eX98arF+keXwMW6hhzVBLa0UtLAVqsUuF0NTyOeVRvVewUEuPbYZckpeSOLogVvhX0Y2rAcJE31kXRDftezsidrwORHs0It3egprtVQweFibl211IXtk89Hl+/Ex0tY2gZ4tqkKZD7k4+GJax6BaxAGMelsTfl/g//SditABjTLsMwbv/E1Ugr1L2qActxmBFK516oxC+OATAA5Jbj2jA5T4vLLn4t/cfmDKpLrVctEym9KM1/ETpwnOlSMbcYyVgQioNkVCV/RAeuvwS2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpPfMeGRpyaVNGvT4PQdFcNGklVtN8+Jb7PWT5ng7Cc=;
 b=MFWI2DGBNeBzGncgovNC1drlrqV1EY1T80uKvSVfeReGXBe83Ie/X3I9+i82wvy9WB6Q45KaT/8qtkQxSmkbf6Y+M8oNSLYOjGnLwF34Yqrg4jmNszry+RqTWmV2Rz2/Mbs+oQDvdUACVEV6TLi45vsbgODiMgVZEC+PLLB7ZQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 08:03:02 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.026; Tue, 4 Apr 2023
 08:03:01 +0000
From: Stefan Wahren <stefan.wahren@chargebyte.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Subject: [PATCH V5 0/6] ARM: dts: imx6ull: Add chargebyte Tarragon support
Date: Tue,  4 Apr 2023 10:02:37 +0200
Message-Id: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|AM9PR10MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca37bad-2d9f-4961-66ac-08db34e30318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NFrVjuxJP8e+s6BTgdKug5XfRaW626JskwEd6ktO2Y41pUQ+b7y/MY6XNNlvfAE4HqzwNYvR07JL68lAmRo4VQV813hDgaguvuXpKDposdn629sCY0bJTadmYJVBdlCOR1/a2jPHR5IHfqeR4NosRCYqVG99Un3ALCgjMrqtidjFmi1mhnmAz6mCC6SijcjKJuk0jZeDV+ZOk6x8lmG6Lce9ewPV1+SfuABI4TS2TNOf/VriXVumqG17QpUxmThgGroK09A3S/ov+dftmN9patsa4RGvL+nL+mkIidA2YW2GyguLYg5jN9H+jaEc/DjxvH001nD/9D+ZE5hk36f2lmwTOHItZjpH6Lp2ODLOwhyVRScsCj2dWi8IHR6lV82V5qvNKShhTRQoaIjB0bvNgSYD08QNCWrOW1RNpEgLsBrckEdk8C1XLUKMJKCfQgJWJ9tnPHByPnWFgJLohOaWlPOrYrJmv47HNs65gX6LfYtyWnQgnJSHq2t6pF8haQc8KsayhR9LOwXe8KFV9Te3O9wWMYlzO9JPtWDE04AyKmmHUK8ulsuyPCkFPEZkeMdPVx4JUAjNeJSxAJSIg7YDOpj1sfz5RjJ+5b34lMtfldTmmes5rXoBxUEQBwhNaRfu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(966005)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?thQdmXf3NBbpAdoCyj4/TdlrlDy7tMgZTPNvkLbpTkJ/dT/HwzpUGBTDBidY?=
 =?us-ascii?Q?QcNBktwUnN2+oIyrE2eUp1dtf6ToO0dEFBgqV0zMo2XY64S+dHU5mfTGdKFC?=
 =?us-ascii?Q?JOA3o/D1lwuEioW6KOPbIBfvzeAMyh8Nn8VMKsostA+w9kScOpVvHV3nfgMu?=
 =?us-ascii?Q?vhmBa39DqnuYekqI+hXTOaba9n5SIPhPJ6zb5EnAdo/gJln/mJMcpCZQm8/4?=
 =?us-ascii?Q?uSU7xruN73MHxhvaPnYZuPTDtIF6NCgv9lYRh8u1WTkYU9l2+ewBiGgEXU9P?=
 =?us-ascii?Q?GNe4heloEEpiDhNeon55wjds4SnQbACWi7/gJIIQZjNn2joBcBd9gynBy2uW?=
 =?us-ascii?Q?wP3LBwz5C8HwuqElC3wZJ6SBovBa/KUVunhzbNAkYe2S58Mp5BRWRdD4ojR8?=
 =?us-ascii?Q?uECLCXG2N6PwMX1nzjRrVS7HDLcrGa2MDn6szvEC3aaGP8uru5XeT+nhrJFP?=
 =?us-ascii?Q?eedwopnb+8aBiiW/wSMvcNe8ZKfxs8PCtAYYd37kuKI8EcwHh0TRnr4UR+8Z?=
 =?us-ascii?Q?aRFe7ae1KyCJz/DU5N2TkGyeQZ1U6gV/dPD+ToNPkH5d5uOUtqa0kLrE4CAs?=
 =?us-ascii?Q?opkdEJ/ixfWxzNWYLeBB3saoGtpmVXClHYS5L7P2GZ63d2Ee8XZB2bAPMWNb?=
 =?us-ascii?Q?CbcRov62Ayfu/pnIG3PzLsc5Eu9/UUaPcMwyu0g0fa+rzB1Ir9c4wdZ+8gWf?=
 =?us-ascii?Q?jYcli0ZAFIAF2Wl3yeXGq2lYAH6sohJoYby5PIzw7fwNOT7PXctsni72UoKn?=
 =?us-ascii?Q?sCGCw7Xt8ye1qSCFUvv5Q9wJBNcG99Ip1cOT0zNdcZ3u8rb/yPN5ALe4yApw?=
 =?us-ascii?Q?1b/ziNXfz7h1q2yXs02wl63KrL+HMkAGD92Zaqclowkxskn9vuPxmTZmxgGH?=
 =?us-ascii?Q?WL7wQLNJqU6lqpC27VoBHyRUGF/OlRQqdpL03NFtZrDQ4w8Q+H6aej6LYxGW?=
 =?us-ascii?Q?/9egQmucT4POdo5AgpGmi4lTw4jK5nRhk7bB156isXxP3dVGOTDpGg/cIXSC?=
 =?us-ascii?Q?v6ZNy9m3IoEsVghCXN2dnri/xFu3H4sJgcKHf4D7kNlB+AA+dmyQdIkLywUI?=
 =?us-ascii?Q?Aw1zCaAK3LbCV/BVJmIh4cpCVJmwIP4wfjX/2jLiuezAq2enMvReLi+a3OSa?=
 =?us-ascii?Q?/d6cqmH3mUyg8dbk/JJ5FVyXlcRwJZWHziUFlsekZFFOZH9ldFD9Jvs2oCCH?=
 =?us-ascii?Q?cf1vCyBNmtxoTraRp0NgHVpbMKQKjcOmE2RUaQLMBpM3Vo8bMiUQhifSAMNT?=
 =?us-ascii?Q?K4giiE3dkS8a/t4dfjklAI3I+G9lDnKEX8b+wE+N4gjrFHB/eoXSf7CMs0P7?=
 =?us-ascii?Q?CerauyN/Yzg2MsmF+OBRsik+31fS/tV9DRFpd3OdWxc0itB5/8JK2DsoXEU8?=
 =?us-ascii?Q?uD9u0VZUt4bwufHVJpKCJqg1DO4x5L6KE4qnG95xuNcHPvah0c6oeCFhxqvL?=
 =?us-ascii?Q?7vMiQPtWy5pdvsjYq4gIk8ke/fcYSsrleJEszJ2zcxR5N77RkfQuAzbyj10Y?=
 =?us-ascii?Q?8Kf0aRSZL0YXoTQB9p80a3luV7yrzREjPvgPL46TAxF10ElluIdbVWbmmuzl?=
 =?us-ascii?Q?v3hzV3X2m80Y+ba9EvBa2N522xfU80+4UDKE5/M+M/tUiPfv8yT4INksBqPp?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca37bad-2d9f-4961-66ac-08db34e30318
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:01.8656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJq2uH/WHi2qUE7qcaGUAwH482lnism1sfiBxIIuIqxe4yWLXfKZjV5EthkcIExJtzGqpDdqy6QNygiiWuJsj90TGqakqxB+t9Q7YMp2AUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

This series adds the support for chargebyte Tarragon, which is an
Electrical Vehicle Supply Equipment (EVSE) for AC charging stations
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
  
The Tarragon hardware is bundled with a charging stack under the name
Charge Control C: 
https://chargebyte.com/products/charging-station-communication/charge-control-c

This series is rebased on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git?h=for-next

Changes in V5:
- allow child nodes in DS2482 binding as noted by Krzysztof and Rob

Changes in V4:
- introduce dedicated dt-binding for Maxim I2C to 1-W bridges
- add Krzysztof's Acked-by

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
  dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W bridges
  w1: ds2482: add i2c id for DS2484
  dt-bindings: ARM: fsl: Add chargebyte Tarragon
  ARM: dts: imx6ull: Add chargebyte Tarragon support
  ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../devicetree/bindings/w1/maxim,ds2482.yaml  |  44 +
 arch/arm/boot/dts/Makefile                    |   4 +
 .../arm/boot/dts/imx6ull-tarragon-common.dtsi | 852 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-tarragon-master.dts |  82 ++
 arch/arm/boot/dts/imx6ull-tarragon-micro.dts  |  10 +
 arch/arm/boot/dts/imx6ull-tarragon-slave.dts  |  32 +
 .../arm/boot/dts/imx6ull-tarragon-slavext.dts |  64 ++
 arch/arm/configs/imx_v6_v7_defconfig          |   6 +
 drivers/w1/masters/ds2482.c                   |   1 +
 11 files changed, 1106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts

-- 
2.17.1

