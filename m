Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5C492504
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591538; cv=fail; b=hVL67TPBI55BBnoGO3vzyTTrvgrsSXnIJ72ARaU7TJhoT0w1oppzEwjZ0TWteVx6y06FULchsj+bxFn7R4KiQcNw07pHw2hU4RHn3i5w3aJoQezVsXY87mCcWx4/X22mz+uXEsTekZmLZe4292o17Gvtgy9jCJvJhTNzh7aO5/M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591538; c=relaxed/simple;
	bh=bQ0bcgsmXv3QNgD/iz1Be6MSAyk0CSUc78O3tTNBPIY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fE78cKXcU2Fb0TJAXrICZrSJmh9uSx0HX+IgTo3+DqizpMKmhrYD7u0k7Q/tUSxQbkQRphSj0BQuAhi56h353eoh8UvfhiiytB9wCZp7PCOM0g3W3D+xG4A/fWBjUusaGqG63jsQ4ek5VHZ6khO/+5TG3YnSQh6UO9VP6STC09M=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V2T+pvxd; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V2T+pvxd"
Received: by smtp.kernel.org (Postfix)
	id C923E1F00899; Thu,  4 Jun 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780591536;
	b=qqgO0KfWeTCSo1rIAsmBN7p57hcYTU9vHR9FdinakTn1dHsMYv37U4cM/yErFA83JwAr
	 7esTmjDuaiXY4rNlg0ulIzJ7npdCQzZ9Ksroxoi2C54m96nbTbvFyL5yadmG4btfPNB+K
	 JoW4TGo4bIWVfk478THTeBxD3rh3Z43muC+BDoHuA9eBid/0EdH0BAlLuE/dE9d1CJ5Hr
	 oCA78patrITADocJ9rv0w0KnTDSWHukh7MMo3yuPlrRnepOLljJrhYS1I83NkRLV9z54Q
	 0zzOfqLvxkuYkJVl6SoGuCqQCx1pso8kfbo4X7JgODSp3dEqNx2JSqMBQvMXaznZTeQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780591536;
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
	bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=;
	b=H2ozNb0kgY7FpbFBiUiymA1isJv7TrZtfWi5BfTxZQVNOiNjFmbt9WcG17icJ1JbR6Ae
	 slULPJkm3oRPShJ7IAYaYqXvBEEeSKxtYVPPEfFzMKuEwZhoItLpFFnQQKtNdVZ9WJDwx
	 bQSuU2YzE/2BuOalH6AzXERBjfkS74VJeAZLZII2vu4mcDMIfzsO4HE61NCB43RhDQrK/
	 uoJ/GTwtb3sgAI/CPgayeUyaRwCKXkLbaDeLvTuOVhPBHWlSLGuLAsCIIZ5OMDjEQzdsx
	 8C6alyZXSw0VANRFNaEDop63Av+uC766awhnig+eEftYvps8M72e4PhcVG/P75p92FQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=V2T+pvxd;
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA6AC1F00893;
	Thu,  4 Jun 2026 16:45:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=V2T+pvxd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EA6AC1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHGHIidnhyqYO+v8tVMiKUn2NG2COFE2M8rDSgVXXVyIZlBf8ZfEAFMkPq2Z6Rt2IxMRWi+AQMy9TMyLBpP28beD1QbsqNFOvAcUiXB62Fem1Kr7Atk9KV/E6YVUGwT3l/RsacJcnCdMiNOYuifYrWJTfsxQK3hOqk8gTVPAZYIjJcxHl7CvV2W9/Lmw+sWzzmNQM4vhts+Xm6lGmDGa3rsy6xGkm0JNfFiBHaURUa05hBIhRV4h1EQRWYlptimYzEbk7H3XHeD7M78jUCUQLb83dyNkGXvfgASCa405K/g2V+HRvWpT1udnfCnGSQJjyRetss3aoTOhsLHoB0B9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=;
 b=lNbAso32nDyekqze2E80pkLeay7dECSd+EtaMZz6jwwgpECtlZc7QNBbSmhzdq1RcykYnQPJlpvzsOLRLR/f8GasNR4zOFkPVf8xxNzlf+wYj14KY1pBPRQZOxuVPXIySzRzFgTT8rOKRuo/Xj5+dp4BrcjJBGxdGsX9I9uIcGZbPYBkDnm/AmmNgzz3HKrYCXK4N5onWulQi8d2Xi8ZGZ83xN2V93LWWBOeO3q8ZZsQh+bJCeKBHMKVxKcvK92PU8+MCkxaBatG4xVfEcLchen6OvHl/mNAD4bgHj5QUgrtlB94y3cyLXb4ByfgZWWnNcE/R8JtBqJDArkqr2tZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6nceupwm6moVEiGodccVLoUJ9ioEXZr7OGItloGoC4=;
 b=V2T+pvxd5ySWpgHeRpiHT1HNt0eaOoBxr0duaLgYfg1wqogei4INWd+uyrrrmRaftb+JyFtTnEsPDFrLkdFiUAlg2ykLp6lFQKoAE0gc4x+Nk6RX0rwsh/iNz0U8oFEbsC9eBYTOxjQSJwYbwHkdUuB+ZiNUUard2qdQ441zLF1sPZghGIfkJ+5T4K/VIzrbShVzOVKLhjgo9c2dqJv0Oc7OULD9k5mrfosfly2NU/bH+oh1/fDKeo2kQnx0wCJNEgQchxXuz+koihZNMnD1pHfOFtnMyhAwFAw/yx/2+Y4TIoq+6AJ5JFm9+UIs2rgLC6mPf0UUhKLDAuIV73pz8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10347.eurprd04.prod.outlook.com (2603:10a6:102:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 16:45:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 16:45:32 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX SoC driver updates for v7.2
Date: Thu,  4 Jun 2026 12:45:24 -0400
Message-ID: <20260604164526.1612520-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0055.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10347:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f88455-9ccb-4382-40c8-08dec258b138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jhvEOSmZJVDs/ZSccIje9eDvuuwATtQGFB48HX6W9r3NwoHMYve0fhHKgwojBWj7MwSyS1kzJUHmreUebCeOM6gfolf4lWFnyPGM72Th0K8OHaQhOCMqIQ4c9laYhfioejOuA0/4OqR4bT6jAa7ZaIJ9zO2UAHeiuMfUKtlIiw9blWTHxC9JeD5EPadbmPM/LNUeB/k0CtIWxB3CTNujV96aTOwwpX7t7NFz0uXJNA/02zS98nkfSIWopEXVGCwvq7TiRIg0WKqr2EasK+HgPZ4+3suvtz6+7mbwOAP6uD/WWyWJbHRbuR6bFu+G0MfaSdeiwinWLLdifICFHvea0sHd3KQurZAbeeL6j4nuhTUGzdzRrIKBWTYVB5e66H64JB6FjhVJzr79hqyvc/Ln0nxAeI2bNh/eaDz9kfMLF2V+ONbMUzJWBRm78OIMrD1BsVmAAf3e2en1e9DKW4uGMlgn0nVAyh/pOzp/mpri+ZKwPR6W9Gx8UISJ4Jm30VNOC7COxTtJCl6/JGQeZ3XB8pf7+hI3twmyNE9yCuXo5gGZMsO7HPaa1lGjlVrN23E4DVxRvt3wIbv3So30PMQ8Bf2y4yL6FcRTZhhnMYHZZKfDNKWMbTocSSweUsgH/uhIeo+bLDr4FQ+xU8RUimWW5Mocv2egsohTQQifmK8rmd1S5VWXoDPCh7IYEzNaLani
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xa6QyddlRnYmGpi/GusMjxPGHcxXya2Ow3btEmlPsTBWUPMSgJUkUgIN6IsF?=
 =?us-ascii?Q?V/mm/JpRwIyO9SbtuDMNMZTVVCPjUCfexru/twMwOJHJadwCLqU6cbIs6KJy?=
 =?us-ascii?Q?+1OQxuukYT+5Ncgyeq93avkTXBGdqQOCOf+aHww55Pp0GC/D/n4TW1FHyZzN?=
 =?us-ascii?Q?XUTUt89ibwj8FHD8Ngg4fwa2pjzlZ9HoXgBMpDapW8VMKhT3CMiN78uxOaCy?=
 =?us-ascii?Q?Tx8M4oJ69YWuAkV9sBSn4ULtj8954fkjY11s7VFjp6EFIYjPepNOfbs5vFTG?=
 =?us-ascii?Q?vYdF/oKqZRxTjxIeJRa5/ekQzs1fq4nDvj/HH6JGXSj6ssB3Jt8gVl644D/d?=
 =?us-ascii?Q?sGmxLD2xTVhBW8Shy7oeEc7Rbl5EmToi46OA3wW/zapNGKOJcEbyNT1PEl9s?=
 =?us-ascii?Q?n1Fl7gjTHflUh99DX8GKxS+tt3CATYUntbUffPKXLiy0zYgbX4n5XltMCJXg?=
 =?us-ascii?Q?AkTNbfURRTT2qkrk7zfM8Nj2jFzN2cbYqxpZWiAGzJUAg4he18FyssSQsBfl?=
 =?us-ascii?Q?BphnGzQA16IS0AhXfo+Fij55gs+Rl/H5I1SGBJJGgsmtodCyBb3qg9pBesuL?=
 =?us-ascii?Q?i5Qlz72CtfjgfaDujLyllLUdZUWCHA/0yvxwGSxu/pq9LDZGrwwXTGNUOzCC?=
 =?us-ascii?Q?7ivY27rGSwWJPSC6xYW9YLyGbtNc+PRvCKRSPbxEW8c+048mXBQfDIAkKNLt?=
 =?us-ascii?Q?YW2mK1Oy/FJgGVS2DNKfZhI+WScKv5wG23V7ILrw77qdenRTZJjxC7vr1ttr?=
 =?us-ascii?Q?IQR5DpKXYrvrHp5YetKAYSv7coo0hgbzDHUlh1zMmX/g4efgKgP39BXAYf9M?=
 =?us-ascii?Q?lacJuaMnG8RbbfYHd9dohxPp9Bb10okbtv+YaIuV1iKtVmcwe/eMUUdZzeKv?=
 =?us-ascii?Q?j+Y8/bZ51w+J/7TFi3DEM2FuexNCYx7mfUXUK+Sz/mrplVJL1OZsq6T2wrsp?=
 =?us-ascii?Q?RC2AbLiolyz+2zxOlcwVwxXW2dnnH6l/qW3YSK+vWNu0YroTRQbyRSHr9pab?=
 =?us-ascii?Q?s4eI4f4Uy9zq0wuGWFnDROAoeX/rxMEGO0l2TteM2TKKKAIU7nmpR/MKLVvg?=
 =?us-ascii?Q?KeM3qJheGgalFszsTSH2S0TPRzWhZBzgCMyIPqVHqYzWqUldLUEuePD9HsKe?=
 =?us-ascii?Q?DoXzxUnHZWnduxQEDhmNVSR0XA+HVHuzBBIqnLOv83xRvANYYYZIuBMUcJWv?=
 =?us-ascii?Q?FKS6vvtr3GVo3lzkxvVBzzqquKFtELY4oLjpYx3yRDZqrShJP4HNjnltKOy3?=
 =?us-ascii?Q?mQW/119U1edfmiYClSHejJzTTxG9FY4npAcxRYJD3KGZmEDKVHlrlK/TvlS9?=
 =?us-ascii?Q?wsW5YqdP0Jf/0ymysHVBM9So4JzGZSEs2QEBbRoDsA86w6gtUY61CVxfPuho?=
 =?us-ascii?Q?TM25tfsozd7ak/vSP3YTdrvOc4s31VXAgx7gBFHIGncubpEXtklFxXB+VPVP?=
 =?us-ascii?Q?9DnEeKzBn7nv61bY8YN0Z8zHm+kIir93BANvMkasqsNiWgyyq81Y30thcWrZ?=
 =?us-ascii?Q?0/3UPbSo2YN7hc449cWkmFpeQnKtTr29Wx3lKxE4hX2wu17Qi9e7kmYLzTbh?=
 =?us-ascii?Q?pHDOLeCf3ApDLmbkUGzO4j3ZYU6IzZm8kLH6WGD7o7usJs+cpjMiAssQT9GC?=
 =?us-ascii?Q?+mK72UidtqgiSwOB/j2uUk5QkUwUd7UpzAItTt07tD9kjsMAW2ciMaUfqBhv?=
 =?us-ascii?Q?5w7ZsC0gQOGXPiX/i0WRoLEyS+h1krXb+JaoibrYcXeY2QVKvhrYJZy3TL8G?=
 =?us-ascii?Q?wgKDF240Uqayy1DVAWoa64AZNTiLQzs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f88455-9ccb-4382-40c8-08dec258b138
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 16:45:32.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bd4va49TF2CbcCR4nxI4bEc0kvPFcBXGz0ohIEWzhn3TsLIjfu+btCV5sYYLjOpuRBSZtTfd+ld1xfhncd5M5Pkeez07EL5kqZLfTb+mVjRhxcwvdJ86dUZDlYJKHT1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10347

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-updates-for-v7.2

for you to fetch changes up to ccb4b54b8ecf1ebafef96d538cd6c5c8455bb390:

  ARM: imx31: Fix IIM mapping leak in revision check (2026-06-01 15:58:13 -0400)

----------------------------------------------------------------
i.MX Soc Changes for v7.2

- Fix IIM mapping leak in imx31 revision check
- Fix CCM node reference leak in imx3
- Make scmi_imx_misc_ctrl_nb variable static in firmware driver

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static

Yuho Choi (2):
      ARM: imx3: Fix CCM node reference leak
      ARM: imx31: Fix IIM mapping leak in revision check

 arch/arm/mach-imx/cpu-imx31.c  | 9 +++++++--
 arch/arm/mach-imx/mm-imx3.c    | 2 ++
 drivers/firmware/imx/sm-misc.c | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)
