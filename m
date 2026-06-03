Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021119.outbound.protection.outlook.com [40.107.208.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C544E038
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486329; cv=fail; b=aHErFA6+Vh817rm3mdvIDb/Hsv0o7jb52PbN22FmN9OXHxUG+VvJIzJ21aV9ydm3sb9eJ3P2lMufg+4n82bXe+5FB2T439h92CHOTdA0x3XhUCWozTOBSUI40Gfs0sguAZcZ65kv6aPGySEoH9SOSvIbgqENiWd3tG5eB+3BNnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486329; c=relaxed/simple;
	bh=UCeFWxfKIq0gapS13LclRPpUfrE/YteF4ncxsMLlbN0=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QimNH0E/i7KUUiQOtxy/UcO29pPSpPP5STFvnyCSZKmM37tC8pGeGD5dMk+uyJDSWjEqOshvTLsHVsH1qrcxDQiW2V7WxTrrsJhJFWxJfBps/jzl3SEdIkVWVUbs4sLB4lkQhN20T9TkfNstp5tVYvyKDJLAphzE9obwgyvd89s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai; spf=none smtp.mailfrom=bst.ai; dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b=QnCM9FcB; arc=fail smtp.client-ip=40.107.208.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bst.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b="QnCM9FcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCxedrCfWh94sARooC1uFeX/KqCboxXUVWAqNnhOAv5BdiOqPgWMqvyws5U6SriR9IRauGZtyXsSIHgcu05LLljW4DsBRKNqvbbC9Qa1C5/btfbLAge+WszxJCAakI55hAYKJFgPhNKQuBkLbRqQZtW9BecgobT61diMc1AjoRfvIZSCoM/SCdhzPIFStxQt6vFoYRTimtlJNsLSGXqS/hvOSQxSEWbmP+XEssinPbZWsANyp+3M2q1DLask/jAmeorz30qRtw0KEGepBZFdFv4Xxqgj37ACFj3MpERXog/VchlnG1oB4zEeHhjZcX0vesUehkoexPCn+1Mv/q9aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMAfoVkT1F47H5qnYtQqde5b3++m9LuRXnLKYzdKV0w=;
 b=Cu2+IjOmW5TEQX2zm+fHDLGvudUVYhX55T1QsfjNJ1AaNiMkRFYjtJV7XDd++gea4g7Mj3J3Z6QgHxLyAiVs/k8FLww+LWUmPSsEulqKiKgLfb6Hlzs9mQtdtyU8i8by6//1sbHDEBS/3uM/EyiD9qC9BWMWqXbkLc68XenV8dzlqWChbhlaWKsGegKD006ozzKsulFO3wUbaAb2d3DtDmIPcrHUIv/dXx7O36c3AmeAx+jtdjeDZ/df6Ab80sKFwhY1E55RresuEKQHMuFHrlPzlx8uClw5moXUhuL4fBcrBlkNw75AjekE38YyuI9CrvsL6/4m6RRLAqZfWZvnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMAfoVkT1F47H5qnYtQqde5b3++m9LuRXnLKYzdKV0w=;
 b=QnCM9FcBiiQSkk3moSCKeiBHjsHbIhvnFttcNhdxX0nfcBPLsvu/i/m4N1QLQWZPXxJXKLhL7EaeWvYHyy+oepA2pI3uNTMde5O+fIFGCy38xjqTp8VcUHoJYTLB+sIe7F7XIzT0ZLgu5PznST8yGU8wmyH1jBJ6KbXamVMEdbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by SA3PR18MB5673.namprd18.prod.outlook.com (2603:10b6:806:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 11:32:04 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:32:04 +0000
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL] arm64: BST C1200 eMMC DTS + defconfig for v7.2
Message-ID: 20260603.193147-gordon.ge@bst.ai
In-Reply-To:
References:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 3 Jun 2026 11:31:56 +0000
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|SA3PR18MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfb18aa-301c-4338-6bd0-08dec163bcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Eugn6zBWiKMiUW9SsiR8gpwEhA9ngG6+e09/2M5zUcHTxvKDrnQXVlT8bCqb9jgF/sXSZiA5EYT4VCpC54XMVeTjCEwetiUw89QzVb6eR4Ue8FLEuBxr1No6KHjkRc7CgE69o1tTZnWX/tR/51nN8FZQ+ScmzH0pVDi6OC8SrK9/QNns53AAiI641h7zMCXepqNckVEUNTtO3HmwyP023vIlWd/77SbD3Q7qiBHW7wyShlez9FwkXOcWCml4YQtUHIM6W4pUiU3bxK1IeOfJEgCakrC6n/YOZbzI+CZHkv8R3bwa4lYLZdZudWYNM9q7NSoTpiHiD9qNU3W31ygXTg4X7IlPPbm7Qi43bUrlkumAbdFolnu5f2ZH5MdMxj/igA47gU61gA/HzOZ281b565Y4bmatbzQBtiDZD+ADBdTuMjdSL/DHqHpokUv4os0XY8VxOBrr9SN/ox9VwivSYIp6cW0N0JWIbADso/v3TA7jitgvScGenPr1jIXqmIQ5xJL3APXV1WVtu86IbygA0TzLAxnQID1u2Kai6uBBnHH+fyMVk+WB6+eaY5VRdpPtMaIV+cOs+7svBTyPTDbWZUvDk2KPQXu3pDoat7/nTHgrIFc3Cu2v2HKEZIF6XLFhi6AYSSAO/+IMFDn99+06bSyN3FKDK6zawxOnUo8Qij2JP1A4sba34axXZyzdnVeK4/aFaMdUIrxL4+AdhLXCjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1FZQ3piVVFWeWlWK1pqSzZWdlRyR1pIVTVqeUY0WU5UWCsxbFQ4N2NHMzg2?=
 =?utf-8?B?dG9neTIyU1FKQ3dxem5JaGl1b1d6UjIzTzZrNDMwSWw1clVGMSs3aVlUbTRu?=
 =?utf-8?B?RjREZVdLb1lkV2VFbzFOem81T2hNSVRQSytlY2trOElSRnAxbWZ5WmZCbndG?=
 =?utf-8?B?RnlINHRrWXhreG1kMXZRWlkxWVp6blBmR2RIa0RoNHJ4WmRGSmJhWVBicys5?=
 =?utf-8?B?ajNxR3FoUWRLSE8rUjRyNTlkOHZPUkJwQ0NvT0dSemVGUjJZL3ZWY0pOeFpY?=
 =?utf-8?B?cTFkVUF6MDE1ekswSWVIc202RllDKzFCeUFEN210Q2N2TW13YXJLMUF2ZDJr?=
 =?utf-8?B?TjlIVThXQnBCbUpmRDgzNGF5QzE1OVJFMzFxK0trSzFCVkxsYUpPd1hhTm9h?=
 =?utf-8?B?VHZENU12NFFRNmlZY0pvdmNFazJLdWU4RmtvbTBOT2ppVHdFZ2RjL3R3L1pR?=
 =?utf-8?B?cDVKQmVISnJKd25OMC9DbCtsTUY3ZWJiZDRVUVFLSUtlT0FwNXFYS3MyV3BV?=
 =?utf-8?B?UTFzakV5TC9tTVlwQXhtWlpPZVZwVVdmZGh0NXVUaW5nTmYzOE1FQVBBejY3?=
 =?utf-8?B?SG1Ka3NvTGRYSlUremI1VkI3V3FSdGNOT3RRUUR2NkVNM3FkOEpMcGRyRk83?=
 =?utf-8?B?WHhxT3ZNSDZtMUxONjhaQ2ZwN1E3UC9OOGdIdDZuMStadnhqWE9lczFVZDR5?=
 =?utf-8?B?ekx0L0hHTU9Mck5ENjZGdjAwVVM1S1VuN201ems2TkZ4ZXVLaHlRZk9FemFE?=
 =?utf-8?B?UHR0N2p3MW0zN1dVZHEwMnl3N1RjNU1UQmRQS2p2VFowWUlSWEVCTlZsOU9t?=
 =?utf-8?B?VUVpbEtDWGc3V3UvYUJXRmVRNjNPMFFRSFNIdjlQR1g5QjdPVVhPYzRoeGIv?=
 =?utf-8?B?NWp2dU5rMUdXRmNnVGR5MEYzV3lQWFRPL3NGNHBKL2QzeTkrSjM3LzI0NWR1?=
 =?utf-8?B?SExYZ2lJL2dGclIwditUMWxiV0dXWFRwa1JlOEo4WkJkNkU1Vmp1QzZLMTI2?=
 =?utf-8?B?c3lHd05aRGVVUnJrTjJMem1GdDJHY1JHeTJNc1pHQjlhVTNDVzBEeVgxR0dD?=
 =?utf-8?B?cVRRZkx1aWtQYUN5RXkvMHFqck84VEhoTCtJOVVBMm5Ld3R0RXJOOXZvWDJB?=
 =?utf-8?B?QjZDSkFNaUFPY0tDZDVwRHJiRVpsNWdac21QTnBmSzdhQ3lRZGNLbUhuWmZC?=
 =?utf-8?B?eE1HZDB2NjVYZzNncTk3bkVnWnVnRG0wMDh2WE1FVmJQK2NYQW5CTlVndlJD?=
 =?utf-8?B?K2hCMTArcHVtcFphaVg3Q1FtUEhvVUZXaHk5VlZtK0xEWDZMeHV6dnZiY0U4?=
 =?utf-8?B?Ulg4NmZ6ak56aG05SE9zeGUwbG9uMzdPZ1BVemNCWGtTMTNKRmNJbkhqblpt?=
 =?utf-8?B?MmQ2STNnbUNHZ3NGNjdjY0RUYXNCT0lnME9YYTdwdVRQK3ZoNUpKVkJCTksw?=
 =?utf-8?B?Uld6WDkrRGlHR0NzcGRDanEzT0creWVITElKVXNMdWUrTEVDZ0NGZ1lkWi9P?=
 =?utf-8?B?LzNHaWdOTnAwS1B5QkFsZWZDVE92ZXpwczl0b3dDOENJVUZ5MVIwZDdIYTA0?=
 =?utf-8?B?SGExdUdKSmQxK1BsV0V4S2VTaFhMOHV0SjZYamJXMjhuUW44RGxCaEI1aGN4?=
 =?utf-8?B?VHFsWmJNcUlWaXZNOVNDMEI4L1dVOFc4LzFWSTdJdjBpMzVqL2RQQW91akVI?=
 =?utf-8?B?eDlBUTdMZ2dSYmcwOXRrZUFzZXg2UUZNeUgzT0VZeWlHMTlORHFtSnNtd1la?=
 =?utf-8?B?ckR5ZENIUk9BOWZqdmZJQVU1MkNxQUpacU0xVDdiUXNzSWIvbVFzZzFZTkJp?=
 =?utf-8?B?RWJtYTMybkRQWk4yUTJKVW9OTVcwcC9VS0lNMVhBR2ZPK012Z25sS1AzSE4z?=
 =?utf-8?B?VmY5aUkwSDZha20wdDhnZTRudlRUVzdPM1U1TDZHdjhDMEJOQllCQmZIQ2Mv?=
 =?utf-8?B?MjNSRXc4cVcyOEp1WUR3ejBXYmZjejVsZW1wZTZFK0NSN0YreWtUSERqWTBv?=
 =?utf-8?B?VDVUNzMzRjJUd1RsNVRQU1BtUk1lYjdRTDNzbk4vTm5sMlpKSjJ1cStlTUZk?=
 =?utf-8?B?bmpMMitZNXZGS25vZ2J4eTlkZWxiV1hrYU5XRjFpbE9taVZMRW4yL3U3bGxN?=
 =?utf-8?B?QnhmQnBzK25vMytLeDlHZ3lrNEdRR0JwSWxqK21GZTdlVHl4TGRIYS83RU1Z?=
 =?utf-8?B?Z1hsaUZ4Y0hIV1hwZFhoeWlUbm9JaFZjdnNxOEd3NmZTeUxIWEI4SkgrZW9B?=
 =?utf-8?B?YURsMW96YTdyOGR6Rlh0aDJ2OWZEY2l3dVliM0Fla2t1a0ZsS3RxbGpuT1VO?=
 =?utf-8?Q?7brY5VtmpI8VLa4+Co?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfb18aa-301c-4338-6bd0-08dec163bcb2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:32:04.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPZtefznDi3pVV+cSULxAu2c7dNMYNTGVObGAHQ/MKh5Shb4BS3NllJKk4XthtsKxhKF8IK02xomm9JeZB/FxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5673

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/BlackSesame-SoC/linux.git tags/bst-arm64-emmc-for-v7.2

for you to fetch changes up to 6447b203406a931d5a2f017afa9a018a72c8d4d1:

  Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame Technologies =
C1200 boards. (2026-06-03 18:53:04 +0800)

----------------------------------------------------------------
 arm64: BST C1200 eMMC DTS + defconfig for v7.2

  Black Sesame Technologies:

  Enable eMMC controller on BST C1200 CDCU1.0 board:
    - Add mmc0 node in bstc1200.dtsi (DWCMSHC SDHCI controller)
    - Add fixed clock definition and reserved SRAM bounce buffer
    - Enable mmc0 with 8-bit bus on CDCU1.0 ADAS 4C2G board
    - Enable CONFIG_MMC_SDHCI_BST=3Dy in arm64 defconfig

  The MMC driver was merged via mmc-next in v7.1-rc1.
  These are the remaining DTS and defconfig pieces.

  Signed-off-by: Gordon Ge <gordon.ge@bst.ai>

----------------------------------------------------------------
Gordon Ge (2):
      Add eMMC controller support to the BST C1200 device tree:
      Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame Technolog=
ies C1200 boards.

 .../arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts | 19 +++++++++++++++=
++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi                 | 18 +++++++++++++++=
+++
 arch/arm64/configs/defconfig                          |  1 +
 3 files changed, 38 insertions(+)
