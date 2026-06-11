Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EF22A4E1
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189364; cv=fail; b=a0ZYytLzocDNSlqx5/dZ5eh8wDc77xiBKVMymx1HHTdbadFYwAeY3tAXf5p+sccsRfp8d9v4N8cM3XimuPH+NVINfUvgLorTorCQvZrICRGvWo7DsYTKzkx+ipyfnt53gYZKSjZ81La3qIpmYOQssMJ7EoJRz6LMZZGDWz42JsU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189364; c=relaxed/simple;
	bh=yAR6MZ8E17A6aH2rgIP7kSUTW2gGz+Uja+frbh9l11I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NXRm5eShfjsF5M554S/jjxbNSHn4VpzmmIfN+PqZud/ygQk7x4xVgfTtHheqmouG5gQcxJGqOYykfGnCds42PRjbdaAB4buXB4LZDwhydtPhzCIlVTCSHgIIu3jAw7A90OQsLkNSXwc0Ox7Rs3LdBZ1bzR0/Ybqj3DDPhQifYd4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TxxCgGaY; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TxxCgGaY"
Received: by smtp.kernel.org (Postfix)
	id 15AE91F00899; Thu, 11 Jun 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.41
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781189363;
	b=1MhnHMOnH4YelNyWjPjl9UD1HxMq8uhLzK25GO4/AX9H03iV+HpZ+QyVnBJEmaqVG18g
	 6/nAXwZg05rj44S0z9zi3wN8rprMcz6NabQsb8Iig8SRuQtCZvskBDgC/lnbqJrFnjmwP
	 pNoB1fVl/stljFTWk0fnB0FzlVRTknbFGeXRUKOsDXKGXDiiZdVHlU70uadvvl62NuWFM
	 h8bFsgKHOnkQwvN4lkpktHqa8y8+0pDyQ+gPn21UDYs1WEXkL5OV5qRjHdNv2Sk8gQ6BL
	 pnr6PGkrk3u0JnskEyE/PjdsMskIknwNG2froD2g5Bm3yWk4P6SHEI9vHO1+LN3ov+w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781189363;
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
	bh=Hv9r+0DBIdLpsuTjNepGhf1KDFz5dqPIJTxo4LFXEeo=;
	b=srzMjueXskFVvOZIjsQ6jvlpovnBdkpOy4hu3TapD+3jDdyK0kV3i4dZMTToIY+kWicY
	 UccAVk8xlRLdWYbVgz6+xPA+BN9ni+eu2fhqCkxf7G/Y2POZVMmIojQQ6xGaGg2FmE5tC
	 nWIVlAOj12NuQWhvLFnwtF/XwJgDyWerZdjbS1cuNos+l0kP/DHoqe57TEGxnO+yNurYb
	 0bLEqJYYV6CYg4UqqIn7kyQoUO6aJU8Uk2/cjCnq5XDBlE5auwbVHfumCJt6kksrUbDrL
	 5f33tPRkOX3p/Ia+o80QpUjG4uiAA02GB19/kxE8nMxFi6luwL+B/c6W+QSlcRPwCwA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TxxCgGaY;
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.41
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52BE51F00893;
	Thu, 11 Jun 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TxxCgGaY
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 52BE51F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKTItno0AlDgXQ8uiNSaemlH6rIcDekeUXjFNmigZCm5ObeudYhaccodPtFHPHMkkyC2JngOMjZmbIJx7XQ1avnMowue5X9Q8cUGTtagKDZNmiN9q6xipp4pUgoh7PFgwW9tGZT8FnMYT/j993uevoDtc+ZUp4sBjxhex1Sg4kgtegxXjUwyh66hvRhezDv8v0E+vaszLL8/Ym0LwhfUxgJDPNEDXFiUyx4mvnFsHOcrFEeOUmHOT9Kp6brUTP8A0OdqbY3YtwcAlOVy/sbzbMn6IeE/+Yl0FB9BITc4z3b+eXMtLnNdCtgGypMu29lAMVQPh8JmJlU1jTN2sz0vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv9r+0DBIdLpsuTjNepGhf1KDFz5dqPIJTxo4LFXEeo=;
 b=nmd75BFYLXwpa2b3iD0U56Hfu9IDuhhqqNjwhswJ1GsGa5ryhpIP4x9l7/nU2k2O/alPOoosMXeoqL8MEvZAfMiqmbuaGvgx8hHzAmalu5aExHbzfniCS2vDmzfqTqtz6hvlsd6mp/vtiZwu3T5hZB+YuooIkU/neeDHtlNGRKRuAsXj2tERi4QRr4I1opRIM5ewc1wn+aRmCk6/8G6JFJx5yKaBnE63P3cxKRjVDvdxjzhxVFOsqZDyGN8CzBHdTUYrEPYN7e1jCKPr2SV18wspRC1yL2rGBQ0gpPin4k/uG6zrqVo1qZ+w2XyW+OuoEoH6ZEm1O9UykRW7YjbdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv9r+0DBIdLpsuTjNepGhf1KDFz5dqPIJTxo4LFXEeo=;
 b=TxxCgGaYR/l2BMQG/VSMs8TFkfoHnKmkGKP5mR6O9khfYoT3hd5YL2AYBmQ9YdvCfZs10WmD4H1bILHfLJL8YFaBdXlZhPkl2EH5Sf3XSRV70omyL4cH4iiP7h5OMkWpBbbfeAFTAnlBb7lZaXpqOfJBR9GgU/aGN5YThgd/IOY+cVje8xWmMbb8CoR/PwJX+v9q6nK7AZAGMhH2JIdTWv3FF+l81EWqPUvCN67ZuY6r3396rXcTNhMakRBO7xyt2Kq8F/k4LucxyGJpGnxwh11Bp3nQ/4nSATlRv4m5U7YFhAr6xt45uBeln5vh/MQrqQewNa9to8r62rK8w72c/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12568.eurprd04.prod.outlook.com (2603:10a6:20b:77b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:49:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:49:19 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX binding (display/lvds-codec) for 7.2
Date: Thu, 11 Jun 2026 10:49:10 -0400
Message-ID: <20260611144912.3860262-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:510:e::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12568:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da53ec1-f779-46d5-605c-08dec7c89e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	99Xo1BeYR6wfTRwD93VlBlXX9Ci/uA3MbGnew5bIjoF7q+rc9Zmv/uRIlOUaUnFCqrwP643AuHD/d4uqktd+A+Ok8iRssVTKyVKnFq85qnzj6Z1zP63fnvYwM2ZzYb9GvfOTfvnN/+vN6o4AO1yt4p3+lO03O1NrgHr/skm/hxARXhESDVD8tVHtJC7gazMyY5BpAlx+3F2j70pTwgM8GmclcuAx6rp9uqxtjuwL2hyxcvJHmrQGlSjmS0qjfgdZiFLeib7SGNFq0KnXDxBqd3324XX6nibWESLIRuZxVm9HYzfMVRrde7FuKcAwdIfMTnPLQPTNkKHgOWDlRIdjhDHOYn5kOKwy31wchhfWZN1N9khTNSgQ/hGMDKraWnrll47RaHLH+t43WgYKvBQn97tcij+3eLl3N/uOlY814RqEuzLlv/eOTJiH/yHwkxpDGBkY0v04IleqWytXt30dieeuuFJraGM8Cvu4Gjw7YDB8E0kv3L29AMfTuuWNfTMSqJ/fVPkz/TOKVQl+SYj0tFqNkZ6usU92g3x2d9kUhW+jgEPoYzsUWXDRyNo5OPKEqu/YMiyLwZ2GgOOhAvidEusWsJHmwQlYOLkv5XfN8iw5bG1j9H7R46hYBCU4S6idR3zsJvpht1aLqy6Rr418QdYWobcPv2sE6hzEcSjI7f7FbSilgiqN96YS0217xbF2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tiu188CL1gs6WnV2oieyb43eiAPS7OPVKlPCUbVUBcdn0WlS1pkZuxtvZoCs?=
 =?us-ascii?Q?2n2qknj+TYcGChkxFoOUtkNGbdkX1U9a4PO4Lgy6nirNPGatVEs3UslC/9Ik?=
 =?us-ascii?Q?vpwksObDy68lA8isqS2LN8nrh66Ona9k5cbgLkgGVK4ZaarJWIDWH9eT8Sz6?=
 =?us-ascii?Q?X2eQEfvJAmtViyo4R7CAK/y82UpxviZBp4vmHs3JaoI0IsMSeub9/knv9120?=
 =?us-ascii?Q?yo+ozEeprRn5rsTXZ2RlT56mM5CZHmlnf4vVdQybhP6HrlbILEsTf3pSHhce?=
 =?us-ascii?Q?n6pcY635/rmwn25AXxOQttOI39GtOekWZICHRU+DeMn0V32r/47l8LpQi6NE?=
 =?us-ascii?Q?4NXaDS8OLX5f7Z/szA5mE19EQd05rW7O9aTiA5xUQanwQIJFa0v4qvb+/iZk?=
 =?us-ascii?Q?yBGTLviM8UQaB3gMdPVcu6nEHUykx/FOnnD5VulE/3gRiaQVUU6MNp6xkGDc?=
 =?us-ascii?Q?d00rbTaLL0wZZbxZ2npOTtSXgeiu4zOyUD6hlm3HiCOiOXGsPRogSnAHDn+9?=
 =?us-ascii?Q?sMK5p9yCsqsz7xaH/IRW910E6sZcUEa4bOIEmV3HX3koYA4dWTwwSmUJeLzW?=
 =?us-ascii?Q?velmn6Qhqt7y4PDb8gt6zSNdAADfGnfiEkM9qYfS1rXnJpuFgBNW6oms4UR5?=
 =?us-ascii?Q?qNa9G01XfvW1Jwp/OkeDZI2ZL6nIoNKszRyoNBNS+iZZDeM9evXxjbU4p+Gc?=
 =?us-ascii?Q?KB1aljVR4ty66uFP48HUHxql7Hn3YC8ElfRniZFcXw0WhPpe03e/90Fvgkem?=
 =?us-ascii?Q?uC4DzfwQlF4b5Jn2mYIY0zN8xURkZIlCBbc1j7XPMBXpPNJcFYfAO5SxDSzJ?=
 =?us-ascii?Q?6qDAE1nIzXIguuQymLt78VMCiaK494MRCRmep0wodMKgADtZP0i0C1N7wP/S?=
 =?us-ascii?Q?wrGdirZMl8q/r8DTg69wTAFKZG+S+9NHkbqVo8iXz1WyGO8uK9250RuFc5Of?=
 =?us-ascii?Q?FNyzK83Z+3ceC72IQ1xz7b9bNfVD0Ts/xKbyNMBLV1BXrzntJpTJM1kAZiwg?=
 =?us-ascii?Q?O4Inx+tPSgyAuXfKX5kbZow6Os3BZNYXC/PxNGKjaEtiA4rjpcxh2bAV/Zxe?=
 =?us-ascii?Q?GvdNfo5fC7TtGVPXQvH2eAB548Qmz4nE/6p7Yh+yRI9fX3Zc286KM3skZfDi?=
 =?us-ascii?Q?oN2eJQ3GpfNFeVbF0Q48sYXItrnYqBotv/x+5Rz7KYfapJRu2HHb9qLDfcSw?=
 =?us-ascii?Q?8R/PFMOXt0oZ6nIZoaDak6j5Ad5ki40sK7XTyMeTViJ0dPKVzBsevdwn+KRv?=
 =?us-ascii?Q?O1kDfkycCRG+/NDX6xa/ofpMwA+j0HkKZ3a2/yahIYqSRiPsJic5xQyB5oxt?=
 =?us-ascii?Q?Am8d5AnZ5dXGsxJcuw4g7G3Lk7p7WgMiiWi8jSOBPPNLnxPb2l+LvGg7KLed?=
 =?us-ascii?Q?6CpSg4jPLi7OchVXs90QnocHuRGCbzeSV7sjSyiZi9sfVp+KKbBhSVFtE8hM?=
 =?us-ascii?Q?uK4kQcSc/5H4tIQ/9TIPkO6MawftS+iHNSAMXVbPnkmYF4E2wxM5iwDnBgSd?=
 =?us-ascii?Q?Vh8o9OC0EP9FWAe9pHNJ8dw3I+M4LUAOnWpZCMBfnONXutN/i2Eb8huJxBGU?=
 =?us-ascii?Q?iTGuLQIC14xmrowOuMeRen1YOtmHnFuOs54m/RWLoi4qtt/SHIw1zvPwOTY2?=
 =?us-ascii?Q?yHrZstDwyz0BTa129xC7fGr6KcRDUh+l2D9A/qXBjgvRas228FgetP6U1iGj?=
 =?us-ascii?Q?r1ZNet1vU/mM5TO0314hb/O2QS3HnG5fSdQ0AEk6EWTr8plzGFXWudpE12zI?=
 =?us-ascii?Q?SKnD/+/IFgT+kSFZnhoKPx1kBhLOHuHTLHxNRk7hZiBiLAEFgmwH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da53ec1-f779-46d5-605c-08dec7c89e55
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:49:19.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V2zuKTWHuMZ37EL4SRdyJl3+ku6K0UFX3Q7BptdvCrLFpRdSNMPH8JDl7nJoSCT8MhApU0IewGC93E6+ukI1sftFdD9nle5vTFqDlR36gYVGjfb3MW26fmeyEH2vbCF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12568

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-binding-7.2

for you to fetch changes up to 88c0120853e96b66d57eff33e06409f49457eec5:

  dt-bindings: display/lvds-codec: add ti,sn65lvds93 (2026-06-11 10:40:09 -0400)


DTS already picked by me. But display maintainer never pick binding patch
and ping twice by Hugo Villeneuve. So I pick it and go through soc tree
to avoid DTB_CHECK warnings.

----------------------------------------------------------------
i.MX DT Binding for 7.2

- Add compatible string for TI SN65LVDS93.

----------------------------------------------------------------
Hugo Villeneuve (1):
      dt-bindings: display/lvds-codec: add ti,sn65lvds93

 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)
