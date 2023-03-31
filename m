Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16F9C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAD20C4339B; Fri, 31 Mar 2023 21:09:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2D0EC433EF;
	Fri, 31 Mar 2023 21:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2D0EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P66b+pb7TjEVfjuqWJ4k3pX906Q17dZPaXcb83CXPUMa21u5T9XnBKaPVBHclM9xnwoIYWbXa7zYAh3QYjbNxRpiKM8cp28YUYNq/N6pwfEZj7OUrgZU6kbC/Q+5DlagHHpcD09Dw5wRiOMZ5BeyNmPWdrvE00oX9XcASv+kV6W0aFCG/Y5xh1LlCkDHam3T8Bq/Yj96A7BeSpqOwb210CPTAKSdCW1PJrHoxxga7d08RtA7ph1DYUq5+gudTI+6GMBvSajDQDw7tOrrBNYpVqgmTHvgDDhKETNKZ6glhtM39VY3g2q2oZUy+KbtJZv1F5SKU+YwKc8Fz6CbkDwbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvBBEszQx+8eSC1xxYAH12ARL15IezaEAa8OkMghxFM=;
 b=XGCV3h4mJDEqJxLFmZcgARxMdpIVM5YTqVnKlq+DKqNymROxlhIh2Cc2fAeN2Fe9MXtzwmseetH7kBBU+DUQCPcYgDeHQQAc7tYJ91+wFyd43jaDZDxIFod1c0iqsqGMZH7bG6W8Aky9WEKrkhNKHsXrsmjplpjJ2vgLtV0lkA8pji++sp4RZQjkBaJKAbwCpuLomyUBooaWIpMsH0qNKy1Zlj6VljyipCY4hIsqzuZytiM3KLX4qtjPYRX0AhyjIfTC4Y9iK+UZkvmmQOZDhs/ynmiPybUJMjMyTIBPFPXIkVxxQ8r6BEuwdU+fZuhlBJh9o7c/2pn1hHJcEdaWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvBBEszQx+8eSC1xxYAH12ARL15IezaEAa8OkMghxFM=;
 b=O2YWBl5fklUDnBsk2G+XyjPI/O+xsclBx9B98PSNBClWjbaYK1Eawfnrf5IQsd4Z5VGFz7UgpZxL5krG+deu57tQ3YJ8NTMd8aBu1t8miDgUCZDBoJnIBDcp6gp5B6jHFT7OP5g89M7ZeJFK84sFNrFsml/An93B/MrVagNYghw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:08:56 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:08:56 +0000
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
Subject: [PATCH V4 0/6] ARM: dts: imx6ull: Add chargebyte Tarragon support
Date: Fri, 31 Mar 2023 23:08:34 +0200
Message-Id: <20230331210840.4061-1-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|DU0PR10MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b90a8a1-4919-4403-e245-08db322c23b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DzfQApD7Z6CCoA9xb6oWyFaCPKiTxcM3nX8HZfUEj2Gsdr5g2DcFj5pHmgLLCowHJov9051NHZfXNbSiC7gWjJmTy7GwfPOxt61ZY9eVNZjDYIncV5l+P8FA3mjv96SYeSLbJa01vc4YLdiJK9kipbU7lpYg+seaPqSP+EpmpfrZsBw/xqOPAhZ9WwIMmj+nKVkG9sxqjx8uJurXo0rt04vYhLZA/zb3n6v1JXowGj48bkat8pxxkj1e2KK7vQr9B8PpSU4G9G+nE//Xie7xPUyflYnFIu5Gm8Zj/GKOeQ1NAvzHUFQd+HAEW+G+t6w4bs6Kgdk9qT5X4xo8zTl8Zm0D1vhXhDD+nMyt4m//g1bj/N5f80SUIYe2r4uS/7yO1oufPwMNrpU6CVSxdH4iQlFIAJIEdVv1pcI5mypYrTPR7EXMLijMeo3AmSEBQ7/o0Ho2IzXwaa1r2PMe6Mez2ZY1eg2UwUDyTdWmMvTI21d5NP0duZoB9f/m2XSHzbehBZQ6Df2QRnIY6ufkoSYq6DV/zbc5qoNP8C7i0NybRw4sivLxsPQy94MXA2ccQw+irwp4iZxZ0c/2bTPQfOx4Xws/dVZuynYRZvEJ/TtkGE4aFDvd4oZZn6cC1V/7GLQ8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(966005)(83380400001)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7SqCyZO4GEeBZvOO8ToqYEXx0RjJSRGwhOSLVIrrRmBjA8oPcxDrHtNOaf43?=
 =?us-ascii?Q?ICkm19nGx8ZZjP628fvgyql5rpM0k3uNDexWyq7OLQMnKwQxCo3i4vNHIdAF?=
 =?us-ascii?Q?mQGvzjbOnU4qQxggUizSkJ3r254sQ4o8TF2saBfwJ0TpgDhm3UId98ll2tXe?=
 =?us-ascii?Q?xLt/T5wAn/Eritm9ZvKB2kvRs88cKLcVIJRRv2q6SpjvB09vD8ft4QaVxK6V?=
 =?us-ascii?Q?CE4ffFajZgG6TQR9qFRrRrG0XhnWgGK+6khDXf5AnedpG9bEZy6qaoNitaIk?=
 =?us-ascii?Q?hdNhzYoprOgRMN+8AjdSWSGy0ZicSqrzFvwhl6RVw4XJupIKkhFZ9dsrdNZz?=
 =?us-ascii?Q?d8MeRjjLyUxBGH0U1OPs5h7ZUhX/jabCRlDBqqP9f5rs0gWlZ9D90OysH84O?=
 =?us-ascii?Q?Qyf/zZRFF92hOfEIWjGu/KQGzxSXJuL0UtEwHNlgD574JWiaCTyWFXmHNapL?=
 =?us-ascii?Q?n8KuXAdYNONLgjCbR3C2HaS/VyShyiMZNPtxD5DyCdSbyHzXd6yexdBoXxM9?=
 =?us-ascii?Q?cQthb5/5htG7UichX1cAA/YODe+hvRNJSNhXUC2Yy6OtyjfV4pNXe5SbS6kF?=
 =?us-ascii?Q?JvLnUUZZguZ599m7h0sU6TgIeH6aKh96HXuK1ds4Cgf19DkYODTikU489o12?=
 =?us-ascii?Q?OJ60x+aR7k08k5V0vAIVskKQzFMDLEP388Aa1w/IopyrcH8ij81Kxobhp0t5?=
 =?us-ascii?Q?RgQ9P2YscFWZ5cPbv0bThEl3WtbDx7aOVpa9al1GkCBH0t+lOp2qW/N9+Zlm?=
 =?us-ascii?Q?thhrqUUt2EKrzidZ/ThdEIAu/Jp+1t/0zdbTveCtPNfs1O7cftw32gyw7rPG?=
 =?us-ascii?Q?b26qg7cheHa8nGi4l56W1G6SsW9njtjzJ0eRLS9B6U3d79kZsgy7EiDVcvRR?=
 =?us-ascii?Q?hBtGuajPLk3N+MXLD+DFJfoN+sjG03NdS+CNDRG/WB7ZhK+oJkwvBqATL4p2?=
 =?us-ascii?Q?8AWJEYuFIAoSi1ENkmQEV0l3sMrm/vqU/qlvHKd2YSOuwKmkjOoOfm98Qkdx?=
 =?us-ascii?Q?0x0zC23fqCfOeYHE3QXGfwalhR12Mu1uS9G0tSaYLQNbJQ7/f1I9UN0VGz4/?=
 =?us-ascii?Q?Ab9bV44q1U+mtKBrVRh8lOwGxUv8Qfywc/JVrV7GK/WhxQeLYSABJ1Qak+KC?=
 =?us-ascii?Q?bhSYvSZP/P/AYsX9QWCl/Km1+hRUDJdMAXeshk32kdtbEyrGYevQMqKqWG1A?=
 =?us-ascii?Q?TyvDZFEdkBw+kweAkd6xVDksQSeWaw8Hmaw4pWzCTPLm87y0XHVHwyClNDYD?=
 =?us-ascii?Q?WVwHYMSSuBBtop+EEH3pMuRfj9UEz01aHJwnEJ7m9ywavlpRIfN3vZNqm6y2?=
 =?us-ascii?Q?2YjBkyAaZRoV5n8IiGDfhEyCT3rz+/h24lQYBJdbw11ssePYoSZjlf+N1joH?=
 =?us-ascii?Q?VD90Mo+GOAZJuy4cu+Ajr+IVBXpJakPNeCV+Tqjy/xwfPDYsmhEH2FZoEt1E?=
 =?us-ascii?Q?SMNfMqRIj0ggglebsY9DlAVewmracbzDUl7XWjZ7BmjMeWNMZ9tJerf+kukf?=
 =?us-ascii?Q?Fhg6v2e70uJsvWR5qglNeEcFilWY3K3npR9TY6O5G77Dht2OWDqhKSo+FsML?=
 =?us-ascii?Q?ws4gPYnTu0kmVwCWwBKWthzaZPpyuhalmlAPkE5WtYr1rEPrGlZmT8KewSNV?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b90a8a1-4919-4403-e245-08db322c23b4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:08:56.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22Xk/a/T9pZCybz6zxLCdMy/0SWOJKVhf88hA8M3fwJ3cmGUrJezYJcWN+w0Iz9U/THshe1WdBasf5wfiKyhzeAGPHMjvDxqasnyo5wCrpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

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
 .../devicetree/bindings/w1/maxim,ds2482.yaml  |  43 +
 arch/arm/boot/dts/Makefile                    |   4 +
 .../arm/boot/dts/imx6ull-tarragon-common.dtsi | 852 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-tarragon-master.dts |  82 ++
 arch/arm/boot/dts/imx6ull-tarragon-micro.dts  |  10 +
 arch/arm/boot/dts/imx6ull-tarragon-slave.dts  |  32 +
 .../arm/boot/dts/imx6ull-tarragon-slavext.dts |  64 ++
 arch/arm/configs/imx_v6_v7_defconfig          |   6 +
 drivers/w1/masters/ds2482.c                   |   1 +
 11 files changed, 1105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-master.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-micro.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slave.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-tarragon-slavext.dts

-- 
2.17.1

