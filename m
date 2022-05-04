Return-Path: <SRS0=8mQ0=VM=foss.st.com=prvs=1123c8f507=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D79C433EF
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 10:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31065C385AF; Wed,  4 May 2022 10:56:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 916DCC385A4;
	Wed,  4 May 2022 10:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 916DCC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244AJI3L026488;
	Wed, 4 May 2022 12:56:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : to : cc : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=Xnqc1e3qJr4B+kjFzuD5x/1NfqyggxJmLVsEsfcQXVA=;
 b=pjdrCkHh4i1GE1jqoe8WwOLEjYn4YeRDalJ2zTVDO6+Xkf+MUQPxWPQwt5+06Gq1J0pr
 ehaxxxRfwZ3+6OFrQPcbAHtv0liqfKmc6wnmJOMsNl+vOct3fbt0e5Xag5kh7ItFvD1p
 aS9Rx+bRY2JYJKDrFNLyqGkOK9IwqiobHTBubm6GjDkPPjZO9P1RVnpWLSjh9Au5hXuu
 Ynict6fYEPKOzA3r2cmF5tEkhilIWZxPK4CAlm2QJa172zqxbgJvbUw1ZXL94/fE+Xf2
 XWpJd+0bSUTKRxio1fFWQc5nwc6FRML232E34RXWgL7lobt5e05bmHOXCYB18kvTqTDZ 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt88w04h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 May 2022 12:56:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8039710002A;
	Wed,  4 May 2022 12:56:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7414F21B505;
	Wed,  4 May 2022 12:56:03 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 4 May
 2022 12:56:03 +0200
Message-ID: <5818c943-882d-7e50-430d-ae3299a108ee@foss.st.com>
Date: Wed, 4 May 2022 12:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [GIT PULL] STM32 DT changes for v5.19 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_03,2022-05-04_01,2022-02-23_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.19. Main 
updates are related to new Protonic 10BaseT boards support and the 
addition of a secure version of STM32MP15 boards (ED1/EV1/DK1/DK2) based 
on OP-TEE OS and SCMI protocol.

Note, that patch "dt-bindings: rcc: Add optional external ethernet RX 
clock properties" 
(https://lore.kernel.org/r/20220410220514.21779-1-marex@denx.de) is 
already merged in Rob tree.

regards
Alex

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.19-1

for you to fetch changes up to 5b7e58313a77e951850586cfaa9f5d60122f908f:

   ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1) 
(2022-05-04 11:03:08 +0200)

----------------------------------------------------------------
STM32 DT for v5.19, round 1

Highlights:
----------

-MCU:
  -Fix pinctrl node names to match with pinctrl yaml.

- MPU:
  -General:
   - Fix pinctrl node names to match with pinctrl yaml.
   - Add Protonics boards support based on STM32MP151A SoC:
     - PRTT1C - 10BaseT1L switch: mainly embeds a sja1105q switch with
                TI and Micrel 10BaseT Phys and wifi support.
     - PRTT1S - 10BaseT1L CO2 sensor board: mainly embeds I2C humidity
                and CO2 sensors.
     - PRTT1A - 10BaseT1L multi functional controller.

  - ST boards:
   - Add RTC support on stm32mp13.
   - Add button and heartbit support on stm32mp13 DK board.
   - Add a secure version of STM32MP15 ED1/EV1/DK1/DK2 boards based
     on OP-TEE OS and SCMI protocol.

  - DH boards:
   - Use MCO2 to generate PHY clock and ETHRX clock in order to release
     internal PLL for a better SD card usage.
   - Add 1ms PHY post-reset on Avenger96 board to match with PHY
     requirements.

----------------------------------------------------------------
Alexandre Torgue (6):
       dt-bindings: clock: stm32mp1: describes clocks if 
"st,stm32mp1-rcc-secure"
       dt-bindings: clock: stm32mp15: rename CK_SCMI define
       dt-bindings: reset: stm32mp15: rename RST_SCMI define
       ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP15
       dt-bindings: arm: stm32: Add SCMI version of STM32 boards 
(DK1/DK2/ED1/EV1)
       ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)

Fabien Dessenne (5):
       ARM: dts: stm32: fix pinctrl node name warnings (MCU soc)
       ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)
       ARM: dts: stm32: add EXTI interrupt-parent to pinctrl node on 
stm32mp131
       ARM: dts: stm32: add blue led (Linux heartbeat) on stm32mp135f-dk
       ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk

Krzysztof Kozlowski (2):
       dt-bindings: arm: stm32: narrow DH STM32MP1 SoM boards
       dt-bindings: arm: stm32: correct blank lines

Marek Vasut (5):
       ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
       ARM: dts: stm32: Add alternate pinmux for mco2 pins
       ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM
       ARM: dts: stm32: Fix PHY post-reset delay on Avenger96
       dt-bindings: rcc: Add optional external ethernet RX clock properties

Oleksij Rempel (4):
       dt-bindings: arm: stm32: Add compatible strings for Protonic T1L 
boards
       dt-bindings: net: silabs,wfx: add prt,prtt1c-wfm200 antenna variant
       ARM: dts: stm32: stm32mp15-pinctrl: add spi1-1 pinmux group
       ARM: dts: stm32: add support for Protonic PRTT1x boards

Valentin Caron (2):
       ARM: dts: stm32: add RTC node on stm32mp131
       ARM: dts: stm32: enable RTC support on stm32mp135f-dk

  .../devicetree/bindings/arm/stm32/stm32.yaml       |  63 ++++-
  .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml |  34 +++
  .../bindings/staging/net/wireless/silabs,wfx.yaml  |   1 +
  arch/arm/boot/dts/Makefile                         |   7 +
  arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |   2 +-
  arch/arm/boot/dts/stm32f7-pinctrl.dtsi             |   2 +-
  arch/arm/boot/dts/stm32h743.dtsi                   |   2 +-
  arch/arm/boot/dts/stm32mp131.dtsi                  |  19 +-
  arch/arm/boot/dts/stm32mp135f-dk.dts               |  29 ++
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  64 +++++
  arch/arm/boot/dts/stm32mp151.dtsi                  |  45 ++-
  arch/arm/boot/dts/stm32mp151a-prtt1a.dts           |  52 ++++
  arch/arm/boot/dts/stm32mp151a-prtt1c.dts           | 304 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi          | 229 ++++++++++++++++
  arch/arm/boot/dts/stm32mp151a-prtt1s.dts           |  63 +++++
  arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         |  86 ++++++
  arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         |  95 +++++++
  arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         |  91 ++++++
  arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         | 100 +++++++
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  22 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   1 +
  include/dt-bindings/clock/stm32mp1-clks.h          |  46 ++--
  include/dt-bindings/reset/stm32mp1-resets.h        |  24 +-
  23 files changed, 1319 insertions(+), 62 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1a.dts
  create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1c.dts
  create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp151a-prtt1s.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
