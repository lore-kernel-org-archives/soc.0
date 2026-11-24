Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536428;
	b=u5jjdM89KSKsTjgvOp6mx7LV+GkQniIc0dRTzu1k1GByHEFDOgCZg4XWtVoOXeJ9Q+qV
	 Mw52ZYNi7RXJx1OcotAfDRl4IXHqTegbJR5ZH2pGbhO2f8/o1VuCzCxpljzATPlX1jJc8
	 M7ZVHHSXzOPQWBgURtMdUQ/A+VRv6QaZvdoZ/Jq6nNcpc0br+B68pXoqliM9fT8bcFaQP
	 T40A+2HSp8PGB2NodFWqVKMT+3BJJzWJxIKi1idYEvT3N7dQtWCd5jtuafKNNy/sBmQB5
	 08BQzLtNVw16gjST9Y7tRYzt8++i8BqitTS7TNAal0nqHCoCsAtMKGPs7JS0Ia7ttWQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536428;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:Subject:To:CC:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pMOj051FF6QbSyNhNWieLsVfruKQvW52hSq4P3nTG8o=;
	b=m+axJ5jnSm07zdG8z+typpkOQ/TonTXchUlsLaIaAMYm4gRAps51H+49MA0Tt6wUlpq+
	 0Fj/UQUbPsH5JsIYZElrgqG+nxBJZv/5SaBCSyNyZSfSsVXGZoIX+OSCX0ZXrLMQXyAer
	 qEnOduWG4tJ6TNO/X0TVrqLdSNGkLcli/374i2t6vVj28heS9zwJicCYt7C1sXIHrQBsQ
	 cKiR6KVPKhZn5kWnY5RvDlZ73JgE+6j+UWBMFsfI/eNIDRnfAI+rxIucFTxNTav9XZ3+I
	 qxXCmIQ9fWUd6dD+tBULtJ/gt7oCs6wOuEMv2YfL8jxdvvX7u/H/bKRhJUNlzRcyVPQ==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Kl49DuWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D3A606A321
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Kl49DuWy
Received: by smtp.kernel.org (Postfix)
	id 24E6F1F000D2; Tue, 24 Nov 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.38
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1795536427;
	b=rN2CraZbggXNN1O+Ewa2ZN6maQxVNsJdLyUcDrEU9UlFdKjc6wz7cmqHnfFarLZWXD7X
	 DiC7AldgjOQsoqykZzMx3FnRPxbVjRjsKUlGYxw1IgGsr3uZxV2E2O6AvvgQMmggNV3zh
	 v4aKn4pB2pU3tkw1SFBhjkNeNwbksgdGcA7IiXzLY5c19IHeu4e756AFqJMmOo+/2mGkm
	 px77rLJxK3oOCflf34NjujikhT7D+890yJZVDgZexdwLicqKlroZidBY6D7wDGSG118Wv
	 wpb2rBBkWJ49Em7Br1wOs2scIupayfJ9qB+G76Z+OqIy+mUbXkY9d68sR2ydBz3ltvQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795536427;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 From:Subject:To:CC:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pMOj051FF6QbSyNhNWieLsVfruKQvW52hSq4P3nTG8o=;
	b=R5Y2x3K962ei7to+AgtRDQeSvNS/XGR41FF9eIBnGUOuaW54xNc2v7ST00Wwz4wGdZxL
	 CNCAvcII48MTHupGNDLsGp83Jk8DkWxH8eet/PsU7tXAe7Y/0tvu6ibB81FsBreC1ZHUg
	 erTEr2IHQuv6Cl7sDb7fELwKGBjjO8EbgnSPFji2V/XVIYC9ZQpH2f5kSIyoiFEO4GCCq
	 kNcyoVHeNFTJSKp/uwOt24AAz/Tz1lvIqcJWM/XUb9RfgaRv1E/XE4Xhm3JWEhxHanSUe
	 nMPY3B/Ma3SaWY6nXTrxoG11kEJzU0BLLpKxqXhjhTopBMx7l7L76mQQKs1HjmW4leA==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Kl49DuWy;
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.38
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59FB31F000C6;
	Tue, 24 Nov 2026 16:07:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Kl49DuWy
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 59FB31F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg9tMrFUrH5KgHKhMQtfPBtAiJ4HSA95l2MhV9ujoZvyAK6VSjphVZ2G6DwfAFuLrAs9zdCJCjKT2ueRRHT5irj+6h3Riv1x8vm2pnnwyQY7vJgcQmqDFyOhJO3JUIHGHMhTcC0o688wuCgK3gVFMk83Z2aImTYgRgkX0p8NRZvtg5FMpqzjkxqqN+tA7sDePjGabCA3iJSpyChhVIOtxqlAPsBUMVaURtPv/t0I8il577aThKY21n3mvjb7AYEAZ2T7PBPsEzHbCJpXaKJ9A7qflVFBofO0EIiJUbcVJive0EdCGc/0ZLPLlDfUUSvMAgzcX3zRrMww/+XCAGRvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMOj051FF6QbSyNhNWieLsVfruKQvW52hSq4P3nTG8o=;
 b=v3mWD4xWYI8/L6hUW/aVDJUt8Ka4QKU1JboG81O5RVzRFw1IwBOvjSi44QW40QeiXYCiKCVa5Wk3LGvQfi6Jt5TfxynpLoG56pbn0YH3XltU7uFcsJBIBayZxBnx1v2I0PWuHAOcKoU5A3O8RxwOTFsb81jhq68ka1lIdb38BaG0PJzpfeKn+WDTcBz/E5avt71a0D29Dx6S1ThBNF3jPdVqDI0Cp9MY/caRiGBNYEg/y6PZxPIbsoR3wt0tNPCeBGgjt0SR3tXdyzxdFPQfy0SDSdeDBgphFGmj97TTgYl6Q+fkJ+v/TfM05p/SnTclW3+8R+FZAVl29iwT4OfqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMOj051FF6QbSyNhNWieLsVfruKQvW52hSq4P3nTG8o=;
 b=Kl49DuWy2sC7m9cMOH1SgO0PECZllQU5fkccwArVmjyA9bj7Y+FKdlAguXbNppIXq/T3h4N9AA8U2pWtJ9FPepAVwVMsPma7roMa7C703HQplQxxxpKlC5TgrD2/fS32orROk8JgTynqPiLyZyXSzi2eQzRs3SMpvST6bN5mJ/uiYdwfKpvWWoZFrAtPHg5qyExRfWNBJz5DBNQaq3SE//0tG8619Py5tkKX9/8XShHxEV3tLXHpAyqjTRzr0T2Efr1Bntar2HIB6mdyH33SP12cbA8FFz4DiVcxjPOJvyQQ2aU3ZHOW2SAhl5Wdk8m+7eRQXfpAYIDqEDEC57+FDg==
Received: from PR1P264CA0182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:344::8)
 by GV1PR10MB8735.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:06:58 +0000
Received: from MI3PEPF00008497.eurprd03.prod.outlook.com
 (2603:10a6:102:344:cafe::ac) by PR1P264CA0182.outlook.office365.com
 (2603:10a6:102:344::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.15 via Frontend Transport; Tue,
 24 Nov 2026 16:06:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008497.mail.protection.outlook.com (10.167.240.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 16:06:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:07:42 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 17:06:53 +0100
Message-ID: <7acd50d1-fe84-4c30-bdd5-11f67d7fdb1c@foss.st.com>
Date: Tue, 24 Nov 2026 17:06:52 +0100
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT fixes for v7.4 #1
To: Arnd Bergmann <arnd@arndb.de>, <arm@kernel.org>, <soc@kernel.org>, "Kevin
 Hilman" <khilman@baylibre.com>
CC: <alexandre.torgue@foss.st.com>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008497:EE_|GV1PR10MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee6cd0b-5839-43c6-7a2d-08df4a44f7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261102123227099003|261021121427099003|261022105027099003|261021123027099003|261028144727099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eV9IVyLPh2vkD0FA8b797LM+/8WXZyvC7OXfJCGh4ncYW66bGbOpsJKb1cCxOgdoNac6u2sUrJWxZfHa3Y6n5A4GxtXKj2w/ihVuA5pDbLQuDhn9CtGjsVgWswUpSrMKiGLuJLQcMbfthLzEWN+7j28cmQiCqCjVK6mLz76b2zC5ewGZ8wBk0AWt2Ol1/G5bxksHma9tCN8s01MF8p5VAK0q56pBCEtW0A+yehv5R+65vh3AHSUl0xbL7zCycaoZo03RRAzb75eDP74zFYcdamll+8y8iQQ6b8JXx/GViKxNqAQbS+NLrfr9iA7dBJJRSDu/DjzLOAnOrNPHGsLNHGyBmH/vwdF4HSXGtr6XnIjFeWxmDGYlkezaYHUWvU8/b5/eN941y5iyiSdIRtZ1ndiLbjOzpCZYGVeVF7EhdiGFuYMQdV8aP3A/VWZQdc3O8o/8v2n++nPQgJGKp+B3WeK3XLdUpEOYYmhsFObwys8Lc0ThRfmPi9QfyFWO2XzQkNipfarNDrFwtCchrE1G3hVUu3JRNWbfs8LMo2VHmMjaNEeqZqr/SZmwndbLME8ShOaogSfw8eXE32GBukS5C6Ej30q2yTvjGKsmPKSTqu8rJDQWaOBbqlHvM4tXUmX9gu2xCvSD6SnxvxI3gzpC7h094dgpSw4IpModgob4xSmPEWILTGovdOMnfQSxttYEGifu6C1tO9pRyvnyDO1sEQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5WYcSyWIu/wXofS/pKKCwJE77insWq7mYKbK2hKwf/uzX3nky/zKNW+nD7lc1SKL/LqB+zB3OsJqwzFvlA0O4Ge7D3SE8T/gwhnxvvJoiuwMHg4AtBvJuWm9AMxKrDdAcxV86SxIRwXyEgDJmWzzsqrYhFwdoiIKc2TxepKVik6qyeu3yezZ61QRkzBxPq9kiHxBtfoUeHPvfsCvZ6ioQZp1hcItgMuZjbiHPkcog7M3v+jU8jQmuFGfE/wSAoe0rFs+d+MSzEEu+b/oS3I9IQc5kfbHCOogFe0PFaRS9OTlL0xm0Y1Noh7wIEBlS4EXVO+3m+R2+EgDHr0r6Qbbu8WtUEdnbp0QOw/Calq22KDo4z5IfVqoT2wbdVRLNpWg3cwTY1A/jmbntPR/AeUArJrmGWWXil2PY6/URTypToJLQ4jRjfyCKVRagOZ9nGJX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:06:58.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee6cd0b-5839-43c6-7a2d-08df4a44f7af
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008497.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8735

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT fixes for v7.4 cycle.

Thanks
Alex

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git tags/stm32-dt-for-v7.4-fixes-1

for you to fetch changes up to add40017961d3f07b36bad48840aaecf57128150:

   ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX overlay application (2026-11-24 16:26:26 +0100)

----------------------------------------------------------------
STM32 DT fixes for v7.4, round 1

Highlights:
----------

   - STM32MP2:
     - Add reseved memory on Engicam board to avoid IAC.
     - Move BT on USART2 and change GPIO line names on  STM32MP23 DHCOS Som.
     - Add PSCI idle state on STM32MP23/MP25 CPU domains.
     - Mark STM32MP23 timer as stopping in suspend.

----------------------------------------------------------------
Dario Binacchi (1):
       arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257

Marek Vasut (3):
       arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx DHCOS SoM
       arm64: dts: st: Update gpio-line-names on STM32MP23xx DHCOS SoM
       ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX overlay application

Patrick Delaunay (3):
       arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
       arm64: dts: st: add PSCI idle state to STM32MP23 CPU domains
       arm64: dts: st: mark STM32MP23 timer as stopping in suspend

  arch/arm/boot/dts/st/Makefile                           |  4 ++--
  arch/arm64/boot/dts/st/stm32mp231.dtsi                  | 16 +++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp233.dtsi                  |  1 +
  arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi       | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
  arch/arm64/boot/dts/st/stm32mp251.dtsi                  | 14 ++++++++++++++
  arch/arm64/boot/dts/st/stm32mp253.dtsi                  |  1 +
  arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi | 12 ++++++++++++
  arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi       | 47 +++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi       | 45 ---------------------------------------------
  9 files changed, 154 insertions(+), 56 deletions(-)

