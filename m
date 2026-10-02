Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF763486B87
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948244; cv=fail; b=Zuu9SVS28tjA2iy77v9iauw5CQgr0q8aP94EAyQOHmi6YpYhJYY3YK3QylrJgr0vI8FXZoVEwT0aOTwK0mgrvtQ7ooQLI5VHFkhSiVOzyVRm9Ulb2h9W5v3Cb0i3WAHqZqitMvJeTNk6vjPU5ySznrBEvjBV/q4wHTKwq8Tb2ek=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948244; c=relaxed/simple;
	bh=og+hkCB3QhNB7pHoF+pP8l15ZqQlaf21UOP17O8NQko=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=WwchY5j/fSpI0BqZ/pZI/phbNU2mncS5F63I2wkPf3W8uA6/NI+7iGorxs836qwtsf5bHagqHbqFeTN2lJnP947mTN1RLxmBMwnuaOxA028RbeFnOHIzqpUolcOgsgF+GmWgnGEtEcgePsB3Qv1uO9+IIox7gNP15iMI43IQouw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eai49ntX; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eai49ntX"
Received: by smtp.kernel.org (Postfix)
	id 672391F00898; Fri,  2 Oct 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.0
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790948241;
	b=2HVy4uoOBQXbba8JoBlz+tPF7/Zt1oAyvUVz6flC4pAu6oikC83gMRIgBMLu8ZoEhLOq
	 6whNyvvLoW2TOVC/Lp66858EXevBuL/sMvw2SmFToWgFyyHX1NTQr5tYqKAEpFd6C1xM+
	 SoLe/9ljjkFfiaYb07b5+TkwPIZ+vH+inLvuGMd9fS577U9/p7pR2aJOxUmBJEAPSVtGu
	 OdgYB2Ho2XgIJWvNVgu9hGgEoRIRN/TxR4dBUEd+3eNoUV317gs8YKwADf8WXw4S4Gs3x
	 FZWBYSVu554badQ8FuNqQCZ12DcGGDr8L0HMnC2DFueDZ+muNb4IX9EjQq1oI/kjC9g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790948241;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 CC:From:Subject:Content-Type:Content-Transfer-Encoding:
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
	bh=MG4ZOO7mvob/hxywPQxDxFqpvK66P+W5f1TI46tMZAA=;
	b=kOtfhWUTngoXy1cSmiBlMwY8hXh74eG0CzXllG8k8PH5nbgdMsLHvM9GP54UIhEVzPAH
	 9+Rwj/hXGyZjlhF2w2MtJf6hxga/ws7OEFDR8x+5l4w1AGbu4KsqmVyUTgSd0G8bV+Rwe
	 qNcPtqKCnhTAAsNlD5XLp0zb6yqrvtr2GfjKzj8ceWBAwNt71R5qtixAdwv9wN3cvchCG
	 pB2TqwAOpGCB7rz34PTIqCIX6B+26qVx4WP7ONzto/DIecCkve2Kw4oNNbkCQxFulBU5S
	 disv2cq0y9sxnF6ChLEKPniD6Wp+D0/fmOR1Q9xoiO0yFxncwdTS1iJzDNnuSLdASmQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=eai49ntX;
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.0
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 233C11F000FF;
	Fri,  2 Oct 2026 13:37:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=eai49ntX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 233C11F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt3tQr6RaA6hbIeBouJRxnUgChgY4sUm1xlLe2Y7O9DjPKIXSrEmOGmoENu+eIVxvNttTcIvLS7gtDBVR0dbywHrRnuHm5fFH7Zsq34mFqRkegyvQp1F2AB4lG+HgXrGJZ/44oEe17iG1kouvIJ3j6Fg/0AqNjJtOs7xEZdXIOedrT81PtZZl5mlD9ezcABobri3ypuMB+woeb5+yp0OrqTsgVEkda7023kAudfxSWsgzAAOZ0BkOzPtWgLDHBlAgWtwVMHsOXvoqwZTauJEvVBmPM2zobwm49ymXbJjsa1EWYohE4Ze6cEumfp8v6OY5motP9yjtdZ2dYRjdW2Ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG4ZOO7mvob/hxywPQxDxFqpvK66P+W5f1TI46tMZAA=;
 b=viLYkl7qp1/+7OblnltptdYn5jmtukuv4qlMMdJvdPJtf4Ub2i+1lTtaxQDhZIqxj8pWrQA5jYDFh+mkRRf76CeSMkmqjXevDX3fFGS2wMuZ4M3WqVW9fdWTGGmrXuCFcNdnjt2njbbwj57RrCr/eYZff3BdLTC3YQR+/8PW6Qc7AJwHyRtmddK2941xzT++ON6IcJRfdW5kHkI0Yu9cFCWSXFvuJv8Bg8DIdolfc2YnngpeE7nt5C+07UvStKEEZLU6tVybDphMDIUOBdbdMMkC7WNyepMoTWrTfRkyhYgvJw3akCibUj1jWWQybR5q8OBQAhP/1S9uD6U+EGW4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG4ZOO7mvob/hxywPQxDxFqpvK66P+W5f1TI46tMZAA=;
 b=eai49ntXMhumnR0oDcJ8xb3TuUbgnklMih7D6YPlddAMCBXLSvvajMJBxlU2nUmE39jKxhnfb/GPFn2twITklqBRM1+FXzWcYAJA9nMIExDPNMq49Mob2ZHK5vX3j0KHsZcCky+cIloU17NqW95HzeuesC9LgeCCoFgWCdWkistCkJDue70brhAiu5F9Jy0gqHNvQW2YHL0aG6KccBqAJk1k/yLTOUo7gqG8PtjW7QG2bwrsmv4z/n0GRDgejUwago7sPMSKT6XSrvJDGxun9HyhE0+MJiO3X8DFbL1QPcEFA3uFhhvcP2t3sPs/4BsBJ8umOK95buBiqf8gPkX4Xw==
Received: from DU7P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::31)
 by AS1PR10MB5339.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 13:37:13 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::a0) by DU7P189CA0017.outlook.office365.com
 (2603:10a6:10:552::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 13:37:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:37:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 2 Oct
 2026 15:43:45 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 2 Oct
 2026 15:37:11 +0200
Message-ID: <44917365-a20e-484e-a252-f420f566ddb1@foss.st.com>
Date: Fri, 2 Oct 2026 15:37:10 +0200
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
	<linux-stm32@st-md-mailman.stormreply.com>, Marek Vasut <marex@nabladev.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v7.4#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS1PR10MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: c88356ac-3933-43b2-be33-08df208a4403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|18002099003|6133799003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ipuLu2pXqv1meS1Xt6Qj95gxa0y0NDGrGWjoOweN3Dq5+DfCYx2V9y6WTbfZOGeVm6bo2tDWcPLF5hMUz6QlXg6/CyiGLL5zhCHYtus8SYB8ApB+sJLPr3RcgOBZQrJg9qtAd56NsCNsBzKKrNPdoKlFpoICL349Z6MpZV8Z9Y1YT00ClcYQpJNGBNe96MQgfvMIAA2juOEJlI69Y4zayy4bJdtiJBNBHjJIEbyOVHbo3FESE5hge53WX5bpyj7HaZMkjtu00bA0DFv6E3RaHc2KArTcrDmo4DLtOaowIMrd+lMSV28Y7VfKyCk3XZhWXe+O7ZyK02oGeYjrpyK+EstNQyki7gTyFW2wEOuW16biOtTiPPdI73/HtuKN8/9Z7lRkGDwlr92QvITzt7JX5TkX3qI+aR+2Rq+nVCt8K/rIAZsnhqOnr+ln/nkQGUcUUeE3BSAAZvKftWOjYPhGkDa7zX5loF3xVzcnRP4PhUvJy9M42Z+oV6DmEAWaxyoHZMYnH+lBB3OAPfH94fc1Iep79X8A30IKXV5tFo2PERumSMggWbBrK8wGp2glfg9mg5mzfxSVxm/DKeQUXP7nEZLS0tsAWO2s6PZJWX43EngkKe4hzxJg3f/hyTr75qm9Cgd6PfidNQLDKL/SfnAv1BQ0cNUblCgYrVnm6eHwxN5JKCNTxdFMtfa2+/sasH3/maPD68Ssbusm7lIS1avglQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(6133799003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TIlEOUdGtSVk20603ptb3MAB/ZvihVPbXiYnIgMu1S0aEDa4k6KSUBO9VBP9llbCiKRS+NAuxVdSZnl8OvhH3js2kBBd54TZVkko2Cg1focC7+5Y+BftvYS4UmB00YArR3+EDNLtMrRtSNTKPkpimDavDrG5rJRn7ruaySBnnaXfaYnD63YyIJ2FfEMPg86Pu655pu2syvwXvA8hkgmVAa59VteLTr5lE2HMCirmhh0hxa4Fb6iQ5eL2BBReD5Hj2RbZB0M9JTVsI8dXCigi1sh4Q99DUkoDkak4u4e4hNJ4zniwxOuEtY0vwgGU8/tphENzXNuI+bV0B54fmGkIGk5qDJOFjl2HRn1J+hjk1Lb0bvCrMOFWqCCEfNg0kZXXgEeJAKxIaC33lHovew445OUB5PabSY/7aOJ7JTeM4mrv4R2HOW4r6P0F48bhm5Zw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:37:12.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c88356ac-3933-43b2-be33-08df208a4403
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5339

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v7.4 cycle.

Thanks
Alex


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git tags/stm32-dt-for-v7.4-1

for you to fetch changes up to f831584128ac2a36fb4fa62fe106793d08c2dbf1:

   soc: st: Add STM32MP2 SYSCFG driver (2026-10-01 11:39:46 +0200)

----------------------------------------------------------------
STM32 DT for v7.4, round 1

Highlights:
==========

   - STM32MP13:
     - Add DCMI / LTDC ETZPC access controler.
     - Add SRAM nodes: SRAM1 16kB, SRAM2 8kB, SRAM3 8kB.
     - Add SPI5 DMA chaining support.

   - STMP32MP15:
     - Use DMA FIFO for all SPIs.
     - Add SPI4 DMA chaining support

   - STM32MP25/23:
     - Add SYSCFG driver to bind USB PHY.
     - Add digital temperature sendore (Moortec).
     - Add DCMI nodes.
     - Enable eMMC on stm32mp257f-dk.
     - Add I/O sync to eth1 rgmii pins to match with RGMII
       specification.

     - ENGICAM:
      - Add Engicam MicroGEA-STM32MP257D-RMM board support
        based on Engicam MicroGEA-STM32MP257 SoM (8GB eMMC Flash,
        2 GB LPDDR4 DRAM). Embedding CAN, LEDS, LCD with touchscreen,
        uSD, Audiocodec.

     - DH:
       - Add DH STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
         and DHSBC support: This stm32mp25xx-dhcos-bb board is a stack
	of DHCOS SoM based on STM32MP25xx SoC (1200MHz /
	crypto capabilities) populated on SoM Breakout Board,
	the stm32mp255c-dhcos-dhsbc is the SoM populated on DHSBC
	carrier board. The stm32mp23xx-dhcos-bb is a stack with
         STM32MP23xx SoC.

       - The SoM contains the following peripherals:
         - STPMIC (power delivery)
         - 4GiB LPDDR4 memory
         - eMMC and SDIO WiFi module

       - The Breakout Board carrier board contains the following peripherals:
         - USB-C peripheral port, power supply plug

       - The DHSBC carrier board contains the following peripherals:
         - Two RGMII Ethernet ports
         - MicroSD slot
         - LVDS connector
         - MIPI CSI2 connector
         - USB-A Host port, USB-C power supply plug
         - USB-C / DP port
         - Expansion connector

----------------------------------------------------------------
Ahmad Fatoum (3):
       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200

Alain Volmat (9):
       ARM: dts: stm32: add LTDC / DCMIPP access controller for STM32MP135
       ARM: dts: stm32: Use DMA FIFO mode for all spi in stm32mp151
       ARM: dts: stm32: Add disabled spi4 and spi5 in stm32mp15xx-dkx
       arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk
       arm64: dts: st: ensure IMX335 is enabled on stm32mp257f-ev1
       arm64: dts: st: use video-interfaces media bus type in stm32mp257f-ev1
       arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp235f-dk
       arm64: dts: st: add dcmi node on stm32mp25x
       arm64: dts: st: add dcmi node on stm32mp23x

Amelie Delaunay (5):
       arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
       ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
       ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
       ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
       ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

Christophe Roullier (1):
       arm64: dts: st: Add I/O sync to eth1 pinctrl in stm32mp25-pinctrl.dtsi

Clément Le Goffic (3):
       ARM: dts: stm32: add sram[123] nodes on stm32mp131
       ARM: dts: stm32: add sram pool to spi4 for DMA-MDMA chaining on MP15 DK
       ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA chaining on MP13 DK

Dario Binacchi (18):
       dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM board
       arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
       arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
       arm64: dts: st: add SDMMC2 support on stm32mp25
       arm64: dts: st: add CAN1 support on stm32mp25
       arm64: dts: st: add i2c1 pins for stm32mp25
       arm64: dts: st: add ltdc pins for stm32mp25
       arm64: dts: st: add can1 pins for stm32mp25
       arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
       arm64: dts: st: add sai1 pins for stm32mp25
       arm64: dts: st: add sdmmc2 pins for stm32mp25
       arm64: dts: st: add spi1 pins for stm32mp25
       arm64: dts: st: add usart1 pins for stm32mp25
       arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
       arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board
       arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257D-RMM
       arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
       arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display overlay

Fabrice Gasnier (3):
       ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK boards
       ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp157c-ev1
       ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp135f-dk

Marek Vasut (13):
       dt-bindings: arm: stm32: Sort the document
       ARM: dts: stm32: Drop bias-disable from STM32MP15xx DHCOM SoM sdmmc1_b4_pins_a
       dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
       arm64: dts: st: Fix SDMMC1 indent on stm32mp231
       arm64: dts: st: Fix SDMMC1 indent on stm32mp251
       arm64: dts: st: Add SDMMC2 and SDMMC3 nodes on stm32mp231
       arm64: dts: st: Add SDMMC3 nodes on stm32mp251 and update SDMMC2 max freq
       arm64: dts: st: Add OMM node on stm32mp231
       arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
       arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
       MAINTAINERS: Add DH electronics DHCOS SoM entry and fix email address
       dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
       soc: st: Add STM32MP2 SYSCFG driver

Mateusz Nowicki (7):
       arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2
       arm64: dts: st: add sdmmc2 pins_b for stm32mp25
       arm64: dts: st: enable eMMC on stm32mp257f-dk
       arm64: dts: st: add digital temperature sensor on stm32mp251
       arm64: defconfig: enable Moortec MR75203 PVT controller
       arm64: dts: st: fix sai3b unit address on stm32mp251
       arm64: dts: st: fix sai3b unit address on stm32mp231

Patrice Chotard (1):
       ARM: dts: stm32: Remove User-PA13 button on stm32mp135f-dk

Valentin Caron (1):
       ARM: dts: stm32: add pins for spi4 and spi5 in stm32mp15-pinctrl

  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml                           |  30 +++++-
  Documentation/devicetree/bindings/arm/stm32/stm32.yaml                                     |  39 ++++++--
  MAINTAINERS                                                                                |   3 +-
  arch/arm/boot/dts/st/stm32mp131.dtsi                                                       |  24 +++++
  arch/arm/boot/dts/st/stm32mp135.dtsi                                                       |  42 ++++-----
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                                                    |  28 +++---
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi                                                |  34 +++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi                                                       |  20 ++--
  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi                                        |   2 +-
  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts                                              |   8 +-
  arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts                                              |   8 +-
  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts                                              |   8 +-
  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts                                              |   8 +-
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts                                                   |   7 +-
  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts                                               |   2 +-
  arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi                                             |   1 +
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi                                              |   2 +-
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi                                            |   2 +
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                                                  |  33 ++++++-
  arch/arm64/boot/dts/st/Makefile                                                            |  23 +++++
  arch/arm64/boot/dts/st/stm32mp231.dtsi                                                     | 105 ++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp235f-dk.dts                                                  |  75 +++++++++++++++
  arch/arm64/boot/dts/st/stm32mp23xc.dtsi                                                    |   7 ++
  arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts                                            |  15 +++
  arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi                                          |  51 +++++++++++
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi                                              | 925 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
  arch/arm64/boot/dts/st/stm32mp251.dtsi                                                     |  67 +++++++++++++-
  arch/arm64/boot/dts/st/stm32mp253.dtsi                                                     |  16 ++++
  arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso                     | 111 ++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts                                         | 213 ++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi                                    |  63 +++++++++++++
  arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |  67 ++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso     |  68 ++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts                                | 275 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-dk.dts                                                  |  93 +++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts                                                 | 101 +++++++++-----------
  arch/arm64/boot/dts/st/stm32mp25xc.dtsi                                                    |   7 ++
  arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts                                            |  15 +++
  arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi                                          |  51 +++++++++++
  arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi                                          | 456 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/configs/defconfig                                                               |   5 +
  drivers/soc/Kconfig                                                                        |   1 +
  drivers/soc/Makefile                                                                       |   1 +
  drivers/soc/st/Kconfig                                                                     |  12 +++
  drivers/soc/st/Makefile                                                                    |   1 +
  drivers/soc/st/stm32mp2-syscfg.c                                                           |  33 +++++++
  46 files changed, 2969 insertions(+), 189 deletions(-)
  create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
  create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
  create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
  create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
  create mode 100644 drivers/soc/st/Kconfig
  create mode 100644 drivers/soc/st/Makefile
  create mode 100644 drivers/soc/st/stm32mp2-syscfg.c
