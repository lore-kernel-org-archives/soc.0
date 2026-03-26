Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2010D36B047
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515981; cv=fail; b=ZTO9huJQL5ibeuB1j3Zt509VgCuXC6/nVgI+NQM0EaQ8QoRjQ1n+9Aw/89sBlEOsi7gLR3h+xGr+MPpBBl1kEB33meAS8FYPaokU5aQhrTCYfrzHpydN+exSik9BXZwKldAWxrjPq/iHXLuYpxqCUX/S7LybDfUGTGHja9WH5nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515981; c=relaxed/simple;
	bh=lIBm7pb1c7D8IOQghb21Xkk2xb7tvzcb/2iuQQcxjGE=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=EVkoV5vbKaGDAtUwp7pi0rGrjgUh5A0OmFSXtE7I1kRktWS4OXR5/Sjoy76auwD/pAJTCZ7bSkGyjA3okQwPvk+LtwSRXqNwuTp0XDhv1iH/9nd3OKtX3AhvV4JT7/a7zmV1fBgOPnJmSS8FSobfqrUDFchZL2KQtROMiFio5Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PUHgDJhV; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PUHgDJhV"
Received: by smtp.kernel.org (Postfix)
	id DA6D6C2BCB1; Thu, 26 Mar 2026 09:06:20 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92B6CC116C6;
	Thu, 26 Mar 2026 09:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92B6CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUYAf40+G6rHV9vW4LxusWZX9NLaEkz8szGgCPb026h8pA+Pu9FyfnDQknVq0hZMjNv6szAsf1VgW4ERxSOTAFPwpuZNuXqOL/8pMhm2hqOuaGbth5DFmEbeIJWAdxhX2r3djAyruL6hAuuQlWBqlSSEfSPJ3DbPHwF7T2Q0FwJAGwIiXBZet3iiVgMqjYFsPgPHE3cx4/LMIR+zJw0+eaZllSoDOBdDsqrb0PSL8NjAKbQyBoFrtYRC73U7FypxQF/DBNLvPldoN6o/jfUr1WBG2Jr/V1CPXtlc0/FLv7SWzff3SulpH0vfOdX0bE3x/twcmEyaLxNSb0aLKOuNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goJY3W2COt2O5Fk3XW0jKUudrTc+wUYmk/YTYbbmyDA=;
 b=aadSTpZhbFFcMRM0aYO+dRXpXdzorXJLOlphOZw8zcRlgrW8LYlD/i7I7xjKQnHzlcd2hJ0tZRInFp5cJHwEyrQh/fZfzzUmkK0TAghR3aHM1SEB6SCy8erE2V+NVwCjr8gpt5FmCbvUNC/xiL5rEUrndXxtXjDp+dhZpS5RIIrKvRQ6ygdVvj8jJjDIU+J/Np+ai48QE/Su60ofrWfQUDT5tvEamv+4GsacueKPH4MXGSxWpOrW3mgFl4UWKhRDiPDOREKR1q1lWjFX53fxwoIHk4ZsIbnQOicvGPWmzXzbTeyc4Dn7qbP8ttxM/IdSaO38yPegEw1P8xeoOH2sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goJY3W2COt2O5Fk3XW0jKUudrTc+wUYmk/YTYbbmyDA=;
 b=PUHgDJhVHpGJUZdBTLW3kX5RXBlzS8PSj471vfhpNqv3kxuFoq9Bgm7TucUEL4RIjyqrDX/lWoyrU1mH4AzUQKw3VdsJ951X4TsyMd4b/xlns1u1ubaPSnq5Zg9BWVHc8uNZwFOaceWrNONh2T2czWdYzdFqbn38PwD8se0tXbxuMLDlkZ43fbZpuwQRfQDLsWXlcDYRgZeryil9hdWhEFLCr6gWA4SmKFLA0SqXFgkyS4InzpD2LaTgkiuWmuHv9lAP7tilqh2Hmqhk4MpDIezlWUKVVEPC2E7gIP5Zsd8Z+Aqwy2qWktwMmWCOVvIsDj18yNi6/1EJhz0Ejv0ibQ==
Received: from DUZPR01CA0312.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::8) by DB5PR10MB7667.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:489::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 26 Mar
 2026 09:06:12 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::23) by DUZPR01CA0312.outlook.office365.com
 (2603:10a6:10:4ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 09:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 09:06:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:07:02 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:04:09 +0100
Message-ID: <c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com>
Date: Thu, 26 Mar 2026 10:04:08 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
	<soc@kernel.org>, <arm@kernel.org>
CC: <alexandre.torgue@foss.st.com>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 Bus firewall for v7.1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|DB5PR10MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaf6a04-28d7-417a-1bdc-08de8b16ed90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VZve60M65Horwm/3cGiC2XO6/7zf75RKvumj+6nTa+Zv/+H1DCNEsD+5XH04QrxTUBo/REEDqf2lgScygX9L0Y7b9U7q1KP7ne0M5jevWId49Iexf/TeMzQC3UmTX4s8Zm9/sF1qkfojs/KMaR/No7Wm3m6h1z1dRhfOVVo9Aymwo5M4vqLSEaCUP1U7wXbt0zFS/ezCkd0pLSILyajtC6VZaQmd8qOJPeMADRCgu6/ZRjBemAtecvFlCxSxbVfcALdh2UXxRNHDSDGU3sduim762r6SsENiz3FpFHom2GbTnhph+m3yLl1D66Az6xO5ix83WdYL8188F1pUwzpbyjp/5QS3PgsV5FR0HbHQLUG00F8ER13fI/A4bvtO+udhGigqYJCwDTRcAcuk/FgRAFInhNiYk+c0RD85mTs2hToJrwhvoC6SWKI0jsfVDg3rXP1aiUGTLoK7/ffsTvbG1w5fvJ6Tixs+l28X3xUI0SEsfKg99nHp7OJ/3Boj+9+UBM3Lvs4RxApOZnGuUNlEvgnP6f6V2b+LH/ZQXZaiIAdmrJqNrjSHeh7f6DKVt4BYJoHRTM8cpLoySv2p++INWh42U16T+mTNHs3bLk2DPVu4WCpWMUSca9RN+sD50LRam4ZWpVFS8nr2C1pX81N3epz1xx3zt0w/DPS8y2BuRi5rMlow7tauDUryUVJbopkZ80hn81RXNxVA2MNactXIYnP4latM6Rdx70YPWK8QAE+xINjrPepIHUDYeGc3YMiKOPMl4VSeSwCzUqfBzj8CQQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	02OiUvNEpvIu9R2mhdhI7juRMcy54ZHuUKdLJC5tQCWOUwzU8iwnOlQNhXhcM8xrROJv9oRr8BmC/uVN55XFJQIWA1KrZrvJC8CiUHgi9z4uw1No5tYFCoSJhnqVxBPp9e6WhDfVHiF67+qiwb1WOSo7Ak25C0KWV8zggQWFe0h/RbOyiYpaYSYLSi8KJMS0+InTeBvqkqU3snrmFvbxfxYkj/elMn2OZWRHzB7V5UYkSZlI1AjQ/5IOSWEKJoozmcw8pTp/TbvmWP9C0bsX/3gbtOXc6+mnZaEHb1S9fcF3z4yCHkdES7RDxp9VGgByW44zreKuC8KOzPf3N0FpZ1HcHqDtzJDMxhzicwG+aVQG8u9rV6Gc5l8BnMC9XdO+AOXbZKdgJt/5HdJgx+Il36XbS1q1Pb1H0aTA4+QMjTafdjZ+craZqCBrBEFLzxmO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:06:12.3194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaf6a04-28d7-417a-1bdc-08de8b16ed90
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7667

Hi Arnd,

Please consider the first round of STM32 firewall bus patch-set. DT part 
for STM32 MPU SoC will come with the STM32 DT pull request.

Regards
Alex


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-bus-firewall-for-7.1-1

for you to fetch changes up to 348741a97c28d7679fb1e204aeec0d6305fc6817:

   pinctrl: stm32: add firewall checks before probing the HDP driver 
(2026-03-25 17:40:22 +0100)

----------------------------------------------------------------
STM32 Firewall bus for v7.1, round 1

Highlights:
----------
Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
can monitor the activity of the cores. Because of that, they can be
used only if some features in the debug configuration are enabled.
Else, errors or firewall exceptions can be observed. Similarly to
the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
debug-related peripherals access can be assessed at bus level to
prevent these issues from happening.

The debug configuration can only be accessed by the secure world.
That means that a service must be implemented in the secure world for
the kernel to check the firewall configuration. On OpenSTLinux, it is
done through a Debug access PTA in OP-TEE [1].
To represent the debug peripherals present on a dedicated debug bus,
create a debug bus node in the device tree and the associated driver
that will interact with this PTA.

Plus some fixes.

----------------------------------------------------------------
Clément Le Goffic (1):
       bus: firewall: move stm32_firewall header file in include folder

Gatien Chevallier (8):
       bus: rifsc: fix RIF configuration check for peripherals
       dt-bindings: document access-controllers property for coresight 
peripherals
       dt-bindings: pinctrl: document access-controllers property for 
stm32 HDP
       dt-bindings: bus: document the stm32 debug bus
       bus: stm32_firewall: allow check on different firewall controllers
       bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
       drivers: bus: add the stm32 debug bus driver
       pinctrl: stm32: add firewall checks before probing the HDP driver

Krzysztof Kozlowski (1):
       bus: stm32_firewall: Simplify with scoped for each OF child loop

Thorsten Blum (1):
       bus: rifsc: Replace snprintf("%s") with strscpy

  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml 
  |   3 +++
  Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml |   3 +++
  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml 
  |   3 +++
  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml 
  |   3 +++
  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml 
  |   3 +++
  Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml 
  |   3 +++
  Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml 
  |  76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml 
  |   6 +++++
  MAINTAINERS 
  |   1 +
  drivers/bus/Kconfig 
  |  10 +++++++++
  drivers/bus/Makefile 
  |   1 +
  drivers/bus/stm32_dbg_bus.c 
  | 250 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/bus/stm32_etzpc.c 
  |   3 +--
  drivers/bus/stm32_firewall.c 
  |  59 ++++++++++++++++++++++++++++++++++++++----------
  drivers/bus/stm32_rifsc.c 
  |  61 ++++++++++++++++++--------------------------------
  drivers/pinctrl/stm32/pinctrl-stm32-hdp.c 
  |  14 ++++++++++++
  {drivers => include/linux}/bus/stm32_firewall.h 
  |   0
  include/linux/bus/stm32_firewall_device.h 
  |  26 +++++++++++++++++++++
  18 files changed, 472 insertions(+), 53 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
  create mode 100644 drivers/bus/stm32_dbg_bus.c
  rename {drivers => include/linux}/bus/stm32_firewall.h (100%)
