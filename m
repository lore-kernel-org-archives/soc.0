Return-Path: <SRS0=Fe94=73=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F268C761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07A73C4339E; Tue,  4 Apr 2023 08:03:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57D42C4339B;
	Tue,  4 Apr 2023 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57D42C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QW/KZ6ThRwE/Q2HNIzzhLdyePiOAB+5r3P6oWhit79Mm6G32jznf5XnMYAaLXvH2DA1mB53D25FPITTa3LLCMKp5uPVYFVHTlZKApZoaHqWu8OSK4UMpz6+ilOC4qIo8jr7yrlf+bIS77dAdvTl7Q9kF2z8Jk/qXh6qaXMZevW/cFcPPJ85lSH+iz5Fh3iFqXmTqOnV9MWGZ7PWQx5aVpEJcGEB1385KjH7SdAOUwflRmP+tKMj1t/Gb70iBGV/C4XPKWoVMhPm7rMFV/GCMUDoZTmg3HTZpeepoWNKRd/nr4Qf4aDvtI9yXkHv69HTMC5y6qTs/sDbkiIgMzBZRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ9BUCnfSzBhq6I4HQ/rcBqIC0znM9hZNOmiV8GeomE=;
 b=Gpm2pe6dJEVOTc1xvOWG15+Pdqa1tnt755V8VYyNZowL0f1zyQTKqs11kNbjs34tbZr+6nkwZEfqPpoGa9OzhW1e01zE7kZoz2071hosDl1oHp+WkK6DU5oWyaZCdxv9MpsvMGc1Yg57ziVILwPDXCEqaefpAnfXylqA3rQyNlYtdIHAGmeUP+FDnn/ViYHhH5VbGl0rJ09zuxP+iNA8Qpxobsr19YAzk/xaGPBCeE7UoDYvwnTS69K7dyR7KY05TcmABpe7M5O11gASkuwlzluSSeah1GZvLpNjh5HQ0uDBGWoWgLwoAQyZVgZnAPHYbqtTupnXJCSoUGwlNSaWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ9BUCnfSzBhq6I4HQ/rcBqIC0znM9hZNOmiV8GeomE=;
 b=MkGLYuZMM0Im8M0v+u4CqH+Dom1FYulpku3/NQ5Y4i1BZMcg6uTCgc0dcici8F+xIpgsv37DaMCFmYGs3g6dgidSMoiw/Ndkdjo3Q18fZL8rPGuJmXshmpFeDe0yFphkG9E8Wzyy4/4z8gjJYjfS4CbLvMEK2Tk/B74UzEaA7Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28; Tue, 4 Apr
 2023 08:03:03 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.026; Tue, 4 Apr 2023
 08:03:03 +0000
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
Subject: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W bridges
Date: Tue,  4 Apr 2023 10:02:39 +0200
Message-Id: <20230404080243.9613-3-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: fcf57ba8-c988-49a3-7bf3-08db34e3042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XL2QyJX6GtaCuB6AEBSyQcP9jAe2gsOJD4QJcVGDx0XXyB8NbLW+SGTKyGomQ2jAl7IVme/jOfKy7o9wVqJ3NPBkiM+w2ax4RleCBmmW7xmc9e0rcTzK/UdBBZZZ8vvBZD/cepyp2kr37lWBAcCCNmk5ARrU4zkAQDp5pjl9K7mt0QtBBUQXTM3onKq8NFuiRRmHu+5O13as0wKgLH7w/MSf+gangr9zSEFEhVONnVwpJZDY8m9j7jrRL6MMLIVmpmhjmDx3N5BAhhHJydb6JB+r9vAaSqYLFKeztBDCTsxAJUwIpMwyYSgK3mrhtowU43yrc3swgJJjQWBk/QG0NfzUjKT6MDQgQrrJ0TtI2smNmINlM1581PQwbkDdPtl72x9/GJyyiEzci1gpMY6cupZ5AFM3Y+QYk7VZ1W+8jsMhMev/bmTFuma24qg6Hy8fNwW6+K9utBH9jKoGEKkpyZUBzaR/ocBOEXGy4tdls8oEV659frmgAxJyjNierFMhVxY/oP0mMfUQvVX5kK0QuPs9wSgCvWMCuZGSz4L1S835NNFavikdmMxielseLzAWjpTgmxpt0uanhDVzRzhHxqsgIJC63YikX9GB+uTwR8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(451199021)(110136005)(66476007)(66556008)(66946007)(4326008)(86362001)(41300700001)(6666004)(316002)(6486002)(478600001)(52116002)(7416002)(8936002)(8676002)(38350700002)(38100700002)(5660300002)(44832011)(966005)(2906002)(107886003)(2616005)(1076003)(186003)(6512007)(36756003)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vo7HxohB768zfVIuxHNrM5484cuIKz7WOtKBLQTOtOl5J5Xw1gFigaF19u3x?=
 =?us-ascii?Q?bDKwDm37aA4U5zVphTXWMNPPWKvn91PcqjUsI7WodUP5xBYE3bRJwPqktRL7?=
 =?us-ascii?Q?aacSQJ0x34u5VDM7AVCvH163JqMyPK21ca4I4E/RZ2WJt7ZY54jZdnIYzSpJ?=
 =?us-ascii?Q?SpYkBcuvXDWRLycEdLXqI3YltjFX56y2KXelwy6NPYpoZz+uNLBemMwBpvq2?=
 =?us-ascii?Q?ZHBRZ3j+3Q6jLz9ZtFAqY7CbFWLKy0sFdU/UoTQNAUBIUZKKzDIFf09TmR5a?=
 =?us-ascii?Q?CvzxaxUgYin9vKrWGcF11YMOyhZtIGVP4XnFL+c6C8ynad+vtOmnRrmjp1Zm?=
 =?us-ascii?Q?lpQb+GigGNdt/0sE45wsWZEkYbq8i4tR69Ao5siAonfUEH6iEXtkL7GnjKzv?=
 =?us-ascii?Q?BVa37f2OIcLNhn2OT/tT93CnTYmYXMlIfx5iCzpQMANB+xQ85lw4cIzmv4Ou?=
 =?us-ascii?Q?QiVdSXfBEuLnsoPu/mqkJusim6xSWEopUa7taL3bHGqySKuNieuAOIFLICHM?=
 =?us-ascii?Q?7usEfoXiIAWJY8qLKS7XtH7d69tcasB7roJ6jLs6ntlUHyiH1O+9w9xl76Jz?=
 =?us-ascii?Q?Omws3qHrkQwGg4+x1c937q9y5L+eTG+xUecJEA4pyhmqghsqOMP2k9e0IyG3?=
 =?us-ascii?Q?Vq1dixhorhqGNdpR2/T9lDtowd1/hjg0mYZVoD5a2LJdIP/FTd+E/zHOz+7X?=
 =?us-ascii?Q?iUnEawFI2x/ACdUrdM24Td/mscGeN+lqsutif7LerVSnALGIdK/mRm1QrBl5?=
 =?us-ascii?Q?ioSIBmVLO0TrPXuzhUzmQZokXNV5qXmtF7QMd2jNFuzO5he+vp9u/xw/X1WX?=
 =?us-ascii?Q?kIayZivDcCD2ea5rVxv9mopNwIg3lSe6eqrTN4b+M8gKVDbFAI73Vj1gdOs3?=
 =?us-ascii?Q?uAjQsWYm6E9bKPZpQsL/wDEeAj4ikBYMk5vYYjQfJzZ9YFdqswNML7TPh9wZ?=
 =?us-ascii?Q?RrPQwje2/tz5+ziVRixGf6Oo7q+eIKcqcd0js0/DcHlgWXUb7aW5SjoRH5nS?=
 =?us-ascii?Q?E6h4DHQAjuqCoklRtUbX2KTVV+vVzXUYQep3hxZvpWFw53prisiry3O0Oqse?=
 =?us-ascii?Q?e5HEOcaVd3I7ZberWvjlcIrMkmk2QkSBNN7Unae1v5WPzuamDg5LNbqJUuOG?=
 =?us-ascii?Q?ZBDgFN3zMnNn/7j116j6DgsK7hD3odvdYS0mWI7vaK+RDtccjb1LeHkX0Y2j?=
 =?us-ascii?Q?SCv7NwNmQxFxFiUDySzBoKhaOen2N2USp23GZi42I4GRGctRLYDZrWPZyctR?=
 =?us-ascii?Q?biLTK46lpeudqMZY0ARJ0bYM3XtlWpdPBdfbx7DzrLOQFUdArZJ55mrcZKbr?=
 =?us-ascii?Q?5MgQLBrALtN+eARypCgqIuhJtgzY+dI9/iE7MVvktii5fj7ZVubg8YjBEweE?=
 =?us-ascii?Q?rN9QEzQYAFOzFNI12kAQvmo4QoHwyXOhraa1GNAKKKmACUKnPK2XeBdJ/byZ?=
 =?us-ascii?Q?J87uGu/7MmcevET4VH3Y7yF5Gae0xFbrEMVq5c8vTaCwj/csPXu0LNI7Mzmn?=
 =?us-ascii?Q?jmr8RicQ+MucfovKnQUEiUnH9gpia6R5P3SmpJvxUYZIZy5YsoBFocunPS/s?=
 =?us-ascii?Q?y7PmD4klz5i3U0j+B/8/5tkJP01EGfgtbFbChWuVpzsoNUonZLLvnoDvkT61?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf57ba8-c988-49a3-7bf3-08db34e3042a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:03:03.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6eXqY3Ff8uHBx1x3FV7UeyUJ4K0Jg8xHqj+wLUMluTM16JN8bCbQMnH4FXV8S9GreA5rdS6z4g52xkTh7QoUBzRUufxvnJVsRo/mXI5it0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039

This adds a dedicated devicetree binding for the Maxim DS2482/DS2484
I2C to 1-W bridges, which can be extended later for further features
(e.g. sleep mode control GPIO). Since one wire is a bus, child nodes
needs to be allowed here.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
---
 .../devicetree/bindings/w1/maxim,ds2482.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml

diff --git a/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
new file mode 100644
index 000000000000..422becc6e1fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/w1/maxim,ds2482.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim One wire bus master controller
+
+maintainers:
+  - Stefan Wahren <stefan.wahren@chargebyte.com>
+
+description: |
+  I2C to 1-wire bridges
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ds2482-100.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/DS2482-800.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/DS2484.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,ds2482
+      - maxim,ds2484
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      onewire@18 {
+        compatible = "maxim,ds2484";
+        reg = <0x18>;
+      };
+    };
-- 
2.17.1

