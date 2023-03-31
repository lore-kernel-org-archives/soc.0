Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F02CC76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15854C433EF; Fri, 31 Mar 2023 09:58:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74730C4339B;
	Fri, 31 Mar 2023 09:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74730C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMMt3vuTPES6XJfq85vA8hDAu1TVhUzOIjkT0y8ZKHI305dLiGzZsEdTjo1mQLzYSnodEGitha23s0UFK5uWIg/cI71EvofQTtux1UARF6QKRvzD4rB96FekJtsWcoxB3YerlnqQ2xBZrhopQaRHOjLZhVWnZLdf35Xwf/Kna14PX/mW/0fmIomItiiYAoJxK56OExlFCdCekHib1R4xyxK3DxXhqNiP9Iyrhs40ok8IKRqwhz6xQVkd5APX+i0tB0IyD/GiQi017QMlEYwL2xK5zeMiW4HyMJfT0gMy9P6NRxAnictn2dzPElY9xvRcPqaSoOb6/SK2KjnmUABcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=To0dOMGa5xXiMisuVC4i0Dmy6H0Oj+VdYAMRjjusatDm4a9JyJnkKdoCFQE1tQJxEytpTIY3hOfl+ZZUyRoICnnC2asItlm9FAtiZtj6TqsF4xpgnzmIPdCsmTLTNOF7AYI2i85ZefDlsR2E5UuBXdB7NT8J6oQAZB+VXRk/0Up03WvAd4oQdXUSDgzWbZB9h/ON3otPr7jvnwYwnm7f2QagheOrcScgamsZ9Gr25a6lmPYh6QHGuDm/l8LCJ5zVi+hyGZVK6bK1S9Ti/wHM2jX893xs03VklzLA3c5pkPfyCOFijz02sC3+RPUjeI8UdEL10S21cjrcCvQMYptjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=WFSBoZGYEHo3KZvIMmdjsFrJAhptdxZT3tWLzFTJaw91mnrVHbJZ1pAPXD1eJ0ueIWaIB1Z9MoitpSILoTPMmBsB9Hzxyt2cVkVuSQOqD9wZHYv7wMp/F7lHLdZndBPMO8Adaungma0Rwlw2VdAWeq2ficc/cEkUBRDhCqAuPGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM0PR10MB3539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.14; Fri, 31 Mar
 2023 09:58:13 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 09:58:13 +0000
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
Subject: [PATCH V3 1/6] dt-bindings: vendor-prefixes: add chargebyte
Date: Fri, 31 Mar 2023 11:57:10 +0200
Message-Id: <20230331095715.5988-2-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 177c7824-a947-4f7b-cb2a-08db31ce713e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6SOXXrB2EIDXPawOWDzhtdBzzY1vqJiaRtpXFDx05VvIf94CxthZnMwafpFK1GZDeSw4zIaukNaEU7YDUAt6xsXEwpRjTz2JzhI9BtAFNM3pgDbiTvP8akrC/QEzFwsQ20A/boVG6DMvmivDIBWdFhveRQHHy2vSG5SQ7IaBAFPSRsNb42qnfcw/jYldUDsCzDxsSnEbysZChZ5Kte6xLtMQ/QLNlHw7sGaZ9Qd/6ZL4XKdGlp4FAgXeGu9HgY6ZYDlm9gafCNHhyDJu5EUQtJ+86C9tKjdqOJ6YQQYed4sGfbjinQQnFt6HdcYKqpPsG0vdeQpXdE5L/6zfNEjPGi1my4bji/K87fjS770LRSt3gKtx8tKTYGOMpcxRMwh+zBdZYOBLfAsbSnQwFY58URiOm0lbSFzaIxb0AWjrohZqIzErTGNZeYrhl9WtzG2dSy1wxYVz1UuP1I8o92mi5cFremHKMgxC2Baa0MTqzdhEV9PNROj7wYEdMPSHNlnRfFdlz/g72tvIsYt1rmjrJn9J+Ja298YNTSUVxWHqsOzRnggML3lY/aNuH0I49951pRsCl6XoKYhgUBLsQ3BGlbvCHasWvbfeZrbu3v1q0fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(107886003)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(4744005)(7416002)(36756003)(44832011)(478600001)(66556008)(110136005)(316002)(66946007)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(966005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nW3LsAbFiNUHizeVwzEAZV3hoG8RLgDmP7fVaYmTDq4Rb9X/7rlTAv/XeRhy?=
 =?us-ascii?Q?vWYfNaVz6jOfowiJ4lP1SAVmBcbyg8rniVnjLrOXoRQ718FYfB3rn+40WirD?=
 =?us-ascii?Q?2IQKog8pr5PYUeqEPSj0kk7WsjN/aTHPVxy4CtjGhmMF3374IshkE+lbUJnw?=
 =?us-ascii?Q?sQ6Tdu6krGlBEUQchlFYyaRzuqPo0tTVxJxAnStBWfAbWbBIsYSanYJaWKZc?=
 =?us-ascii?Q?UGS8x6Rv4V9aK7rSqHNULJ2w+kitn2JJ3jqEHwVKb/i/fgki4p0tJZZGG190?=
 =?us-ascii?Q?taDC07LTdsXuHifLqPLpRWhOFzY6mPvZvBNnuTxygiJvKwWeHJLRo1V7Xiq4?=
 =?us-ascii?Q?aEfna8zaXxLZc4KWT6CBMwxylJNI2tmUyCYiD3Ru/fc0n+ZUY+1AL3oyp75x?=
 =?us-ascii?Q?E7TmsfV32MaNIA+RRJa1F3kQFHKH/iGwCSpq7Xv4lvP0HxW8CAforpFd/wJO?=
 =?us-ascii?Q?PDs1Ha/oHym5BSpYgsyt6BBWsAWtpXutfqMr2E5d4dZjtSEseIMmogBqEKDJ?=
 =?us-ascii?Q?i3mAaMqfXcbL5xcyzYFnsQbtitahTk5AZM7L/IWHVBSyB0uDfjU/aokQjmEV?=
 =?us-ascii?Q?7ZYHLfdIAln5BTIRio7QL53tzyFvweJ410Z6mMPtAgEwchRNboo8D5zie8zw?=
 =?us-ascii?Q?weFruH8PecKlOU0h2UilWCISqdFSRTv2MJ4x4QuH3wcfbyozxXi8QfNYxf0c?=
 =?us-ascii?Q?P9nRFZvZkKJqO16505DW634y1+eaDPSx1nrWUe3N0xD7J1rOPrBP/Li+a4mW?=
 =?us-ascii?Q?qSzbioHMktVisnuIPAC1bI/20Xb8PEDexiimjl23KznxQ+FkLyaT0t8I6BU4?=
 =?us-ascii?Q?B6SaTArmohzzB8+5JyrZYWHnPbqRvVhuwszCT0oGrv03H/8B2U4AjcBT1ljS?=
 =?us-ascii?Q?M751+Tn7ajEj14/IQGUmR2RULajJYHoL/TG0+MIppMe9cEtbT5HZ1MjxDd+P?=
 =?us-ascii?Q?N1riXmbkPrJu5HSy9w1GdbqjEuJmWrCm9oDGz78AGfR1b4lyJOp3MfaBXwrp?=
 =?us-ascii?Q?BgCCNveMV7jjOh2YKXBXq3GsWYrkfGMPPg39Rm0uVMie6ReTjvE8s20waSYb?=
 =?us-ascii?Q?ZBXWNhmaPZxBAZUUwVetJ/6PFzDhWC6AnfKLCVF+Jl+S4oi7nvI7fwjZwa4D?=
 =?us-ascii?Q?/OKMUoOQ8hGQFiqhnqqixtpIn/79ryMxahSTXkJrylLuoi61yTqi2CQBkwDH?=
 =?us-ascii?Q?x8cRwFZgF76PIxCkEDWbG9Muzy3QWiHp/IVoxXjY0adpq+bLmDAQQ7QvWPX9?=
 =?us-ascii?Q?5nShtO5tKOuFDEJPY0iWO37quiQQny5aLX6ZsIX3k1Z4QVg+WbY9hyrLPeae?=
 =?us-ascii?Q?tGOJVYiNSp/5clY7YAtikBbzlaud/xfL5z016S9yIj/VC6BLod4rbcQ49myt?=
 =?us-ascii?Q?oCd7CllckfXXTruvMtvzNEV8JI46wo5ywvD2P9iES1D4wDFrKLNzxwRXvyYG?=
 =?us-ascii?Q?WZng04gN9Ag/R4xir5fXdKEsxZ4JIPzBIksgYcS7WlxKunkrOJlLvLdWeqm7?=
 =?us-ascii?Q?8vvN8xehl9QNTT9mKiD2QWTKm8vbio6kRdizjE97TKB5LAHXnsZXHR15YoQJ?=
 =?us-ascii?Q?6FKbo1qiO+80pHhKx0iNRSXOJS/gKyGLsXO5+xijUHZLGK0mAKuDhoU4YRUh?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177c7824-a947-4f7b-cb2a-08db31ce713e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:13.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2+8GVz1VCqf8Cm0czsL8VKiCprt1f943J2fg3dQY6K0aNM/5SQ6F+LWkA3d6M/UU8R1/ye2VlsBfp5V2HGoejq5CO1Ie1R06eqi2vNkxVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

chargebyte supplies hardware and software products for all
aspects of charging communication.
https://chargebyte.com/

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed64e06ecca4..b8d8fa1d1fd6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -240,6 +240,8 @@ patternProperties:
     description: CellWise Microelectronics Co., Ltd
   "^ceva,.*":
     description: Ceva, Inc.
+  "^chargebyte,.*":
+    description: chargebyte GmbH
   "^checkpoint,.*":
     description: Check Point Software Technologies Ltd.
   "^chefree,.*":
-- 
2.17.1

