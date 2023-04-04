Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A37C77B6E
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECDCBC4339B; Tue,  4 Apr 2023 08:03:15 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2066.outbound.protection.outlook.com [40.107.241.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B031C433D2;
	Tue,  4 Apr 2023 08:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B031C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ7PJ6RMcSoUOjZ8tCPJHk+CEN4cD20rrgZEBTV7z7oCz4ryQRSWi2X72h2SDjXvcYIJRwBBxMJ/axbgV2n0le5wDqdZ0BPy6LN+bg9sn1dM2hosb1iCQPBrhO7jBtxWoLfLstNa3aLgfKCfURzVW0T4Ut1zu1EkPAuKMPJdAenrCTze73GPZRNtnDgK+Fmq/bT90tgPy3HQ0+oO45Aq7ZrXYWvwMJiYUntkzEd/IxTI88nQnSWgqEUlXgSNYNbjXrSFyJw3tHMWwHZO/FDs3amt8T3Cw90o3uKuTIkz7Q7FQrvkP0cXFJrfR3l1fG+iPAuwi2kB7WYX2EuaV4Hbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YgYLCnCYJCt9EVXBhXgf4saAmKVNjDSebmMwXDAGOQ=;
 b=FboS1YCky7Y30vUH2uwuQdvAA145g7QYjRDVsyi7BkpZvduonpu43zXO/XTXIupioqRyhMabk7pTSOschCvhcUakPb33wJtXr+zlK4JvONGK3xC79f27L3jEH/LOZbBZlqZfJVQtVYl90OJmx4K0e3iB+RyE4ogR+RKzVzE+p1br9TGZRfliuedFljSs2/hD/RXmIlhows10A63QcEyJTB+5PYJamwu8sz/jW8i1ruMToOa5JBBZqrcj4EzBP+tE652/Ln3dsQkz3G8BfFLdS+09KNb/te1ejS4joT7EI2z6oXyoKEE9ymJZqviwT6ZQGg424oszxBnBK2hBt74HBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YgYLCnCYJCt9EVXBhXgf4saAmKVNjDSebmMwXDAGOQ=;
 b=nYPlZ3VKdtjGBFwSDAItLZHs4dlOf1EWnEeN2NI1KX1udiCRc9SEVlyLEk4KVWfg6NXskeoW+aLzAa+VTWTMkr4n8bFOodq0svE/MfeXrNtpEASJ6hR/HGMF9zMC0yw0fwQdhuOEeWLtnuixHCrO/E+OhpwnBY7pEFkFN5jrzOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 08:03:05 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.026; Tue, 4 Apr 2023
 08:03:05 +0000
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
Subject: [PATCH V5 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Date: Tue,  4 Apr 2023 10:02:41 +0200
Message-Id: <20230404080243.9613-5-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: af25db84-fda7-4a9b-6e9b-08db34e3051b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9G9ts7CXpLi0nXwhvfykuIFrQWlZRrgVmRzi7pL+A6dwYcdNiBK2/RdCh9cuoE1pzDZMxetalNHpjYaDZxLXvxbddHMlYZDeixzVem+YoVzpar1Tm0D9zSl67dCXUENnpOukSDRd/oB+5P3bEr9CUNbhTLeJx12CNmPq4xL36SQ1bRBKhQZ9fKbzGTse2mYXoHh/+OW495WFzoRA5c+SirsSlCrB2dTB1P9c/a4TpE30HeL2umKkQmXcPXqwe5TlCV7BuWyFpkGYb+Z7igqy5FbgROl3ESYzK3bcLJDcArxtOJDn99FWrMbmMtL4NjalvNApJY6wKIdqCUMkd5vqduoH70C5FM3Ll0BluganXaaGRPGYiOL+rzHvRQ6nuP0ayBCCcKYABduBVgJznrc0vVe5/h4Pqny4CGNVpxg+nSzEFhHyUvK6AzVH/i67TuS8RKBs3VDozqBJdmFhVkZ1DCCXAB9pAFs+mgaoT0Cfr/3Q1P/G63NLpwQqhFBSA2yx+rf5FzfxtWr8rDu6W4bJ1ICo8pU8XclUCN0flZ3SS2UVAt+a5EI71jJ/YFJKzmFKT6urUJZZjnf9neboINfCF3ndmb8/09PcQCdP4OxGCqUPE5FKXw0tSJTCi5nn3PIX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(4744005)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7LhoagHnDpu2LEpSQpmAL6LWKQF/yyDjQSb+bDqDec/cE5q2247FAPv2MZ1+?=
 =?us-ascii?Q?/JuoT1mpb+vuWlAUVKovCoIqPFfuZHDmZwKSyWzbXAumm+L1x340EMeoMkxC?=
 =?us-ascii?Q?tMV5ntioA4qEUJIkbu7f3nL3cEV3k3FoSV8HlbapxhHvkdMaX6iwVERbd/xx?=
 =?us-ascii?Q?DhZ6/BmaNjWXjPYYjulAdvp0vkQPdM7KvXZDHRo0TdJiRO88CMCQMJ2ew/Rc?=
 =?us-ascii?Q?1vC0jKaUvABFWVZXY3M/zsAuMdoFc2j+HX5w2DWa6/NpopHjyzjUAHONBne2?=
 =?us-ascii?Q?G2Bzap3e9NVaLcSAWsKTUxclY0fqQKvAhl4OJb8Txh/p/1o9w4We+oW8cHmm?=
 =?us-ascii?Q?/7Mvyx8+tOQldOoRmly7+vYPCZm0ONlB31Hh+THD/wDH/sgHfluE6TKVrMCs?=
 =?us-ascii?Q?r5FuUqJijqBGChOxf7ig4DJECz+H/QjO2UWfkkSxYY9caFFg4gvVcO3PdJQ5?=
 =?us-ascii?Q?+E0WJlijKjqts6y6Fb0r3UjrwPOpDVf3vXkLkkhWoKu3OOYgQSm2QB1ryxt5?=
 =?us-ascii?Q?grMbH7AhTP62kxOMJSYwHIddzepnQTym/wYnZpNddw+Iq1Mogb+Gx+pe8DzG?=
 =?us-ascii?Q?Ev+J+HVms+JwLBfFrgrKYHYVdrczWbhgqztooZITR7Akuk0WIQadFP6Fyh0h?=
 =?us-ascii?Q?bXB6OSEetxDrHGydPccvYTbgaOonM7/NLxt/Q2G6Id7EKNM4Df3FJmyPjI5X?=
 =?us-ascii?Q?bGW1sBWifXFagSObBjrOJ7Vz5OLFIY6n5097BTAvypN4ct8Sh1zNBhxJfC8V?=
 =?us-ascii?Q?SR+TlWNCO5RXaDYhksO+qvGsoKsDUg66Sv8mcKucAqMJtbY6bTZ2VjKSj5VO?=
 =?us-ascii?Q?EeSChIqKPsR6MvlVwZeAz/FiMFGhCP59G8+Zc780lkNYdiMTNrB3c5+2+zlX?=
 =?us-ascii?Q?zP7JmMVBS+J3CvfVocF734myzY3IZZFXpFnkX69g1sR6CNcB9KVQjSvU4uCG?=
 =?us-ascii?Q?i+ElfSokAyNp0chpw3FbDoS/MUFynDg9G4PzAkPIoyaMQlwKt94JScA169zP?=
 =?us-ascii?Q?0bPhiOFuoQ+e/ax0sK86BxZgboMghqWQ9NWcA60QdJ44Mjz+LylJqr2hIqEI?=
 =?us-ascii?Q?ao3LjOaKpRlNFPBN1VCdxjZEV5BkrTI/qL0ZloPLcDCyIyuVnVJ34q5+mXqk?=
 =?us-ascii?Q?WiMo3AUEy+IPEhGipGv/rsI8eLly45yl8aZduSqRkzXA/1R24zax/eBJag/o?=
 =?us-ascii?Q?KhMwrlE5afWkmm8gUV6VdIz9iDZTongyfE72LwGyMxOOkshfZJt0QUYSQB9B?=
 =?us-ascii?Q?E04sM4aQYHmZUSuOLyM00D4WNMBRkqH8aice+6uUaER3E/ItwF7k2rIfHh4r?=
 =?us-ascii?Q?AUxV74vWBUbr3/CMVWP8dIodvBsROMm2zs879H4adm4G4Jg2HUvg4JdoEmwl?=
 =?us-ascii?Q?ow6I66dhPrdxbl/2geLENx0Rt+rTAU2WTtfIHN03DUEnEz66n3fy8OsjUxtt?=
 =?us-ascii?Q?4LpsCfMqCNfeUEGugFhEAgpgnwSIUDKeNUdjJt6Bhlmsd4RZQvdxEhkWfgwN?=
 =?us-ascii?Q?Ssb2VYUVPhxYvwoYq42YriInYr8ElGl8E8uz4CITnx5cI7JwYfNab8DPcn7I?=
 =?us-ascii?Q?DwlzWLl7PMljNBNQ1vEBkGFoHVQ5XluzKayb5K+oHycePg4pdU0eYsu3tYgZ?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af25db84-fda7-4a9b-6e9b-08db34e3051b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:05.2313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CJhOZqd2xnCfsHKSupWdHcnUGMbpyggooIOckV35cV8FcWcOzi+w9dEMcF2XOAjipOhXH9jpznAVm3UdKs0r/kbB6S2aIm72JGxK66uR2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

This adds the compatibles for the chargebyte Tarragon boards.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b175f2b1bd30..7fac7f834814 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -707,6 +707,15 @@ properties:
           - const: armadeus,imx6ull-opos6ul     # OPOS6UL (i.MX6ULL) SoM
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL chargebyte Tarragon Boards
+        items:
+          - enum:
+              - chargebyte,imx6ull-tarragon-master
+              - chargebyte,imx6ull-tarragon-micro
+              - chargebyte,imx6ull-tarragon-slave
+              - chargebyte,imx6ull-tarragon-slavext
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL DHCOM SoM based Boards
         items:
           - enum:
-- 
2.17.1

