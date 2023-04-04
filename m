Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE75FC6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B56FDC433EF; Tue,  4 Apr 2023 08:03:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37607C4339C;
	Tue,  4 Apr 2023 08:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37607C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbnUJTBn+Jb8rIcvsuhs9vl1/MbVxm3oYv0rZqaZwkNpAYCmzwod2odgietbdtW5Z4q96tbMEAmrHH1iGnkZ9Y4oqqmKhgJ8VZtzwWweO2YTI2phzIBw82OClnvLVw2awOvQE4kW4sfNu5XV18H8WHSTO6kDd9rCAa2Szyo0hFK54tGfUzSdSn1JDu6rt0eq1YiyGd/Txs0VjluSjlbX5LiHm5OWAvEKxNR5uJacsUy9zlopOYWz3qqT9Ay7okUeEN2PG8Rp0UAKW0Fpv/FtwMmH4wbyTj1HM1CM41XlajOfwA823tirG9i4khFOS5OVNa0CeyDmBv6xuDY1apaTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=Gi2uw/AQkoIN1nFKG5MW9anvZF0E2IYJ8k80SBuWMMcfcDBB+wCvJiZ95CZiDLYuo9EY6S+yqbh38IrBDaEgVi4C4KlTXasXYl9tKb4hPn7U8AdNoTUXf8cSiISH9aExDO2clqkdfV+qK0dSSAuTXbBxP3yAZYAAW3pnOxO/65nbXvoAf9AacIK3kCp7FlUH8VBYH7BYFxHOlQlSpJC15wzBF9/F2/CNxE19NZ0wKc5hX5YtWxvMZvdoi+yJqm7og6N45ufA32YZEvKWVwgCVFXBCsieqCJA19z2GkLeindrsD2FGnIlfM4oYCyvM73RsZr/Fzpdbs3e18mPZcyGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1JItkrS9l6FbA9WW2YRI/dVqVSuBuUffpJHgHgJDr8=;
 b=IQp1rzWj1H1ouhvy6ov+N7bONAj5wLiwOKTZTRxhkOAbOU5slFSTLWFFrMGsMCXASQOMz5BgZNv9G4jRCsqNWwoRI2RYqpTdVGRsr0gDQ04p7sHyJcAL4k/6TgRixqP15EiH5VOxxdm6DcaW5XM+4w7e3mCi5rI6sHExDaP3Apo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 08:03:08 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.026; Tue, 4 Apr 2023
 08:03:07 +0000
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
Subject: [PATCH V5 6/6] ARM: imx_v6_v7_defconfig: Enable Tarragon peripheral drivers
Date: Tue,  4 Apr 2023 10:02:43 +0200
Message-Id: <20230404080243.9613-7-stefan.wahren@chargebyte.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:33f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB5211:EE_|AM9PR10MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: 971d8c14-4695-4318-3b24-08db34e30624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lQLGENSO+0bFVyrC+MmqnQTLLbUVXNEkpIeFrFUgh5zXaZcpnAqHnEsSNA7pD66/djeYcCt80PedySW6di+Y6LK9nTsADr9HNH2gKZTwnadr/vXaaP8natTuS14I0BcRM3tsDz9RVKeyPCX88VcUvVKzFGoc1FRnplXPQ+ILKM313KzNXLID4hv4nhp0DIjRRzEJedS7COsIE2uBoDP7pEHXqFViczKeRMU93m7X5bfExKvUgZ9UpRTpo3UgNzX1HJZfdlB7jyHIUWDGkZaS6fOSp9gAf4MFpkpjm+xaZB/dDbHY7nX5woLhkx+uK9TuvUnIRJF7bnnizsHfuLrA18NS+eKQRe9uNr9u2eAfr6RzlnX/mg8GN4LycClx75BrnbcaPYC+hWwe06RtAb6xgl7Syr4fx5//2D18NRgEf04xvGNaksGZ56IQPwGEEMHS5ajtU89p0aX/lf2UrmmADaxy4HRw5Gp3t68XKimrTDVe7WiWFStfeTYtyMbDIy2p7jIV+XpARhmucbzNLGGpWsI73nLwuxBrBw8YPkLGOZVPk5fojWvXf3twqaJQKUWZ/dRolySlTuQOrzZRLMMA0JNLHly+SCrYGWvY+nwvrILGGZPalHikcQym0Poq1pLf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PJyum59RPyfyJvOYcQ8fWksdqe+jvOS+WZb4X8lnNJB/4+2nUC+dUoLWQNPP?=
 =?us-ascii?Q?anZurFEwdHcAo2TQYpXL1d+6GtFNsDwA4FjZB+h8ZkWzvzYqyBF5J9Jro/zl?=
 =?us-ascii?Q?kBKBAYHp9UggtdGXYRMttuhKYGFVZMyorEzHpBPbOUutRHFPR5625/uLHDqn?=
 =?us-ascii?Q?6XOK8QsCbz3ZDj7CmlUk/wNcObkTfPDUZZ2MZvVksL6TaXiHjBhyRHu3pqme?=
 =?us-ascii?Q?CIb7i4kasqs5GVtEahTZIBAsqsV/GI2T1x8Y7vH58PjYq4rBPmgEcfJbx7OD?=
 =?us-ascii?Q?Kt6UHDOIGzthCKyDIvkI67yXcNT/ZdIoY8ISiQl++qZUINwcC6kAXqGEGjUG?=
 =?us-ascii?Q?aTAcISmm9T6VneCf4NZJbL74eEmhQEFqZ30IiHq4YYe9ldPtaR7VHpAldhPq?=
 =?us-ascii?Q?RvgMpVpoXXoJMJTQ/eGAqq+UNJryhVzFpo4ZTN1tMTEszPOf1tDLoW0fAoH/?=
 =?us-ascii?Q?OvNzF3Wq2+V6p16cuNYJv8Jmvf3HorveFm5X4ugBruJyDyiOoQA+JsChqw/q?=
 =?us-ascii?Q?bHBw6e1buhXGOkXrdEoQkzKb1ZaWaP+ZUSl7GFXkX81tDITqB9TQezCZzLEY?=
 =?us-ascii?Q?AAxrlESS4D/3G1hFmLUs4F2kPtMeySfgkSw1x8lDhUNHlhmdvhP+gexSVkTa?=
 =?us-ascii?Q?jlz8JTZvojc1/kMN4FJuGSezM/+4+CcKM3MFQUD8tXRiZ1Lyfue49ZMxPQJH?=
 =?us-ascii?Q?OPYbqp1SNUigC1pOeDNLDNDANQAJh7KgbereNwzyQDL/C5MGZVQ/LVsw9qXT?=
 =?us-ascii?Q?TDTQTz+eWA+KAzoxLyLDVKccbUVy653HFj6qWSfKF4euTUoFCGgEXpxKyI4+?=
 =?us-ascii?Q?8uyB7w8qcHFAL10x5eiTKi84FgB6h5ljEhcZV839ecB08a+RgNZdiD/mLcI0?=
 =?us-ascii?Q?ozZHWwS1d7Ob1LmW9V6av89kprXqZMf1BVF2D0fih55SZkdBX074lD4yX7NM?=
 =?us-ascii?Q?/KV6ugF1TRBkl8ai9A/4OUj/+h5RHAS88rbU66B9aAWHpKYaMRkiwe6CkR+h?=
 =?us-ascii?Q?5dETV7VhCnEgmldQ1KdVj33KupL2NhNBA7VUdb4yK58p2610PhcUm2B3aPsR?=
 =?us-ascii?Q?zBcSnPDqLOIHy7F1HQVSkX91A+4MzTPdfJSrif1FczZq/Ll6Xyr22QtycBYr?=
 =?us-ascii?Q?GmeQDTZutJV7m1CAK48/+0EmiQkW7z7Q2rrO3d11iz0SXGAbwL6Zfp+Xp9Ar?=
 =?us-ascii?Q?kmn4Lj5UACdy48KXX1JHyu7+aGoRGXSHzGBKR/LN3yKMrALJfuUxGJ5UVLPL?=
 =?us-ascii?Q?l1klAVa3U3W7Gl+OCfg1AHJSA7ylmOOuwa3wrBx27bUfJFhYK3Lndn78O8Mi?=
 =?us-ascii?Q?wdqqLqNSsPnQx6IDLZHuFcDgZXJEdueI78e9R3PfSnneOnJkthiD+3bnwQcW?=
 =?us-ascii?Q?HF38mqd0r9KniVpZIgir42CAob7BUBbnZhWBamGt/TTPu3XW2+kyzKOg+5Pm?=
 =?us-ascii?Q?YXIMZvz7hXwbRgrOXVdaMYFpVDUVqSnE9GBvKV3P5ayI7g+J4uRty588MRhB?=
 =?us-ascii?Q?XtVd8CB7qXdtwr5kZko5t/HHkLEaVV1MYLlPOGSbG+hAJVQowWymeDjdzg1N?=
 =?us-ascii?Q?NIuIA+ihx/Hjgu1d7yj4lG7s4+xK1dDZNrYR5lVQb5gQVfusbWl/oDkF2Gkr?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971d8c14-4695-4318-3b24-08db34e30624
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:06.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm/7a+IzmKLSeg/ba5/ljLXB0Y13QQ7OuNHJOl6RxrtzqoKxchrHne28n3JWZa9FGAv90SO0EjHFcsFrBYVQtXA+Btoqse458NIIP9XzsOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

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

