Return-Path: <SRS0=pFui=I6=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A573AC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 12:44:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6EFAF610A5; Thu,  1 Apr 2021 12:44:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1836112F;
	Thu,  1 Apr 2021 12:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1836112F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131CgUZl012798;
	Thu, 1 Apr 2021 14:44:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=pjmCR+XGmvgFkT4CF3zMUB4Z58ylQYQIvf4Xq4HTUTU=;
 b=j2W3FsKRG8Sd92djYrfhZjcYvYhsqsDguQav2/D9WRw3Rdwcns3xqQkZvwhhIjjP4Udu
 UFbb/gxT26K4s7sxRGhUpzhZ0ninOVmV4OCX8vv5IxGbkEJIBA+lbM4mlTmuaSgUrool
 r5LlYyRtFWXRb3x+o9AeQx26yI3/uvc04nAm2oyNplpijfO0hQOfo8UBJO9iSWtZuWqD
 H/iuzN5q1YQtaY57Jd9uT0tSvSCXJiMsnLAZOtskL0N2jBjxoOe8BiYB1BMYtGdSVL1z
 1pY7jWaFa7c3mSYfWFdSxHJXmRdfcSesIt6qU/L/vVUPW2OxJCWUtkCHDqRWMDJxjmDn gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 37n295v6gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Apr 2021 14:44:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2586810002A;
	Thu,  1 Apr 2021 14:44:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC691248ED5;
	Thu,  1 Apr 2021 14:44:38 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 14:44:38 +0200
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Jagan Teki
	<jagan@amarulasolutions.com>,
        dillon min <dillon.minfei@gmail.com>
Subject: [GIT PULL] STM32 DT changes for v5.13 #1
Message-ID: <48784f53-943b-0baf-d4a0-fcb7d3849b00@foss.st.com>
Date: Thu, 1 Apr 2021 14:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-04-01_05:2021-03-31,2021-04-01 signatures=0

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.13. This PR 
provides mainly new board supports. A new MCU art-pi board based on 
stm32h750 plus a new Engicam boards family (SOM and carrier boards) 
based on STM32MP15.

regards
Alex

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.13-1

for you to fetch changes up to 6ed9269265e10669d62280a869652dbe26f43ecb:

   ARM: dts: stm32: Add PTP clock to Ethernet controller (2021-04-01 
11:41:00 +0200)

----------------------------------------------------------------
STM32 DT updates for v5.13, round 1

Highlights:
----------

MCU part:

  -Add stm32h750 SoC support. It is based on stm32h743 and embeds
   crypto IPs and 2 ADC.
  -Add new art-pi board based on stm32h750. This board embeds:
   -8MB QSPI flash.
   -16MB SPI flash.
   -32MB SDRAM.
   -AP6212 combo (wifi/bt/fm).

MPU part:
  -Use dedicated PTP clock for Ethernet controller on stm32mp151.
  -Enable i2c analog filter on stm32mp151.

  -DH:
   -Update GPIO names.
   -Enable crc1 & crryp1 on DHSOM.

  -Engicam: add new boards support:
   -MicroGEA SOM which embeds STM32MP157aac, 512 MB Nand Flash
    I2S.
   -MicroGEA STM32MP1 Microdev 2.0 which embeds MicroGEA SOM,
    Ethernet up to 100 Mbps, USB typeA, microSD, UMTS LTE, Wifi/BT
    LVDS panel connector.
   -MicroGEA STM32MP1 MicroDev 2.0 7" which embeds a MicroGEA STM32MP1
    MicroDev 2.0 plus 7" Open Frame panel solution (7" AUO B101AW03 LVDS 
panel
    and EDT DT5526 Touch)
   -i.Core STM32MP1 EDIMM SoM based on STM32MP157A.
   -C.TOUCH 2.0 n EDIMM compliant general purpose Carrier board with 
capacitive
    touch interface support based on i.Core STM32MP1 EDIMM SoM.
    It embeds ETH 10/100, wifi/bt, CAN, USB TypeA/OTG, LVDS pannel 
connector.
   -EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive Evaluation
    Board based on i.Core STM32MP1 EDIMM SoM. IT embeds LCD 7" C.Touch,
    wifi/bt,2*LVDS FHD, 3*USB2, 1*USB3 ...

----------------------------------------------------------------
Alain Volmat (1):
       ARM: dts: stm32: enable the analog filter for all I2C nodes in 
stm32mp151

Alexandre Torgue (2):
       ARM: dts: stm32: add new instances for stm32h743 MCU
       ARM: dts: stm32: fix i2c node typo in stm32h743

Jagan Teki (10):
       dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0
       ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 SoM
       ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
       dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 
2.0 7" OF
       ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
       dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
       ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
       ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
       dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 
Starter Kit
       ARM: dts: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit

Kurt Kanzenbach (1):
       ARM: dts: stm32: Add PTP clock to Ethernet controller

Marek Vasut (5):
       ARM: dts: stm32: Fill GPIO line names on DHCOM SoM
       ARM: dts: stm32: Fill GPIO line names on AV96
       ARM: dts: stm32: Update GPIO line names on DRC02
       ARM: dts: stm32: Update GPIO line names on PicoITX
       ARM: dts: stm32: Enable crc1 and cryp1 where applicable on DHSOM

Valentin CARON - foss (1):
       ARM: dts: stm32: fix usart 2 & 3 pinconf to wake up with flow control

dillon min (6):
       Documentation: arm: stm32: Add stm32h750 value line doc
       dt-bindings: arm: stm32: Add compatible strings for ART-PI board
       ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
       ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
       ARM: stm32: Add a new SoC - STM32H750
       dt-bindings: serial: stm32: Use 'type: object' instead of false 
for 'additionalProperties'

  Documentation/arm/index.rst                        |   1 +
  Documentation/arm/stm32/stm32h750-overview.rst     |  34 +++
  .../devicetree/bindings/arm/stm32/stm32.yaml       |  21 ++
  .../devicetree/bindings/serial/st,stm32-uart.yaml  |   3 +-
  arch/arm/boot/dts/Makefile                         |   5 +
  arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 275 
++++++++++++++++++
  arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 306 
---------------------
  arch/arm/boot/dts/stm32h743.dtsi                   | 177 +++++++++++-
  arch/arm/boot/dts/stm32h743i-disco.dts             |   2 +-
  arch/arm/boot/dts/stm32h743i-eval.dts              |   2 +-
  arch/arm/boot/dts/stm32h750.dtsi                   |   6 +
  arch/arm/boot/dts/stm32h750i-art-pi.dts            | 229 +++++++++++++++
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  21 +-
  arch/arm/boot/dts/stm32mp151.dtsi                  |   8 +
  arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dts      |   4 +
  .../dts/stm32mp157a-icore-stm32mp1-ctouch2.dts     |  47 ++++
  .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |  47 ++++
  arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi  | 196 +++++++++++++
  ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 +++++++++++
  .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |  55 ++++
  .../boot/dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 ++++++++++
  arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts       |   4 +
  arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts    |   4 +
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  12 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  12 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  64 +++++
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  35 +++
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |   4 +
  arch/arm/mach-stm32/board-dt.c                     |   1 +
  29 files changed, 1551 insertions(+), 326 deletions(-)
  create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
  create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
  delete mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
  create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
  create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
  create mode 100644 
arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
  create mode 100644 
arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
  create mode 100644 
arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
  create mode 100644 
arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi
