Return-Path: <SRS0=d9Ur=7X=chargebyte.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8191EC77B6C
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 21:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69E27C433D2; Fri, 31 Mar 2023 21:09:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FC1BC4339E;
	Fri, 31 Mar 2023 21:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FC1BC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chargebyte.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chargebyte.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abaDR7hIvcTrXPhVQnthkW+SWLeMuyjFVIxtUn4J50NmTQytM+6zDVWlPBjHW0FGnpzSu5QffneC50A78Jq14+854ZFNT+gh3vlYFowQw4C6aHLX9uLhsgLPP7Dmk3ZdmvN2J4YF/ckOSjq4G2OXg1xen0+q9Sj8U+yUmnslMrVyvekgTVwGZJ9zMIOFpH9y8VCf/Z1A50rmmrG7Gdzw4eTuL7BbCX+jA1ozJLQAnS47Xs4lpGMHFXIbJ34p0JnzdTIS2tOkbcPdpruvWJa5HyXLyHauuV3/EBtNso2z+TK8zIZLYl9co38UzDgBb2vnqJH1JgZNazBqDQIldWOBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YgYLCnCYJCt9EVXBhXgf4saAmKVNjDSebmMwXDAGOQ=;
 b=D2LoXY/OfMv3/QwVoWlvY2IRPnvohneTq8q0OuIwJyKB8w0BwsuFJ1dwttz0nTGRKpBpUPJ+e6YXVFrvElbzSTgMDfBcRtXtlRywfZ3tQIkuxSeJoDyRth+JbsLbdgubNAs3c1lYkfYz1fKr0EMQDn064jxe0wPBqOf8C7qvsikS44YDikTcnq13awxIKyqmUIcUjWGMsjAsjFG4EJ3v91F3URDn8KIK38DoHXBNkXLl7EzGg1trR60Iff7VKFhmiSc8+UaaTZNv/i+tq3zDpDUdZTT8RSur3S3lWGcfgG5RGmScZ2wfSOc1YrR8eIJMgxFbsF+vsH4V+yvAMMNnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chargebyte.com; dmarc=pass action=none
 header.from=chargebyte.com; dkim=pass header.d=chargebyte.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c4c.onmicrosoft.com;
 s=selector2-c4c-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YgYLCnCYJCt9EVXBhXgf4saAmKVNjDSebmMwXDAGOQ=;
 b=V8wcIXNIBUroOhtj7XEdw0af/xx3iOu1NueEgb1yZLZPlg8iXERaVpEkp2KYUxmDV5oAzg9N7WJE1cjmwcNOkuF15qEzaTvOJz158rfhU8AgxNl1uGIhqpdXGGwy62uEAHW374JnYFCjUq0lDGykK7giqsLKJKAQjKWnIz4FMfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chargebyte.com;
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5)
 by DU0PR10MB6036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.13; Fri, 31 Mar
 2023 21:09:00 +0000
Received: from DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7]) by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bb8d:725e:2ad6:ade7%9]) with mapi id 15.20.6277.014; Fri, 31 Mar 2023
 21:09:00 +0000
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
Subject: [PATCH V4 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Date: Fri, 31 Mar 2023 23:08:38 +0200
Message-Id: <20230331210840.4061-5-stefan.wahren@chargebyte.com>
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
X-MS-Office365-Filtering-Correlation-Id: d2c23470-a727-40c4-9e79-08db322c25fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/1Tgr2dlwmtN//Gf1eH7XKWeK/0tKwpIPSQaYFiJ6juzXCULuWfGi/nwgzj4NOepm9ggP+2mh3dFn57em5+aVTqRxkpuzyBVpccEIDQSURkrqU3bMBcWHlCJY+6JwkL96TPISbbIbFEpaYCqsfjOLVLdAES4qdR0MjoNGogyrahlJtHeoQjmNa251zcZr1XFd8/DGmqif5r+S5j5mXLdWhHayf26Uw44Oj6cMMOcLYqyp5OkczIhR5t2xhSfx3IYsTuJr5sdcK2B+Eg32rEvvTqqk/KcnpwdcPT/A4NKGSLoUSjOT43xyUWTmGRk2mvVNHnfb7A80gQBKkj1gSwXL+E4MigsGSXFiVxXOo/M7wHC0Vhl+StlNA8l1hdNjwgKDpqNAZ6w5SvUs5Xw6tBZUituyi/zc6zJxUMZtGuoT2SI16p4hSm5L98xy59XfitCsQVlMSuPGinVYjDr9SRjxpbqXxXJLb0/m/D0DfejhLvX9+W1JZW46Kv/xpwZ7k+6nvdZHdl21oneaWC70mRh0+2Ep0bYNzjWaq/+sywcoY5Y2DwOWeOeQMmgdbA4Vk1PRGhqjvRobzTAzJsC+BOAin6H572iRXJ3GnwvhiVwagPAfWBoJte14THIZ06bJfmL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(38100700002)(6666004)(86362001)(2616005)(6486002)(110136005)(316002)(186003)(52116002)(2906002)(478600001)(6512007)(107886003)(26005)(6506007)(1076003)(44832011)(5660300002)(36756003)(7416002)(8936002)(4744005)(4326008)(8676002)(66556008)(66476007)(41300700001)(66946007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pq/XvvXTUKHitr2S/MQ2yiyDSWu+cfs9bqxp4EzPp+lPKtjdPEPkfHE1aqHm?=
 =?us-ascii?Q?t/pJ/xlrGjH9qI0AMw6ME2dyuh74wFPGPSKlqzr5uNBnXw/JIyLGgoPIN0to?=
 =?us-ascii?Q?tqr45Pyyej2OTLh2n7i//Ico5sP6XVRKsCq5uIfnRWwKPVnPS1oOGgJxff9p?=
 =?us-ascii?Q?XLtx+xUuSQeIa4EoZ2YiN6FhwxmVI4ATSg0Bkwp6uTuWfT4XUtqtv3tIAGXy?=
 =?us-ascii?Q?xfWWSLHRn0IAi6cFE+/OcQzoioDd8tc5st5RvE3EmBY/PatEfBhOFQL9iOau?=
 =?us-ascii?Q?cPHURTFcFHjNIvkniT2IjV6doFjrw6fu7z7NIqoMl46DZrWlHwxkpTpbKt65?=
 =?us-ascii?Q?iy+h8ApjC6N3yAoeRaaF1VAnbn7lUkP6KFkb/T7tiPRnDskBY3cnnCf7YrGT?=
 =?us-ascii?Q?+6xNmFI6GiNItGpvJeztqWq1AxRoHMFrK6DCz12G3tmmyLjUfZDxMnQzzpcg?=
 =?us-ascii?Q?d1LTN3pV6Hwhm4cBT/jK83exlcEzTePZ3NEYuphoMcSLiZHzkb6eC5ZKx8Jm?=
 =?us-ascii?Q?Wzn09m2CIpBVOopBl8YZAd2zbYkVwuS8aN5CknLmo3CDfOjaFQgFrBI7z14p?=
 =?us-ascii?Q?iW4wS+XrGUqoXgX8f19ij8P2FtPSRLBh6uZYzasQDSnc4OZbuD3KUpzDHawY?=
 =?us-ascii?Q?67BiaJp4fTP/jHVQhXPbbM4bi5tH0uUOYojub/JgcAqjC3e7yo5nFJt614jY?=
 =?us-ascii?Q?ffBbhlSmeVRvBWZyZNncwuBpMabOEgxOSnSZm6pePkPCANPaud1agGWg33L9?=
 =?us-ascii?Q?w7XXIsZ/wxguHzNwFXajt3zhlq7KY/JEx8PPaGk1w6N2J5soAU1S0MHkEw0z?=
 =?us-ascii?Q?O55s4ZolX25JuMJxvUc6XWMikqCxFKM4pwtzBtRTCum/bKTlirh5ijysBFB4?=
 =?us-ascii?Q?VCyy8MHRpQzxPXRk7hT5Z+f9tpOK/Ghmvv/NMcfS9c30Bb6CQ0AnAd3h2JMt?=
 =?us-ascii?Q?xBxThm91EnTXpAv4iw7s9jPv5HGjXbNvnGY2e304t1j8qHaaMRoIuaDZ6m3U?=
 =?us-ascii?Q?dFJE6JtjVfM+fji2yaB8rq00wnBxlResLX7ymLDuTpi236Ox7P85XF2q+b0U?=
 =?us-ascii?Q?KzGmrsq+7rBQzbTmjGNaQaqjHKxVBQzFxwGWKaZICHA6fF8bUMLGw3gM4BMh?=
 =?us-ascii?Q?hr50lxYo47ZlRvx8EhJxEXrTVF9VdqvETJ+r+0qMEsBb2GKpg9c1Wk+UWUjj?=
 =?us-ascii?Q?BgASQ6LrVaft5llB8ioeGd8Apkn4cbNzz/syOYtD4XAovOvGH937OOavlKb6?=
 =?us-ascii?Q?P0HUQl3jAQIb9NtJNqHAPTUIT10ib6Hfr2AV5Uv6lJzgjcYHTvdo11vPXNdP?=
 =?us-ascii?Q?5t+5NFfDxLLNZKXbN+nUWAPc67qkXXxp++2WXjXDf7HFBviCczATeHX5OCGP?=
 =?us-ascii?Q?jom6uobu0UdHoUFyeoEdnFOjiuLpMLkuQi8yvbSwt7D+PejMxbQ4ayWyO1Mp?=
 =?us-ascii?Q?QPwiv1LQV6PVRpUqcqecGWGHEnCFWfYUaOmklaH9/BFthnC08mkwXCoG8QQC?=
 =?us-ascii?Q?U010+nBlPPo9SUwKWgL3Ex2uJnF7T7sc7gk5CwCGleYIX8r8ncqNefmUlCqn?=
 =?us-ascii?Q?z+FB27kcqYZQ8cgNtdRqj87p0JQDCu9sFegvUl5kNQMgCQhI5XV91qRHz1Rl?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: chargebyte.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c23470-a727-40c4-9e79-08db322c25fa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:09:00.1727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 30547194-0d55-4a2f-900d-687893d3bdc0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf8Sv9oaD7CpaSc862+z5DkAM9vNO+pmx7ewk/FKNlKs6xRqO1mmMbKEhVLMYt6S1KAqhrXUsl1iqXKSCQj+2RhfSX9nNh4Mi+pYdknMuC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6036

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

