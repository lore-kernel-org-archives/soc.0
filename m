Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794851399;
	b=Osaa3xCiE5LO3z5OWy1izyYiT6X26AROSyZzaaruLf+EfUxOf6384DNKwYS+FkY1Kt/J
	 N64B1+salIvMYJHIQbrFg9XockYZ8yb5zHchdtue9kH2xNQm+FET1wks7XsqD4x9sYaBh
	 QsN06Jh8Yybi9NmiGtIGeCPklKBrSdGovVHHVjCf3cSAaSaJS0aH+NyFcn39qDWGdKlSQ
	 FvkmzT9o9acOO1E3EcXY7+aFK8KoDDba6Iu5iBnF/IXpLJvdL6fEzkY/Ws6D+6+8rYaMR
	 hREFyFmyzj17CTN6cwbKIebRAM2r6thLEPSG3TYQ5NHPrBdDxlsseFmAtk69KMfZtiw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851399;
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
	bh=kPoBrmYnUD8AY7LO0kdh98nFRE9v+UsoLB+U8I2BoIc=;
	b=P4fgRz+SiNg1woZTXMXYXZrxgnRL7+EEZAOpkORyT0Hb7sAAqSbHgQN8pHP0QyXe0Tuq
	 lyaUKka0kEMWrOfG7Qh+CZlk13JhoNrYMh+OAthaiCTk6WdkzUGjGidP9UhzzlA2+2MTw
	 6n4fCi+xaRSbEmF5T7tL5gi5k9W5DtE8QVGq6+7XS4KNoEAoHk4hHNA3yRIqT3GO94cen
	 raQc8yvkfvSyntCU8WTcdSXp4/8x5owZ/rp0uVsIWxehcnckjPs17+xz6vO3WSMInUOYq
	 G7+rkyJJIAGd+4eCgZf4i+7Hy+8gcMf36sZJTwPCWrNnNCeV5KuYOHBcdvp+iAjXeUw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xJ+QnSp+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F52606A33D
	for <soc@lists.linux.dev>; Mon, 16 Nov 2026 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xJ+QnSp+
Received: by smtp.kernel.org (Postfix)
	id 3488A1F000CB; Mon, 16 Nov 2026 17:49:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794851399;
	b=WpSoDTBJTFlLlIvFLy+u9d4tkeBN1qkUB0Q/hvW68HTyUsmOpdnSlpySWAum/H4865fQ
	 LDsvjFkIxxF6QeLwaA3+MpiC4bEDrOl+aRTm72NF8/kkkY0A4DL0QNDV7YwPyI35jNR9B
	 CI81BmZVjpNC6xNok9K6yYCGQAiIaUjafBMXK5H+pYfdw/KcWu1w2ExFK6pOS+jXANrVm
	 BhEQ5R+Xk0UmyJQMx43r9MiBsykyIryXTjvXMiavLImotoDqsT5Zi5CyrYuZ/DibVYnug
	 HcEWFJDGv9usRDFoXd9h6ZJCtLXdxDEcO1Xg4ZhbgyomFuWuOYJYaX8wugxrepUTSXQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794851399;
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
	bh=kPoBrmYnUD8AY7LO0kdh98nFRE9v+UsoLB+U8I2BoIc=;
	b=SgyFPu7ZFKt7pG+WPzw4yrdLSnk212YBPZxl35++biIo1DcN/J1AvuyEH9q9ENdMIXWZ
	 QMffsvRDb3tm1yTYbsXq22QeVeODgxQo7PdFBdbv6UJsq6+6BC+0yoLRMmzPHRK6QX2CB
	 BgVXk64RfxZ6touYAs4NHXZddDFp+OJqzaQaFXzFSCq3DFLY1Lje49/L8CT1/eq19muIj
	 JENAaspIF7fAc/40e/Gqutz5tsPZhOI+TBJ9b8nsG6PLEUK477nhJcUHJaXHZMb9PZwwa
	 o7mnW6Dp4VnlWZiuaGlqzOEEWzbs4t1gtWQoqRX77HwZhPMitYvuctDUZMu+JSNWwqw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xJ+QnSp+;
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EC871F000CA
	for <soc@kernel.org>; Mon, 16 Nov 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xJ+QnSp+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3EC871F000CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVC1Rwc8y3Svn7vgataXlAMhbTBmPP6YTCxnWTg5L4xPeL3pF/CeYV0mvylUX1Udk9gSnBFP4qgmX3hAMiEIJEqjiAuEbMJuTzXOuQGIB2DD6CYad36pTdG5DNc6WxPmPVcpROLWenUhXnpEdo3aYOg9RLXyDb/uWnyFEibRZRo5OL1KN3SR5Wuvp3peKbpE2SrK4cTs5yW5+JKGLj1cd1jgxF3eBzgIyiKNSrhyPgEzP7UpZe/BLbXIGmkhU+ag9VwoDgwH7bWXgS4NZAvIGfxaBcAdYnSPioAEynT2X6T7086ul5XfTrCWc5M09nEH5hq7OAevwxeMgmkEbnwwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPoBrmYnUD8AY7LO0kdh98nFRE9v+UsoLB+U8I2BoIc=;
 b=X1qtQGeMlgvOv5MR7wivbsu26AsZZAP9XjIO1oigUuVNh/+DeYzXhwNvmEG2geBRPO5LE5g5u91jp4N9fFU5OG2TjtsFvvQphEKC4RwuOiRgYtnF/xLHozJk5QvrvUpTWhKrbfRaQxLiGGty7WwDnAVA+8BtvrAMe9/HVzrAN2EBpFfl4wWYs0odNwHP8fYoQPdMPSi0gnUV+JokfWDAzNSR7C89kSfCPTXnfGl7ovjmrdNuxwXb27caqDqfaAFdMMKoMKPsm9uBauHXlCpGFbDCBYe8oH3+FSgfC+7G/AFXy4mTzu46Dc3Uh4cnhZaIhoCKgrWEEAJAyUXTuOS7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPoBrmYnUD8AY7LO0kdh98nFRE9v+UsoLB+U8I2BoIc=;
 b=xJ+QnSp+ta6aj/JkK+g/1v4zW62CxGY88o06pCNG9b1JPJYQg+NJSt4F324mvZuQ48BAV2uKgd0rnZI82lamCNLur2vE4JplU+jCrw+kw9ppigcsryT1ZTBeNrxvLjylaN/FAHmJsPUASQkrqWLu9PR6yplgGMrndMwAewhoawsOOH+VC2O5o5Vejc+SdO4ohgbKJu637a3YJ483Sa9whahJDbbdZGdsU7HFYMa36paAO+2nxoh3YlNVMLzSoS3qISB03G7XtVqtDn/4oM9LbbLRzOLIlkBQ2E85R8KvvGEvrmNFdg5KymZ92Skw7FA3FSiC48jvOlMxY72MrwHEZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 17:49:54 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 17:49:54 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [GIT PULL] iMX fixes for 7.4
Date: Mon, 16 Nov 2026 12:49:46 -0500
Message-ID: <20261116174947.2957972-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: ff41204c-0ab1-4cfb-bb0d-08df440a05a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|261009223027099003|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	FmVwiZbmUi8/jjLNzBPUv9zphB6XSMVJw50Vjlw4IbUdireG4YcZ3WrUIK7zB+htPv6XYR+zvbLhBwsHmd8KHg/3aaNcOgwmFgxFQdbp1sNa8qD+zyJWx6fBcTl24awxO4F22ljCI9TDbkomrPtrt4T8tnCICs6GFusPzj80g55T6m1de+JzFyzJ4pKnOD2qLxpzWh8zXBzi9Zfw6h/oLVWnhlBfUg1o+kd+q+q/p+XS4MTwg2lCVsCzESd5k9lM6sBiGMP8Fb9w3SjUMvD7YOI2YzH9xI02OPSRlj5F0qnMi/upVOicgQeJVMgx3f8xGkDLcIi0JJB0scc7zXDWw7DaYdXMscq2UIteMkUlIrHASqfjWDN0qtJYhESEvWQv84TdjldyY0UxYWrIE5/0mLb2YpLdCLUAt2r3YlNmyBbn1oIqncN5Ta5vgIUB8Jyq3rjg6A0U+lG4GZOc/9/WnNdgqJcZmjMIHYqvhgqUytkse6JgM9R1n0SIcYFHc0pvUhBvSJW5/HLJRqG+1vPuL7j5DI6du7GTw72C1jkZ4+wO7xQYiPBBgh4Us5BtLwPS5EwuXBBs4illcML4L7IUuFV/lfDh6Q+aD+uUqGm8YfPeZzp+7qr+yaV1wFZDcJLr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9jsioFEuUQHDbp4y+Gt5uA5B908gRWV0FR1H9qn5DXG7jugU33PUwAaXiMji?=
 =?us-ascii?Q?69FuFtqujtO7RTZwSeUqS/6u0mAww57GaLOB18HKei4LCJtAduILyqNYijk/?=
 =?us-ascii?Q?EtYXW22h1UVdWgwbAKEwJEq7JsP20UCZbQ1xrnVHBEhEjWt9U49kTWlcBkkw?=
 =?us-ascii?Q?tRTIy5rQdSfeOflP9D56PriqL2S8UMwXw4qMBspHG6FarCiuv557ZEqq+ojE?=
 =?us-ascii?Q?q8G6bSDDEFocw8JnAuFv3NCKLBa6kYNcfWMVMtcEiWoAa4ImjMl0s1wFuNVk?=
 =?us-ascii?Q?0wBa04Q5WBAzpiVH54LbA5U9Sd6Td2HgbRoQguS2trE+dLw0vE6LFQlmt5r5?=
 =?us-ascii?Q?HyG6ur13a+qSW6hg5BddJnhmjkv+dDwVSCI3kKs18a9XVgbLO1CaLGRX6fOr?=
 =?us-ascii?Q?J+zZTFxAtxx1DEpk94wH7PlGhSb687+42YqScv4NUpxz5O2jGheweFp+fJ+H?=
 =?us-ascii?Q?tsu4HHaaxaP1c2y0OStVseqy0/ggEyhB0Ixsy5N+5DPn+45XFWrrDU5NTSVX?=
 =?us-ascii?Q?NDyxDTW+E0fh4oY8wu5BNQMfePntPPHpjU8DZWbak0fOker7U9OMd1/1yiSY?=
 =?us-ascii?Q?4j4Z/aiktAE37HvU8lw52GYmcxVD8ym8pgfbImfdU9eHDEzOtNaqCusUW7x2?=
 =?us-ascii?Q?5SzXhIOC4ZnrAQ38z/eyciCHKQpIt2wWKO1B/TQD5aIhakFfMsFbLiwexHed?=
 =?us-ascii?Q?ORpxzE8Wlvc+FyOidYQtAbD+5IzhiaW+jbNfL0AxEtwh0CiJXHF/JSLI5kEW?=
 =?us-ascii?Q?tC/Ir9bdT7Q17wtgOeocMmOChKqouidmqsk3OLiPonPJtaB275wN2BVWZDWh?=
 =?us-ascii?Q?Pbjb2feUUFzruGnTB9lbdNcyjRBz5qYoUEdF9Y/PH1Fcr6OUqsq1MSydLF6P?=
 =?us-ascii?Q?ltABX7TphDotJoPlG0+XVlsQriedKGw7pHvQ/j7FHu6FkkTVG7xPikQVu8mG?=
 =?us-ascii?Q?p0e30w2UoabzoCtp3/CS1AOQiBWH77DQZwT+S+Vh2Gz3ya4LikZKAzmC/dwG?=
 =?us-ascii?Q?lPKU9cSS5CKhA9LUBprDxOajBxK7cS65Lwchlvx1jYxjYBN4U52XHX94SDHv?=
 =?us-ascii?Q?WRGHw+HVk/KVz0THGk1FMONCwp/tT8anz0k9LyxGWaLLTrLKK53GgbxEQ0pH?=
 =?us-ascii?Q?IXpOmDn5kwII55qU1bhOQS8hN6B1KyRn3mDWFAzZJcGSfrTvVdUkVfCCs5em?=
 =?us-ascii?Q?DS8vV+JzRgV4pWUseGcyA5lbbFebqeMyG0P00v0j/m/6p5smrexJdlsmzzmy?=
 =?us-ascii?Q?8absqnAoa30E1EtZdxlANDhXCXDJiatDeRoMMZtY2dFNZmNXIZFuZbQP0O9B?=
 =?us-ascii?Q?bDMRgxZR8JfPUrGywyYHJ4kHPwUuWQW4Ti91C3ZpjVlsutzDUxb2DyjZqe4I?=
 =?us-ascii?Q?3iKj64LWphmntwEpPjA17/JuVaruXEQzbO+sC9OGLeO37tF37MEAQbsfZZSE?=
 =?us-ascii?Q?vzeVCTYwqOGWxMveKGHmayS3sQsYtkvXptO+xPu4LbGtqZCDmnCrmRy2f0nc?=
 =?us-ascii?Q?/f5dlO6wDNZU2RyjuSuWqoxAzfpuXzmSxWSTyFP8Xbdzy5sxofGznfvCnKH7?=
 =?us-ascii?Q?Zt4dHZkv6UhC5Iv7gZk6pLVYaUDULlkaG15cyP1Geqm+1EdfcOV97KhdKND2?=
 =?us-ascii?Q?A8Mtg405bCfdR8ptcFU1hG6OTGGMplnz5gzmPN/g/YJmzdcSFnxAXLRw+Tw5?=
 =?us-ascii?Q?/7xfMGtKDOSohGzeCJyxWxkQPlUpX29PW21ykHuDXQXfwwtM/Z8WzV1dFO3L?=
 =?us-ascii?Q?PT7ZudVZpB+/c9VDB7ICMgKfLZYXcgY+3HARuZlv5S0kr/A5VljS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff41204c-0ab1-4cfb-bb0d-08df440a05a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:49:54.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Pj+AGrBjVTCv19rW1EyxiH+XMyr4vrOfD7BUfKy9EnKlRQqsjtWG75MnvS94zBtyybqmYIOIltI3TP8/rDibhT9iCIOEBAVHLC5d0M83LlSxtMHqMEadRcN4VI6GAJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.4

for you to fetch changes up to acba37c2e2df26ad722d470777044fd21620834e:

  Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information" (2026-11-12 12:40:48 -0500)

----------------------------------------------------------------
iMX fixes for 7.4

- Fixes i.MX8QM usb3 host xhci function broken by
  Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information"

----------------------------------------------------------------
Frank Li (1):
      Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information"

 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ----
 1 file changed, 4 deletions(-)
