Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48803CF670
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622071; cv=fail; b=PwEK/7mB48KWvVvbFXYuKRRU/jQ7OuGfV1nBhg9+GzHNb1xcyvHYqeYPVleTJiNq17GU5ESUbKjBKrWlfDLSgZqmzvfni1ewb1L+k9HKciCTy+o3MlH6RVNlLr6K3WygUNo1LevlSRugzPww89N5HDW7ojXEwlRPKdWD8/jbOC8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622071; c=relaxed/simple;
	bh=dR1UFcq06rguy2Q5ZX08qnaH3L9uMu7VBzypxLFdWag=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dWBsjnjQWREzQt4exthXXYJo1SG5KsTFQW7RaayVK75P7wnGK1gpyctoBuGgRggpKkJmrvba+znc84dHanHl765Pg3vJ8utu5xXKyoIjpNuPpPyy5WOwqbxA+PXnALwX9m3yIQApM7kNmMYwlxD5NcDRWSf+0Zo+8toFK9UmPiY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vzIhX98p; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vzIhX98p"
Received: by smtp.kernel.org (Postfix)
	id A01271F00893; Mon, 28 Sep 2026 19:01:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.49
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790622067;
	b=rs7y0X6Dprx3yOvF9Cf5dYp8rYMiySXLn1DhmJeCSVC21UwwMbPL/bKFWPHNOh2LS9Yo
	 XxM5gJkYoLiIKsXpQgcAuXHXXTKmK5OaYUDS5r72IHFTi4D0Lv3EsHTlhXcQx7qCL5Rzf
	 Nvcg99Y6BnrWuHLoXKxUC0GYRv1tvmfedu5aJLr1/vmeZdgFVc9EOubqxcVoa9SaM77PU
	 BcfQZAPgL4FfQBwpXi/pi3Akqxmzmxegr5/wdA20FZw0OTJ7wjNDjk/aopW+6RpxsIQQ7
	 ZYTqkleY4CjbPxWSvlwb4gh7VbNARVhIT1ZK8lDZHvh/sa+2O5OcoJbdtsm5fAj8TTg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790622067;
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
	bh=5TS7H8i/KuqY63xpty6qC7vwjbTDcsWrXUN5TQk31oQ=;
	b=iUohN7HNzVGe/j1jhX3eTkvJixWEJihr02j/fcJX4wU036MFxsuNv0Kkrts7cWMYuwSV
	 E4XGs0/hrkalPig8hCwjGsWeg0Sau8rujM++o74r8OaFT1EsExv8mLKlSELMkKVCys6Il
	 H+wdloh2VdwifYqFFivhAKuGjYTTbH8MHaulpY56SL48w3bNI6myXA+zJKvlLmU7HaNLb
	 LOxgb0d2YbUEruyt4QJt9gTwE54S4kjJkkyErnJx/xFqrCi3fKurF6Ha1obhH1n1Vuci/
	 6xOlEVLNtT6BuXVtP2i2nIZu2L0IKyMz6XgMA2RZtL7JQI39etFmkNaQOaquciJpRMA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzIhX98p;
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.49
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1CA21F000FF
	for <soc@kernel.org>; Mon, 28 Sep 2026 19:01:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzIhX98p
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C1CA21F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khrguHSCSAPJaDftERI0A3LwEHXAIThSUhWrEUzjfLwKdPOi0PH+x09twB8gadFmohsG/6eiTMZRyyrwI+/xv5NhL0q0nEgruYowpPnzFjOkGzrfiiEvWmTuS5Bfbl35bdSL1rbbeXC7b8F7dn8SQMMp3ZuSvAA2OmBQDRB6eZtOKlup8WbLaYMYT4Wdgw4OzfyDTJ+pI69Q34S/MexC+vYI58Zt9kGneYqVE3nbVZCr5o8WDgcp81GtpmNPPyiqV1ZC66O/mdIpdRxufkNIML44DOQ5f92Pvud57PKUAJ92LqPHhvpWGoZZUzsu70SkJnGnjfvGYgGLP3C2KXY37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TS7H8i/KuqY63xpty6qC7vwjbTDcsWrXUN5TQk31oQ=;
 b=EcBBKFxw23ICcRvHroBzyEpR9E4dwun/xzEShtsICAUo/e5oIzSY0BLDcO2F6WHm6k2NGohENlm+GOn2PkWmC4ye3/fSGxT9QugVal35u/O+o2UmPOkCwejj42cc6nrsPDRgJctm4kluWt+3UYaait9tglco6AVFxZ0NJip+aLkQxofYURF6+XuojcpK9bFmqnhh47SCsYFYJWJIPovzlDwVidwWT9wea+ZfUDm1gwSjN7+WYnv9FkiPKPIZEGjypgQbFgc0dxvQ4VC360xKCy19eoSJP1xOa5FTDfsT65cx9SXOtJy8qXskJEOawqXckFldcq5YUsU/QPqvASJnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TS7H8i/KuqY63xpty6qC7vwjbTDcsWrXUN5TQk31oQ=;
 b=vzIhX98prB8XJrokxCfzHQwqBFIX4X/2nWORXi+T5TwzzSVziWsXqaJcN2XJS0HZ7s+4MELJp5ywxerRQXv9Y8P6MXEgVLPa+TJp1w1PTWztLqK+revyPEl+g0zWlEOFluqTkxqA9iKLlWKQ+kVJhpqYpzu7uosK0HdWpM5C1UucWsyb/CtzVVHXDqiag5AoGx/uud6pCvMM/Jm8pKsYcoSL6WNHHzOFWZzh8Mti+j9BWuDhs0fa0UvAgCCzCKpR1ACG8gcZEXIlsyvK4aFyW4YN80hmacRPP0Q05q99pLawvRDf9fPNUUtA/lH7QVFVy2E/ApDZBAW7FlcMfOPrIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:01:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:01:02 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	gonglinkai@kylinos.cn
Subject: [GIT PULL] i.MX drivers change for 7.4
Date: Mon, 28 Sep 2026 15:00:54 -0400
Message-ID: <20260928190055.1994853-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10524:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8e2393-c98b-45f0-44fc-08df1d92d770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|260925021311599003|11063799006|260925021911599003|260925022911599003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	K2/pk2Et3Ahl+tCY6AQR6oGiCErHtvuF2i+OogfhwCGNMSD1Au9MHHPw1Qdz1hfbSmJkB2DMFLwjsloULyj4Xi8CajhnoEu3TM35YeI8IdQijnoEXck7n805lh3cfB6Gu0DDpzs/UEm75rn2Lq4StjYvjjQaEiOL2WqxhifLWWEvspUffRn3Im5/LtbmqhuiWIOstPhA9qywnW6k6mHLfyHtP+J1xrKPHGYkobowRM7gaIzPDndU3BYFxSeGSnTUWZEkSCEIMEBD5ziZS8MES6SqiG9cI+gHGEONAC948umfML/hWq4A2jh1D50+hL2CIBe8V6kI9aExZNPGbVoiXX5ClF5FKGqS7KGy5V+jR4JOi/g/ncKpoUqKqs6ZO68A3GNX/3/9VMSHk0GGUqySWtl66IaLcRLbErloZk2MbluwTTaOdSjF1ZiVUrKWktl5TcYU1gQkzGSjTCUOegbXcwGFl+2aIt42t7HuwKa2zHQV55T3O3d417z3K7JpuAKexgyVPKODNHCC2JkXnvWXjxr5XkjqbOo7EL1oe4AkbWTtOjUWxmgCwZafH9ddeDYNlQLZnyIEIzOxfX6Y+N9wJukCf7XgKolmlCsDiRnwmZ5A1QeMsMD/eJkK4XHArm1HrK80LJYvTYMldmDLeYrhQMT5mfknHWKBxT8CODqMhd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(260925021311599003)(11063799006)(260925021911599003)(260925022911599003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rCTUadmu840J2N0UKjD88/QNhM+AcZpXHpOPEj5vfu0GKnk+w488eiCHm3T?=
 =?us-ascii?Q?j3oP40vXi4zg4UxOEn8SN9U4aGV6gi2vt9JVvlx3wHsolNm6vAbXnC2GzAbl?=
 =?us-ascii?Q?ePEacz5/mVhTuQRGecih5rUIPukE4S8Ibpnp5hETg2BWcc/Tey8GfgGtRovn?=
 =?us-ascii?Q?YiHlVgfgYGR7g/Rd6t9IaumJg52Y+VNnHYfH0BVcdhGhbqbNv1pJ5UlZ8D4f?=
 =?us-ascii?Q?DIXFGZVbEqiQDMbG0DK9g8lk/NgQCt2BazK+VEVJAgWxKZ4iRSJFWKmoRm00?=
 =?us-ascii?Q?PyH6Q9NU9MJHAkxB+/msMxRpfy9Aze+GJywTA0jmXzGARkBNeIDw2dgEybDY?=
 =?us-ascii?Q?ZfW8HwVPQXt1Vnixtoq4Az1/cFKeHJ1WPfvpvUQ+9LwQtWAyvE7HkPXytrzZ?=
 =?us-ascii?Q?1Qkgo9dGmBRWF87NBe4cuWULHqIai47LbjfZFXtE0F6Qk3TI+GFgnwTQN/jP?=
 =?us-ascii?Q?IMJg0oHCclyHgn6EDwAAQjE9WlojOCidF9WhYtMVuJP+bWh7es6jA0MBOq1A?=
 =?us-ascii?Q?AEW3etLzSNcTT3k/dtl47q7yQxJvuLkvRifjHmBdPtPxv8yag38+fK6pu5xH?=
 =?us-ascii?Q?bQKDRYXaC0AJf+pusuh7QHnlmHDCN2KupV4ofY1dKsZ3rNcrs3oZ9B5/ZhbD?=
 =?us-ascii?Q?Sb6JUUlbN2MBhCa+I9JsWEw1bYCV/fxM+/bTqLaUrEiS9tWzFka5gO2m4FSA?=
 =?us-ascii?Q?fFPiK6wEf7dqSaFxspkmh+TaL1I3USVS8ToM0SJ0T8iVKvCMLgJQ+EGJFWEt?=
 =?us-ascii?Q?5vNfg8ani4heRCaMD1yFxcc+6vZ4s++rxJwEt/W8sxf8wIh4YkI6E9I8KGsj?=
 =?us-ascii?Q?cjQZZeRS1I0a1akrl/TrfByo7jtEfoz0z5/NR1K7WwvvZQPez2wlSEGmHHF4?=
 =?us-ascii?Q?LlxBxi+8uwqDoKfYQOPSBpkkIjmRi/e/3MpSXM7W7cr4EGfH/HZTFDFXjMAn?=
 =?us-ascii?Q?qBFUln8fyKS61EfmCm4n+tREtzZF4IWfIwOQ9Nl+3oqO96GXM5MN4NBWgExv?=
 =?us-ascii?Q?mimmkDZKgHTq02rKOWPtPI6HaVsBxmz3WQh8tPzinPLzj+iDzSzpCYFHBYmx?=
 =?us-ascii?Q?vjxPrscENtdogaA2Hz2YCKGBIQCiBwuSFDIP2Pd5FlfIixlE8+LGmG4wCBNX?=
 =?us-ascii?Q?SzY0m3X1X3yHWlgsZByPQfH8lFUbMTYZSTUPBKTA3WG6uAGI5Z4m1dnqWkAX?=
 =?us-ascii?Q?WdqVoszvgSeQbWIfXlypgTKma3l/uzk8rAAbtWkkqrh/FQlSSmZRGC4EqIyL?=
 =?us-ascii?Q?QWJWFktIzi45vbj8xiY9zv+KJFE7iB0/55Ma6vfpLvyn5fWZqcFJwft5WxoT?=
 =?us-ascii?Q?1pYQzW+E4h7urFN64G6seC1L71nE8XSg6tSTAH1JbjZIlIY2ARh3PEUbzosn?=
 =?us-ascii?Q?Xx5xoELFPGwZ9Unrns2gN4B5jfSotdlYP5OhNY5qyV062SSWRWFOrVnLFfV5?=
 =?us-ascii?Q?4Eo8I68A5a88HIeaA6N3kX39eTFjCzoix46w14t8aGFWzNufIXakZBcsqZ3e?=
 =?us-ascii?Q?lPjKFuSaMDHa5gEW/Sr4wDpotpnPyifeiU0Z/M5snMfF/DcznycyY1qC6c73?=
 =?us-ascii?Q?utvEUdCvnGzpEm/KEUP/r7eGqOp6PsU4LOfmgdPZ7MA+KG7i5a963yhyIDDg?=
 =?us-ascii?Q?WQzzJTNdgjVBedJFiH2EB1YOryM+BVa9sEmeISTfxrNHBUPaJopbsgqYaDFh?=
 =?us-ascii?Q?mILYZFYOYOnKPp2+zlCJG9ZgCs158MCF8IxtBZ8Gz2VQdMKT6B44ojOgDEIG?=
 =?us-ascii?Q?BSMin+BvN9JtFOTZcDfxXeanhLllqqpBoClzuISzzVWnHyisLIby?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8e2393-c98b-45f0-44fc-08df1d92d770
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:01:02.8761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ilW3X4RgZoAu1nScuuj6v9eWKfsi7hVXGdXcqPRDgV0TlTKKm0e3ex1aJee3RUKlREo7/tcPg7qHYMCJiTJkrSxH1Dg0yLydbQuMaiBixKqsbLTY7/5zbz5Ql26Acvn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-drivers-7.4

for you to fetch changes up to e3631d0242842940f9e902afaea98202e56277e8:

  firmware: imx: dsp: fix mailbox channel leak on kasprintf failure (2026-09-14 15:38:00 -0400)

----------------------------------------------------------------
i.MX drivers change for 7.4

- fix mailbox channel leak on kasprintf failure for imx firmware dsp driver.

----------------------------------------------------------------
Linkai Gong (1):
      firmware: imx: dsp: fix mailbox channel leak on kasprintf failure

 drivers/firmware/imx/imx-dsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
