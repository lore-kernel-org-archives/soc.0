Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792B4C77B6E
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C6A9C433D2; Fri, 31 Mar 2023 21:09:05 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E438AC433EF;
	Fri, 31 Mar 2023 21:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E438AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhtypjaveA3MxjXL9nlp2hqHm2UgP68FwbPzikfMMTc6EHmFa/PzyeEu4AwPlHUutOjev6kP9SSga8VPpbwiyXHeqQdoYnjpksmCtbkWc3oftUqii5Jrfog2FF4TW6TBda4cwowpH+GO502Zk3AdZAPGEJciOBW/ASXrHJIl9adoDxuVQGFtZykazK9Cq7/ULy0iIslRSvc7i/TkMBwNp+dvbVZur0MgDIjLeaj7kNemcB+atyoymmNhiPMhGRnRInyz14dInZdTQE40RnWRy3Q+9lAuCBx4NFQWtGGnOQJQwci5GEplgTAjlFdLbx1HBzCqPTyyKyIpwdFHtezfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=R5gFh6fLo7Qmm4XM495whLsx7LnfFvocS5BpQbFchyV0TnhtIRtXe/rCTvWIrk8sMjkok6CuHiyFmar89bVQFO9AX7SknUNVjCq5r2H3og+pFt8lBjycx936NhgAd/7Vkp2SgJFXxzcmZeyLJUx/RMjOn6EY6VzxLNEeAIhki5lpK35n0B3Nj4QmQYs4nJHf2uRU5eWpssV1dRxCZ7lO9/14b28nR9j4msUSO87zx+rNVlKPGh607DgprY7X4NoJSCYQeOlIZGuVqgly5z4aZRzkqfLdnQCdNqhm/vnVvUO42mrn5yPQJtzsEzBKpjA6kCSx3AGCaDLinMaeO/pG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=gNUnp+/hD8klFBSWpxIzoxIgg1/PqYbJyLAl+htTIsckQAePoxpX10kDsnCaVhNwgY+SZmT6PsuOvGR80Jir9M9HUEUFa7enq6/pNvSB3jvT6sj51sOlrmhNmY96vQEZo8Lsro3VpIUa4MXh6TdDAclmDXXkwnsuzp3y57jShfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:08:57 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:08:57 +0000
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
Subject: [PATCH V4 1/6] dt-bindings: vendor-prefixes: add chargebyte
Date: Fri, 31 Mar 2023 23:08:35 +0200
Message-Id: <20230331210840.4061-2-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: fee82f2f-26ac-4b99-b2c9-08db322c244f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jh6TLA9BLHl6xyY9mjCAILVpiLXnQw7UGMd5b06Q2Dx+XRCW/QNCiDhNGC9jfsnUioyeRpzo4Fw8/+KyExDWV4sf58qd5hEoRMt/Nckm4ZFAeajNVHtU+Vd6pTL4fga4I1MrIdo2SQb23eM55d1QLbEnf9bNBrvvBzACI5hguUZJdzMYT2vSRoVrnLUehtVPUDYIIo4FUK0WJdBCW2sh7qLmRq7xfvrTP1vwzsNDOFS/lVT3ufnnZLywwxAnozR30Tk0AaQFbm+w3XUqyCMnrV4qrJkZUiUC0AVB2bCw+vfaqa4h1D72UEVEHa0SYfK3JDylhjoiT49vgob7Uyt+mEVaL+Gny8GtBTbcnmoBX0LWZEFS+CMeYX8w1mx0QH6bK53gE7bV/y68MT0QurgKkq2a8eKs3lG7HgkY2TY1HA6Xe898unzvevxoYTYHOn5i1ys+NxeDRenGX0gXxjR1A12txLtKgFnv1H2lADXyjPk2wtHCNTyalP84HqopwSL1mA7IEERxl0gQMNnujL6QTq1E3oZqRwNEAm3eBNRZwMBzZyR0g5xEeJj0Gbg9iItZWOkmbYGnJV/2s5Lp2SqfqzhCeJw4A2j8YidMGX9jbt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(966005)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4744005)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ORC+Rn+GlS0L3AD7eNjCj1ZUi3HktRfMoYjdWLABq/dZBjOC9aL+yRhrRnNh?=
 =?us-ascii?Q?AfqaqFju62nWNhK9lZ5MiB3PppKmtiaqYdAzaNYqEBoXtaiWqGLmfy8dAzPr?=
 =?us-ascii?Q?a+j7lCdJL8Fb3BPq+g/katY5kVdCD89DCRWCSKZ6gZakVLtd/deXY4hGSlO7?=
 =?us-ascii?Q?QEfJYOL6pQG9TQETMgQ5BC/4uhwmNsUmxhHAmeaaAo2f7w1D/feDN5+h9uR3?=
 =?us-ascii?Q?UrqSJCmTJvnqpxkQjmHw8nqAtsHSuqruPe4gnkcZBa2mipPoCgF0dJJjoY3K?=
 =?us-ascii?Q?nFci86tCRYb11I7WOa7OvRKjBttFxqvG6AyfTDivEkg+b/K/tYoy5VD6v6Qx?=
 =?us-ascii?Q?pqxIV8LZ4yjErO/M1mbG9LVXzG4hgJszbMDEsQ7Nh3+wpEP1c8hpIrnxSBba?=
 =?us-ascii?Q?D4MvoTCRIhZMq+VrhbXNVr5daC9m4NUuCYH9Mk+K/flq9UENQDl76doByayo?=
 =?us-ascii?Q?T8GMIOX8J0Kx+4cxx1T1ypJ7i0klZt3W2ZptsHvz2G6jQZk8RQetnmctznjE?=
 =?us-ascii?Q?F7IcpOnqI+xnhgqAxcaD+XaEtqsvreXNUEU5YoRTjsxQgZCpcR/KW1g9LQaB?=
 =?us-ascii?Q?Q9qT/unsxqigpFI7fxJm6QJ8hSPFgmt4JkkyDdcODxJbYaS9Amzs9Vzo+XPt?=
 =?us-ascii?Q?wijfbR4t6/bzw90Lcr85EfHOohSU5NciqEev/Ty6FA8c1MquR0pBtqTjPOpU?=
 =?us-ascii?Q?aeeLXNXzqVLb7XZOjoF1pXIhlzIvhvU/Wz1RoM+qAl7LSDbzHePxdHf/1noU?=
 =?us-ascii?Q?2UKGruPqsz+hrPkJk2CpPPO+H7Lw/SmF9zla+IPUOhQwokQ/WBwt54TPNz7t?=
 =?us-ascii?Q?C2BeGz8PR8eslWEbbdmFXctq4QYwdMZX92Z6R3lO0LXxLf1fWVRsJv2ehxhp?=
 =?us-ascii?Q?QiaAfga4d8lKxdrqxzTrSgZfkwuOmYEWm0M2JceFWW7NxoRH3N15ifOyhvjE?=
 =?us-ascii?Q?2GQknisYCd6nqKM5jg0pzHUzZZOqwl6eF87ZAWGOK5z72C2jNVtXU9N9Myd3?=
 =?us-ascii?Q?KNf9r+A/b79f4hSznAInEoYet7+nYc0oTuVkYnsILiHFiExz35uXN4Ypd8Z0?=
 =?us-ascii?Q?3ROxD4Hf5wO9lCUOBH3QmmPsuMyOhjhACwFzawmY98yz3hKVH69ykOil5aY6?=
 =?us-ascii?Q?J1CUjo17rl1NcrWu+yT/iFG0+pZ9eLhNY0OnCcP5IWu1ZefLZwbZVD88JQ4I?=
 =?us-ascii?Q?/UwV+WJUbME9m9f9WCfCUZYcSld/BDguiA/VZq+K4lbpSoRStuTH1O06wnRr?=
 =?us-ascii?Q?E4KmKNsUzqtPS+EANMAPCbqhrisUY2Dxd9gOd2cdl6AEULXmHImNKMFVNbAG?=
 =?us-ascii?Q?DdUOxqxLfTGm4YV1fVdMmclZlfyrDWo782w9/KR0qmP7ocJvtVhevMXHdJio?=
 =?us-ascii?Q?NwE/Bq+gCepkbNmL+Pqr4XABlOyI4mkAuhhp0tTFn1wsqKucPvPB1U2lRUIQ?=
 =?us-ascii?Q?nYv6qGJy7L2E4StlxfR8rUNkbxW5vvndvm4u2+BaKj+OIfvskOTj8bjn8ssO?=
 =?us-ascii?Q?8dVK0mrBLuRYqDOhWZXp53GtpiFNpluHN4cxmvwGzNUlRBceFIwnbvb+IUll?=
 =?us-ascii?Q?/9XRllg8Hr0yeBoq1RnQPYoXVSPnvuZcRcj0uLM63PgpiZwk58qJa/l7ha36?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee82f2f-26ac-4b99-b2c9-08db322c244f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:08:57.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXkCFMTKXZkbQuxttrpm0L/yvhCpyFD5NplGvSdGLYNrwN4XM+F6og7t2/i3ErV39xwOdZjL4qjkMmemOpjSqbGXGuKyjyxUkZ/HfnoB4/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

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

