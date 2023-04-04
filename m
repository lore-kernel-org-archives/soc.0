Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1CBC7618D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CD3BC4339C; Tue,  4 Apr 2023 08:03:10 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E65C433D2;
	Tue,  4 Apr 2023 08:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22E65C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEZ2rU2E18l08RSDxj9UtzXvlUXLxs/d+uVexbI6Hr44UtXjljTM/TSIR92L4zrowHYy3HO2aWfsSB5yZ8nwmdaTdLNoyz1Yns9xLTRwb/y8qVwDwKF720r9fxZFiP6aPkALoirknJiCGMHZ/lQ7bn/y2576her0JBdgJVVb8Zk0qRDGQKV74I6qHYDJlkYKOt/GCvZZY/CKfohnOfyB4yc/AEQD6VoYsn/uSPFIzCPMUWmYvwZP2MutL5JoiSvCzu5pYthr9Lcf2OH85+8ySMkwdrBzxt+QCS+ouoKN2zBAB8QMM7NhbeIVtwjsW4Mtk/i8ux0kCGgSTL8Qn7BlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=eJPqJiG2qRuU3RV0xbClby6BAJdLjTs0Jhl7Tug0hw0bGNlczHRaZCzEtWRaiomprQlbsNkguk4FntXZy8mYzAntUggE5n1xs6uIDNgIbf3p8TRLg7hNJqHmCCrs/7H0pt2qq/LyTtjlZgKwLwhc8qZmxTgRU67oaUfMwEivDfb9H0LQISdwpjJf4Fu0GmtAO++4wBV3j4bKppYiUpUy9Xn0m9WXaOw8p+R5bfrH4GhP5lp02GlZFEWco697CxFOrw8G4t0mdlwVYVi7oKSasvkjiHE3MQ7qdAf9Zfar6oygiBn9ko2++4T73gMvunKjSyS0M6lUczT/9cy472GysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chp7th0QoE3lCiI0yzGk6wSlZzn3QyI0CK3YfwMwZKE=;
 b=pNECQARlIH7DXmgGIdOt1AXHAKPYY4CLu1nlvD1DU62C6VNFDAyXwR3EGGSVNJ0XKxaU6Wv0SSf0gCDUddWTUIBbQTjl9T1MLCDWHU177xrplPyDaVhHZZ15j5xbLd36Y6px9CtO0flGRC9a0w9HwKZvgpjfHO4o7WtmeXAZ2jI=
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
 08:03:02 +0000
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
Subject: [PATCH V5 1/6] dt-bindings: vendor-prefixes: add chargebyte
Date: Tue,  4 Apr 2023 10:02:38 +0200
Message-Id: <20230404080243.9613-2-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ae994da-476b-4081-4efc-08db34e30394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	naVYj0rspX4J0UOqCqWwUZAshWC63BcRd6IPWt+6Ea8jwkdcoqXEt/h3sLB1MdukyVj0T6O/8yXFnXz7+/H0iuUNoxaAEXq/T8cXuDythUBkfBsd7YFKoWaO9ClB83QzVPPKNL0Ft4xYg3V/myuMYeqL0gDNbW/UWJkFALgJJNN2WBdyzAvC9Tpu0HQ1GGnpbVdR4WIIi1cUPgoq7W36U3E1RC8tC9ca7oxZr5nR48C90AJ9+K85+S7wg409fVDQzX76BTrXicIFRBWuWjQrITEl/Mz3Y6b/SSGGqBdZ3vELulc1gOSWbca79mG+Ts9U4iJyD3HGJwp3MAbcxag+muKrxXlYZ2sf4WpInoILNvMN4J4W9RyX7fML4k2CMp57yMf0U4Ag3Vn2dzJdyJSE1voN6fv3BMdxMSlwIhVjoO1yxupU7GLa4VHZqYrlpTaldQWCABrlEL5glWUZTYQ9on8Ck4tij0RySDiAOwYCo1YMILou0SfRuc2PqAuSGlOckW+NRv4K5MA4B4pjV756VOWnYfBMV23yg0acPii27fKDhBfiowrPcvaVDkcWtI1gGlgl5K5NtfHVfkVADYKDh8lJWACs4ap+tMMB3Z5L5H0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(966005)(4744005)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uOvt4mwNQyjgTTdvLCIIR+944fNdK3KeJWHQV9sD88iad2Hf3f1JYAKJmviy?=
 =?us-ascii?Q?shBbGgPOTIx/52J5KI7ICgtXHiZoiKhmCcBy17tXo6GCixnrZP0GY66Zjwef?=
 =?us-ascii?Q?g8jvC0cpJ2Y2m5lixrjAPrWbGSwQwQkLAnq5G3XY6LJlzEve5CHD4NIZKQPB?=
 =?us-ascii?Q?H8c66QZsqU30dAgmOykJUlPYQi6Wzng2oSd+cjdvdWBCTCYjlIbxZLQqiEug?=
 =?us-ascii?Q?2mt9voPxEBfdguHSuaVpD+pFvEwIX+2gFJ+lbGTg3KudLIgYBr1cGV78laX5?=
 =?us-ascii?Q?WFGfbd7/qSIei99Y38qmyNxchdRLnBncW42OXY2b9bfzHXdGQiJcsZ/Cvyx6?=
 =?us-ascii?Q?xL69LhMJclbNVG9Pnfl7CaP6zJ3qWBFjdHQGtmA7sCJnHSWmZqxkKK7mBgC3?=
 =?us-ascii?Q?B8vEukvDTR1z0cwd61BREHeBqYN0Ne51XNW6MXIl22CsqCDTn5TOnVPR84Au?=
 =?us-ascii?Q?pp9xKgl0q/F+cmg3XHYFBm6iQ01rx84hnETCL9yMc1rG3PepqRrFxtfJLwq1?=
 =?us-ascii?Q?eVplKPLQ0GjBpk1zx97caH2xjc4GYFUx0S9RO2f75bZB0K9iU/VNsuz8hbwy?=
 =?us-ascii?Q?EECb2PIDOMhk9xrBM/N0u82WdX8WcQ5d1J4Au5JCVLm+Hxl2DiJWMvmyRODU?=
 =?us-ascii?Q?r1LzSL27+REMTEXT75jBK39sqFaOaraMQFkJ968sPZJVc5CN8HCuAbgrQJWT?=
 =?us-ascii?Q?UushA1/zr6zo5RD5KZKr15IAt6czoI4EhKdrtcJ8mPV0VQlH8kulasFjcBCW?=
 =?us-ascii?Q?m1J/sxqeAIIbPlZerNFhrjNnz4mZDvfN2zt6oellSXg14eHqMhXtfCJ6XMP4?=
 =?us-ascii?Q?ZPlL1Lp290vgqvNtBbGQ/gKiJdxIdamxuon2fug9NgniOsVlYmoN1nsTzhJD?=
 =?us-ascii?Q?is91plk3aBr3HoI5x1APcmRRwyLsm1B8XKQVBJwGUTpoUZT7Rv+E0d9Afk4S?=
 =?us-ascii?Q?9mCzBDweV9Au5DULCJI9LPdbgUuuNjzyvs/f0OIPYwO3NbUMWsD8lN7aOgDI?=
 =?us-ascii?Q?eeOH1h1569K6nqx7d0fBpUDAyJt2o4hJkAFSTXbhEkD9AvTyX6DAkeXJsZ50?=
 =?us-ascii?Q?MpOrtjIzP9wqDBkU7ZwJXQs42isp+mR18ePeXaVLziGX3LtIO1nP+KrDIH4l?=
 =?us-ascii?Q?/tGLY/NWMe/CCFN0vr9VzSryIvak5tNdlIWKdtyVZPzB04VXBdaC7igv9rq6?=
 =?us-ascii?Q?zOCsrtZKIsyUTyKZJUXZJyvAIFVEY4+iXsFLRQgON64AlUMyq+Kkw4JBjFO5?=
 =?us-ascii?Q?MInkSfe6VIODLQ4LqVd34iakRYB4qhfnQorDuuUX1U1DCufzQqqeoZJWA3HE?=
 =?us-ascii?Q?YVmiIkiEpN1t6hAsChgABiPqVIYvo1KGwAukPkPBziUBCrueA5lYEAwTj+Fj?=
 =?us-ascii?Q?PwhFiIN0umJg0+gohnFNcuFXRYCIoUMPuGH3ze3lrvwRkOgaNoGA8UnsW/eD?=
 =?us-ascii?Q?WpkBwgVLm2o0BQNyOYMV0/9Iy4/NWl7KZHZkH0ZwsPL9PdkXWCc5O41kghwO?=
 =?us-ascii?Q?blGJvLDZ2qnrp0DKebgkSxmYsnCk9gPXg5Zfq0LIP0w7nhkuzHNHzb6OhLw8?=
 =?us-ascii?Q?9cngZgg6/tdTPNBc5fragtTQW5bjn7Woe0GEQRfTBhZmYSWqfbuf4P35Ii4o?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae994da-476b-4081-4efc-08db34e30394
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:02.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXzxUPOuNU72LHC5YLW3kPBGRuNESpXdyhjr2HY4Y2wYj4RbWJSgFrvBWxIx10HAE4poe4rtnxSq013rR6SXQ/jtvKlf9Kbnh7OhaobTM6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

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

