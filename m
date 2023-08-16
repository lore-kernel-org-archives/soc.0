Return-Path: <SRS0=R1Kc=EB=foss.st.com=prvs=6592f3dbca=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0B9C04A6A
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 12:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1890DC433CA; Wed, 16 Aug 2023 12:28:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01DECC433C7;
	Wed, 16 Aug 2023 12:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01DECC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37G8qkJR002315;
	Wed, 16 Aug 2023 14:27:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:from:subject:to:cc:content-type
	:content-transfer-encoding; s=selector1; bh=zPSap9eIRverxO2IXUgc
	G0vCvfSRQx4YPrUyck1M4WM=; b=mal+m1bN0NS2d44YCmpWrXm0Nko28Rorr5xd
	JBAmm4RmAiVBWcXlKCzEHAj3qQNp4iAlZUr3TIhfal6E8rmYPo3mNjSe+FcxreEx
	i0ae0sPYKG1WTAmaf1yXb0iC6SkBWtT/grQ1N6cMP4iKhVhJD95ETCNh7FUu9LgD
	fXZorIftTySIaZYSX/lI6myZAFQfuEM8u6heasLmOAJL9Jxo7SEMTT3cALaLoc5a
	zunruh7etzDsW27XGcObacX7hDGoWQbjewB3UBcExo0LWbkumLkQM0QwHLwX/Q9Z
	LK+ieKXDha38mLKnHoc4e8NnP93NfuVe4iLtp2EnBpQmlS+pnw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgth61mtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:27:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C37CB100061;
	Wed, 16 Aug 2023 14:27:50 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA6E3235F39;
	Wed, 16 Aug 2023 14:27:50 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 14:27:50 +0200
Message-ID: <c0524a16-ab27-0cb5-8e7b-c12f7bde7e0d@foss.st.com>
Date: Wed, 16 Aug 2023 14:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.6 #1
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_11,2023-08-15_02,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.6 cycle. New OCTAVO 
boards have been added, SCMI regulator support has been added on 
stm32mp13 and some patches on MCU side (display and CAN added to 
stm32f7). Note, there is nothing for STM32MP25 (armv8) for this cycle.


Thanks
Alex


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.6-1

for you to fetch changes up to 4c757f6b8026f7d65bbcd2b821651848a074a12b:

   ARM: dts: stm32: add SCMI PMIC regulators on stm32mp135f-dk board 
(2023-08-16 10:58:45 +0200)

----------------------------------------------------------------
STM32 DT for v6.6, round 1

Highlights:
----------

- MCU:
   - Add CAN support on stm32f746.
   - Add touchscreen support (edt-ft5306) on stm32f746-disco.
   - Add support to Rocktech RK043FN48H display on stm32f746-disco
     board.
   - Add gpio-ranges for stm32f7 to fix boot issue.

- MPU:
   - STM32MP13:
     - Remove shmem for scmi-optee to match with OP-TEE configuration.
     - Enable OP-TEE asynchronous notification by using PPI#15.
     - Expose and use SCMI regulators on stm32mp135f-dk.

   - STMP32MP15:
     - Remove shmem for scmi-optee to match with OPTEE configuration
     - Deduplicate DSI node to fix  #address-cells/#size-cells issue on
       boards using it.

   - ST:
     - Fix dts check warnings on stm32mp15-scmi boards.

   - DH:
     - Add missing detach mailbox for DHCOM and DHCOR SoM.

   - Odyssey:
     - Add missing detach mailbox for Odyssey SoM.

   - OCTAVO:
     - Add Linux Automation Test Automation Controller (LXA TAC) based
       on Octavo Systems OSD32MP15x SiP. It contains: eMMC,
       DSA-capable ETH switch (2 ports), dual CAN...
       It adds two boards support: lxa-tac-gen1 and lxa-tac-gen2 based
       on STM32MP157.

   - PROTONIC:
     - Add Power over Data Line (PoDL) Power Source Equipment (PSE)
       regulator nodes on PRTT1C board. It allows power delivery and
       data transmission over a single twisted pair.

----------------------------------------------------------------
Dario Binacchi (7):
       ARM: dts: stm32: re-add CAN support on stm32f746
       ARM: dts: stm32: add pin map for i2c3 controller on stm32f7
       ARM: dts: stm32: add touchscreen on stm32f746-disco board
       ARM: dts: stm32: add ltdc support on stm32f746 MCU
       ARM: dts: stm32: add pin map for LTDC on stm32f7
       ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f746-disco
       ARM: dts: stm32: support display on stm32f746-disco board

Etienne Carriere (4):
       ARM: dts: stm32: leverage OP-TEE ASync notif on STM32MP13x Soc family
       dt-bindings: rcc: stm32: add STM32MP13 SCMI regulators IDs
       ARM: dts: stm32: STM32MP13x SoC exposes SCMI regulators
       ARM: dts: stm32: add SCMI PMIC regulators on stm32mp135f-dk board

Krzysztof Kozlowski (2):
       ARM: dts: st: stm32mp157c-emstamp: drop incorrect vref_ddr property
       ARM: dts: st: stm32mp157c-emstamp: correct regulator-active-discharge

Leonard Göhrs (5):
       dt-bindings: can: m_can: change from additional- to 
unevaluatedProperties
       dt-bindings: net: dsa: microchip: add interrupts property for ksz 
switches
       ARM: dts: stm32: Add pinmux groups for Linux Automation GmbH TAC
       dt-bindings: arm: stm32: Add compatible string for Linux 
Automation LXA TAC
       ARM: dts: stm32: lxa-tac: add Linux Automation GmbH TAC

Marek Vasut (5):
       ARM: dts: stm32: Deduplicate DSI node on stm32mp15
       ARM: dts: stm32: Add missing detach mailbox for emtrion emSBC-Argon
       ARM: dts: stm32: Add missing detach mailbox for Odyssey SoM
       ARM: dts: stm32: Add missing detach mailbox for DHCOM SoM
       ARM: dts: stm32: Add missing detach mailbox for DHCOR SoM

Oleksij Rempel (1):
       ARM: dts: stm32: prtt1c: Add PoDL PSE regulator nodes

Pascal Paillet (1):
       ARM: dts: stm32: fix dts check warnings on stm32mp15-scmi

Patrice Chotard (2):
       ARM: dts: st: Add gpio-ranges for stm32f746-pinctrl
       ARM: dts: st: Add gpio-ranges for stm32f769-pinctrl

Patrick Delaunay (2):
       ARM: dts: stm32: remove shmem for scmi-optee on stm32mp15
       ARM: dts: stm32: remove shmem for scmi-optee on stm32mp13

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +-
  .../devicetree/bindings/net/can/bosch,m_can.yaml   |   2 +-
  .../devicetree/bindings/net/dsa/microchip,ksz.yaml |   3 +
  arch/arm/boot/dts/st/Makefile                      |   2 +
  arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi          |  45 ++
  arch/arm/boot/dts/st/stm32f746-disco.dts           |  69 ++-
  arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi        |  44 ++
  arch/arm/boot/dts/st/stm32f746.dtsi                |  57 ++
  arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi        |  44 ++
  arch/arm/boot/dts/st/stm32mp131.dtsi               |  66 +--
  arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  68 +--
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        | 129 +++++
  arch/arm/boot/dts/st/stm32mp15-scmi.dtsi           |  23 +-
  arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts        |  32 ++
  arch/arm/boot/dts/st/stm32mp157.dtsi               |  18 +
  .../st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts |  24 +-
  .../dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dts |  28 +-
  arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |  28 +-
  .../arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi |   7 +-
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  28 +-
  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  93 ++++
  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  | 172 ++++++
  arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi  |   4 +-
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 610 
+++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi    |   4 +-
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi    |   4 +-
  .../dt-bindings/regulator/st,stm32mp13-regulator.h |  42 ++
  27 files changed, 1459 insertions(+), 191 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
  create mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h
