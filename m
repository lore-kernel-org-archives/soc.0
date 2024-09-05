Return-Path: <SRS0=ql8L=QD=foss.st.com=prvs=99781aef41=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD0CD5BA1
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 09:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CEA4C4CEC3; Thu,  5 Sep 2024 09:45:28 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 090C8C4CEC6;
	Thu,  5 Sep 2024 09:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 090C8C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4856GYJD014864;
	Thu, 5 Sep 2024 11:45:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=mPJMo2y3Tbwi4Cr9dgCAFk
	kPUt6Exg/qIR+SwZ3qQik=; b=JNJXRoCX21z2a/oXzIUdDlerUHbPLiyonGH6S4
	qCxHOk/uczwAR6XRZ4zPiBNybTXtfWtwFXI8b9Ubt+bvSafy1RiokEpP0DbHgu7t
	wjnbHYsZhqW09xh7sNi9wXsHSPWd/HcKZYHpuNTZ8cT+6G//Nudz4hnCYi2Ene5w
	nrDK6tRHnF9lc8zj0uFKq1fPD1DXceND5++yynKzdvjveA0Np8QYne+T0ULuUOpL
	eETTbJ1Bv1ssNnCRevdbS3F7sgL4sLXjK4cVqbHPxPvvHp5awgS7b9ONgcQv7ucV
	DQLCpmi4NOFaFnuhcd0i24Dte9072wfhFKTV2xGlwnSkazVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41ce4jjmvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:45:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6AE3740048;
	Thu,  5 Sep 2024 11:44:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70FE4252258;
	Thu,  5 Sep 2024 11:43:33 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Sep
 2024 11:43:32 +0200
Message-ID: <1091e600-f1e7-4d1f-b83d-c67e8073772c@foss.st.com>
Date: Thu, 5 Sep 2024 11:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Marek Vasut <marex@denx.de>, Oleksij Rempel <o.rempel@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.12#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_05,2024-09-04_01,2024-09-02_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.12 cycle.
Main changes are for DH boards (MP13/MP15) and for Protonic
(add of two new boards).

This PR introduces YAML validation issues but all are fixed thanks to 
subsystem next branch (net).

Thanks
Alex


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.12-1

for you to fetch changes up to 7d6b8316ba139c5a7cbbaa888089d9f4eb527dc9:

   ARM: dts: stm32: Use SAI to generate bit and frame clock on 
STM32MP15xx DHCOM PDK2 (2024-09-05 11:31:56 +0200)

----------------------------------------------------------------
STM32 DT for v6.12, round 1

Highlights:
-----------

- MPU:
   - STM32MP13:
     - DH DHSBC board:
       - Fix Ethernet: MDIO lines in sleep,  disable PHY clock out.
       - Add nvmem cells for ETH MAC address (use OTP to get MAC addr)
       - Add led usage for RTL8211 PHY.

   - STMP32MP15:
     -  Protonic boards:
       - Fix QSPI pins configuration for prtt1x boards.
       - Add new MECI01 and MECT1S boards support:
         - MECIO1: I/O and motor control used in blood sample anlysis.
         - MECT1S: 1000 base-T1 switch for internal machine networks
	          of blood sample analysis machines.

     - DH PDK2 board:
       - Use SAI to generate bit and frame clock.

----------------------------------------------------------------
David Jander (1):
       ARM: dts: stm32: Add MECIO1 and MECT1S board variants

Marek Vasut (7):
       ARM: dts: stm32: Keep MDIO bus in AF across suspend DH 
STM32MP13xx DHCOR DHSBC board
       ARM: dts: stm32: Disable PHY clock output on DH STM32MP13xx DHCOR 
DHSBC board
       ARM: dts: stm32: Add ethernet MAC nvmem cells to DH STM32MP13xx 
DHCOR DHSBC board
       ARM: dts: stm32: Describe PHY LEDs in DH STM32MP13xx DHCOR DHSBC 
board DT
       ARM: dts: stm32: Sort properties in audio endpoints on 
STM32MP15xx DHCOM PDK2
       ARM: dts: stm32: Switch bitclock/frame-master to flag on 
STM32MP15xx DHCOM PDK2
       ARM: dts: stm32: Use SAI to generate bit and frame clock on 
STM32MP15xx DHCOM PDK2

Oleksij Rempel (2):
       ARM: dts: stm32: stm32mp151a-prtt1l: Fix QSPI configuration
       dt-bindings: arm: stm32: Add compatible strings for Protonic boards

Sean Nyekjaer (1):
       ARM: dts: stm32: Add missing gpio options for sdmmc2_d47_pins_d

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml |   8 ++++
  arch/arm/boot/dts/st/Makefile                          |   3 ++
  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi            |  20 +++++++--
  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts       |  44 
+++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi            |   3 ++
  arch/arm/boot/dts/st/stm32mp151a-prtt1a.dts            |  12 ++---
  arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts            | 108 
++++++++++++++++++++-------------------------
  arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi           | 126 
+++++++++++++++++++++++++----------------------------
  arch/arm/boot/dts/st/stm32mp151a-prtt1s.dts            |  16 +++----
  arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts          |  48 
++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp151c-mect1s.dts            | 290 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts          |  48 
++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi         | 527 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi       |  12 ++---
  14 files changed, 1109 insertions(+), 156 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mect1s.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
