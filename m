Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022107.outbound.protection.outlook.com [52.101.43.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1B2EEE76
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148090; cv=fail; b=JmH50ec7CgdBHXuYVTNgR1vRX+5KFCiiZDrQ7NwlMR7aT9vJqp26fRFv+orLecoQg+x82I0PdtNcZ5j30ISY+krowzbNB46BsUhKGDLLjub5dvCMYGS5zB3Pyvqt9OQ33IV978jYrb5MrHkZjN4SpcxXfwIoDSjUkYIlNLVvGHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148090; c=relaxed/simple;
	bh=dJbpFGGRlPF5l3kMJ2J1XGHEmhajnkUktzeirE8/BiU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Umo2PVoawQTQNjscooIzmE7o5E88MawjgJaiQEAzbn4q5N2oJoE8PEwrHH6+guf6PF+Q9L9js0hfG4uFOXe3fQ03hU2z3t5Sqgkc58WbZ4w2VmYoDuWKcqg9HN/zT9obS+Tn9VdocMe8oTaC/V3XFQrpHimLV2+sVi6okodn4Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai; spf=none smtp.mailfrom=bst.ai; dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b=WJRt3Edn; arc=fail smtp.client-ip=52.101.43.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bst.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b="WJRt3Edn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mde5YPfnJY54zmYDsXD7lJ91iQA+iqxDESQP+FBFe4OON4v9C8T7eWqpsT7N+LWKx8P65qg4fA1U/RBaHHVeAtLtjdSXLYHjxvUkJoJUzckXUsVztqLB0ocf66gq5PDRLXjPDuPWAPLLHki8qqsGmMZZjjihW7a5Jrfv8bRQJZ5cazvhvAVfCNKd2wv1TOGBJPLV62VxY0MyrkQ4jMhuyMJzSOgRgS07cGHqCpiElkMDuCGFAXDoVgyS+r140dyuforMfnvgP3LLo3seea+HJLZ0Cy+vg/Rs5jR7VrtjY773UAr4tWN8/LVoe0ZktYgrGmamZgz8tZrRDo/sNuO4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=MvBbtsevD5Zb6XGs65VGjIVnq5uxXqWcQBtp9gj4Dorq7IRoVFmxigpA5tyC4p1wbarqfMeXDPjBFh9CR5qFDoWpRpdVmo5ffeGp9VlnxpRkJobJHjEJt03MEQl2EloZWVCQTPJVU9h2juYcwQ9dLgA4xzHMvB9DhV92o30pbYUVq+H+wqwFI03NsT6M/7w1TqVgQk5ADnlhcF7owufTxjR4jYQuOx3UZdyPkenjSldrEdqYhYuSnUrxhteZWsoowDMktWvAl+W7LZftC9AAdZOLFL0Akqj4m/wjGQAiOiwF+L2gcTcNF5qAc2gVkxUtW7YyCI3X1LSzxU66EXBcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=WJRt3EdnJcWhpfx4i8bAikv/hwbMJ/FtH0u/KfX+vacyJGdewrxb5d/Jumbidcv0zr0noJjNFlmjLSD17MoxDy8glyKOA6OjokrEoB9jCfaFufiunfGPtN2s7XBQKne7l+nNVP8AZVvNDe60ivoFtHdb4PZgbj4KBgAV+adSM+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by MN6PR18MB5416.namprd18.prod.outlook.com (2603:10b6:208:46c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 03:21:24 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:21:24 +0000
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]arm64: BST C1200 eMMC DTS for v7.2
Message-ID: 20260611.111859-gordon.ge@bst.ai
In-Reply-To:
References:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:21:21 +0000
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|MN6PR18MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bdd773-7370-4b42-03e3-08dec7688474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	D1dtj9Pus50ZXKOsYoVf8D4mJoN8ux/DzE8efLgOiQIYwNkM5FsTWSM2JaBXCdw6GyxJ+3wNi4Eknj2BUv97ksNNfsBICOK5FMTNI1wd2bKx7i7lrvrVZBNsN9gE66xsIiK7ASCqzpnGsHiGt1p5vuyRz04vBNeQc1UK3m+KQ6R95Dk2nr51MER6f79wES2KGKBi1wSgHmVQxj3QHszDVxjaeuHKq4EXaIlLY+mfnJAoYlMwfW23NJn1vjh+zH5LOO/lB6JbKnq54roYNawOS4T/UgMf6jonGDi/wkvjfCL5zpOpJqZqq8LpJ87hJe3bTBUH47o4TOaGCERns9iNHQrOeGB3t/yCMADmqXRIXyFO7mIxhRC+834Ze2bu2mWTDxQG4p2pkjzQDwcly6roCSz8+LKl3SeVTq04YJxJ+GUOHLPP/v+H3PuRkJDOvBveYEKGH/i+QYvHskZ4O5DsmosTm1499/xBMDIAZLrxSMb3cDUCv4kSt1W1jJvbgdxN4cJCkv1ifAdtuoF839YpWRyKbzGXMzs9dMIDQI8gg7u3aM/I7yQUdbWLmDNMrTjpsiZcDmGuFk6/4qfzz7I5px7JWfra6hhPHKUVsdhDs9sQFtE28lVPGT111vACt5tbAweeDAf5xSzksC0UMQ3F5RjZqXN5ofJdVJNIC1Gytfz4I/Rtg7NjUp5TPvn5i8zk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjJCNmRxc1ArZkp2TGoydUl3UUpUQ2J0SW9qREs5cnJ5emJhZzJTdWo3Tm9r?=
 =?utf-8?B?OEx1dFpLTzZmQnpvcjBLSjZOeXIxb2NlMGRyTTIwQThoVTR4WHlsR0htSklO?=
 =?utf-8?B?dmNmbkVkRzNDZFdnOGRVNitDQTRkRXlTKzJVb25ZbEI4cnpWdFlOUUJMMVhN?=
 =?utf-8?B?N2lRS3ZMRDdUYnBLQStXNjVRVDE2WS8wbVB1UmFLb3hRb2JaSEdPL0k1NFJV?=
 =?utf-8?B?UVUrc0I1ZENWSHRjc2ptVjg3KzQwaVJ4enRFa09HNGd1RjVmWW1Ma29MRC9w?=
 =?utf-8?B?blBRbVR1UjQxOG1KWmhQbmZnU2lPQ2p2Y2ErZmFmMWJkK3lQZDNaTVd4bzFF?=
 =?utf-8?B?MEJHVVE3Z0xTMHh6SWtENENTZXdSb0lXSkdscFZSdXVBeEZ1WjF3eVprUXow?=
 =?utf-8?B?eU85d09ROTV0enZUbW9RZktTN0lGUGpFYkZuSUNYMk1kcDVPcjNDcllGa0lH?=
 =?utf-8?B?QmhRcFFZWVpIM09lZWZIcUZLWEo2KzhPZjhveTNteDlrZ0FTR3FvNkYwVXQ3?=
 =?utf-8?B?c242cVo3TzV0OTZPcm1ZMFJaaW96WE9hNlNnNmEyamExSEZxVXJnczhVNGRL?=
 =?utf-8?B?blZWdDUvYlJXU293R0VuOFF6RlZPQjJIWFVwV3FVV2JEQzg3ZG1UV1dIT2lM?=
 =?utf-8?B?WlJWTG92cDVhZk5ONGFqMVBTc29odm9SaTl6dWZvVmEybm1pZFR2THhnMnVo?=
 =?utf-8?B?NjYvckRqaUtzYUR3V1FtS0FBWkh6cm93MTRzUnpuTlAxNElwYWwwRi91Nkl6?=
 =?utf-8?B?N29oQm1lRldycTRFRXp4M0dMVlJxWlRjcE1wL3V3MjJWd3E5M3RFb0ROMnFy?=
 =?utf-8?B?UWN0cnk3YjNTQk1KL0ZiWjZ2TGJJWTYwUXozRU1jWm8zNm81bkxSMC90eGdQ?=
 =?utf-8?B?L2xEdFBqQWFMWi9URCtlbUU5eFNVMXpJeXB5ZCtXS3F0S1BBaFFKbk95ZUFB?=
 =?utf-8?B?OHZCMXV1TmhoMm5wcXpuNEwyK0twVm05d0g0VVZmNEk1SmZ4QmdvNXQ0NTIv?=
 =?utf-8?B?UjZsdjd1eS9ZY2tJVGplbzh2MFdWczlaTTk2YkZHUFRWYU14L3VOSFZiSThy?=
 =?utf-8?B?NWVrWjdoZXExRkpTQ0RTeWJVNWJXVHNjQmtwZzlyNFlMZ0dUSEhqM1dpV25M?=
 =?utf-8?B?MjhQSndsLzZlRXpOdFcwbWdjQjc3LzFsMGoyWjQ4TnBaYXVDVDAyTnlSanZT?=
 =?utf-8?B?dEJHQytMTlNKbzNFQjB2aHNqb0NISUJUMjRNckdPZnBFODlMM1Y2NG9wSHY5?=
 =?utf-8?B?QjZVS3lCRm5wUWg4Z0h1bFdKMnMvTlZPQlNqcFROWmdGcXFqTkNNTTZ2ZTRF?=
 =?utf-8?B?NG4yMVEwdE5xckc5WXF4ZXAvelEwMFgxL1lxdXhjT0VWUGdaRGFvc0lkaTcr?=
 =?utf-8?B?YmVYOVVmNG05UEtSZ0lrWWN5VzgwMy9MbElGbURCblNyalZpZk03djRiWjBU?=
 =?utf-8?B?aFZGdDgwL2p4VmhOcGlsOGs5QWhXSzBoVzFvU2dNRzl6U3dFVWgrSUZHZ0hv?=
 =?utf-8?B?eGM4S3Fxb1RKeUtBc3VYbDlBN3ppVitjY282aG01YU4zSVdxTTZBaDF1emth?=
 =?utf-8?B?eEJqQXU1cHpnTS9rUVdHVS9MeWk0Y0lOZlVqTVhPZGJHcmdXV0dhOUlYaHBQ?=
 =?utf-8?B?Q3VZbng2S0FpelhUVmgyckdRU2N5ekxxeVVROTJGR251M0I0Q0xzdjVpc1lV?=
 =?utf-8?B?eU9BN04xMU9XYUhnVmtmMVpHdTdLaTU5YW5KNHBKblU4YW5JVzJRbVB1ando?=
 =?utf-8?B?dHBOWm5GUDVGZUVFdGxBRE9jbzFwbmMzYjFRS2FKQ2ZpTmh6ZStiaSt4c1pU?=
 =?utf-8?B?alFJREIybi9GRkhqNldqZmJsN0VGYWx1dnRjRitWZjQ1ZkxnWkJtWG1PTDU0?=
 =?utf-8?B?azBNbnB5Tzc5MDh3aUFCSnVLL0JHczVDWFF6eC9xdXV0cjVJR0pralIrdWxV?=
 =?utf-8?B?aDhxdXphNmVhWGh3dHFmTFV1dTluSHQrUXh0VFdiQXFFVzlrRlIzWTYyZExY?=
 =?utf-8?B?bXJjeE5DKytNeXYzdURIVXZaRlljRkovdWVuOFVsUENPaDMvdmlSODMzUkYy?=
 =?utf-8?B?cnpzVVVQN3g3ZFFocDRLdU9IaTkrR3ljNGk5Y0dldzcvNFhMUkhYVVFpVGpB?=
 =?utf-8?B?Smg0YXorL0laOTJHOWUrem5hZG45RzE4M2orY2Q4WmM5WGF4NERhWDJTdzhk?=
 =?utf-8?B?U2RLYm5CMnoyZnZibTJzUGtaVkhjdTU2VG1YZWh6bVVLTnF6a3BGd2krMVZn?=
 =?utf-8?B?UXF6dlkrWkpjYmg2VXJXT0gweFpJY2VFU2pCT3Y1L1V3YTZERDM3MkNib0RK?=
 =?utf-8?Q?5yqg/6HmHaq06ep7FP?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bdd773-7370-4b42-03e3-08dec7688474
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:21:24.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zDcuURJngepxq/OKZ2aGRWckiuknByOPXctDoiwK5AI3o1GBSmyNrF1XndXgzqsDM1YaE3NxlMfcOb2Tudbew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5416

Hi Arnd:

Thank you for the review.
I have fixed the two issues you mentioned and updated the pull request.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git@github.com:BlackSesame-SoC/linux.git tags/bst-arm64-emmc-dts-for-v7.2

for you to fetch changes up to 6e3b49b69038ac794414ed0731634e2677b834b8:

  Add eMMC controller support to the BST C1200 device tree: (2026-06-11 10:=
37:12 +0800)

----------------------------------------------------------------
arm64: BST C1200 eMMC DTS for v7.2

Black Sesame Technologies:

Enable eMMC controller on BST C1200 CDCU1.0 board:
    - Add mmc0 node in bstc1200.dtsi (DWCMSHC SDHCI controller)
    - Add fixed clock definition and reserved SRAM bounce buffer
    - Enable mmc0 with 8-bit bus on CDCU1.0 ADAS 4C2G board

The MMC driver was merged via mmc-next in v7.1-rc1.
this is the remaining DTS piece.

Signed-off-by: Gordon Ge <gordon.ge@bst.ai>

----------------------------------------------------------------
Gordon Ge (1):
      Add eMMC controller support to the BST C1200 device tree:

 .../arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts | 19 +++++++++++++++=
++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi                 | 18 +++++++++++++++=
+++
 2 files changed, 37 insertions(+)
