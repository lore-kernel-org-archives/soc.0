Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7DEC77B6D
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA241C433D2; Fri, 31 Mar 2023 21:09:07 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD34DC4339E;
	Fri, 31 Mar 2023 21:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD34DC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5VI3t7A9vq/XszvmB0/rFo3GZL6I6k3RE1YnlRNEFn+lfhIHdk/AT/pinPUvccPsKRA721eL+jcslfNhsGtPzx3E9yvXtWG0NClcmeyhrySg06vBwZ8l/QeUmLe0bL+FdqnfhR5OVFC1Il3Ve6pTqRX4Wy+HI6IB1It7dAIsN5Jdjfo+8l5CdKZqOvDQOkobY3k10A6amEXTWsh4827+GWnWnwXhBIWunyB0unQAeyZ23w39eYvWriqw+Vz2MiDpGNKl5bD38wgEQWauBXiOOkgM2FqVX4ktOePNz/bngcZPUjdr6dKmOBkgw7j1w2ybzwiuJ7Y010/GUmm7tHmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=Fu8rK2/zNp5yzWXBU1bD6n5rWQwf4FtN2p9mqR+es313m1C5wa8HX0hygw+e0ugbg1QOfaaDoJze1f6AucsVKOJd+Y/9esZPe3Rul0FPw9hs0TnOb+233f+pOBBBRHu2Y09O7A23oXChMTvbBud7MGgx4t9uN/mCGayMjCB8IcRpRcRYJV1OD7KgMvE8q8f0hndc/NgVnAcE9KDJ0EvD866DXWuduNC0SWLXtAOji2viW+LeKiqfWO/aqmjfCu+AopoauD2/Mai2hOwm0uh5cD3f+e/NASP6FAiXwmxsM5Wz9vhl8JPPw8+uM1vyfw3ouKEtgPzUbBb86RlJ/B2pnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=qb3I2YNin+2Iw9jk2N8IcneL7M8YovoUId9QetJBykltWyizVawO/dWp+lsGMQvRnKrRs3YTNNwloBMWBD0Nebf+w6pNbC3tRuoKRzaSuvG0D6T2UCe7gZVdJXmquXB8RFBM+ZiQSSj3tM9g+4vOak4NsGCa/DtUT/Ig9J462EM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:08:59 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:08:59 +0000
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
Subject: [PATCH V4 3/6] w1: ds2482: add i2c id for DS2484
Date: Fri, 31 Mar 2023 23:08:37 +0200
Message-Id: <20230331210840.4061-4-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7bb757eb-c020-4955-3687-08db322c2569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Q4qDEkXQzrk2YN5QyNnvGzUc9YiW2Qg7wHbhW0xRQjmc0UuRf44jk0s8XcqZKGBLXpM8lBjKqqXkeSZr32Q21+LUKE+DOzkvdJGgRNghoRSW6Ej+JSiMCYIRdBtfkZR9pk41VNSr0ag/mvFIYdLZpx+vScPqRomb/mQRDzx8QtJ76WkhmF1XFhvCtDaKiixbEEMuWaLCEW84qTSORDQayzrSh0e8Qx6MStLLJV1bbVQvh+pZ+hmAM/uG1fYDWw3bNhPTXAl2CzbNRqzuecws1eXh62J+ZUXzXYQ8xSRpFFxeh91siSrjkfxpnxurobup1LwcW9Bq4LlVAUuRiECN8mOZbDJNDOEOnI6+ihTKF8TX2rda+s11ugErAQMLmq5VU2DA+Rk48st3e9Pgc37xSRWziwyy8Ji+gSqxLoN19PFQaSLWvgBNY3Ujs7RM9vBKIKNHGmVGm7wEesse2Cx22fKYfl2OuHUVY2P6BiiR/8T3/615UhrEcH6DibrQVJjdkSF3HO9eIoiZYIHgjnOCX7AoAABN83AaSwL4gTV0DD62yespKdZjiAH0o+4LAxcu9BvzffRUy1l/8S8xdSRcaJYGqq4LG/4HV/2vp++F7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(966005)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4744005)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fGswTw0cPR4HfA4P5pJzVBZgh9aVg+AcqvK/YI4GYgRnjAJYE6pvgjghtg4x?=
 =?us-ascii?Q?6kVJ2s2ws+UHQxh7qsbBhvRwgqV7dh3j0AgOpXEsfLr6MIkZgbfjiIQ1AhTC?=
 =?us-ascii?Q?Te2nxv/6cnKXRK0NrgU6hrC9PrGkXllTkfo3HPLFD4QyxYwXJYHkghsmAI0v?=
 =?us-ascii?Q?HAnlPM5Mc3az1/mjuvC6MKNkGrg+hNPphvsd1YBt7P2i0coT8jYtTaryJG9t?=
 =?us-ascii?Q?C3ijzSOmjPu7n6YJwkh0dB9AvzbofRRmLWRHqz8azfE7TkOmN4n07WnbQbDP?=
 =?us-ascii?Q?AJdPsS0xmH7lpu8w/4FPVSd/stXTcP+af1hCMsqk8LLXzJrx4A4ls5JN2Vzx?=
 =?us-ascii?Q?h7FptX3okEeOEWTX2+juX+Nuj6ZBxwefyL8/ODWzbmDLOh7wJZDEwT4O3pp/?=
 =?us-ascii?Q?KPoF89DjIOlnBNelA6MItJTmfRSVo1TNw+4JzTAJsONNm1ZI0gaIiFGlRQUl?=
 =?us-ascii?Q?0FTUfQQeCJcgZFev+YYko5qJo7i9NjLTB6TKuP2A1br6PWHsN/PTmBd9Qlj0?=
 =?us-ascii?Q?LUSBzq6daXqSd8QhSrKgXIqFGRG6p7LXK2dM3QPWjuqtZQRUeqXDXS57Pkz8?=
 =?us-ascii?Q?xmJQKYEfXHP8AILfD7UGWY1Moa3rp9B2f0vvxQ3RmHoWT9+sswkODPo6sT6m?=
 =?us-ascii?Q?+qV4IEzCxt5U3ttrRcc+UaPAXMWvQKGVg0sRwJju9ODyqd1X+FK1IhCdBPAd?=
 =?us-ascii?Q?H15+OtkQr3yLz9s7OEEXXdr8YKPfjgoOw1Viv+9JlAxmmgIvrjvNHEamt1mo?=
 =?us-ascii?Q?Gfh5wVmm0NNUprEn8qR6svfQtk/dHGCLbkcCiOD9pGKJ+CaIwKuwHXx/TY5q?=
 =?us-ascii?Q?ZG0R2uWrKOI2KFykrXMCGSj9U7+i4lX7jo0HZTcvNEoJb9hqJ8LWJH5Ry5Kp?=
 =?us-ascii?Q?W6W3V5nuGKpiBzVP6psljLd7RLlG8wV7UO/HBLT47/iN8RY1toDbVGkABY2i?=
 =?us-ascii?Q?R7UrKJxx34lcEuyXgV99JIM8Lsd3tcjfwmall41CNEcgEL37ezo5Ar8+Y85F?=
 =?us-ascii?Q?JuCuqQeSKfD50urNN6D/CmHssv2BKkB9rSY689dPQcdgYD4rYnxeqJkwx3Mf?=
 =?us-ascii?Q?tj4B5SBIMjrJy6Q8M19ql4thAZx4oWN8icRpHMz+iiUb30geF3VRGoPP4asJ?=
 =?us-ascii?Q?S2F3f8Uw2hXp+RfJ2QP847ZdJDJkmiwTsZy77QOWvci8jS8P9DTNC+7cTeIi?=
 =?us-ascii?Q?DKaGZNhF0Z9QAFcO0AM7lMMIJELpZ7+MImE60u6R0M4euLmy66fk+GPHjtM4?=
 =?us-ascii?Q?YU51NnnYGc1clR7ihHHfEtS7/3u+U44Wri/fo/kO1JpMn16XWD3ZHHEIqbTo?=
 =?us-ascii?Q?RyNCaZEMNoVIzoXhtW8CmmvzcUY0Xy1mEGzkz5Pe+MS+yT5nMHQ4HQZep3Du?=
 =?us-ascii?Q?d/74WpMEYOaTA4wLeCZG+780m6D1uDDi8LsK2v7ucCuGk3iBSfDTjHLKJIIT?=
 =?us-ascii?Q?KPcK/tfX/cQ/e7bvCxLjKix1bYNwqHp1GAs+tyirwCgMU2X2Ik1QH5YcuKvH?=
 =?us-ascii?Q?P2PqHOos9dJhRwBd1JYcEXK8VUTSw++8zsCJQPf86FFZo1U3GxrVeH18omcX?=
 =?us-ascii?Q?BeGj8iGBhhx3OE9qTUnienBljrUqn0nAc4myGTwu3MNY3s41wvrW/p3YLLxu?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb757eb-c020-4955-3687-08db322c2569
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:08:59.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvbQcs+PGgLOqIFRPzBVwTGt3PCc/QPEDTZAowZjg+++WCJCI318FrF1hQmxXbayAyjfWqDParOEp3URKKAdB1mfkOE+GZh4vYf2HAGET94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

The DS2484 is compatible to the DS2482-100, but also supports a
pin-controlled power-saving sleep mode.

Link: https://www.analog.com/media/en/technical-documentation/data-sheets/DS2484.pdf
Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
---
 drivers/w1/masters/ds2482.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 62c44616d8a9..6f6df686e9ad 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -545,6 +545,7 @@ static void ds2482_remove(struct i2c_client *client)
  */
 static const struct i2c_device_id ds2482_id[] = {
 	{ "ds2482", 0 },
+	{ "ds2484", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds2482_id);
-- 
2.17.1

