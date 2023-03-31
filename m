Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACE7C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E9BDC433EF; Fri, 31 Mar 2023 09:58:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53E6DC4339B;
	Fri, 31 Mar 2023 09:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53E6DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm/8IYnMX4AHF9eghEDT6vGpIHTQWsoojRUl5kxPaPlbFCWJZoTszZRqVJV+fsFYfxByPf40OYMZQXx9eYvtkG7dQBw0HpQeMjdDLrGx7bnfB/hCN3+Yu4XhBVXHvRifsw16fdB8bLypn2yzW16y47RvdJTuu2B5NFRDI0/cE1mPTwLbFM71tuMnFAHG1ac0t9bJH0cIObo3hyEEbCpGPK3L7i42ck5z1oCjTTFZyk2bf1HRARBYSiVCxaXq1HQ4tnYchA1oQTxzOmXzKY22K013rhJ331aZ+j84nEvnrup5i3RD7TQakRb7POERuIAGETin+isykiYlhvTCjVUbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtjZ184xP4sUDld4v5sEvavh+sm1SVUsnjrJB7OS2Kw=;
 b=kBkH2sfFv/Lr55UF8w9JFan2/cpdndn3r8pFHyh7qKIXRVuHobs/hkVL2oG3BYfmgufQRPAzpCEfIpViY0I59nFXJrzqE6b6fmXaBNA33BiAnfQT09bRhk1y5Jhv65jF8qKb9WfWqY+/GlycfdMB9yJFp7rlJpnKUFOkmYiWTF3E1DEKCoq1HLFf0uhsUwaUyePLYPn9/yHc0owDPaQVzYV8DT03oOW/nfu1QAj6aj3/GRkFxRzaN6fBHUlnbYutMzclU5iENephQV0vjEgTu/KzwhTR516c/jAei+R9IxvFBaR7KTbLRRPdkwdYxdDyx6I+/4kvXihn1qLX8CpDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtjZ184xP4sUDld4v5sEvavh+sm1SVUsnjrJB7OS2Kw=;
 b=ZXBBQaAMW+zE0Mn99Gci86VPLPmptfY3uLsKa0N+/jj8CPvh8cbjWMgjCyrLUdMH0ZYcP4lpU2/npT7MuozXStqtpc9sSUBkIGe0uleXUKbk9t0OV+q+13PohZqlYsB3e3FJpfvzDXhHZOHt5W2xozmiMR9Epc1MTjjdxO5745Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM0PR10MB3539.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:152::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.14; Fri, 31 Mar
 2023 09:58:15 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 09:58:14 +0000
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
	Stefan Wahren <stefan.wahren@chargebyte.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH V3 2/6] dt-bindings: Add DS2482/DS2484 as trivial device
Date: Fri, 31 Mar 2023 11:57:11 +0200
Message-Id: <20230331095715.5988-3-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bfbb00b-c548-4b71-4015-08db31ce71e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+nU8HoB2Fo35GajZ7KaFa1l8/6kZDvJZMQVrAeWOXi/Dqo/2v7F8hCZRpa0eBIS52MeohdexRdIQ0/4uLivNMAh7xIwbNobpDJNS9ueTvVkxLQg69D+YVqfnRc+zePaSM6oDNqtsm2gSL5eLmis3rPLRZCpzLj7ljNCateBettUgNAeZZrMAF30EdwhfsMYOQKimvVqFZFT4f39GyRLV12M0FJvyaf1iAqGgSFEclP/Gcthk2BUyAHAclc+LHhmQiY40MvT2AeQkdIwu6zXIFFXaqLjAjOF9IxphKpUgx1DA9LvyKLAq9/bDHoKuqdnGvvK4McMrP1qG2ThOH/f3OoTpc7FWmMdvou06GtEQWB9IOyLKCT91Bo4NHXFpzUPDAseRUYElAem0z+ncraveA/wL4X75LeSpRR9jEdC4DCXiypLM9BjkPeSz5qGs/kHBnjWoxyOhTyi/XTUAFwHNHCufHzhcf8oC+dq0MHLVwXK7WZ+iXHZMykT37V4mtoX5D+H8pnrpAWX0vf+OBkfZigFCS0yikjNHoa99a85hBspouljCAjVntWXP1GsxQ35MHqNtKHCbVxkPbOrfgn1/EiTDZAWqDg6K+Uu3VrxjsXofVzZCFSMhJXIoTZyImBm1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(6666004)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(4744005)(7416002)(36756003)(44832011)(478600001)(66556008)(54906003)(110136005)(316002)(66946007)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pHITxOipB6cZ4qE7jZ80Df7532kS5vfqvzSMFNGk6/mhTrenZzXlKakwN90M?=
 =?us-ascii?Q?sv0WUuAnbKYZ/8teWJEncTi8ITpkLT6R40eY7zgW1HHwzHuzRTaoRR6eQWr1?=
 =?us-ascii?Q?BlRLBIeIBWIrJFI38WAW3JzXdfqClzWgmcefSBRw/IZHztk1D9cpHc46dV9I?=
 =?us-ascii?Q?XyDXyrezJrC+aarqbhKMFwypJ4vGZw51Y5i2oLFHfFqKzZc/xWKY1QYxX2cv?=
 =?us-ascii?Q?RWaVA6mL3TJSg+Bm5youxd0DEkuQ2Vqmbmp9qeiVtuhg3Hy+HoD0p7uAZin1?=
 =?us-ascii?Q?FYvWPg/SHHUrD6hcukGmGEn6NTQ5TuF+S3v8ODc/g0gDlCtL9GuOi0KjDsWy?=
 =?us-ascii?Q?pUvmQvGrOHtgdSt0SN8zs+I4z1yEk6VFtpdX0eMfjN0K4shpdi6vRRxbXZqL?=
 =?us-ascii?Q?bbQfbJoph03zwHuCeDef8InP62owOAXdu/kLByHfbNEWFbTNqpgl/s+VrvW3?=
 =?us-ascii?Q?72YNucTgqq7A/ODYXqS3MHVqbxlLSaLqNCJeWcJAidmLCiavKc3KUJeT38Ys?=
 =?us-ascii?Q?BIwFRzKtlApconHWu49trrWo0F2pOdwshfAXvk7daW8jff64nNKa/WHGkKjv?=
 =?us-ascii?Q?w7dMhotb6juJuyYCe5nZOM12AI9V+SBAz2PaSJtcjA4y4pJms/zmRDq2xlAV?=
 =?us-ascii?Q?lsUkWjRFN7t7RkBvlKND6QWXpT0wk9AW1HDlzqw3ZwrfkDzrPg+8pLeYL6NR?=
 =?us-ascii?Q?8shIVSceg1zcCAHEY1vH79Yp1Lf8ccELGj9LLZUky4kf7oo4rb+9Ytf5QjuX?=
 =?us-ascii?Q?HMn/2sm3tzCswsB3T2N1DgrhVBy9xR5xvEf2q8eM0H6ZI7fg/pvKEBBXxCMF?=
 =?us-ascii?Q?rILJE9W+718owhpAiQogvSKFOd9NDp456KzduxKy/zNLLYsS+OGg83YqfzHS?=
 =?us-ascii?Q?PoKlOVHT2uO8nGH5OIdeuC5b6gLq4JZXO1ZQsivnIuJpdE7uuh74TpkEMLD2?=
 =?us-ascii?Q?Ep8Z3bQnPYQAfSXGtZ7tr76DrowL9JPgwb/8L/QUvQLYrBbSjyN+Eqjc9Bu/?=
 =?us-ascii?Q?+0LMaq1n+Uf46eY0kz8Ik4L1XjU2Fz+jNIknzeUBjlte1eB3DG0kTpql6f1G?=
 =?us-ascii?Q?BLNKrShvH/fhyqx4HUurKsUCbOoRFsPv5Zwv4qa06zIHTNPoVgI1Ra/AaTQe?=
 =?us-ascii?Q?S7Rk5j5BLpJTollzFn0TskQxO3+R1xxwmBIuZbR2U7cVtz2hx/tkgTBOlEcl?=
 =?us-ascii?Q?/KK0SVEg2jpTQWwlcDNWEasXly42NjP/iZrAP0pTJIRTN2a4Fi8LDDu8q6Gg?=
 =?us-ascii?Q?is64mfNfWcVBqox6tN50MchmEXCgFp1LqxyzvmO1naY15W1b6OZshSx66Nmr?=
 =?us-ascii?Q?cBHj+SlD/wf2kDe+XEureUPQ0IC0yGMLRjMLhFF17grVlQyaBYcEGulj8P0s?=
 =?us-ascii?Q?iAzFF4lmFhEom+1CDJoDdy+oj9tNzf7P9/avZgY/oivFNh1PN95ZHUGwDm2I?=
 =?us-ascii?Q?Qi9+g/TMgx71YtgGZ62Z8Z2XjECitBnbr5VJrBRShAJjixveQK3axiGMA93g?=
 =?us-ascii?Q?BGidUbMg6LtimKVxtstiQuzolvtIe6/KowmrKLcwj+bsAdBrO597giuwWcbJ?=
 =?us-ascii?Q?IRkjYCTdzkDGeU6jwhXR0oWvcNyfBi6bjaJ+s9WgsXX/dJQMenvFOpZoL4ZX?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfbb00b-c548-4b71-4015-08db31ce71e8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:14.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQihRUIg7//Kx07P05l5SgQoIgqOZvSaXtnLSIkE5A6RKS3V++SOLlRADzVwwnzeNduVaDcmevuTpaN/3rfv7Lvhuy+pUAU+aAZpA6lw1jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

Both chips are I2C to 1-wire bridges.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6f482a254a1d..9b7b24989359 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -183,6 +183,10 @@ properties:
           - maxim,ds1803-050
             # 100 kOhm digital potentiometer with I2C interface
           - maxim,ds1803-100
+            # I2C to 1-wire bridge
+          - maxim,ds2482
+            # I2C to 1-wire bridge
+          - maxim,ds2484
             # 10 kOhm digital potentiometer with I2C interface
           - maxim,ds3502
             # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
-- 
2.17.1

