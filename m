Return-Path: <SRS0=8ISe=TI=foss.st.com=prvs=8055af2bb9=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90275C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63222C340F0; Fri, 25 Feb 2022 15:07:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41B42C340E7;
	Fri, 25 Feb 2022 15:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41B42C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P9aABH019266;
	Fri, 25 Feb 2022 16:07:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=SrA8jjGV/T+X0b4zuHkyHeHKIysLC0xpT/wTU080xNE=;
 b=jX89d0XPbGkRnMlO3k/ofR+HvCzTEkzHWTCdnhAIHUgW5s41mii6gQplTKaqHrxrsAxH
 PThfpzrPFXOTCtGyVoNPL0O37T0zZuZmzXDsvggmzyrwhEwIAHOfk4HFU90pX+mXGJTw
 EiOLmrhmh4r7u77m3AENpXsDJl25czlyisPpUhqQCXVo0ygUCEVQCECxy623VoWcIJcZ
 QedIQxip65kuQZf8MgOFDgdnIQoOwMudfxWyeyyA/Xxax0bpErB1/zumngPRyO6FLMZQ
 CIfiAHpII+P4T7dxCIapPhUIBTfWOuZHDSBcVy7MSHaGXsycMDV8LW/Uxp/OMAr9c0Bb Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eevmgssyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Feb 2022 16:07:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52A06100034;
	Fri, 25 Feb 2022 16:07:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E9122ECEA;
	Fri, 25 Feb 2022 16:07:01 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 25 Feb
 2022 16:07:00 +0100
Message-ID: <893924a9-bcc4-9fa9-4f8e-7f56e77f6854@foss.st.com>
Date: Fri, 25 Feb 2022 16:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v5.18 #1
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_08,2022-02-25_01,2022-02-23_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.18. A tiny 
round2 will be sent next week.
Note that this PR introduces a new DT validation warning:

arch/arm/boot/dts/stm32mp135f-dk.dt.yaml:0:0: 
/soc/interrupt-controller@5000d000: failed to match any schema with 
compatible: ['st,stm32mp13-exti', ...

Corresponding dt-binding patch has been merged into irqchip branch.

regards
Alex


The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

   Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.18-1

for you to fetch changes up to cb4b2d26c78a1707499bf60768e463032a221e3a:

   ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp15 
(2022-02-25 10:53:15 +0100)

----------------------------------------------------------------
STM32 DT for v5.18, round 1

Highlights:
----------

-MCU:
  -Fix W=1 warnings for timers (duplicate unit-address) for F4 and F7 
series.
  -Enable DMA2D on f469 disco.

- MPU:
  -General:
   - Add new board support: emSBS-Argon.
   - Add dma configuration for all U(S)ART nodes and disable them in 
board files
     when they are not needed in stm32mp15.
   - Correct GIC PPI interrupts on stm32mp15 and stm32mp13.

- ST boards:
   - Add EXTI support on stm32mp13
   - Add DMA, MDMA and DMAmux support to stm32mp13 (iso feature than MP15)
   - Update SDMMC1/2 support on stm32mp13: sleep config, update version 
to v2.2,
     update the max frequency to 130 MHz.

- DH boards:
   - Enable rproc to control the CM4 and IPCC mailbox to interact with it.

----------------------------------------------------------------
Alexandre Torgue (4):
       ARM: dts: stm32: use exti 19 as main interrupt to support RTC 
wakeup on stm32mp157
       ARM: dts: stm32: Enable EXTI on stm32mp13
       ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp13
       ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp15

Amelie Delaunay (2):
       ARM: dts: stm32: add DMA1, DMA2 and DMAMUX1 on STM32MP13x SoC family
       ARM: dts: stm32: add MDMA on STM32MP13x SoC family

Dillon Min (2):
       ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
       ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board

Erwan Le Ray (16):
       ARM: dts: stm32: add DMA configuration to UART nodes on stm32mp151
       ARM: dts: stm32: keep uart4 behavior on stm32mp157c-ed1
       ARM: dts: stm32: keep uart4 and uart7 behavior on stm32mp15xx-dkx
       ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-ctouch2
       ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-edimm2.2
       ARM: dts: stm32: keep uart4 behavior on stm32mp157a-iot-box
       ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0-of7
       ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0
       ARM: dts: stm32: keep uart nodes behavior on stm32mp157a-stinger96
       ARM: dts: stm32: keep uart4 behavior on stm32mp157c-lxa-mc1
       ARM: dts: stm32: keep uart4 behavior on stm32mp157c-odyssey
       ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-drc02
       ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-pdk2
       ARM: dts: stm32: keep uart nodes behavior on 
stm32mp15xx-dhcom-picoitx
       ARM: dts: stm32: keep uart4 behavior on stm32mp15xx-dhcom-som
       ARM: dts: stm32: keep uart nodes behavior on 
stm32mp15xx-dhcor-avenger96

Fabrice Gasnier (4):
       ARM: dts: stm32: remove some timer duplicate unit-address on 
stm32f4 series
       ARM: dts: stm32: remove timer5 duplicate unit-address on stm32f4 
series
       ARM: dts: stm32: remove some timer duplicate unit-address on 
stm32f7 series
       ARM: dts: stm32: remove timer5 duplicate unit-address on stm32f7 
series

Gerald Baeza (1):
       ARM: dts: stm32: update sdmmc slew-rate in stm32mp13 pinctrl

Marek Vasut (2):
       ARM: dts: stm32: Drop duplicate status okay from DHCOM gpioc node
       ARM: dts: stm32: Add CM4 reserved memory, rproc and IPCC on DHCOR SoM

Olivier Moysan (1):
       ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15

Reinhold Mueller (2):
       dt-binding: arm/stm32: Add emtrion hardware emSBC-Argon
       ARM: dts: stm32: Add support for the emtrion emSBC-Argon

Yann Gautier (9):
       ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp151
       ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp131
       ARM: dts: stm32: increase SDMMC max-frequency for STM32MP13
       ARM: dts: stm32: update SDMMC clock slew-rate on STM32MP135F-DK board
       ARM: dts: stm32: add sdmmc sleep pins for STM32MP13
       ARM: dts: stm32: add sdmmc sleep config for STM32MP135F-DK
       ARM: dts: stm32: update SDMMC version for STM32MP13
       ARM: dts: stm32: add SDMMC2 in STM32MP13 DT
       ARM: dts: stm32: add sdmmc2 pins for STM32MP13

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   6 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32429i-eval.dts               |  12 +
  arch/arm/boot/dts/stm32746g-eval.dts               |  12 +
  arch/arm/boot/dts/stm32f429-disco.dts              |  12 +
  arch/arm/boot/dts/stm32f429.dtsi                   |  57 +--
  arch/arm/boot/dts/stm32f469-disco.dts              |  16 +
  arch/arm/boot/dts/stm32f746-disco.dts              |  12 +
  arch/arm/boot/dts/stm32f746.dtsi                   |  47 --
  arch/arm/boot/dts/stm32f769-disco.dts              |  12 +
  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |  81 ++-
  arch/arm/boot/dts/stm32mp131.dtsi                  |  89 +++-
  arch/arm/boot/dts/stm32mp135f-dk.dts               |   7 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  94 +++-
  arch/arm/boot/dts/stm32mp151.dtsi                  |  37 +-
  arch/arm/boot/dts/stm32mp153.dtsi                  |   7 +
  .../dts/stm32mp157a-icore-stm32mp1-ctouch2.dts     |   2 +
  .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |   2 +
  arch/arm/boot/dts/stm32mp157a-iot-box.dts          |   2 +
  ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |   4 +
  .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |   4 +
  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |   6 +
  arch/arm/boot/dts/stm32mp157c-ed1.dts              |   2 +
  arch/arm/boot/dts/stm32mp157c-emsbc-argon.dts      |  53 ++
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   | 552 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |   2 +
  arch/arm/boot/dts/stm32mp157c-odyssey.dts          |   2 +
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |   4 +
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |   4 +
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |   4 +
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |   3 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   6 +
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |  56 +++
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   4 +
  34 files changed, 1089 insertions(+), 125 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp157c-emsbc-argon.dts
  create mode 100644 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
