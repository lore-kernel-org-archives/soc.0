Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D7634EEE5
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516090; cv=fail; b=cgcmfqxjfYp27H9DqCoqQtESSJGDf0JaeLAL89pF86lSPwgAFtCOnbmr9mkwZZ9DFdp0e1oUgaEL1OmpWngtfnlzAZ3q2XuagR+ru7PhOdad/aLoPKzlvHZ/xFJVYvNzttKKIavfeEMhIhxpgC/6e2ld/KxnOYNKwm9B7ecWaME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516090; c=relaxed/simple;
	bh=lKWWbHpOwovMksxwLBPQeDDAWGW5ktkOsCjALg0xBf8=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=OYusm0lHqvnd7Oc3LQV0H1mAsDLYExJafQN6n9SHUJdAj7zDoGIGc0HUIRAVI3XMpwfvQ2u+TYn4nAyXpgwQAGdcNn+TSWJtJ2ktBrjiKqjgBnwCyO9lTewAZa3lA/gkQygSAvfugbFtE3w80fo5zNKL8lg5KMXn1EnsxPjt7jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JfVL7IYJ; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JfVL7IYJ"
Received: by smtp.kernel.org (Postfix)
	id 37975C2BCB1; Thu, 26 Mar 2026 09:08:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8079FC116C6;
	Thu, 26 Mar 2026 09:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8079FC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP7PJZNxAVEUk3UfrFngTsxyBle8JGGRgqK8ZS+AfEOj9qYdwxWsTueX1lmnQHOYWh0TDXJLJfYy8FgppwvwsJmPZYLTvtIS3814wUVPB0EJ2eUZ9hRkzXI2+au09MAZIB7ErgOWa7zAkxHDsqyRb7KZXV74Umbd0G9X0E8IctJ4k7ge1ThL4wqNINCL7pQ3i0PtBHzoNXH9w/e+rK+vlg/pg3iNRMJiSBsFbmpl280MnKeS3ZJFQYpFtzhDCoUaIc3x5bbKAEgYyj5weDHghzVvXy0WchROeNKAOG+zMowMc54LGPNMmpi3gj3vWnnph8PxEAwVRifCV4jRRdGatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bF7SNflttrKvW6VMVU70rQTclPX8WkcsbZvthLjUd2g=;
 b=pmZ+e9kaouPqKSZzTTj8XuVjmnDK3njOGlDtYz8DCEQfdxU3JXtrx2VH5Q1KW07qoZZ4hZHigZu40c9d6ow0tzDJoO7sVut9Qi7AI7N404hB5c7n9V8ok1gV+R0mRKgQmwpAmDVQE25hR+Adsb7crh+sNJgXqURnDdpGWbMfAY88kmi1Xjf0QUknFifH9HYesW/jLTGHu/kcs3xNtH5GPgkg5gFWLdvGgOWH0ho4Xk7TM/ymNLuc+qg4Zrwd1NHTsFlsOcIjY42A0LtGsrPMMfulhChl8sUbF37bYkzN3QicEB0WBHAzjbVBUlL0hW5sgWHJ6SAX3L1TBIs7tYBT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF7SNflttrKvW6VMVU70rQTclPX8WkcsbZvthLjUd2g=;
 b=JfVL7IYJ9orXggkgKUKzm90h6Wh/9MY4eUNMO4evZwDfaMQcDAm5LKB8TjlvdSJiax/MkzXxE2prnYoMX31dMVIaqHS5mEC/mpgWCd7XY22PcYjBeqcB14rp9ZxmRKtVKghU1yjhLPHcpst+Damc7u2XwUgX4R3FBSaOprjfu28/GDz4YOxlm0AoLqxIeQdq9s1+R+chuHJElJuyc5+LcxJ5au8Hw3LXJnpNGdzbCSKIVZF37PZZD+QJN8f7GYexDjlSmN98as97l6/599/B8OYHFIA2dj3LTquaNFks80zfyv1Fg7GdqH0SSNDmYvYUtIneBs9sTXpQgCJLRoZhJA==
Received: from DUZPR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::20) by GV2PR10MB9824.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:30b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:08:00 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::8d) by DUZPR01CA0160.outlook.office365.com
 (2603:10a6:10:4bd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 09:08:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 26 Mar 2026 09:08:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:08:34 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:05:55 +0100
Message-ID: <6af7bfa8-dd73-4d12-9c3a-b2d62a8e3a38@foss.st.com>
Date: Thu, 26 Mar 2026 10:05:55 +0100
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
Subject: [GIT PULL] STM32 DT changes for v7.1#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039233:EE_|GV2PR10MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfe3576-188f-402e-94c8-08de8b172dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eW3ztc/kDXHdrxc+ZsSFIQqFQFxZcGVGexydWPq0SJcCXZmS8t8lS2ic4DokBAo6cZM1XKMkdSi6HzvnXcp7HQlxbagPpVK6dI7F788eRI8FKwO6M1asLt7wKW5+DDvjctwSTKHCHyHaqA0DBMq4ye3WxLy1Mgs1YfkrOnck0a64/kJYzeRHCJ17yZtnNcTPiytDp3Xbh2k0WcjmC/gEe8yA/ZwoQT+panpLgwCD9BusKmgLwVIuvV6YoE/Euu622eeG6dI3NuD1MASr04LhqD48mu+nqUCjVELcU9Q7f4UmPtqIzxxTgp+xnG2NY5Di9IGWZbqlRiE5uGRmuUVCmSWj4KECi7kufqwXfWGzPL4CpkWtC7Zs8639fxrzi7dGqEix7VJU3xS/F+NmP489YKwWTnHJTU/pgX3aObDOUD2U/8wFn7MLGNE3HCCHHxJE4NtLp+uh3COM40d9j0lqqZrqstmu1cuhXANUPk0s438V7gQwP1Phy6XwpsHYbQ8hZ7bbrMvwWb2c/zOv9HECGI5CWwFKgvaLLp8ea8VceMTinniexblo5G8YgQSJsIOBLEU0mlKHOGDKq/iMRRO+X5IqBAFZNdeHIUFB6UIOlVqAgA8CKRRoPGjiI4BY2hT6t8/osv/bAwNTosqjHL9F3l4xoj+6iRsRm4phCW8LA+327rxoiDCUzW0R7n1feebWXyPTrgDdLt/v9T1r7cw+uSC1WGnh2rkmGhawz3wakRAdbPLroh4isVryYG+iriw1R6BlfDeaJFKqxUCvkztsxg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LSUUHnpNa7Ysj+noWcf80Y/k+uKNg7eZBJfO4fmDup09qN75O6ZFpzqK6aVnXRp7kmoh1k7npMjM+YHKKFRwOhZWiKg49t4rv/KEGH8uPxq8F7oo2RXGIEYnuAnEH2LAyUYO3MLZV/gjiXawFtt7EGP8G3SqSGFCIXTnYDcjha7Zl4Q8xKvYmgUv7RTNG1zhrXONdm+sdRAJJ5Dz5A2SraYS1sb2b7MhAkVJbnPE/dUs2nB/CVeXhuZBsEVXxCVYykZFNZSuLFFtedfzqrYP099EvuLJmUM2pe/AWDK0uY+g5vBavGakgykGFtN7Tt3im1RcVla8YkA5k76oNhdjZ0KUvmPnSt3er355SnzC7VbqdewQxv2bvlXzMIRQNJMrf0/sWUCXqbgeYQUo+k1dgiVbFvVhsa5gfPO+G78hgJM82TjcEiT3QxTlHtrIoJ/i
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:08:00.1468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfe3576-188f-402e-94c8-08de8b172dd3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9824


Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v7.1 cycle.

Thanks
Alex


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-7.1-1

for you to fetch changes up to 407b861f4d0cd3ac2ce1b98e6e09fbc7aff29b09:

   arm64: defconfig: Enable STMicroelectronics STM32 display support 
(2026-03-25 17:37:49 +0100)

----------------------------------------------------------------
STM32 DT for v7.1, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Introduce and enable debug bus on DK board.
     - Enable Coresight on DK board.
     - Add DT overlays for DH board.
     - Add Wakeup capabilities on I2C nodes.

   - STMP32MP15:
     - ST:
       - Enable DCMI DMA chaining to improve performances.
       - Introduce and enable debug bus on EV and DK board.
       - Enable Coresight on EV and DK board.

     - DH:
       - Add DT overlays for DH board.

     - Phytec:
       - Rename "Phycore" to "phyboard-sargas" DT files and introduce
         SOM device tree file.
       - Fix and enhance current support.

   - STM32MP21:
     - Add Bsec support.

   - STM32MP23:
     - Add LTDC and LVDS support and enable display on STM32MP235F-DK
       board.

   - STM32MP25:
     - Enable display on STM32MP235F-DK board.

----------------------------------------------------------------
Alain Volmat (10):
       ARM: dts: stm32: add sram node within stm32mp151.dtsi
       ARM: dts: stm32: enable DCMI DMA-MDMA chaining on stm32mp157c-ev1.dts
       ARM: dts: stm32: update i2c nodes interrupt/dma in stm32mp151
       ARM: dts: stm32: update i2c nodes interrupt/wakeup-source in 
stm32mp131
       arm64: dts: st: update i2c nodes interrupt/wakeup-source in 
stm32mp251
       arm64: dts: st: update i2c nodes interrupt/wakeup-source in 
stm32mp231
       arm64: dts: st: add i2c2 pinmux nodes in stm32mp25-pinctrl.dtsi
       arm64: dts: st: disable DMA usage for i2c on stm32mp257f-ev1
       arm64: dts: st: describe i2c2 / i2c8 on stm32mp257f-dk
       arm64: dts: st: describe i2c2 / i2c8 on stm32mp235f-dk

Amelie Delaunay (3):
       ARM: dts: stm32: fix misalignments in nodes of stm32mp151
       ARM: dts: stm32: fix misalignments in nodes of stm32mp131
       arm64: dts: st: omit unused pinctrl groups from stm32mp25 dtb files

Christophe Parant (11):
       ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
       ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
       dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
       ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and 
phycore
       ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
       ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
       ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
       ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
       ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
       ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
       ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces

Gatien Chevallier (5):
       arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
       arm: dts: stm32: enable the debug bus on stm32mp1x boards
       arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
       arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
       arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board

Marek Vasut (1):
       ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM

Olivier Moysan (1):
       ARM: dts: stm32: remove i2c dma properties in stm32mp157c-ev1

Patrice Chotard (2):
       arm64: dts: st: add bsec support to stm32mp21
       arm64: dts: st: add bootph-all in bsec node to stm32mp215f-dk

Raphael Gallais-Pou (9):
       arm64: dts: st: add ltdc support on stm32mp231
       arm64: dts: st: add ltdc support on stm32mp235
       arm64: dts: st: add lvds support on stm32mp235
       arm64: dts: st: add clock-cells to syscfg node on stm32mp231
       arm64: dts: st: describe power supplies for stm32mp235f-dk board
       arm64: dts: st: enable display support on stm32mp235f-dk board
       arm64: dts: st: describe power supplies for stm32mp257f-dk board
       arm64: dts: st: enable display support on stm32mp257f-dk board
       arm64: defconfig: Enable STMicroelectronics STM32 display support

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml 
                           |   8 +++--
  arch/arm/boot/dts/st/Makefile 
                           | 129 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  arch/arm/boot/dts/st/stm32mp131.dtsi 
                           | 156 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
  arch/arm/boot/dts/st/stm32mp135f-dk.dts 
                           |  24 +++++++++++++
  arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtso 
                           |  85 
++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi 
                           | 164 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi 
                           | 236 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
  arch/arm/boot/dts/st/stm32mp153.dtsi 
                           |  68 ++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts 
                           |  59 +++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => 
stm32mp157c-phyboard-sargas-rdk.dts} |  24 ++-----------
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtso                      |  61 ++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtso                      |  31 +++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtso 
                           |  10 ++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtso 
                           |  10 ++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtso 
                           |  17 +++++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtso 
                           |  17 +++++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtso 
                           |  89 
++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtso 
                           |  24 +++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtso 
                           |  10 ++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi                        |  75 +++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi 
                           |  74 +++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtso 
                           |  27 ++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtso 
                           |  24 +++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso                 |  26 ++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtso 
                           |  35 +++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtso 
                           |  19 ++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-560-200-x12.dtso 
                           |  66 +++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtso                    |  28 +++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtso 
                           |  13 +++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi 
                           |  72 --------------------------------------
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtso               |  35 +++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtso             |  35 +++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso               |   8 +++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi 
                           |   6 ----
  arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi 
                           |  97 
+++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi 
                           |  40 +++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi 
                           | 285 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => 
stm32mp15xx-phycore-som.dtsi}    | 341 
+++++++++++++++++++++++++++++++++++----------------------------------------------------------------------------------------------------------------------------------------------
  arch/arm64/boot/dts/st/stm32mp211.dtsi 
                           |  16 +++++++++
  arch/arm64/boot/dts/st/stm32mp215f-dk.dts 
                           |   4 +++
  arch/arm64/boot/dts/st/stm32mp231.dtsi 
                           |  31 ++++++++++++++---
  arch/arm64/boot/dts/st/stm32mp235.dtsi 
                           |  18 ++++++++++
  arch/arm64/boot/dts/st/stm32mp235f-dk.dts 
                           | 130 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi 
                           |  63 +++++++++++++++++++++++++++++++--
  arch/arm64/boot/dts/st/stm32mp251.dtsi 
                           |  24 ++++++++-----
  arch/arm64/boot/dts/st/stm32mp257f-dk.dts 
                           | 130 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts 
                           |   6 ++++
  arch/arm64/configs/defconfig 
                           |   4 +++
  48 files changed, 2526 insertions(+), 428 deletions(-)
  create mode 100644 
arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtso
  rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => 
stm32mp157c-phyboard-sargas-rdk.dts} (58%)
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-otm8009a.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-644-100-x6-rpi7inch.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan1-x6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-fdcan2-x6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c1-eeprom-x6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-i2c2-eeprom-x6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-ov5640-x7.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-avenger96-overlay-spi2-eeprom-x6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02-overlay-wifi-rsi.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-460-200-x11.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-497-200-x12.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x21.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-531-100-x22.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-560-200-x12.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-638-100-x12-rpi7inch.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2-overlay-672-100-x18.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
  create mode 100644 
arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
  create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
  rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => 
stm32mp15xx-phycore-som.dtsi} (53%)
