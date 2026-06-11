Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020100.outbound.protection.outlook.com [52.101.85.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEC14B950
	for <soc@lists.linux.dev>; Thu, 11 Jun 2026 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147583; cv=fail; b=MjxgaRjaWe2bIIEa0DFqR9Hqu9mN3Ay4IQV3EbnC0E5ir/padASs3/SKQzC4goe4KQpvN1xCSeQjK5fKAvPL+OEOHRBrSmgj8LzHRMT7mD4ronXyYvnYmxC8FiVwsgxBo9IkcBvSuSmSqRqwrf+RwIcf2JfbTePCl2tIvomY45A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147583; c=relaxed/simple;
	bh=dJbpFGGRlPF5l3kMJ2J1XGHEmhajnkUktzeirE8/BiU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kUNNxRzdnPGxZ4NtqYamyQK/JRT2Dt4P5HdO2S0yM92KDKGWWn8vJbCQdo5R9uHIfbgW8sVy+Zti9s5bNP6zc4uk3fdoZLpJFjFpMm1weHPLN/0kc6TGC/TbEig6VteQNQnQ69kYXHzF4/MhI1h6X02PPEuBeF6vfbhIUs0/Mcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai; spf=none smtp.mailfrom=bst.ai; dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b=Nt4ona/L; arc=fail smtp.client-ip=52.101.85.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bst.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b="Nt4ona/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQfYY15ppKxzzrB8wp4LYki4VyqVoTLNKmcHzAP/g+ifqAoLm1kudL89MxEOzXKdFNzgeRGTe1zuO5xQyyy5EDcg+ExT1F5Xv1Aue7jdgzBcv1lSlQvHJrKaMezaxBrf9umMBHkRuYDREqY2aiCVs03xMFM8YWLTLpboFLGhCMG7y7U8yZreWVk1PYYda98cSla5GSWhoabcHexGuUyRx8D3xGyIn5QLIkdODRzHDxYak0B5tzrxCmyFcyQliQumfNIZK10o2IZDNOIzpIn+fvWpu0jqwgt/zPJht1Vpi6h0tpxoLskGn27KwJFeQzlgObKxkU5NruEDedxDVZFeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=Z0q9+dLYig3dH1wZ4hIze9s8J64VgIs8hzfyNGLjUzidR5T2yK1C4sZ7FU1R7Iyh6mNl0t7xwH3B4iRkwI/krDLqn7qOgNXdi2JdybYBET85ygeqJmZBGsgNoxaHDpgyJCtCRhKwMwlfN9drTLQTn51IvfJ+xrJPFG1DLnr5KoIC25lqatVtVQTnP2T6iU0XN3bV9mzHNp/qpCFBihpI7hhKkOHyPkvxyT9Jko76Xb//mHj8Hp91gwdb0s30kh6mne/7gNGUbY46rEUEVZ41BaLeKooJ0xQwC3Ig1nRjPRBrawdO3LZjuznV9frcA7BIhXzlGcfryuNluwllCWmPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3FVet9uhqR/UU8BSycsegTbFXGX0IeKBOYmitii2Q4=;
 b=Nt4ona/L5k2SgH/V5UvjSOXRQ1x8MtEDU/Dm8DUjRVid1hmT2uz7eR+BOnn+EIIOZe+lmkuOLpW8h69IZl2Bu9gB85U9C4P54J3A3GrNHIy3K9CQhdpARj/yiyC5GIqB1rVaXpYpxBa24u5gCwBpgSqREdOUC1gSyb4f7yIWGkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by CH0PR18MB4324.namprd18.prod.outlook.com (2603:10b6:610:d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 03:12:58 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:12:58 +0000
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: gordon.ge@bst.ai,github@bstai.top
Subject:
Message-ID: 20260611.111250-gordon.ge@bst.ai
In-Reply-To:
References:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:12:56 +0000
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|CH0PR18MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0a0e8c-2533-4f18-16ff-08dec7675667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6+xZdFZyrNLvo6poTK1BibgS/4sYEccjIqklBsPPQZzWOjmTHXiuqpGMOSSe/0DdsPjuOFJu3EoToP5xL3jtmKit9gjobeN5ZG+Vi2eRK+6eoCnVRwjE0CiSyzmYLFFYfKVzvCeyDXooUpDBgRQ3reC/WMM0SVbQHMmZgnpGINF+KqJQ5SjsmdoWxKvkzpibEg3tOZA5rWkbb7LlPzKAD2iycMNbEoXt1T2Lt2wlWKb0xmxbjwls2MfhAXHP5Rnosh60lEdPXrspHfa5jev9grHk7CYywQapDkxrsOd/7iujfO+HHrj2N5P5gGRW13S9dBhwLcm7VciKJh7XIdlLqgG9W5l1dGOXrwxbzY7VphFwxE4RlGyHyk8UUhLgiwImITvOaXTaBG+KfY5BfZPbZd4oyqRPN6WyyjxzXV2C8iVwc0tWiUWSsyFncRcvCsN3HCMiEIgnM7a6SLH9+TTLkz5seLvXu3W0M8/TcE52SnNIkCH12tvrDKLjwh1a6e8CBCHhgkGoya2KV2aDLM9iqn7wEg5Lf5T6uTf3bWYxpIPfK3l7nKOHZ0q3/d63fRgDcUwzX1vS+kphlH9Ze0VshP+x/Kj5a/eeNKChLYB6RnAVrPm5hWLAzTHRmy2rrYdgEvlvbbQRHjYVgYozNTGvYPjbQJ+Z2qxVPAHUuVNAfCCSjnPHrBVStmYU55WHRe0k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3A3VGVEZ0VkbVhMRTRLb2FWYlprOURWQ3BBeUVHdjZEZWwrallOUTVVaStM?=
 =?utf-8?B?eUQrdlUzd1ZEbEdhMmdBdHlFWk5EMGJ1d3FHR0h2cFpTeDBJdGNWbkwwN25N?=
 =?utf-8?B?cHlvekNTN0Q2SzBKTWVzMzVjTGRIYXlxbVRMbFhLQk51RmpJMHh0Y2ZmRFNr?=
 =?utf-8?B?aVlQaEFlaXd5SlZ6UjhEUXJkQVA4TDJEMXJVUW00VkpFbzRHSkFxMVZwMENj?=
 =?utf-8?B?UHI0ZzlzM3QzVlNyclVOZXNra0UvSHNhdXd2MU9hUzRVNjlwYzRBWWpQUk9L?=
 =?utf-8?B?eFgzKzk5U2EyTXdlRW8ySzhQcWlRSGowc0tYY2JyNU82cDRMYjBvLzRXeDZE?=
 =?utf-8?B?L1dyZzVTNFB5eDVYdnZrbDNpN1ArUHFnM3F3TmYvZm53bTNOcnduOUZZaWkx?=
 =?utf-8?B?TEZPT25QSUNOckJhOTc4cnhpcnVCN0lqdkU5S1ZUKzBDbFZ0MFNuT09zMFJV?=
 =?utf-8?B?d3RiWE1JUHB2eUhPMGxwd1orMXpEVmdRZTBYd2NycitLblg5VUl1cFEyenND?=
 =?utf-8?B?WFdsbzRXYy9BUmlNYVZSblFDMWNQT21oTzkwaDNOWXoydFdETmNuWGtSd2Fq?=
 =?utf-8?B?dnZ3cUJ6ZFc0bkUrc29keXhSUmVQUW5IdlN0eE1sU3ltQXp5eUdwVzhRNjNl?=
 =?utf-8?B?d2dVbFRxZTVINGlhbjJEMEh2cjczZm5LWFZhZktyYU9GaVh1Nkp0Qjc2OFM4?=
 =?utf-8?B?YWFIUVZHM1pmdkRYOVNlUXJTRlNBUVFFTkNsT21JYVFwUy9UT05FM3hvdEcx?=
 =?utf-8?B?ZytHNEl1RGIxMWV0VzNqOXN3bXhVOUZQNGRES1U3TE8yb0xrN3VyNk85Z2RL?=
 =?utf-8?B?enFxK3lNeVNtN3k5bXAyZk1yRm9FUHFJeXp5Q3RTeWM5V2k1NkNuZTNFYllo?=
 =?utf-8?B?THFsSHdTazNyUlYzRzdkc2dZWEdwRmJvZmhVZUFVSUdLT0xXek9CcnVGdG5n?=
 =?utf-8?B?anp6OGhNcFlBYTY3c1pjZW5kcU9VRUdWdTYzUDN5QkVsR3ZJbDVZaVNqYjda?=
 =?utf-8?B?cituR1dnbEhwQUtFeUZrZlJZeTBYNzB6S01ZNWkzYlFHbUFhNzZjNkViY3Yx?=
 =?utf-8?B?aVdnWkRRWDdNRlh2cVV4aXdJdHRkVVZGQ3pVTDlpR2hUNGJ5RVhmM3V0ZGlZ?=
 =?utf-8?B?d2c0alFwaDJ1T2p6aGhnUmJtemltcVVxN2pLb2RNcXV0eXRYZzVXOFh4Mkxm?=
 =?utf-8?B?RkZMeENadFVPWWVXS21wTnp6UjN6SEgrZllNSExJNXVtVElucDM5S0tzYzlE?=
 =?utf-8?B?Y2I5bE9MTUV0VWlTaXZUeFVkeUVtbGhKSURHb1NSM3YzbUFGNWZkQS9FU1hD?=
 =?utf-8?B?bVYyZzRJYTlYUm9TWEVhU0piR0w4TDFFeWd6MWM0V0dOVVNGTitXOVYyM0F2?=
 =?utf-8?B?OXpVZXE1eEJRdGdaekhqU3N4MXhFK2g1VWVFbDhEMFVSRlFGa3lZaEtJbXNS?=
 =?utf-8?B?U1M3Mm9MSEFRWDg1SmRxOHk3bFdFc1IyMDNYa1hyaVIrNFpXaHV4anQwT2tG?=
 =?utf-8?B?dSt4N1BVcVB3eUJaemtDOUZQazZBWWNJaGlCYjZnVS9PeXlSd0hpQ0lEYmE3?=
 =?utf-8?B?SlAvWFlmOE5GcU5lR3dGSkVUYm5GWE82aHl0ZVZDTG1JM0ZyeGF3M2dnckJt?=
 =?utf-8?B?bXg4VjA4WEs0OUpvbS8ydUJzNk5tY2lVRXhPcGpTMkxiT3YrRERJd3RGMVZs?=
 =?utf-8?B?NE52S2JJRXd2T2orOVBWTE9nWDRPTDhvRDhVRGxBWHJweS82SGF6R1U0OXZK?=
 =?utf-8?B?dXBwQUFSeVdQOC8yelRZbGhweVdwaW13RURUbzZVUmkvY3VjaHhUUGd4WCtk?=
 =?utf-8?B?MUV4UWZIdlpVZnN2WTU0RHdLR2YvdDFCbnRUZkgyWXFDNU1sbUFEUEdnN3R2?=
 =?utf-8?B?RndtckVWaTJlNTNMYzJMS012YnNkZjJacGlBN3F4bnJKc1Q3bmtmbm03bWpW?=
 =?utf-8?B?WGNQNlJPcHF1NHp0em01c3p6N053cDVteEg4a1F0R3lPUW0rby93VzFkTlNN?=
 =?utf-8?B?cTVoVythSkQyK0o4eGtYdk93aTlSajZMaFA0cVdBMy9VbGhubTNqeDhsbm9R?=
 =?utf-8?B?US9USFNpZkUweXRxZlhjZ0M3VVRVeUpyeDFnQVNyZGRoU0IvR1g0Z1Q5cVcv?=
 =?utf-8?B?TFV6ZFluQ1F1bXk5RmdZYWJvTWNyNXp0b20va244Sy9BYzF3bWc3Nk05UUNZ?=
 =?utf-8?B?ODhBeGlkaEhrZnJBKzRqdFNUaGh5STBKRlNJcERkNUZtci9zQmlkNkljMk94?=
 =?utf-8?B?cGdZV1p4SjNMQWdQbWh6OTJobjlkNjR1RUtraTJZelMzRUJhcU9nOUNDV1Nq?=
 =?utf-8?Q?c7BqJmITRQWamQ345g?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0a0e8c-2533-4f18-16ff-08dec7675667
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:12:57.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXMZzEyoys/xrWLRsmUzqDD2BzmlP5rZAPLSRn6WQvsEC+xkiPaj2UPeu2TatpntNUsIkW9GhCZdb+O1zpumKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4324

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
