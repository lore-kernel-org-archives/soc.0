Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795627125;
	b=Tn0KX9nANpNBJtYAoez4j9O8gxVPjjl2ctWoMU3/FYoLuP+Aot0wBcbYp+poB7p/0HLt
	 RbLQSAXI+AdpukiGWgseBlk///nx2bvz6boETQY3uXSRR8gXvc6xLuBWARmR/h+eTEbqQ
	 6AY9LuXPljF0NgCLEZ6nnRg24dZnwCBMePlNo5DukfZF+RtuAzni7nq/ulhKf4QT6k2ZC
	 ZqLK6UZgF+X/kAS3m1qzCYfdTuljVetx3bc0ENQ4UwxoOZhmvETJ9ZaJmcg2OpfBiphy2
	 7PvAtxK1WDxNHMIVjoL96k/WOGQLiTdm6mEbp2nYYXPU/K2NMGCo2G6c1vxp8xByrJw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627125;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
	b=Lr9Uq2of0Ecd1Tl6KUzJoGfvzB8+LaDDT02BUrIEl/vqUo1VrK5HCH2LMvikz5DzNSjN
	 dd/+mgiHUTp/CatQ4P0HeUrpDhNayCsQHcNO8/Vb6uIJusWjxhdGkTjWf0gAcHHDcWatK
	 bf1JEatYwd7qf6dEeX+ldkvU0syI8a5Zgwww0j38SQhSy9/DB/yxK9bhJyX1mOLOK3G7z
	 qF2gqeSIZj8vaYJ6R5siKEVRCYIC8iPl0rMc2cFFwmRcBKqb4/KjCYY6f7T6KPy8ahrfA
	 u2OFGMIt5YesITZMVCcT6uz1mBvltnS0cNuV3rPVgJN8zP5B5t/8FA7IUIij1D5UqMg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4813B606A323
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD
Received: by smtp.kernel.org (Postfix)
	id 39C771F000C6; Wed, 25 Nov 2026 17:18:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1795627125;
	b=WuLfRahc3X4Du61KE73rHTcKFfimVe3gKVucuDPIkmJGFmqRlTLtvsZtpx51agh+dHo0
	 eVlUehRSKgO4PraXZPo3WrOh8o01ChzEz2ruim8au4u6QCBZBOU/c7m2q1Pyo0SL7xTrX
	 WlXufJPcNdjdP36KRGPvFKwobeuof69JAxUjZRkZ6X1bavSJo9sJKiyR6IdFDq8Mfj5aj
	 OPkCDIpuG5HjdFnU+yNdbB2d1O88rfDz3Z3Y7c7jCiXMb/UVx9MDOw2waa53uzGMgPrDK
	 KFTz8eHUcADDANpGqRtRKY+xDqy7VdcoFkrgV9fRx02WdnlZ42kEhaXg9pMgEICilrg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795627125;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
	b=GKXkx+xerYRLcupEa5l29H6LQ8sAV4yI6PDiC9UsXV2IZXHP1rkrkTE/ySmkfAbXCDkP
	 4A+pldAlX8GLNgkMq+sse+v+O5s1a/IvSNBr8Q4IwuEDQXHQHSZoiCt9q7+u01KiSwzwu
	 R4cyKEgohRj/mbYz/jxjmT6fJ/hxdf4kRX7FrswA4CVNJVv+DBWTv8V10SaKHAfnVbhlN
	 UFlwpNjtOu3CQk+tUf57SWg0tvsnpRvuxVsMI5gwZZLh9TRYQP+LithlyminctBW1gi8S
	 SnQ9WnTraO2muF6gWNDExDCX19v6q2kWgNH2tPfME5+l85VHzT36RbzriLiR7Bsu3aw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD;
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C2B11F000C4
	for <soc@kernel.org>; Wed, 25 Nov 2026 17:18:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4C2B11F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2KI59qMdtG2hSrwfpGj06/C/FDs2G57DXe+lx8sDvue7C9FrXAAYHvhtaozH91rPUMQ5xYwW42gQwWCSdSCqmF+s8TNUlmcVddz8JW+xbYH/lBsU6XiSJ1sLdCGXpgl2Pnh2dF4p0W3aQaS1qHjthan+dZcc33gs6MLWvZ719Ngu5oAuxRk2gCLyihwMMFdCWsrs7Em+r2WAbUwmOyOwkYoKRYxZwFIyRhe1Kicc2nFkGGUs46qjnSSJj8p/yytm/tph3EUjYj14T71Gad5IQaV7fwE/R1PxloqmJo8iUZT2cE4tqKWThi5mWoJ8vNmEUqNASxr7lgpa2LXtzPv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
 b=RRRO9D5x8SXKB/yC10jorw+XJ/RDMb0k7WeCkPU+I3r1QIuOhVOsBCC/N4z1S5ThXe3td5kRVJgdi70TOkKQSh83lsFxQWa5B+5GTqJInnYVi2OeDjwgn0KudDCZzb9Z1b/VZu3l6KmvEHyhyVfkfy8pWEGrsREj3cxcrI8YSPADKAcZzkMttzFi85lqoSxakLoSFzKCWojzeoMoPZeLIiJpydfM5eiG3cRCZoyq3YnFyYONMUb27XJosa1oI8mc+L8R5VVjlbfQk2GGwWhGvMCp9lI9WjLRy68KakXuEJyVQJMzP7uMjWg+x8gb6r3F1gEkP/P2ZGZtFZ38v8yhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
 b=hHic7WODswUVh0QI+GJ2snCc8LM3Ld0cXnuH7aA5V3F+pEnMpdDSM2VHpHAMstSUHJLZSSNIOWDo38vuXV0iIInreflKLF28RaXJlbG9NMeNlLSdiSadjPdjMSRcDe9QqGYGCt5W3y5NT38Rploy5T+oiERoXr3clBeXfr91rDQrQKOcwbvf2+HJ6oittexE2BGvhfmn4xZM1pGCxrhiQF4LkIDDyusFLx1Z3w0zhaGJv/EBSZz1hq2zCXQRuDLQBf5k29MfDgn96cBiNN1e8gaTX29GkFU61RU8gw60Usorw3SgtCNR9qhbFG4id9IVTlHXKOKyvAbM90VobZ3xLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA9PR04MB186684.eurprd04.prod.outlook.com (2603:10a6:250:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:18:37 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:18:37 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	jaidevshastri@vt.edu,
	ustc.gu@gmail.com,
	vulab@iscas.ac.cn
Subject: [GIT PULL] drivers: imx: updates for v7.5
Date: Wed, 25 Nov 2026 12:18:29 -0500
Message-ID: <20261125171832.3067690-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0011.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA9PR04MB186684:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ae4465-e4a3-404a-c61e-08df4b18245b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|18002099003|3023799007|56012099006|11063799006|261028144727099003|261022105027099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	eBzarFRSuok+bJ79lx2n4Cjj6RaplQouvReKp4qdCVrfb8cwOreLSCr4dfIhkK+TAZY0oPtKluW4oxnALgUeUhgiluDnKfm4BTpZcAMuQR/Jy7Mc+Kh4yWstgjoxsvN1m9Wk3po5EWvnqqRggKxfwUfhtwzATh9gjmyn2WFcK+NyaFFGrPHFJyC+VydgcKoyodzvOHa2JsPLQ93XdzGAoL/FvkJYf+/q7CSAsn2VYapxHlRF4bK/gTsHGqJBG1upd69/6oEPo7Dm3kkXcJAN04WaRS/L3AAI0nqnA7hMPyIKT3Id6jBvQXiqOrktUuoFacdEcS3Au2g90zxgY0icuEGLvKDSC9YRGUBfJO3wTerSM2gRIRc03ZYhhN/9v7gGA9IIbrPCRbNmu1U3KI0+amCIgQ7D78zgwqs5wApE6ZWIEvWVcGIQxnF4p1DOFlvJfswhUAI/l9yOkpGVoiSjjes7gNdGm73dGWNfFtL+Mtxw1fjNRrJzNHbDq6d0USTlLmsCGTvoppQ73QH7zbNRFSjDJZf59Cd40mZjkjwcTgSKhq7XXspHlZpZuj8mkI9NsQdXo3afpQ4TuAgxhdci/l+odj6c29Ye+yHYKxwCfj0xn5PwC4/TCuoyqFXGuytl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nMNHzRUXODMf+ENhDzbfvPOxgXOlbGOiwPQnCEKFcf0021DdxcD7bxKuQXPq?=
 =?us-ascii?Q?/E64+tLPUkzuPno3PYlvordfch84tEyIhYrTY4qd/P2IOhjGx/xut/Y731zV?=
 =?us-ascii?Q?OH7WKfzMoTIjHArO2XOgoXd0ttwiIEWRguH1SB/pOtIZkcSMEGY9bfYHZLvf?=
 =?us-ascii?Q?CTfQuOOmujZidyp53MUxScZ7+wDcvQKlYBSmvudBk2yOVK5zok9CPdBoFQjE?=
 =?us-ascii?Q?kuH7j5GN1XEbHLD63dP0rbvNZtgkHo2hb7l4uitcN0vzhfDbxyrMX84MAouS?=
 =?us-ascii?Q?skavd0nXc4Rco9yUuo56jHtg60AblN0iQtOUgQZYGcFrsF3yfbCHLiVqViAD?=
 =?us-ascii?Q?CE8QYPgOvYEnNoy/BGklWU13gsqgZU4BLgutRxewAhKtL5xKgU4UimCtY765?=
 =?us-ascii?Q?9mbwbb/a+FXU1pTDInFTxBhe77yaOQCFisVd8A16rP9JbnCoNaLSUzHUlX85?=
 =?us-ascii?Q?icnO3tQYirOGzxSz1nVnY0sKlsDgHIqH9K8v0onzA09z8NlKysF5OxW4ISGJ?=
 =?us-ascii?Q?mie4pey3/Oahg7LOXjxuqrNtIhXHABEdHON1Q8GDuWW21I+qhtE5t/zAVORa?=
 =?us-ascii?Q?3eRYkhhbdwpCf1VB9c0BUJKR2NQEnY6z4xEZ6EsqIz9irHPNMdGSQGHrFXlf?=
 =?us-ascii?Q?EhlCCAndGQ+QktsIhR+0C/XvCbvX7v6DxLkKlzRwcNIgpQGT8C+eIlszm2eP?=
 =?us-ascii?Q?/30HHumggtSWMWtB6NPjs6RS2G2WIPBEuaHVPjuOGAaXpwHSmbPkFy1u9nBA?=
 =?us-ascii?Q?C6+9hPZQIn9BsXi9Ev1lDEdJ8j6tp2cyTie1BV27yjwL8m5v/xHgxSV1Y1xy?=
 =?us-ascii?Q?B18OwZRdOlN9P8u6JLbMxpsEp4t0MJGESVCxjGMHz761RsjAbEMFd+n/aM9m?=
 =?us-ascii?Q?AqUvy4UPC/mLbdDl1fbZRsBa896al4/OqYAuFOZYz9PzS9CmaeK8SLMQsMqq?=
 =?us-ascii?Q?V6fXd5t3RH59PTleYCahU/KJu38g4/q+u2pZ2ynPoXV1IIpLR7d8hajgHI2b?=
 =?us-ascii?Q?jJySwcE73W8GGjo6A42EjK5ugAlZ1xS+InwuJt14paiSjpCo/iTFyQxwRX8t?=
 =?us-ascii?Q?QhynH1srJdridBfw2qTpaQvArpeNapigo1aeBSVG5BLs+pyhTALsJWDJ7XCA?=
 =?us-ascii?Q?W1SBk9Jq6OGOJhOPHR60i36RToAk/tD9KQfddfL0lQNjgn7091DFREu9fNs0?=
 =?us-ascii?Q?wOCgxY9tEaY2rm6SxprL67XwZXUvTBIf9JpIkWmJESL+GhWHWQzbPcSdlb/S?=
 =?us-ascii?Q?zNYkBNZAMhnraMMXvapXagkhhkhIsM8ni5jcusi0+WnApSNHXVo9AGmZIMTL?=
 =?us-ascii?Q?1HHEf6sZ6hGDeudHLj1n9XPUqqP6/5QSHRKN9EBrU30wRB8KEMDCb9kKjfaA?=
 =?us-ascii?Q?GmYp2yEodETK7iBj0wr0cCRcGR4i2w5x6keZMyfWMKN1KYXn0a6SnDilFRXQ?=
 =?us-ascii?Q?rgFwei/ol0cZB5IwUF/FbsW2yUKTBYjMi+zzvYmqa3zCVUVi0o0IDivAbvix?=
 =?us-ascii?Q?sADgA9/vKr5Oc67ALgQbLLgWUMCaqmNMokNjM1XEoIrypuJqM7HU5qAwf/sn?=
 =?us-ascii?Q?EYkCI7/LCM7FhRzoabjPgWswyf/PYRN0txHstR+PGLXDI7lvAmod6tWGmMpT?=
 =?us-ascii?Q?WbsKupzRhVBy02yd4qD6ikSuywuyugODFAppHwMUJrkHb7xWawSjT26aIMEf?=
 =?us-ascii?Q?gMA+tqorOhREX89UWHkGfyKcFX1dNcHXOgIZBmD7L6ofIqD9zlOUVak9H7PL?=
 =?us-ascii?Q?QtQ11OyStZ0YasirkgzDeYP5M3ZCwuSebyouZPkzlwpHEL0n0kJJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ae4465-e4a3-404a-c61e-08df4b18245b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:18:37.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfZuCfolzTzyojGebGvkNZAJBLdUvp+V05dXptXeWBQDHUxrVyakuxK72tADb9CqEziuQkOPqKu/OeS5Z7F3keZ6csBigbqDz7hbM4jKupFSMl5F99l+q5F98D56QqvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB186684

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-drivers-7.5

for you to fetch changes up to 398d92968e2c35be7788df3885ab6bd885b0b6ab:

  soc: imx8m: unregister the soc and cpufreq devices if action setup fails (2026-11-19 16:19:04 -0500)

----------------------------------------------------------------
drivers: imx: updates for v7.5

Fixes:
- soc: imx8m: unregister the soc and cpufreq devices if action setup fails
- soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
- firmware: imx: sm: publish the protocol handle after the ops pointer
- firmware: imx: scu: publish the SCU IPC handles with release semantics

----------------------------------------------------------------
Felix Gu (1):
      soc: imx8m: fix clock reference leak in imx8m_soc_prepare()

Jaidev Shastri (2):
      firmware: imx: scu: publish the SCU IPC handles with release semantics
      firmware: imx: sm: publish the protocol handle after the ops pointer

Wentao Liang (1):
      soc: imx8m: unregister the soc and cpufreq devices if action setup fails

 drivers/firmware/imx/imx-scu-irq.c | 18 +++++++++++++++---
 drivers/firmware/imx/imx-scu.c     | 14 +++++++++++---
 drivers/firmware/imx/sm-cpu.c      | 24 ++++++++++++++++++------
 drivers/firmware/imx/sm-lmm.c      | 24 ++++++++++++++++++------
 drivers/firmware/imx/sm-misc.c     | 24 ++++++++++++++++++------
 drivers/soc/imx/soc-imx8m.c        |  8 +++++---
 6 files changed, 85 insertions(+), 27 deletions(-)
