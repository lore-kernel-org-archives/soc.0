Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF5DC77B60
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 09:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF751C4339C; Fri, 31 Mar 2023 09:58:37 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC77CC433EF;
	Fri, 31 Mar 2023 09:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC77CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmWcuiQOUmJN8ygUDPVd7LQreFZpVz6foTNLVqkAN4HRXmpfXjfZhXu3YMb+qHYUALvU9jV/gNihT86OTLQ80T4Fvf3HOMBHr8Ab0MOWIVHFqSOE52d0b76MGpnLrSEOeLA8cCzvOM+jkN+fcJkWEcjrRZCeOdAApdjE8tW3aW/lutybgOgNU1GjOB3kzYoKExfIgaklWmMH5B7kx8qaTxygFOrjBvg4t3xlJvU15PtgWwZoT9QiwbgIYuax+DdpIzjqtfFedhidqE2UCvK13rhJGpTK5pB4DuwEblPAUDQ7tF+Q+YqdLDyMhOMCvlyq5/4UNHqpZF6rhdjoywYNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRlkN0LVoy8hG34/XSORJqEPIdoqtiXjSZVRwFZ4yPg=;
 b=lhMNUe9OgvmP+rOGZRDSWpk0jiG6ECOhBT/buqZZv2vKraCzornrXci3/iOGmthPeMruVPCYbHlmO274V63FZruWbN7VRDKW8fx5QmMTpDWHk4APW2UiuI1qGiKELJWD5DEZKFN4+Jxro6/OwXEUYiT5d5knBW+ejtfreaf9tobVDB3BoJlXZMJRShch5s5I49SpbPR/K7b7vx/ztmrEKa88lVzgY9R4XhaPYgcbgB6nfPzqEVsj4sIiMKLk3q+EotAReuzMCNg7zq6nsvanriLQDaDyzWY7gVXaenAtvg5Wxjz71wbyDDc/JzDvDaBgWbfSF6Hb/xc2QKyFxkEZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRlkN0LVoy8hG34/XSORJqEPIdoqtiXjSZVRwFZ4yPg=;
 b=Oj9KM1ZE2mYA2R0cpxRn0NWJWlNs0DaX+GC1wn84MpyRBLhw2A2kGPHKADCAgWUgpGHdJvTDtWx9ClQZJVNWKAS3DVMEn79l7YFBStTXdHSx0iFXARpNd5mzzHrWHAVR3MaUNp7sfXnB673wEzv8K2OnpBcLHAgloX4FgtReuDk=
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
 09:58:16 +0000
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
Subject: [PATCH V3 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Date: Fri, 31 Mar 2023 11:57:13 +0200
Message-Id: <20230331095715.5988-5-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59c5723f-f4aa-41ad-7a81-08db31ce7314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lWwWRLMxtY3wvQxGT7yhLcO91Yu/qwIWMl1wKEpDjy/TjUTHHjtQ/Sr5R1hobN0E8T/gKvjlW4Zq0QiYBg7169emqFBqNqKdwCvD+Xv/rQoiIm6pQm1g0eEBVY2RzxNikXnaB/vdWN/p6+8kz/+XKpnqGM6EOXiSXcPeBwI5me4pJFgtpQ+A28Or3FttAvfDlHTr034wVPqHjQOtDVSBBQ67h6AdOgnX+GYoWpKGxJ8A9bijrSAw9WN1J3cjzyjj6uVm3j2w61egO1AzlA0X0N00cuiqm6KQngVHvkIDxEtgoSC4290bV6FldedYQXV6IzMYASyrpmanzRkVuDAhxmHzoo+FWvD17p3fetrazD5GS1zQPHr0bBjznomWtV9qHVhyuLzatWJSOCdib6+8owZylCHkFcxdG6IDr5OpMlRsWQ5z+QCT4wz74n8c2IJZk7V34BiwYXSsRgWGqlpDrR0RzXavu3YhnoCaLHVzpPKUSDKtORsxkTcfTKXn2Eptix6X16Mag5ElHY6Lebyp8Ao1YFKua5UaY6xypdZm0B+SKi2v8LF8h0DP/uS+Q/nyyEGZApBBKosQ+26JwITI9/aSCUBGpq7lIjuqBp9E7ojb1csUEvrgpNma4NfOQLuh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(451199021)(8936002)(6666004)(107886003)(186003)(1076003)(6506007)(6512007)(5660300002)(86362001)(4744005)(7416002)(36756003)(44832011)(478600001)(66556008)(110136005)(316002)(66946007)(26005)(2616005)(41300700001)(2906002)(38350700002)(6486002)(4326008)(66476007)(38100700002)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d77AD7HmEINpyrQ0ZL5pVHhvOjpRZSjIhcWc6Y3H00E3RGg9gMI+Tmt6CxY1?=
 =?us-ascii?Q?7sQmFP6HUOkYgS9V/WjyK9g89kVnvDl/qcbxSHqzoI3dEsXWnBrwE3DbGTiU?=
 =?us-ascii?Q?LHR3ZYXraMQ16yoYfVwvQMsxVFit6p0ygm5pm3NFfHMmcNtQGtDEhqnLskkK?=
 =?us-ascii?Q?odTjGjdFo+83jZivvA8peoyMiriegJ7IK6aEDrbi3YgcPaU+i4jJX+9OemCz?=
 =?us-ascii?Q?nqb18KkwrjE6gD302n+xApt34KxqH3HU5lfX1r2riDSb9Qg+L5U/uObw7Czm?=
 =?us-ascii?Q?Lk8yArBOYsja+tfcSGmTdl9FeZDvv57M6c/gdIUZZ0keXfqtFv1FiMsyzwo7?=
 =?us-ascii?Q?lwk5HHtenkmaccR5Z5S75XihyYSaNqrJT1cp2OXatmhd8xSGbxLJiKR6dNRP?=
 =?us-ascii?Q?diOdm7XJELIQvS9L9dNxmASAigpTWgbLcDF0TajzTYoIX6zqRKKsfbInxEkP?=
 =?us-ascii?Q?h/4UV9gJ4S8jQogYI8ivzdC0UYoWo/8IfAG+2dky+DBwbw88S1iqLYZ+1zkd?=
 =?us-ascii?Q?6Qmj+I6WR3Zgr/K2QYj4HoT74HgDww8La92ClfU2ghAGk39ELYjOK9W4Qbox?=
 =?us-ascii?Q?p9HocyCFnVLBHR89d9uolIERKbhUgZQhIQqbNfzxgrVNSnlD4ZOVV7nu9dhw?=
 =?us-ascii?Q?++12kq92uv7ymfcMHCF3UcBVit8aJs/KYFlv+cX95r/r+g3ujg0bTUiGeYX2?=
 =?us-ascii?Q?4gfAJtdELkPlW4IT6dmrtTdvlCE0BFh9BWeRaOgFpOMb+UBZZshYACfUZR4P?=
 =?us-ascii?Q?F7WcX9JQDUlQkW29OktnD9fQ8ESG7L4mripITgqOKM9Ash0C8QNqv4iWIbQ/?=
 =?us-ascii?Q?XaOeqdRZjTLDMffQlcmIkRpyLkKy3gvS/99q2XLVWXZfiad+c+QXBI+RqPjm?=
 =?us-ascii?Q?c3st6Q+Wl3fmeqUdGuJwec8IDIz4zx3KVQ8IJ50Q3+aM30zzDmv0N6hhfT86?=
 =?us-ascii?Q?oekQGkKh1LKRp2uHLV4ExPjMLHWo1oErPN19nLPaUlhD+G2Bbvctr0khvk/3?=
 =?us-ascii?Q?2zyP2JORvlE0dxJnQdMiGXTx9al6PzJ3vt72/BGuBod3Q65nO9BAAskUZoAu?=
 =?us-ascii?Q?iZP+7kjkMrCgB7xIc/LkyrvfsoB8jKAPHdX95Ru1C6923gcBo7FFrym5Qee9?=
 =?us-ascii?Q?ipUnUu1S8LRrT3/2pEYqww+qADbLTFG0Z41ehSsz8LGIIoyZtqMaDQWq84ul?=
 =?us-ascii?Q?DaPCvpdE9pkNqo0038+cvDHYTZWMaswL8XW9EkSHPiXaOnqUV5YtFf5dnzC/?=
 =?us-ascii?Q?M/eA02gQvOqNrmoAE5OZIxoR/nbjnaLdeb6pfvmQbqsr3iixkKWh1j3PAV4E?=
 =?us-ascii?Q?EmFKPoZBAoq5vQo/k9AS+gjPW9rFgIYl/Purzy6TkfMBHyFKhb21hxVPEzO7?=
 =?us-ascii?Q?ox2q6dANWCN/OiXcobfFpNdcHQ8MNNxE38wF/iZXNH8VPY1t2MwDbUtFYZY4?=
 =?us-ascii?Q?j9EskKcRFvy/OUgp/nPeqPFW9QMhzxN0IjnRYXLi/WXJeMdgeZYnj8koO87U?=
 =?us-ascii?Q?+A+H4jKC8kfHLG0Fo0pQTBk19CxikmXJ19/uq00PDQoyDNCFPuf2Ug6GaL92?=
 =?us-ascii?Q?n9Frt04MSMUxotgpp8tineucFiP/YT5z3tjfjoZxgvNiQYcJI7Ws8vABB/aX?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c5723f-f4aa-41ad-7a81-08db31ce7314
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:58:16.8698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8+VsaKPaHq0fitNlMaeepDfQscLWGRdhw87LArov4U8LxNOU+NvlwTmstJ1m51GclEJm2HvDipZyhcFAgIDn/2qAdRl0HIldzXBHNfURwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3539

This adds the compatibles for the chargebyte Tarragon boards.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
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

