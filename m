Return-Path: <SRS0=oo5W=OF=foss.st.com=prvs=79166e676a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A5C30658
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 13:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DD00C4AF0B; Fri,  5 Jul 2024 13:38:22 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41814C4AF0D;
	Fri,  5 Jul 2024 13:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41814C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465BTOZt006010;
	Fri, 5 Jul 2024 15:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=GlqYi6K41a4nbbBerpV4k8
	78XfxjUKJLCYLSrKztAh8=; b=Mc+7T3B2LaXhaSbpr8cl/J4ZQBcvL3woOlbI6j
	GU7DxVLx2qqQfXJT4NYBSBwZaXXJlqKIf7qFk6uc9K2KOiWxJrfGOzjJhz67MKGg
	0zR1/0icD3xIMLKFMfARt/bVaBt23MM/BVbaEjCU3gE48P6nXdFwEDb1PjgWSdi9
	ou4RxYBb35LbIhk7hhXl+tFGLakrv1UYXPeUlZXuJw4HyXuTSePNiAjDzUMJ/xln
	lEPbDfCn9L7DznE5FCB6FtXcbEthvUiP3D0KKexTPgW7m8rHzFIDoCNYyhU4uxUf
	DIJNoTwRW8Jc2n2slnFcgBqKUssTHgx/T02juNiYwQGUXYeA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 402w7jf8gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:38:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 70A5440046;
	Fri,  5 Jul 2024 15:38:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D299228A42;
	Fri,  5 Jul 2024 15:37:30 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 15:37:30 +0200
Message-ID: <8f10bd29-d067-4060-89ff-2e1a605f3141@foss.st.com>
Date: Fri, 5 Jul 2024 15:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.11#1
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_09,2024-07-05_01,2024-05-17_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.11 cycle.
Main changes are the add of STM32MP25 feature (power domains, HPDMA, 
ETH) and STM32MP13 with the add of a new DH board.

This PR introduces YAML validation issues but all are fixed thanks to 
subsystem next branch (net, dma).

Thanks
Alex

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.11-1

for you to fetch changes up to 419ed754a3b6279f748909dd552fe425c7fce4a2:

   arm64: dts: st: describe power supplies for stm32mp257f-ev1 board 
(2024-07-05 14:45:25 +0200)

----------------------------------------------------------------
STM32 DT for v6.11, round 1

Highlights:
----------

-MCU:
   - Add syscfg missing clock on stm32f429.

- MPU:
   - STM32MP13:
     - Add camera support on stm32mp135f-dk bord using DCMIPP and
       GC2145 sensor.
     - Document PWM output for stm32mp135f-dk
     - Add goodix touchscreen support on stm32mp135f-dk board.
     - Add new DH DHCOR / DHSBC board (Som + carrier board) based on
       STM32MP135F SoC.
       SOM part contains: STM32MP135F SoC, 512MB DDR2L RAM and
       eMMC/SDIO wifi module.
       The carrier boards embedds 2 RGMII ETH ports, USB-A,USB-C
       and an extansion connector.
     - Add Ethernet controller support on stm32mp135f-dk.
       It uses LAN8742A PHY based on RMII.

   - STMP32MP15:
     - Rework Octavo OSD32MP1 split for USB phy.
     - Add OP-TEE IRQ for asynchronous notification support.
       It allows OP-TEE to trig Linux.

   - STM32MP25:
     - Add OP-TEE IRQ for asynchronous notification support.
       It allows OP-TEE to trig Linux.
     - Enable firewall for RCC.
     - Add all U(s)ART nodes for stm32mp25.
     - Add 3 power domains for low power modes.
     - Add HPDMA support.
     - Add Ethernet controller (ETH2) support on stm32mp257f-ev1.
       It uses Realtek PHY based on RGMII.
     - Add and enable SCMI regulator support.

----------------------------------------------------------------
Alain Volmat (2):
       ARM: dts: stm32: add DCMIPP pinctrl on STM32MP13x SoC family
       ARM: dts: stm32: enable camera support on stm32mp135f-dk board

Alexandre Torgue (2):
       ARM: dts: stm32: order stm32mp13-pinctrl nodes
       ARM: dts: stm32: omit unused pinctrl groups from stm32mp13 dtb files

Amelie Delaunay (1):
       arm64: dts: st: add HPDMA nodes on stm32mp251

Christophe Roullier (6):
       ARM: dts: stm32: add ethernet1 and ethernet2 support on stm32mp13
       ARM: dts: stm32: add ethernet1/2 RMII pins for STM32MP13F-DK board
       ARM: dts: stm32: add ethernet1 for STM32MP135F-DK board
       arm64: dts: st: add ethernet1 and ethernet2 support on stm32mp25
       arm64: dts: st: add eth2 pinctrl entries in stm32mp25-pinctrl.dtsi
       arm64: dts: st: enable Ethernet2 on stm32mp257f-ev1 board

Etienne Carriere (2):
       arm64: dts: st: OP-TEE async notif on PPI 15 for stm32mp25
       ARM: dts: stm32: OP-TEE async notif interrupt for ST STM32MP15x 
boards

Gabriel Fernandez (1):
       arm64: dts: st: enable STM32 access controller for RCC

Marek Vasut (5):
       ARM: dts: stm32: Add arm,no-tick-in-suspend to STM32MP15xx STGEN 
timer
       dt-bindings: arm: stm32: Add compatible string for DH electronics 
STM32MP13xx DHCOR DHSBC board
       ARM: dts: stm32: Add pinmux nodes for DH electronics STM32MP13xx 
DHCOR SoM and DHSBC board
       ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC 
board
       ARM: dts: stm32: Add ethernet support for DH STM32MP13xx DHCOR 
DHSBC board

Pascal Paillet (3):
       regulator: Add STM32MP25 regulator bindings
       arm64: dts: st: add scmi regulators on stm32mp25
       arm64: dts: st: describe power supplies for stm32mp257f-ev1 board

Patrick Delaunay (1):
       arm64: dts: st: add power domain on stm32mp25

Sean Nyekjaer (2):
       ARM: dts: stm32: osd32: move usb phy power to common
       ARM: dts: stm32: osd32: move pwr_regulators to common

Uwe Kleine-König (1):
       ARM: dts: stm32: Document output pins for PWMs on stm32mp135f-dk

Valentin Caron (3):
       arm64: dts: st: add usart nodes on stm32mp25
       arm64: dts: st: add usart6 pinctrl used on stm32mp257f-ev1 board
       arm64: dts: st: add usart6 on stm32mp257f-ev1 board

Yanjun Yang (1):
       ARM: dts: stm32: Missing clocks for stm32f429's syscfg.

Yannick Fertre (1):
       ARM: dts: stm32: add goodix touchscreen on stm32mp135f-dk

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml |   6 ++
  arch/arm/boot/dts/st/Makefile                          |   1 +
  arch/arm/boot/dts/st/stm32f429.dtsi                    |   1 +
  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi            | 697 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp131.dtsi                   |  38 ++++++++++++
  arch/arm/boot/dts/st/stm32mp133.dtsi                   |  31 ++++++++++
  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts       | 377 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                | 128 
+++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi        | 308 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi                   |   1 +
  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts          |   5 ++
  arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts          |   5 ++
  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts          |   5 ++
  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts          |   5 ++
  arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts      |  13 -----
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi          |  13 -----
  arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi            |  13 +++++
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi          | 100 
++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                 | 246 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp253.dtsi                 |  64 
+++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts             |  77 
++++++++++++++++++++++---
  include/dt-bindings/regulator/st,stm32mp25-regulator.h |  48 
++++++++++++++++
  22 files changed, 2146 insertions(+), 36 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
  create mode 100644 include/dt-bindings/regulator/st,stm32mp25-regulator.h
