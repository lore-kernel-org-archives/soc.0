Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021092.outbound.protection.outlook.com [40.93.194.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45302D1F44
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246819; cv=fail; b=o3Sd0+Hn8Uv6rRdPgwuXeHK1dEtVMEeM3Q2irj3CIKnXg6DEXc+VPOfoQTZ0DswE4omdKOCeaWWyIXGn5+6Ddf6de44BZPJQvN9E9k7Ykjc6FfPCwe4IzgRnH03L15sXxcI0VZmVK8hLiVVYEI4kfPIyE/xOibhcyzgVPmqc5g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246819; c=relaxed/simple;
	bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=;
	h=Content-Type:From:To:Cc:Subject:Message-ID:Date:MIME-Version; b=uos1T1NwazG4/aLbrVkWAsSXOAI7e9DHkAeyABwy1ksUIi3B8Hk55+ZWac7lB0Edv989DtbULKqcFFE5zUL0Obw/S/Fymg3NKeCcuQTylP+wcMkMCVBReq+wr3hXrcD2Cf9OEIPq+mcWbNXlA1/BkXz5WcrtosRx/TIDvrtxt4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai; spf=none smtp.mailfrom=bst.ai; dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b=qMRvh1GP; arc=fail smtp.client-ip=40.93.194.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bst.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bst.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blacksesame.onmicrosoft.com header.i=@blacksesame.onmicrosoft.com header.b="qMRvh1GP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/0zDTsQVGf0J8j0k6LLuOXhigiv+0ZIGg7c1d0Wquh1nbKABjezIIrNVL8oc5bsmnX8IuAe2QiCxII0EiSXLff8DxmOO5djB2MiICOTMSvRzQc29QefPdYLs9WOHQpKQSKK8Joc2uMO74AOhoq+ricW3ozEcU6lFJXfz6L0pBpxgLqCSM+Zv70bAZsiixF1p9A2DFzVRosXzgSHwllxbNkcQNK6HBW24axVizrd7PSAqJC2ua6bEqKwS0d830leN6maJYDiIcTc1rfNNZva49+IXFmfQJIOFruyUiNvwY5cRvOQ1Mck8rP+qhlEe4s4GhLeNqivtLMKkg7f8uubHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=;
 b=H+Ck4XtYpouRD8or84WwnU8sL7GD5nqBxEEll1Um2blNS2dWt4mu8OgLOt/+51B4nVc4Au1GKVJakOr4gZLpoyqoCu93KW4vjwmjp7D8BESumaDuteXnKYiLQBtUFGJBek4kX6C26ONz2DS9yiFOYPCdOEuAXT+x/CIV1rh2iKHKSTqq4ezIza5C4s2obAfrPE208ZSvP2IWIy1d5SLG4vJxuSoiIf4TnA86idB96Zy+8gpRCxdCRlhsFytM6zOqEQAUD8NJRNb2Zb5weVB1oPSr9C/E9dYHN8xwaNtM9ds4DR0WghOvlrzjWVrMoJHyf2UxQnWcF1M9IGIKc/02kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=;
 b=qMRvh1GPVxk+4k2FDVAGJkWiOT92yWLd5EPOepPVgNLawI+Q72Lhyg4HHr66vQLqtQQ4wD7Y8heGK60zhAAgvNyNfGSwFg1TgvXGi3/hycuSelploeEaeT0Ff3adZ/bbwTCy3Gd8DGEM2b3s08gApXle/1M9Lg3ysEinwcAe+K4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by SAVPR18MB988338.namprd18.prod.outlook.com (2603:10b6:806:4e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 06:46:55 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:46:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]Add eMMC controller support to the BST C1200 device tree
Message-ID: <178124681322.539730.7583821629980585000@bst.ai>
Date: Fri, 12 Jun 2026 06:46:53 +0000
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|SAVPR18MB988338:EE_
X-MS-Office365-Filtering-Correlation-Id: dac6c276-aa9d-4b4c-803e-08dec84e64b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DKX6s4Uc0lDBPVANUiJdEvritPVeG1NXX7fm4E9BOSx2evJknjCiYqYbCcYLWlvP/IQPXayuOl36r5gnmLd7rtQ+tIuY70ewS+j2dlEm71pIf82XFeHg5FzxwIJaekFFdQDGePuJzb7emOiIO0rohgxD2u0WsqqLxcl/6/ViKlMjyHrnKJBt5FzhMDxClLdPxoeTG0rZIEb9yKC8e5RYQTfMfboDY/w11j+Lsm31z/7wakxRkSnq6tPSC6UFyPVc0kBDR6HPgbeihzpD+LKAXmVX6agCFTk0XDoHAG/TdhiAcJba3uaQZmg1J+55gxlYu8pjoq3yiMBFSwv4v4fc+TVwRfnEfZgCof4gMS7S5beN9325Zod2yUmCQNoeOSxgU90xZ8BI9Fyxtk6PtlEZGpQm5kPkxQBdQtGNhRlSwcywva7kFS0qfMdOTeqMdJIa8xpjpnotEwQpvG3RqDmc4pnCo8erq9OPAF2wCgilPIs9c1fRVP/37CAgqv4Odcr+yo2GMDTCNKOGlbWAbqZvUGSKYiFHaUfgOlwD93/3dWfGyuHHasa9L2WkJANDP8nfAjh67msdnTM4xdyxwMAL8okAKkIll/7EDApUoMn7uGYVurefAUF3oAnnbupenw3ybyuc7dfm/UKz0yP1IJTgHZpvRZV6xzAI9sivJz5ACA7M89LVKLZcvBoFooWbczfcyENw+3xo7MpfluX83wnCFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzVybCtZSW5Fb3pKaHFpNEJDM05Femwvakk0TmZob2VZUFNTWCtoYW40cUlD?=
 =?utf-8?B?Ny9WdzNKd2xEQXJ3WmduVzZUdjgvWk1LY3dnVXhvUHk3aUtPVTdidlc5cWRi?=
 =?utf-8?B?NmF2YjVsc3FpZ0U0b0dZNHlNcnNVTGlMbTIrZVFQS1lkUTR1V0FiQzNIbVFD?=
 =?utf-8?B?blF5b1hIWWREMCtOSm8xVVY2TlZHZU1VQjh5dU1kNHNoRnZRdU94N25ySWky?=
 =?utf-8?B?VDByRStSZHBzaEFRTmpaZFEydE1zRkZ4SkhmUHN6a2IxYTkzQUVVY2ZML3lU?=
 =?utf-8?B?RlBSMWwrd0oveFZOYTMwQU45M0N2L0FTcTIwWXY0NFhIOHBhOC9tRUF4dzlN?=
 =?utf-8?B?bDdGb080UC9qcU50eWFqM3JMckV1cnI2OXBEK3BKR0h6MGV2UDRuZFRZMDFP?=
 =?utf-8?B?dFg1TTc2Z1JEWHJBNklWdEc0dS9sb3J2emJJcldUZnNmVUVUQmdoaUtvUXg3?=
 =?utf-8?B?WU03bjVNNzUzdkNLdk9aVmJYdm5jcGx0bGZDMkdrWTQ4YjlpeThYOExNbi9C?=
 =?utf-8?B?TkJqZnZwNGJUcmJFOHZ3R3k3dkViQkVaZTNuQ2oxNmk3elhTOGNWOHJvSWY3?=
 =?utf-8?B?TGhaS3BwTTZpQVRHMzROTmF3eHVHZmpqWVVtU09yMDdScExYOVQzV2drUXEw?=
 =?utf-8?B?YndQQWNLeGYzOWUyeEw5eGEzZm0wWmxRWG9SMnVoaW9pL0hESGtmcEI1cmoy?=
 =?utf-8?B?VW92d0JQSlBuK00xM2dzL1JEbUt2cUZldTV6UE5vV0kzRmxGak1KT1hlRGE1?=
 =?utf-8?B?Y2hVenBBUDdXTVloemlMRHVsbHNvSkZSODBPcU90UVh0QlF6MzdSVm16L2Vh?=
 =?utf-8?B?ZmEzN0VVNXA5VWZIUmFRcjNDb1M2SWY4RE81MWUzaUladkNqanNMcW5BWTdH?=
 =?utf-8?B?aXlub1JhYmxOWjB4bWI4UWwwS2IvTHo5OC9QbUVUNjhrZElkQ3pJa1JhVHdJ?=
 =?utf-8?B?eXk4M0lBZDVkY2twaXREKzJnVVhSZXNJOEVTMjk5VnFURmFVY0YxNXRHOVBC?=
 =?utf-8?B?am1BODhHWUtremNWY0FFUUhwT0lndDNUV0RIakd5TVYycTFNVWNlNjhMYVhn?=
 =?utf-8?B?TTB3eDE3MmorUitBV1VCZWZtMlg0NHZCYzFMOS9kNjdpc3B3TEgwTGZ2R3Vq?=
 =?utf-8?B?UVFMMG1kNEZaYkxJZWVpTzhRK1JwVmZyNlUvcnM3R2Voa2FORUhub0FqYUtG?=
 =?utf-8?B?VmlHUTQrMElzZVJ0bmhoMnpXdVorYzNvVDFZd3VLUkR0UmpFTHpOQ21TZnpr?=
 =?utf-8?B?SElJbThmRnZabURKQW93S1lWTkZTZmc4TUh6MjdDZ3d1R0ExOXBrbFEzSnVJ?=
 =?utf-8?B?aXk0NHoremNWeDZNb08wUlZLeDRMczh1bFRNV2N4ZDA1cGdlWks0RVdnOU1t?=
 =?utf-8?B?KzhHR3hFQmlsVjhGL3JZYzQwUEUxV2VIVTFqaW1CNUVZazFEVVowYWxtaXBX?=
 =?utf-8?B?OEFQYk9lUUo0T25hcldER2VKZ2lHcWRFS2M3YU50Q0djRWNaUHR3UE9QK1Fo?=
 =?utf-8?B?bzRxZHgwaFVSKzMrUnM0bms1eEt2STc2R1hYWkc2NWt4SmdhQU91S3FUYlZi?=
 =?utf-8?B?czBRcGlTaDMxVEZwcERRZkxuNjZHZzdlVHk1MFJRT0F4eUFmdTN0cjVBOXJZ?=
 =?utf-8?B?T0VIdld0UzgwZm5uZWk1R01iM21QVThLTjZUVTdhVXM0Q1BiM1JHcVhON1V6?=
 =?utf-8?B?b0F5SGc4THZ4OWZsak1MQnpuSFRuekdNS2JxMzlRbFVJMnRPT1lEOU5HTmRv?=
 =?utf-8?B?cFZBRjJKZDBQVTliek1xU1dhME5TbytyYy8wa3FPYklsbjdkUWpGUWxLeUc4?=
 =?utf-8?B?c00rZDZ6STdVVHN4UHpxR09sZHZyVUNUa2tWMGV5aXhPMVBUUXgrbmJRQ2xP?=
 =?utf-8?B?Wmt6Yy9rOCtjSy9BVE1rSWRlaTFKbWp0RGNtdC9QWEJjdzVMK1hDTGpSdTM1?=
 =?utf-8?B?OG1NZ0laaG1iOTRVQnY1M0NvZVc5TGcremVWc1lyMGVraGhIalhYWEtVcThv?=
 =?utf-8?B?U3dWcWt4NTdJMFJ6RHhPR2RmTDZBdDl0SWZEbnlreE9YVFRnQ0dVcjViSTV0?=
 =?utf-8?B?WmJ0dHVPQU1CRXlrclNJeUNkYkppWllFeXRlQ0pkdFNRYTlIYlQ2cDlUMERl?=
 =?utf-8?B?MTZrSXAvdjRuaXZBcXM5ZG15bk4zZW8rMTdTZ2RTWEVqbTMxdzcwV2MxUHBl?=
 =?utf-8?B?aUUvb2JtNm9lM0t4aWZoS2RqWk0rQnlEU2N4cnlhV1JMTEFXZjB0bnpnZEd3?=
 =?utf-8?B?cFk5d2FLVE5Db0ZNaG5ZS1RSMjZDbFVIWStJQm55Mm0vckFMbDFJNHdMbmkz?=
 =?utf-8?B?OCt4RkVrOFIyV29FdU05SzdjMFJpR0RVQmVhQ3gwMmpHQThxVVpaZz09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: dac6c276-aa9d-4b4c-803e-08dec84e64b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 06:46:55.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFa6l6vNhK1vxjFjDJ4CktaEU85K5IG8efM5yzqFUejPgqLbW7Zhb+SYD8TwLhzOPU+GkNwx3gpQqVcInp7Vkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR18MB988338

SGkgQXJuZCwgVGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhlIG1pc3Rha2UuCgotLS0KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFl
MzRiYzUwYmQ1ZjQ1ZTczMToKCiAgTGludXggNy4xLXJjMSAoMjAyNi0wNC0yNiAxNDoxOTowMCAt
MDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczov
L2dpdGh1Yi5jb20vQmxhY2tTZXNhbWUtU29DL2xpbnV4LmdpdCB0YWdzL2JzdC1hcm02NC1lbW1j
LWRyaXZlci1kdHMtZm9yLXY3LjIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2MTkx
YTYxZWM5ZDlkOGYxZDFkMWQ2YmZjYjZkMzAzYmU3NmMyODA0OgoKICBhcm02NDogZHRzOiBic3Q6
IGVuYWJsZSBlTU1DIGNvbnRyb2xsZXIgaW4gQzEyMDAgKDIwMjYtMDYtMTIgMTQ6MTc6NDUgKzA4
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmFybTY0OiBCU1QgQzEyMDAgZU1NQyBEVFMgZm9yIHY3LjIKCkJsYWNrIFNl
c2FtZSBUZWNobm9sb2dpZXM6CgogRW5hYmxlIGVNTUMgY29udHJvbGxlciBvbiBCU1QgQzEyMDAg
Q0RDVTEuMCBib2FyZDoKICAgIC0gQWRkIG1tYzAgbm9kZSBpbiBic3RjMTIwMC5kdHNpIChEV0NN
U0hDIFNESENJIGNvbnRyb2xsZXIpCiAgICAtIEFkZCBmaXhlZCBjbG9jayBkZWZpbml0aW9uIGFu
ZCByZXNlcnZlZCBTUkFNIGJvdW5jZSBidWZmZXIKICAgIC0gRW5hYmxlIG1tYzAgd2l0aCA4LWJp
dCBidXMgb24gQ0RDVTEuMCBBREFTIDRDMkcgYm9hcmQKVGhlIE1NQyBkcml2ZXIgd2FzIG1lcmdl
ZCB2aWEgbW1jLW5leHQgaW4gdjcuMS1yYzEuCnRoaXMgaXMgdGhlIHJlbWFpbmluZyBEVFMgcGll
Y2UuCgpTaWduZWQtb2ZmLWJ5OiBHb3Jkb24gR2UgPGdvcmRvbi5nZUBic3QuYWk+CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkFsYmVydCBZYW5nICgxKToKICAgICAgYXJtNjQ6IGR0czogYnN0OiBlbmFibGUgZU1NQyBjb250
cm9sbGVyIGluIEMxMjAwCgogLi4uL2FybTY0L2Jvb3QvZHRzL2JzdC9ic3RjMTIwMC1jZGN1MS4w
LWFkYXNfNGMyZy5kdHMgfCAxOSArKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2JzdC9ic3RjMTIwMC5kdHNpICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCg==
