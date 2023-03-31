Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E8DC77B60
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 259F3C433EF; Fri, 31 Mar 2023 21:09:11 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4447C433AA;
	Fri, 31 Mar 2023 21:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4447C433AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHkZIS5qI5bwtPB0fBNyQRMeHth4S6Q/nOxXYyCmgnl3Pk86QQzjDPgMr12tlCuBTJ923ErrM3hc/hKtX+B0PRdgkDZclmc5r52/GaQRUgH0rK6ucD79DOrrPhlqCp9wt/INlVc7cyas8n1ZUC+4On6qEY/JWgWrGkTEvdmQcRjSFhrdz+mulMf1MFL2SNF40uqjD4+c03CKKgA8B0rLGAXccxgTO7uXpVKPS46G3SqItX4KiBOp7uS7FGBKYpFFcFhDwIyCNNJYqlbTh2stIZJ0xnT3b/Pz2XZSAT6txMT9vmzs08IVWD7xrvnRuOYxWzK1UuubdccFskzeKskxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=OVwYL+BKR6GXfEenwm7HI3Dt4j+A2PbHn8lihvvsqos5SIquAl5iuxJ3VMx2ApD3vMxBfuJKF0xvGdnYKMNuoe1PuyRj/H/Ons0KP3CWl+pqPyh9K9/MFu544W9ShWq75Ety1gtavaddcME6QQjEGogr4vPE22158v8dRNsTvOE6s1Uo22p57b5SXBqymLIae7nY0fneWGBqTXbcUFKaxZa+Nt9246pKs6D4aJlXV9WltW1vaNwlwISaDDQkefj15bxBkuRh+lCCKI2U/6tEjQKNGc/5NJOQl8PduhjXK5TT2i/SmYrSmQ/R0diXwFmHsTmJ6qxiqh9A4GbgVwTuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=LKszSTyad+4mJMeZBQngRi/eTDy6ubcT1OoopD0Dez9WOjlnwmMyaw5JvUZiMWy0V5lJh4VBxnlqBII9gGKv2IWWbWV8O0CgZvtXvb5D1YABJuXCV0xC8TrANg6dJd8FmhmWSvbA66UvCcWJ4/o4Ns+bSW7TZhx/CkVC6TXkq7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:09:02 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:09:02 +0000
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
Subject: [PATCH V4 6/6] ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers
Date: Fri, 31 Mar 2023 23:08:40 +0200
Message-Id: <20230331210840.4061-7-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230331210840.4061-1-stefan.wahren@chargebyte.com>
References: <20230331210840.4061-1-stefan.wahren@chargebyte.com>
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|DU0PR10MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed2949f-9e8b-4133-8df7-08db322c271d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9AHboRHseoMh7G80m0rUlj60UfQCsNMSfERXvwVdinaw3gJ8R2tcUXERHilKXLdwPLghnogVzlFGVvPpZllUWPjyd3A44fjsBf53NZXChQo+0aR16pJVZUW3bN/jZt2R3e/BorNBUMHBVzfAVImM4IbVZ8EGowyb6lIpZ+k8xNmLrUx4FQrkkd1FEtVvP5jc6RpjgD2lYZMucLsXO9fDvJd8HhPLpsa5EqLKeK9nWT3YegA+Z8/O9u+SNcInLiO3+RcWXbTRMYM2QPZYDcH1W5R2aQ7qPqsEBNgvpZ3nE2p2jZudT6idnHVJQwcN4do6M+FS3GHJ+VZPI4WDL/tcwhXIpJ4uNB+2JIj4AhBS0ZPzGYb6dCDVZOOQ/k3n0dG1uLEFOwxLZEjE/hCONscQl6uw14UZAsi06EL1ru2vOCLBzZADsLCK4ZCDkPPTySXZ7VWFJBgbHGnQehd4TlFUuQr0mcVmM+5k6MLMA9OwWoOw3cXlFvaspXz/Wit7ejte3Yndhk03PIFv+ANe6fjB9I9viQorHXxGb+MyJjbL2hFkfPGLP7/H6GN/TEb7UfrLr/qz30hNIw/VIDEKiIclcuJgW66Lk3ZjPW+kBkD+zp/pGAUTc5+joiaW/yO/oNo2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(83380400001)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ae1p7arD3Tm3H5ixzvdtU/ghtsIS5LGZvgkavu4eup9e9rkAMr3yTteJCZ7q?=
 =?us-ascii?Q?Codimg5CvCCtNBkN+bshl3RFTqFIZkcM+Uln59/f0r06gRK0+96F86dkKkyj?=
 =?us-ascii?Q?kpoZN6caidb5Q05mY2/XdOpM0ZjwFVUmuJ00rfoMkhfiB0k74Iy8nIA3BxuM?=
 =?us-ascii?Q?O2n+rhnmwIu/ARpO/dhGxQcVyCvlYP1MGY9/MfO+ZalzthDbSrsJtNbinvn6?=
 =?us-ascii?Q?lnrD15KcBfNWwAg/MhX1PuoIOe9Xv5F63LpcpQD3UZpG391BN//TVfTnTGGt?=
 =?us-ascii?Q?ZZe8BgZahTbbJxRP5e3DxegaOQBKTteUtEK8msyXhyvAN6ycGfTkoieEwReQ?=
 =?us-ascii?Q?q2HTb4r1uRHZlmSSFwX1qXSvZ0J4CP4MYl1ES2SW4B4hCLykiMSXF/1KnLRk?=
 =?us-ascii?Q?MOvs2JEZhw0U3+ssxZi+BwweK3rWiS7a2QPKNrRpGWHibbkGrtVYU2oyNJgZ?=
 =?us-ascii?Q?sA0063hI9TC7uNGfgcPY5l4yeayFGMRdI3aqRRG4LcyH8RpK6Q3DNGh8UeJ1?=
 =?us-ascii?Q?Y7wDV0GMWKEhpNE/mymbtbxNstU4OwouZdh7h/v4IDdyeL8CEkS1YPWEFoAM?=
 =?us-ascii?Q?n9/JcbJxk6JfzsjmWSiD54C+Gsn/QyAroOwHOwUvGjFrXH0MRYmhVikIIRj0?=
 =?us-ascii?Q?0C/zgbUzY0I98a7m5znx/xcBkZTCvFJ6U90ZYmTwp8IAU+q29DnoDOqsAnrW?=
 =?us-ascii?Q?gefbRDfj9LXyapWnOclXfF8VgraoKjQpN6oUq+7kjNh5I9XwJ/bYeWhp1ntp?=
 =?us-ascii?Q?jry4btFU6T9I1sjHbMjafwEzubdJSCTO5CmLa+qAJjANBDtird0s1HcsvwCr?=
 =?us-ascii?Q?5nM8wjVVhrqg9d3bBB4Qiq8gHjJ5PPMWjHlmEArR4jKCj64j/IGRPgMMsBo4?=
 =?us-ascii?Q?D/f3x2XX56QmmqY375/yqFcXZXkAbcv2pRYRLetiyJT6M4RoXiRRiAZ9omtJ?=
 =?us-ascii?Q?9gkgr6h/+vVGIdemv3ViJrtHpwIyMXU5YlG06PC8YTWsDIQ2Y2ZBe0T27Kxd?=
 =?us-ascii?Q?eKvlDnYc2ikfa1budHU5N9YK1hzuslZmSTclkNuS6YLKWWr4MP04phNkTL7q?=
 =?us-ascii?Q?56hsA0zhpgmeVfFPAWHoBqMSIs1qG8jF6dr9ApTM5SOXPDpUEwEOcO0S4I5h?=
 =?us-ascii?Q?bDWr1WC32So3dQu4foI/k3n6yLklTLDNWHiNySQJ+MzmXNp0lEuJB7zAB0pg?=
 =?us-ascii?Q?yKWgZe8tEoSsq2czR3la85dYs5Lxee9t0+Kvbdn5H31cj9ys8K3/n+jXIdWs?=
 =?us-ascii?Q?cN1WduTF4W4h3+2tuuzOj/veEiii14t5lu3KEYnKZBoXGmVQqEGKNXtVcF4Y?=
 =?us-ascii?Q?F4pbTjQadaubhfnu6vvfWE3wUIZOQluDtjxLC3mEg9CobrU1zY8DA9xKyyYh?=
 =?us-ascii?Q?XVluAtI1k9kCIOkpHJ2poLMU+9/JWGR8eqWQXjQDyDlGkVoU40pqjFwlpG5B?=
 =?us-ascii?Q?xTslm4oPbfUgW78Wq5QR/RdEK9W7qFBHuqvE7834V88lMq8TdAGSlE/zsYpO?=
 =?us-ascii?Q?aeOCrWKRqtQ9B55OFS3k2mQjzvngj4iRhjMDlfu2qo3ofe9yZZR/lrYOmND4?=
 =?us-ascii?Q?7sxO01siyhDNZM8lnTU4bBSFXL/HTkC4EvPDNs/tNKnQp2NJxQc+tTxX6DpW?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed2949f-9e8b-4133-8df7-08db322c271d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:09:02.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEbiMeXFN+F1RbNvqOXt7pNyVO1HdhF++YIDIlGwd8qs+XOeA7rGwoQGdA/eGrlL7Y81XlrBq9XUOf6PRAXOOgmqYePl/0y96IhHNu6LWWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

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

