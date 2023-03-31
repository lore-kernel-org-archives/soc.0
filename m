Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACCC6FD18
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 785B2C4339B; Fri, 31 Mar 2023 09:58:36 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB6D5C433D2;
	Fri, 31 Mar 2023 09:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB6D5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXTvkYb49Cz017/JBXvv04NP0uM+Ro0LUnqbjm9fGnOfP7UenG8vrWLIDobFirx56c0Apa46ODR4A3fxboOYhwQ//k8Ggg7NYXkLJWDgxxvwEVrDHMEej9gtQUQjlYinWyCTifpIEU+8qu3gxJuAGdmR9XBpLd9HlihR4LpU9v+fbYVFzKCOpFtvzLXUezdzgKu5sw6Q8CP7jql7F9iheuGlQFJk7YNwlnwXJvZnpH6kipdGIQImk1FPUstQMbduW+Ke/68GhvkxeEKemCJtdnimS6tFqKnl2CkeSn4iqX3cNvAcEtQyQPRH7ICr3lgE+0VMnn5EI6SBgk+xsPipkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=i9o3EBrpX+ajtPNdfWnUbJi7HBqY8pk9ZtM4oBqi+0WX220cWfFkN58V1zZ9MyxS06C3W+X31tAE53PE1Ui3xlsTTFSuWHwv6U33kL7tdS5aiYPijHhKfoJ0bpdVTPv9y+6or1SXdNvr2gsLPIHjTlrr8A4oF0YseWABw8CCDt32uaN03yjVXoR+7Itcxjmy103ms8koOTTcpa/u799OvMTrRVhUcHAceSrq0FATQiNpvGMSq9FUyQYyi5NYPc+OSodWbik1YKOh9Pb+U8J+JnG2+wjw+/WvY/a6LmmojF3WdARKDxC08Ih9BZFYhZQ9Gt86uX4K4dFDL9PKyvIxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=o22395PmmVhEEtnkdoK9ADOT1Fo7AIqHDwLmgIQGdwqaUvvV/Y6jXROUlOrkvoduCwB5zZFotrkitGqLfyUfVILOq1VXDPJMYXd6seL5V+mJhIGN4YfZEnTCYo0Hm9nb9mPsRKCVcz8pm/h4tF4iXSA1CNA2IpuBIYjvfXelgmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM0PR10MB3539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.14; Fri, 31 Mar
 2023 09:58:19 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 09:58:19 +0000
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
Subject: [PATCH V3 6/6] ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers
Date: Fri, 31 Mar 2023 11:57:15 +0200
Message-Id: <20230331095715.5988-7-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230331095715.5988-1-stefan.wahren@chargebyte.com>
References: <20230331095715.5988-1-stefan.wahren@chargebyte.com>
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|AM0PR10MB3539:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b5f51e-1184-494e-da16-08db31ce7458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wQI+WrzU9MZ+4En7eakZ7m3Pty0fup36KOoQO31NCQGH0ocdZsuUl/J37jYCM0cTB2IL5nLNzulm6HckyXVYpEaMEWHC60bc5uOO25BY8ic3i32C1u1h3XvNDbuAVIVykyZU8UWQ+gSv/QLB8kN+0zatjIVHaP1ZgZzarRCw7B4xEpgUxU1LWZ9NUmOCZ/QseUAFkAOuenAtlx33SVHCxta4Sdt6SoQGxXRVaYWXVnjZFlqtU9Vn6BPy/OfOuWu6cNfAxD7QwVv8xiq2aIWsz9EOTDpCv4SeW3UrZnnIrKeQmgpYOdVbqHiZK5p5Ii/owEUy0gzejFsqeT7sZIbcY2zJUzciMpS/kvdG+GYYs3gwQqHpqASb3bTKJ9SzAYXjKSQmdlJDwO0LLLwA1gSbHBm26C0VAoRHTTKQmqym4YSEYHUOO2dILWXE3nPa3FcyyeumWDZG+a+MAPr0OJA7yLjqLTn/ahtEK+EHilS+uprmpLox0FnrCdvGm5vhbjY7ngddVZFeLuZrkpnrHTxBh5T3c3XEUCpv5d2lcQaBwx+3t99LhM7w/x5R/yMYxImvV+g22LiIOtny2nyALp3LXapUnf4noSsA/Fz5DcAbTncJ/XFJosQ9BTjQYRaPRNC3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(6666004)(107886003)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(7416002)(36756003)(44832011)(478600001)(66556008)(110136005)(316002)(66946007)(83380400001)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jl1Fbxj7V2TtEldbitvWDeGghKDya4gmpTg5BUn4d6ewyDTKRnVDixo1LoPU?=
 =?us-ascii?Q?Oj0z/Al6Pbezr+SLcALjCfVpsSG+eJl3UNq2ra8/AH5dJ4A4AUeZpYJMIyVj?=
 =?us-ascii?Q?u7tBGsjfKSFJFiyV0izoDh3zOlHYRUm0x6zrVV3e3pEJ9//HozB9jqZbfdFV?=
 =?us-ascii?Q?OJaU5gxHcOBo4mBHuVQhVcDXl1RvVnatMZqkj5h5O7vlBXZGZ9rwF7L3Pz08?=
 =?us-ascii?Q?KEvzvkFLGoCAgauPs32ea7Wz7X07xUAwqx3fppJPRuBKgaMAn3o/+2MRjTCr?=
 =?us-ascii?Q?vFNTYbmpMZIFrc9gzYAJVd1vay12kXpIiup7G4jv7il3uSKKY+B4jwxb90e3?=
 =?us-ascii?Q?p6ssUMS3OLtVkxy8ezlYu7yoAfIHVC5XHMzf8c9RgxKp0s3WOhtgVQfCdseN?=
 =?us-ascii?Q?YgZfWduwxqK5VnnzmOaJoyrn9OQM2QNaxxavQV/pHV+6NOKfPmpH6HBsho4S?=
 =?us-ascii?Q?KG/OXxD4oy9wg9VdsvNhfBmxYZMQdrRn/xpRX2B3nKqY+yBZ1Peh1+120NAf?=
 =?us-ascii?Q?SIfT+jaFQ3bFunulo9T9uw+CtfkSshj5fmnCGDJwQ4X+n0ow107wffygsF1T?=
 =?us-ascii?Q?URxZX88ByNzitRdvq+1M/bF6WDUUt9u3fFocM3Oznl2z/ZCLXUlwmgPnkTGl?=
 =?us-ascii?Q?ySBtrdbKIY5VtvyIFSvBRPlmwHAcpgDW9iG8eJqbi953Gm2g4He/hEC8ni7P?=
 =?us-ascii?Q?9Gg6aATqLPbOmXHjUvCRnYTZk4xTBjqIO8Wfjz+38yjTmXb7g5l0JRtE6GaS?=
 =?us-ascii?Q?Vx4vQDiMrT6AX9NoGt4EduTdQo24db55DiEh5vrlrTgM6NzJqHG9Oqd2IH9c?=
 =?us-ascii?Q?yhSxd3h6gxZAUahWG3XXksOMDY2UHEZScCnNyn8FJ9lIvj4h1WOJvq1esMxU?=
 =?us-ascii?Q?viEr89a1r7nCC5G++Q+4iimikNLoFjDuGyytprj1//mmcxoPo7BJeGA9Di62?=
 =?us-ascii?Q?JfUQKYQYTYq3qKDs07pohPywgHbFenGSuRXw0UiKYHZkd4TsdI8BcjR3qbXW?=
 =?us-ascii?Q?1I7XNkamz+slG0BEGL4FSRXHpwCgt7KFmSUa5Mbflnu22q/hpFZYCzyD9d/7?=
 =?us-ascii?Q?NaqLqBpr+LTzTTbE00OXKUaNIxy46dDcj3rIq21Dik9p2tZb3UxTJyrlKyrF?=
 =?us-ascii?Q?nAdgSLwpHJAxO1gizs2S6mPr44JU5ErAYvp1Lyt2+KiDW3fNPxouyqQ5xAwf?=
 =?us-ascii?Q?j3WFI/Q0iyxIEqLzmQuEtdvyZpjArhGdf2sOJMcEwaRFtWNNDh/YV4qMvkh1?=
 =?us-ascii?Q?Q8hvSiFssb2AXZfIbGYdd+yXymhRi5TXn6EGKWq7b7EZdLix7hRMOh5HQtZl?=
 =?us-ascii?Q?5upki9bX7YNxEFiWEj0trZWiEizUQrvZj1dkV4Xcgnd57hikeMjgv7pQF8qX?=
 =?us-ascii?Q?skL0GKyTRgcNJxwJSSO9hK3PHkzOlgbqG+d+bGIDezQOhANYM46D6iv4k8t6?=
 =?us-ascii?Q?9/gwT5lc1+o8SuOGE/O1Fs0/yF9gHMPqRR5c28fr0kfClAH8NOmVfsdyfbwm?=
 =?us-ascii?Q?/FKmpAWMrAjhhlWgOBf0J3WEszJJTKgDcb4pLwGwFeVY1MXqhyCBAiCaFJHZ?=
 =?us-ascii?Q?WunidDSABlEJNGEaiigYB6oXKpUQH5kaNCDzhtATPfBTWRGl4Jdw8lJ12utJ?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b5f51e-1184-494e-da16-08db31ce7458
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:18.9385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0qo8MbRCRrwOdOKk56xJYImAW1MNG5TDnVtnoql22Xs+enntztQY4ORxKB4rPshRtS0LrGQiYluNNaN3DrDgcwTG/WC/7HsnX6qai9iWyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

We need to enable some drivers in order to use the following peripherals
of Tarragon:
  * QCA7000/7005 Powerline chip
  * One-Wire Master DS2484 with external thermal sensors
  * external 4 pin PWM fan
  * ST IIS328DQ I2C accelerometer

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 9475839e7fe1..2e2af31eeb4c 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -128,6 +128,7 @@ CONFIG_CS89x0_PLATFORM=y
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
+CONFIG_QCA7000_SPI=m
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMC91X=y
 CONFIG_SMC911X=y
@@ -216,6 +217,9 @@ CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_BD71815=y
 CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_74X164=y
+CONFIG_W1=m
+CONFIG_W1_MASTER_DS2482=m
+CONFIG_W1_SLAVE_THERM=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
@@ -224,6 +228,7 @@ CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_PWM_FAN=y
 CONFIG_SENSORS_SY7636A=y
 CONFIG_THERMAL_STATISTICS=y
 CONFIG_THERMAL_WRITABLE_TRIPS=y
@@ -409,6 +414,7 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_SOC_IMX8M=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_IIO=y
+CONFIG_IIO_ST_ACCEL_3AXIS=m
 CONFIG_MMA8452=y
 CONFIG_IMX7D_ADC=y
 CONFIG_RN5T618_ADC=y
-- 
2.17.1

