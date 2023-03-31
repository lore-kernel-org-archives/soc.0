Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3589C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8622C4339B; Fri, 31 Mar 2023 21:09:08 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2070.outbound.protection.outlook.com [40.107.14.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA44BC433EF;
	Fri, 31 Mar 2023 21:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA44BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOBLHTCsQkKQQxCmTPc39KXlAxyJR1POAxOXGWn+gfzhxvvNHnfXmMJQVsdm2s/Gq75zUKVhTFBfWTacyDC/zKSpVNmmF0gniDf5sld1p1+YGx2DjILnlbMrFhD4xw5HPoaFqt0OGpxyOmXaFm4FshdXANrbPEOZEGU2qhW88CUwE3qLASu8VpNeFuiCjVITMC4mtFHPTLkT1ZgekM5ANV23ZMYnw5xNe6WcLHK6nE5r3fFQxmRepn9kEHk/R38whwUxSgg891mXRvLxL8OxZlmLs1SVrM9mE1Dsx0NBfKwWrCqjQCalCqEjc5OjT9M2itO1lLPUrKU0TsuuLzyGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQnlY7hPEDkBSJ0FD0vOuiXFI0Z36nSBP6i3FHtgzJA=;
 b=C+9fsHnqQH8LbjO26UsaOBXi3Rgk4kK9XtR63GCOzmcNwij8tW5/nYcZVKSAgtMep7GUTbtdbeZ5BLktzH/yfGmzAb5HqV77oi+vG1N4I+NgLXbsmHDkGnHLV86N5h3QIdKHaQV/kWNTy9DyHRoOHRN8jhkBAKQEtf7Z/2jZmnDZzT7ECZvbkJPlARLqLjPKzI/Q9xEr/eErrU5B7MwfDAlHsMUiRfiZTlCHnu2MT56Gf2ulR3R+od3yHYaNnC4AwJUNCRNHbRSDHCrkBs5nv1L6e8VAe+1cdrgkRM9CTHEWo4w7xVS8kjmw5WqvEv32rOP6IOvIBa8zI9faroprqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQnlY7hPEDkBSJ0FD0vOuiXFI0Z36nSBP6i3FHtgzJA=;
 b=sVJLZIWJfM+3ZsV32THgx3k2RG9e7JBFwBs5gvJflHrJuK35plbUU5/Y5ofOQBlt6hE2hLpRxsWiXAIWcyWRDSEdRD242SoYJTOsPEEbZUSTN5Bdj/Ic2E2GTnbJ+0eLZTwVGq2ES0C5kY98JrhC5JmGuf5+UAFbe1zsqkgo7KU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:08:58 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:08:58 +0000
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
Subject: [PATCH V4 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W bridges
Date: Fri, 31 Mar 2023 23:08:36 +0200
Message-Id: <20230331210840.4061-3-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: f3026e41-71bb-4dc5-f2d5-08db322c24d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23KudUgH2MXGz/k4KW+BpaH7wjUD4DuNSG5MlsFZUjp4Rm+ZzNwrMtT9ZI9+EInZ9JjVRWqGFnIymTHycBE6omnxG5eS9AUoCRXEPeMsPShK97+R7x9BxXy3RNgAzosgApHoPPuBcT7oRhOjcIxZJ6rgzB9/39+Hf0/uwTjx3Y2XvdzSNKVG3vavhR/CbQBOuS/s/UQNsPHyrVWI0Qj4AVg90I7Sa5P1dUGg+yQ3UGobDYrXbt5ldRxw10OXMl/Hsa8diQHDZfxGyLJXBuzjz8n8k1R/BKjV442zx5MN8fn69x28QqGN5hEgLBWARlOi7QmPb/POVsGTd35ezYW6g4Y4W1dsLW1lywMC7nsCREyFQiMgKXhri0gTBY2k+f/7JHhPjYRa4R1VP4/VittXaX+tBUJlTWRoSp7p2gDlgMguaVTUlWRBOOkek0F+Ephxz84+moBTqCLemNxwqSTSgbHYG4JJxa2UVPlTdhw5NgpeJT5DJUI6R9B19JRt6UIhMSYZ99lY79StdGRp5/ftxp0+dwEbs1JLJ/krq4AWOw2uIUsG2H+8itUtZEf2kYJqDNJhI9Wmi3wSl9uSnkQaLKtZxxWJQ+KzCIlwT7G7hJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(966005)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?taVBMrD8ZVI6bKIOJ03UnH9V+PivUcUmvKit2M/65fvIBCF2wkTJviJDpyKu?=
 =?us-ascii?Q?5pHKFdVStOxLO95gJK4RMlvwZZ8Mai/cDT2wqMF+YEy465bRBjlNjrcC0bUs?=
 =?us-ascii?Q?VitClpsK4y1sEd1oOfJDYfz2dwLOStAcFAJh0IXMjIpyhW53eZDcfCSM4uBU?=
 =?us-ascii?Q?+GJQ3519uFuHi25SAb98UZKyE6p//6ZuDEfieVpNaucd+UCxSi5+jxvLA6IQ?=
 =?us-ascii?Q?KrZ0Rn5KCiBHTS/yEnjwNvYsQpp040uBvoGBapvnHjX3QefUl+xeFdE8io7v?=
 =?us-ascii?Q?IgXxjF+ZgGUHDAwC0BVaeAHR6r2ffdW9/WrW9XqB1hw5eyLglQnyAuadMEQP?=
 =?us-ascii?Q?tRIdlUWGEXAi7fFHP32gbuw1+pHhiAEehff/ID95zLem8E0eDdPDKMWEVslE?=
 =?us-ascii?Q?FBa7BieANjMnSoBVi3QsLzAE6kTnfiwiRND9/HekTj6vemkRfXfTXUohTVcp?=
 =?us-ascii?Q?OZSXbkVvnsaLOHiJRLt8SlpcMOQ9oATjz7ocYhgdF/f9RybRL6VSghOfFthD?=
 =?us-ascii?Q?7tFAwwe9jHyqP8uyEuffFWysJGXLO3BJUKB8HkOeR6QdFlPbcDfCbIj6KESj?=
 =?us-ascii?Q?BuMUvtfMtnaRemPC04rLmnKdAQN/SivTtjOOOV1GF75Hs2e6qdnd3prcYYOu?=
 =?us-ascii?Q?7SV3OJOeth2LgyPEiqRKyxHSsO9cWkkMyVNjWs9b0BndiIRGw+x/Q/XQaEc1?=
 =?us-ascii?Q?7oPTbsaUej2jo5ldpssvc4+6Wk0cQv393CVe6H2kmzL0VP/CM/txyIOngciw?=
 =?us-ascii?Q?Gj4dQbT3zs21FivH5DkdgAdz3QLuMapAyXNL/SD6tC6ur4QeGuz+OL010ufn?=
 =?us-ascii?Q?+awY7T50ASwU8rkqtjli9K1n+8GTKpMKM0TVQ+wi8UKEiST1ojdNGjn4W9vb?=
 =?us-ascii?Q?ivAbQB69cDsP87VW7lUKqWiZrfeVAYTzqRD7NO0uh3UHMpq0Nbf0Gb2a5645?=
 =?us-ascii?Q?HMNlV43nhKsY6nP/iqjrIJuXDLcto9I8X8TZowtchdS2XL6AcFr7Ajs9+Y4K?=
 =?us-ascii?Q?nCS+kaiDrKpDUkWimeW0bzi8JU/IICnFbOQg3KbM+25ejDINkQmQgcMHynKt?=
 =?us-ascii?Q?AFrSsQshhIGwgKQ920huM7c6xl73SUDBYJ5XWZ+l3DT9O1C7m4ldtccsEdCv?=
 =?us-ascii?Q?05/9IsE8+8yG+7/sbNA17l3xNBNzjBRBp5lAi+2e9fXuChxxb97ux0rMEzXW?=
 =?us-ascii?Q?s/++rn5bcvt4KiQyLDQJi5E+4DtTUlNsbkBdlIq5pD5lOW7PzcJrHHU9MV2D?=
 =?us-ascii?Q?oaZfz/CQQSI6gz6FE7sJG1kWJKwOJQ0du7VqKE1UFTI3RLXXQ7fVpoXC22gM?=
 =?us-ascii?Q?59tbiepjJpA+wvXLYzQjsghJsLR06JCR+z1PvBB2azgo1a9kh764UmEaal5O?=
 =?us-ascii?Q?9vR8AyIcqPRLPFIgsreYbAg5AnQAkQpUW4gnBmX0qLrsIFVi/BgXXntk7rQB?=
 =?us-ascii?Q?e0ymiA1IdLLO/pC/M3K4R3SlpoxtHUJOllsywXV+tSntAZZy9GIOTxwdvnh3?=
 =?us-ascii?Q?D8kVMlYuaMvec3j+GWITnDhYfO9i1C44HNNqTAojFKRk6XZiEkKpyQJNH9kk?=
 =?us-ascii?Q?gopQtGKKWz8pUvBoHMkUQhgo9K9ipGfiqdwhzEf0HFk/XlCusOd556xKb17w?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3026e41-71bb-4dc5-f2d5-08db322c24d9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:08:58.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEDMYDqaWChE0kKtcYWXbBeDufU50tXmkuigVXEbt8geqO1LkLQ5khKeC2CXZvhx5aSR4o7ACes1tkZguZKj9C0N2z4q9AXsyRDEtc3yBQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

Even this binding look trivial, the actual hardware supports more
features (e.g. sleep mode control GPIO). So add this as a dedicated
devicetree binding for the Maxim DS2482/DS2484 I2C to 1-W bridges,
which can be extended later.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
---
 .../devicetree/bindings/w1/maxim,ds2482.yaml  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/maxim,ds2482.yaml

diff --git a/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
new file mode 100644
index 000000000000..fd692a3a7400
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/maxim,ds2482.yaml
@@ -0,0 +1,43 @@
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
+additionalProperties: false
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

