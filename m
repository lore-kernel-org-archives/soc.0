Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46263C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CD86C433D2; Fri, 31 Mar 2023 09:58:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0E91C4339B;
	Fri, 31 Mar 2023 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0E91C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fob/XCipfH0ADQS4d3ofPmKLCaMkZpJASfQl5CbVJ56BaXCFFIltD0wnUT5El1y5te51cCLOsdr6pX5nKWj+imRA4+U2e6SoE5RxkEYzQJ35Y5637GWFraj523lS0ZlUJLyNpYwhjLkTHzDKEAoHtcCO1ix1/CSW4o0AoMUnMGXc7r7/IU1pLXUCQYQXDIYtlHogU60x7dTplEH1F/+kOcgrdfk/Jknk9DD4KvOFnCHV6m3xyjWf6a238wT9S71ZZvpLDe4UwcVkFKR+zvts8nZb7rQfPKaAOrgJk5Sau9i6FPkpLTA5cjbBXwrXBMAJUobJj0yW11l43QWV2YIXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=iX/8S5uf8K62iDxEY0Cx3s2lGZYidmdakv0Yazh7e+w6aZXjZ22AEMamlw/WVdc/16LJytZRiYn374ouKBxN2lE3yBFL3oBrRdO+UqjwuAeuugHKpFRZ7uLYAcCb+u26FLcsPDk5+M2stNOro+E0X/7AjD9Wg0Iu0BWoquy3d2ALcll0gs4Wt/efsPhZuv6y3/slvRbRwbbAHA36/l0ADGAen5Hr02P06K6/PDTwAikI4SJTx6RhDo41uGZqCfSN5LxFea8+yXBAZhcR0gpi++izg8s2wC94JXlwNC/89szUn0BAXUv/Y+CdYuWH0BZ4qeek9w/mpu/XYBgi5h9a4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgHBfWanPZkt+c9wiByfId/wRP/Fan5Nmk+IK/0rPwI=;
 b=ifl8/Fi63CgVKab7eCBoJ4vYh4fRBsQeoVRmc2N6Wgsvz5N1tHJZdSbKBSLuhq1jk0xhgXODJoKy6TBZoboKa08UMZEuFrbxyl0BOhFIprScl5wXrcr2AhxzphWgoABIVrZZJMo03DmXaExJmBcXXXm0ftCXoCJnRAfxbGcJkTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM0PR10MB3539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.14; Fri, 31 Mar
 2023 09:58:16 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 09:58:15 +0000
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
Subject: [PATCH V3 3/6] w1: ds2482: add i2c id for DS2484
Date: Fri, 31 Mar 2023 11:57:12 +0200
Message-Id: <20230331095715.5988-4-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 56a1c2ab-71ac-4788-706a-08db31ce727e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ZDZkVBI8ZaaDOPehsH1GzhdevAmlzCnI1d08MA23gNi+t2izXFX6liOnfsvcXIEyLGIm05uGp4MGMespLilAr7ZXoD/GBNOMFeFwH8mYBOwRYlFJ9AaZyWtYkma2p6RK3eXInmiofNUEkU7VJG4Oh4wzFRRqS67Z8uV7nH8dmxSgsIN/nCZFaMuRB6b5FXMSxmZw8pWvCIxsHXPniYKrtJIl57AzlLwfkzzSqhZrnSrsB+ag9vJ7oDYKJauYjy9oeos8Bhv1emZ0DT/cR86qSClW3a+KqtWxB5Au74U9I43RTHk9CVu5uVmM9kIBdmtrcEsSGxBbI9pFX9pPvF0mOzPWR6IRaxbN4LdpaTnSLltXWB/+umqeFXE06MCL64VDaud598wC1oM2DOAcHtCIwJZ5gPZDJNdKQsKm9crEEdToQVqswyPYlrWyNXefTK/ppsPTgD5pi7C/DWL1VLPFDpjaaZrxA/pbsF73ZbfdJ6QEhMEeJT+T/7tDEq8WJEgzYubV2Fdp85da0TbxA0GI3Oe7302b9OEbf2NG+nsUPvnRrux8QKP0YDAUEOh7ZpozOMfaQS9KDlnrABTVTq691YPoxDCVqTrVWc9D8z4Otk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(6666004)(107886003)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(4744005)(7416002)(36756003)(44832011)(478600001)(66556008)(110136005)(316002)(66946007)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(966005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4GnZum88D8MUvHLsDbG2yZrhzMcrahA6yLkO4dazlZSD5KrB3PkU4UjM5pZt?=
 =?us-ascii?Q?Vmg0LL231mJDE/tlUSLRNdHq49Fzh386Hjlc71/Pfw/KxO+8ELMRw67etEhv?=
 =?us-ascii?Q?c7RAxRBJvEtyXUeAdF6KlEtS0uJNyVE6Qz156niP4wG7n51ZEQTZs9tZ5eOP?=
 =?us-ascii?Q?8Pb5z6py8cMUa3kjagMttFkCFWFx/b0OsFPobufivNHxoyj+CP94xeucwzyU?=
 =?us-ascii?Q?5KhicgYIhBzovgQpq2YSHydpuDt38SzIAAD7RPtgdgV9t81kLPNwIu6gKhR7?=
 =?us-ascii?Q?9BGoGwbhvP+ws1KKU1Te3MM6NoZJUYMdV739koL1jiwJvh2d+kBoThLTIrvv?=
 =?us-ascii?Q?iptOTn/m0r9Q1KMDAuC7ExvqpkYFgRJ5LGwwrWnktGj7t+aF2k5excdmEVKU?=
 =?us-ascii?Q?3Y+k/q5GRlLuEhyv/ql3hwo/eZ6lnT3C8Ef5k2sq0U9YxWNi7SIOF7TIvleJ?=
 =?us-ascii?Q?OO8A/gUi7cSJVMe1jxvPRHW4P/7553bkoINSvodQcGL6qwV3AZjHZTv88AO/?=
 =?us-ascii?Q?qxnfHOc1NRy4QZfomSCnVEPfWhhxyeTUd40lSnNlgRvLMq+Q9HwUrAbO3Sxe?=
 =?us-ascii?Q?OtvGbkhLPC+ZQIpF9Cs/sqWrR/nlclb5Iz0Xc/c7wGxkaq3qmHsP6bCBGd0A?=
 =?us-ascii?Q?4ZCKjKRO+8VvBudhB7O/b2aPPM3WgIO66tW9iIX6lEjuFGVh28yW/hEcG9at?=
 =?us-ascii?Q?Ijo2+p7ZO5bQYj3AhQwnUDTBSiUpZbvZQbVS/5UtpX2AACbDAidTXPnLkvu7?=
 =?us-ascii?Q?jmr/d2Pr7MPsIWwbE5w9ssNXNUxUwMenzEkdT00qbvm93qEtqVF+W6LjL/15?=
 =?us-ascii?Q?RcHkTfLhuWVWrfc6a5pFswZey+QUxmLqXDD060ahXqpD5O8kbUAYW8Jx1qJT?=
 =?us-ascii?Q?/a5Ct9OIevmjh2HdpL0GzInncNntmKFbmhij2cElq8ds1LGXj+SWaITtUvD1?=
 =?us-ascii?Q?31qJYjsNEkrR9nMzgfqvx9u3y8/udJZnl91eXRVzUE46rdZH90yc6DXSXDHK?=
 =?us-ascii?Q?zy/DSUGhEQqrJgnWlmIjimQFrx25o2iQtW3/gAM/hgmmbo6eG6Z1whp8a+Nh?=
 =?us-ascii?Q?waWznCImARa2jPC2TD82Lr7mMWw8jxC9pjLRTlj4oOGIUl+bg85yo5VIb1QL?=
 =?us-ascii?Q?otarzSVGegwcn5quM65svd05ahztFjCNWG9Zz7hz/ZOnyV9TQkdvrsMWjO+N?=
 =?us-ascii?Q?Ym7JxMDMOqyEXGq4dGeLkkMRPoqUq+i6cYn36xzqWg6K0HfYoHu6GdQP5urT?=
 =?us-ascii?Q?fPUlEYrLLdNs68TAnD6TyfisTQ2PVLeE/t5wRqMWscF0IQwmF7ZsAnPEAlPZ?=
 =?us-ascii?Q?/GCy1w+4Mrr4shAgHeTZtMNS//VSt9IAvo0iIKmfxQbBqkzv78OHvHqvG7bv?=
 =?us-ascii?Q?BEKHlQHsa+2HQyhR1sxObpzeBEQmnvWN05IUQqmEHZOPh9f5u7GG4A5Zvdnn?=
 =?us-ascii?Q?dzLGK1sRMFIPnBsenDeh0E316Wwgj6wEZvC1gYktxQ/TindjAEGSJvqbX7Bm?=
 =?us-ascii?Q?nogMRHHcTF6glLcD2+exhqYUe6DrYOwNXzI/Bx1Jy9PkUppRaA+gTu20+bgO?=
 =?us-ascii?Q?a5zFsnZEB1eqIOHusbwCuQU40HGcPuQDWCFbtlZKqSOY4psNfhlbTeVVSwW3?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a1c2ab-71ac-4788-706a-08db31ce727e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:15.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKkTg4rSrUYEYtwFXVPhD5aZuu90rS1UPOZTjK5Au4XnfNqmHK4zQUW4xp8X78teOJvJ7R4Wy5ss00BggazjdZyskCHv20g2VJZUDNLcbYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

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

