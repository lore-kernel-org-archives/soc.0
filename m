Return-Path: <SRS0=nVHO=CA=foss.st.com=prvs=452724c529=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B0C7EE2E
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 09:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DFDDC4339E; Mon, 12 Jun 2023 09:33:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA986C433D2;
	Mon, 12 Jun 2023 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA986C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C7chxD021269;
	Mon, 12 Jun 2023 11:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : to : cc : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=5RxF4qfU194xVjtl7T2n/Ofe2CRBQCdrUk8f14hgpfM=;
 b=3vBWuys5F8nJELCZwcrTM50v/rgKExAz5vsH/EXhUnY5lXYc7dZb8NHAOQn2LnHIqmTf
 to7zGbbQi9AGEkjTz+amztlRaRhV+MQ+0kqbdUPGyXr0Snav28lLughLGfluvZXP5V89
 Ld74emSUsvdJ+yhTZ8/F1vvE2DmI61e7sfpAB+LhFpNKwq3KOhOiVHC9jqTyCzlwU1SC
 spRhY5gHf/tMQFj3cW0r237NgCwyxS3uNWz4703yVtU9jkT3+jSJh3pq2jNVsCuvIna3
 DgAX7ZBqGS4iYm3vK8JR6o8ZZYiQZzgeJb+LPhlVTDcdL/ZzASUjXgX4KXx3qhaW88Y7 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r5y5brspu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 11:33:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADB2110002A;
	Mon, 12 Jun 2023 11:33:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7235F21F14C;
	Mon, 12 Jun 2023 11:33:04 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 12 Jun
 2023 11:33:03 +0200
Message-ID: <08d711de-bb6d-a976-735b-5e18b19818ea@foss.st.com>
Date: Mon, 12 Jun 2023 11:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>,
        SoC Team
	<soc@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [GIT PULL] STM32 DT changes for v6.5 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.5 cycle. A new board 
has been added (PHYTEC) based on STM32MP15 and we continue to fix W=1 
warnings and YAML validation. There are no more W=1 warnings on STM32 
MPU boards.

Note that a second pull request will be sent on top of this one to add 
support of the STM32MP25 (ARM v8 product).


Thanks
Alex


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.5-1

for you to fetch changes up to 076c74c592cabe4a47537fe5205b5b678bed010d:

   ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx 
(2023-06-08 12:08:54 +0200)

----------------------------------------------------------------
STM32 DT for v6.5, round 1

Highlights:
----------

- MCU/MPU:
   - Replace deprecated st,hw-flow-ctrl by uart-has-rtscts.
   - Fix LTDC/DSI warnings.

- MPU:
   - STMP32MP15:
     - Add OTP part number and Vrefint calibration in bsec.
     - M4 hold management updated. As SMC call is deprecated,
       the service is moved on a SCMI service.
     - Add ADC internal channels (VREFINT/VDDCORE).

   - ST:
     - Enable ADC1&2 on STM32MP15 DKx boards.
     - Adopt generic IIO bindings on STM32MP157C ED1
     - Add supplies for OV5640 in STM32MP157C EV1
       to fix yaml validation.
     - Fix i2s bindings to match with the YAML validation (DKx boards).

   - DH:
     - Rearrange MAC EEPROM.
     - Rename AV96 sound card.
     - Adopt generic IIo bindings.
     - Fix audio routing.

   -PHYTEC:
     - Add PHYTEC STM32MP1-3 Dev board based on STM32MP15 PHYTEC SOM.
       This SOM embeds up to 1GB DDR3LP RAM, up to 1GB eMMC,
       up to 16 MB QSPI and up to 128 GB NAND flash.

----------------------------------------------------------------
Alain Volmat (1):
       ARM: dts: stm32: add required supplies of ov5640 in stm32mp157c-ev1

Arnaud Pouliquen (2):
       ARM: dts: stm32: Update Cortex-M4 reset declarations on stm32mp15
       ARM: dts: stm32: fix m4_rproc references to use SCMI for stm32mp15

Dario Binacchi (1):
       ARM: dts: stm32: use RCC macro for CRC node on stm32f746

Marek Vasut (5):
       ARM: dts: stm32: Replace deprecated st,hw-flow-ctrl with 
uart-has-rtscts
       ARM: dts: stm32: Move ethernet MAC EEPROM from SoM to carrier boards
       ARM: dts: stm32: Shorten the AV96 HDMI sound card name
       ARM: dts: stm32: Update to generic ADC channel binding on DHSOM 
systems
       ARM: dts: stm32: Fix audio routing on STM32MP15xx DHCOM PDK2

Olivier Moysan (9):
       ARM: dts: stm32: add adc internal channels to stm32mp15
       ARM: dts: stm32: add vrefint calibration on stm32mp15
       ARM: dts: stm32: add vrefint support to adc2 on stm32mp15
       ARM: dts: stm32: enable adc on stm32mp15xx-dkx boards
       ARM: dts: stm32: adopt generic iio bindings for adc channels on 
stm32mp157c-ed1
       ARM: dts: stm32: adopt generic iio bindings for adc channels on 
emstamp-argon
       ARM: dts: stm32: adopt generic iio bindings for adc channels on 
dhcor-drc
       ARM: dts: stm32: adopt generic iio bindings for adc channels on 
dhcor-testbench
       ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx

Patrick Delaunay (2):
       ARM: dts: stm32: add part number for STM32MP15x
       ARM: dts: stm32: remove extra space in stm32mp15xx-dkx.dtsi

Raphael Gallais-Pou (4):
       ARM: dts: stm32: fix warnings on stm32f469-disco board
       dt-bindings: display: st,stm32-dsi: Remove unnecessary fields
       ARM: dts: stm32: fix dsi warnings on stm32mp15 boards
       ARM: dts: stm32: fix ltdc warnings in stm32mp15 boards

Steffen Trumtrar (10):
       ARM: dts: stm32: Add alternate pinmux for ethernet for stm32mp15
       ARM: dts: stm32: Add alternate pinmux for sai2b on stm32mp15
       ARM: dts: stm32: Add new pinmux for sdmmc1_b4 on stm32mp15
       ARM: dts: stm32: Add new pinmux for sdmmc2_d47 on stm32mp15
       ARM: dts: stm32: Add pinmux for USART1 pins on stm32mp15
       ARM: dts: stm32: Add idle/sleep pinmux for USART3 on stm32mp15
       ARM: dts: stm32: Add sleep pinmux for SPI1 pins_a on stm32mp15
       dt-bindings: arm: stm32: Add Phytec STM32MP1 board
       ARM: dts: stm32: add STM32MP1-based Phytec SoM
       ARM: dts: stm32: add STM32MP1-based Phytec board

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   6 +
  .../devicetree/bindings/display/st,stm32-dsi.yaml  |   2 -
  arch/arm/boot/dts/Makefile                         |   3 +-
  arch/arm/boot/dts/stm32f469-disco.dts              |   4 +-
  arch/arm/boot/dts/stm32f746.dtsi                   |   2 +-
  arch/arm/boot/dts/stm32h750i-art-pi.dts            |   2 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           | 231 +++++++++
  arch/arm/boot/dts/stm32mp151.dtsi                  |  27 +-
  arch/arm/boot/dts/stm32mp157.dtsi                  |   7 -
  arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts         |   7 +-
  .../stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |   6 +-
  .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |   6 +-
  ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |   3 +-
  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |   4 +-
  arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts         |   7 +-
  arch/arm/boot/dts/stm32mp157c-dk2.dts              |   8 +
  arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts         |   7 +-
  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  16 +-
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   |   6 +-
  arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts         |   7 +-
  arch/arm/boot/dts/stm32mp157c-ev1.dts              |  12 +-
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |   3 +-
  .../boot/dts/stm32mp157c-phycore-stm32mp1-3.dts    |  60 +++
  .../dts/stm32mp157c-phycore-stm32mp15-som.dtsi     | 577 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |  11 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  18 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  54 +-
  .../boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi    |  34 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |   6 -
  arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi |  36 +-
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |  44 +-
  31 files changed, 1112 insertions(+), 104 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
  create mode 100644 
arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
