Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E208DC6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C10B1C4339E; Tue,  4 Apr 2023 08:03:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EEABC433D2;
	Tue,  4 Apr 2023 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EEABC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGvBtkKnOOO63Oz8jk3DqpD/eb4r95mlyOR76Wj77fUk+SgF1bzgeDHdeZvwzhMceQmG8WpghgPxeyLnVb3fdrK9hTxbOo18JyFYqxoGo6DNLgT6ptjwxRRGVg/IoZ3FwacfJxSof8AWjCz6xIDhy81V+TxTUz54+0ZDvvdYn6D4FnyU57mFUQTKzyXhECpLS7wwGTKRyTy84N02TNeJxmvBq7hairlXgZyoF6HNzPXmzbSmW1rDc55H++K3VLT11gJUHa8q572ZUZ3wPFGTuKFu8N8lB7gRxARd4mnOrmOgJimO3uqlkRxuQ+7/K8Jtz1h57wlHH4f1RogcIOSPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=mq4w+qISKGUHAW9XWJ1Y8UbFXvRcIZvF9YtJa25W4NZmjxwM7oIEHx9VBg8g/NCirbJLF/TH9MbO7O6iK8evEMVnwilRG02MAY8HrEQbG8S9tSRYB92BLe0xgvhJbXlWZ2FzjnVZTl+J4x59ZpJi4chxg/fVkItfxwORKJhY6UyUPZ5yVCK66mkfb1ULuSBaIuZPhxfCS2lJHmobicBMoUVI/SKtRj4X09yDe6s7kpJzN0y8n+Dt4i9yhKhjIZP6GYZb/pXYgksU/Ls+XFRyUbVHiReh6gJ3KFE4OFCEvivLOemmCXqWQMVoeIBOJvctUg/aSvUCaAO8YEvOr4l9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=VlEmO5+ewc2s/+3Zu6/lgFqxNwWwAEmeDbPlLx06xRn0IVWhwhVZ169bxv3SEQDcX2HznNRq9cpfn095l/QnHfeSCIkEfTpQIPiQ6Ify83SlTJfER7Z3zAPAggZV7iKGJHR9EVA4da2Zvt7gR0JqlrBzOWEEsRfL6lzHhCT23Mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 08:03:04 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.026; Tue, 4 Apr 2023
 08:03:04 +0000
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
Subject: [PATCH V5 3/6] w1: ds2482: add i2c id for DS2484
Date: Tue,  4 Apr 2023 10:02:40 +0200
Message-Id: <20230404080243.9613-4-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6a8a3e0-c38f-4a98-e780-08db34e3049c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FewvcwSR5K8n7AIzr627kZ8zspqVFUb9U+e2qB9ek+JmvdU8jaNBIVoq1tfXgphOqmooEvyyyJGNIhbkJAszRMGidka2Y+uVdvaz6Vz4XcV8re4w05DlsKpNH2CkoTsKRD+sVPVwv1CDG0Fh2LD+lC2uzYqGj1WX40gAKU7xe83/phyQdJO+fEjYjCYahEtGIUwf/rIU9aqQ8vEtsZNpBPe1vkjkQcuqIh11NtjI7kninjtYp3jlvm6EJ6hXPaGBxAMIE6FHIpccXZpkcSyed/NEBCdEFloeWdQnwR7FQQf4uImV0xNpNpbkq5QJ9Vt0NLFixNpBzwiyZjEYlc2Fas95qg0lEcomhHQSUUCrPngjQ2Np7ruVszPnJp9tAzNdq5m6kQT53rC4d3dQjqpXxJX215cniEwi/03kAeNBMdtDw+Bf126z2MV9NNKXtGUN6+VnDYLOdgP2x5ISRG6WWApY7s7qkud9uRDPdTQnQErYjlGWebTUyAycwDOkSmKnHW01OvbpxyKJW3NKKrr7mWZiAkjDmxPl27poMZkUd4FaaXk3EThxCHOthDkbc86LjjV0r39e9gNPtNBUQYsd7pVmkuWuHFiUVtWjejQhc7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(966005)(4744005)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4+bMb322mD0L4q9Ltuvx9Bv/rwwFJSSqgNqAIm3gaiZ4XmH639yQd8tzjboA?=
 =?us-ascii?Q?iRQ0nb0/Bc2x5xmO/myUr/uVKg0Ytxz38JkHgAhXKHa+GV3S+RyqaBktUIbK?=
 =?us-ascii?Q?vn4Nw3TWX0avQl7+0ihsOit7+0ILkubJeI2ycJszsJJ1NryuagISlDvu9fh5?=
 =?us-ascii?Q?W9jGtmkWznLmmRsnbSc+YYmZ3IKLRTR/qQilKR1Taeu9+pnKb48T5rb19gTK?=
 =?us-ascii?Q?95tk9RVMSb7NL201j8ExecHIc6TSs9+uSZdXkcr+it9Q75VYc8uI4Ezlf6qC?=
 =?us-ascii?Q?IJJ2hEngNr+j6d9vWaoLyK1YTA7TMOVkTuooAvuSNVKa7TktFSQCsSeafWT7?=
 =?us-ascii?Q?RXvhriN+eAlmKxr3suqiHZP5UMLKExphxyydKaAfAJ0fKRTU0wgp6vX5Z4WS?=
 =?us-ascii?Q?/YEeoBnUSsSZiPlGQvFGwZD0prVldNJqPe+HROPv0k/ypddOr+Ff5D+/VD26?=
 =?us-ascii?Q?MsgAa5Q4gEZAkk1KOSI9GTN61C4PPApM51mO2ZvBFe98JqUGCnFa/ZevXm/8?=
 =?us-ascii?Q?P2bAhRZANXZ5SXmYUsMp98xpqdVPKmH5IT8MuJHsLhwoX4xILSlxtYd6spUK?=
 =?us-ascii?Q?BsGdxv/2Eqq29J1UIpKhawHgOYTFeCjHrRe54jpd8FNuicazVCvr6pdl/agg?=
 =?us-ascii?Q?qY4UANC/CpbzWJ26FggsiqwQonl0Mmb+tVaNZ8RU/rQ4fYrbI2SzTvkXVWdN?=
 =?us-ascii?Q?RvlR4gmihGB0SPXYa4N055y12Ir319G453v/MYDWGPl5ra7QVnzEFE7VYUK7?=
 =?us-ascii?Q?ezlMwENhVj5XVwaYgfNL2u7laiCMMu01tu3GkI7F+/57PkNOD4ARlENa9s5n?=
 =?us-ascii?Q?jVJeWo+bgHKwhJTMdPGCQ7lqTHG3ClU9NWAdXp8pE68TUdmbAPc5JkdV2K5/?=
 =?us-ascii?Q?i6kT9w2o5det9KQ9N5nxpLettIHXbQr1rk4EaB2LyG8nCDAWear7fO3Z0vq2?=
 =?us-ascii?Q?FQvKYotso33naD/QyIcKCnml63S11AIQQ0wrIiN2GJklp+xE5ffGdzxbAgI4?=
 =?us-ascii?Q?OQq+fIKbb5+SVJFGbvbmoYKvUifZRebU62hkMb+OVzcUcDSA6vjL+vbXVgkx?=
 =?us-ascii?Q?zqwsfTzB47n3Dmkb27ZVjZPls5vnx3Y4hnTMHaq0+qlB5VPHaxNEigxqZ0n3?=
 =?us-ascii?Q?Zmvo0EdyyVAhUNBW8REsjMsrjvBuvWgCXEz2GPDFsB9mWZ1FxHFeyREkuCtD?=
 =?us-ascii?Q?l1un/CdvmnVLyXxHNd/Tw6us7A66jGXKrKwwAufowT8pbeNnXY+PWm0xvohr?=
 =?us-ascii?Q?78aZeFgeMIStBzg/WF8LBfQ5peExqyL/ib41VvFtABENPvnvxTF6MNrc3K7w?=
 =?us-ascii?Q?m3ScuDaZmIVxpbHfZCPzOI1mCkOC0MqXJAVC7FDBGCtCB+eMKqic3P3Gxkp3?=
 =?us-ascii?Q?+OABHiQ1JmJPbf6wQaAqELZQNOdOMk5L0QpKsmu/Jkulu9cTwckUJlbRrHIf?=
 =?us-ascii?Q?VlDM1Df74EnV6qyaX647gugastpAnNWB8dRaDtsu/NN5DxWbqYLGnHdNKZmj?=
 =?us-ascii?Q?0qjLNnHbRW5HvQ3hATGrDPcUimgkiPdijvaXPtAn/aJSrWuNvzcGTAk6g9if?=
 =?us-ascii?Q?jFf5Ihs/rLujIXBtJI0V8cnVsfXqWGchXcMKFZi8N5Co1KkONsEY/l6VzRo7?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a8a3e0-c38f-4a98-e780-08db34e3049c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:04.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7JMyh2waFhyw+Dmet4d1sYeJm5zv896X4Ti4TcsnEkF0IUKDxlhNK4UbGd2l49GUxwDQvrDtmLk8u4EzbgxTPSJip0DjJsrvRYjHv1Y1fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

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

