Return-Path: <SRS0=KWJk=FB=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76789C2D0E4
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 08:55:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 004B42224A; Fri, 27 Nov 2020 08:55:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE6A922249;
	Fri, 27 Nov 2020 08:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xTrcSJXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE6A922249
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0AR8mLXT012685;
	Fri, 27 Nov 2020 09:55:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : subject
 : cc : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=lKZtEEJs6oE6nKSZWYxPWDTxfHvmpYFR5P6c/mMJiw8=;
 b=xTrcSJXr7SWendXVGZKxuffDGiJZHQ5Vm61LRorqLOtvQZ3jOO0BZRS5lmNXcxcdJ4ly
 OWVrHq8tyzoVOjwFRLEoAnCdp1Q0EGybw6i0Dmqo9tHVcrwThGEHWQYONpKz13k5LOLq
 EXjs5+R2YAw/GNhZ56NSNdnOPsDtK2Qg2AqhTxyphC0MENojFvso3WSj/2n6CZTPJkn1
 qPQc0mELPB/WZBULIuyndwB7bAe1HkELXxGRhiHaiCqKMF3jE2pXRlCT6OtjppDp2M0U
 NS46PYuG+UjYp9s9TyuUEYplPUZRkauBttyTUAxH7g826FM81+wbAO7CQ2qVUmoxygKM 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 34y01d1epp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2020 09:55:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43F85100039;
	Fri, 27 Nov 2020 09:55:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28F64230CDE;
	Fri, 27 Nov 2020 09:55:31 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov
 2020 09:55:30 +0100
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
Subject: [GIT PULL] STM32 DT changes for v5.11 #1
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre TORGUE
	<alexandre.torgue@st.com>
Message-ID: <873c17a5-28d5-9261-f691-1b917611c932@foss.st.com>
Date: Fri, 27 Nov 2020 09:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-27_04:2020-11-26,2020-11-27 signatures=0

Hi ARM SoC maintainers,


Please consider this first round of STM32 DT updates for v5.11. As usual 
main changed concern MPU part. Various fixes have been done, a new board 
has been added for DH and USB type C support has been added for ST DK 
boards.

Due to company IT changes, for upstream "process" my mail address in no 
longer alexandre.torgue@st.com but alexandre.torgue@foss.st.com. Let me 
know if it causes issue for tag signature. On my side I updated GPG key 
with this new address and it seems ok.

regards
Alex

The following changes since commit f4c7fa39415da6db1fa0bc26162ac23a0fbae8bb:

   ARM: dts: stm32: Keep VDDA LDO1 always on on DHCOM (2020-11-09 
14:36:50 +0100)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.11-1

for you to fetch changes up to 6660e2445523a57410de008a9b137d2c0a66e94a:

   ARM: dts: stm32: lxa-mc1: add OSD32MP15x to list of compatibles 
(2020-11-26 14:42:41 +0100)

----------------------------------------------------------------
STM32 DT updates for v5.11, round 1

Highlights:
----------

MCU part:
  -Fix dmamux reg property (length) on stm32h743.
  -Explicitly set DCMI bus type on stm32429i eval board.

MPU part:
  -Enable FIFO mode with half-full threshold for DCMI.
  -Harmonize EHCI/OHCI nodes.
  -Move SDMMC IP version to v2.0 to get features improvements.
  -Add LP-timer wakeup support.
  -Enable crypto/hash/crc support.
  -Explicitly set DCMI bus type on stm32mp157 eval board.
  -Add USB type-c controller (STUSB1600) on stm32mp15 DK boards
   (It is connected to I2C4).
  -Fix dmamux reg property (length) on stm32mp151.
  -Optimize USB OTG FIFO sizes on stm32mp151.
  -Declare tamp node also as "simple-mfd".

  -LXA:
   -Document Octavo vendor-prefixes yaml file.
   -Document lxa,stm32mp157c-mc1 in STM32 yaml file.

  -DH:
   -Connect PHY IRQ line on DH SoM.
   -Add KS8851 Ethernet support on DHCOM which is mapped to FMC2.
   -Document all DH compatible strings in STM32 yaml file.
   -Add DHCOM based PicoITX board. This board embeds ethernet port,
    USB, CAN LEDS and a custom board-to-board connector.

----------------------------------------------------------------
Ahmad Fatoum (5):
       dt-bindings: arm: stm32: add simple-mfd compatible for tamp node
       ARM: dts: stm32: support child mfd cells for the stm32mp1 TAMP syscon
       dt-bindings: vendor-prefixes: document Octavo Systems oct prefix
       dt-bindings: arm: stm32: add extra SiP compatible for 
lxa,stm32mp157c-mc1
       ARM: dts: stm32: lxa-mc1: add OSD32MP15x to list of compatibles

Amelie Delaunay (7):
       dt-bindings: connector: add typec-power-opmode property to 
usb-connector
       dt-bindings: usb: Add DT bindings for STUSB160x Type-C controller
       ARM: dts: stm32: add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
       ARM: dts: stm32: fix mdma1 clients channel priority level on 
stm32mp151
       ARM: dts: stm32: fix dmamux reg property on stm32mp151
       ARM: dts: stm32: fix dmamux reg property on stm32h743
       ARM: dts: stm32: adjust USB OTG gadget fifo sizes in stm32mp151

Arnaud Pouliquen (1):
       ARM: dts: stm32: update stm32mp151 for remote proc 
synchronization support

Fabrice Gasnier (2):
       ARM: dts: stm32: Add LP timer irqs on stm32mp151
       ARM: dts: stm32: Add LP timer wakeup-source on stm32mp151

Hugues Fruchet (3):
       ARM: dts: stm32: fix DCMI DMA features on stm32mp15 family
       ARM: dts: stm32: set bus-type in DCMI endpoint for 
stm32mp157c-ev1 board
       ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval 
board

Lionel Debieve (2):
       ARM: dts: stm32: enable HASH by default on stm32mp15
       ARM: dts: stm32: enable CRYP by default on stm32mp15

Marek Vasut (5):
       ARM: dts: stm32: Connect PHY IRQ line on DH STM32MP1 SoM
       ARM: dts: stm32: Add alternate pinmux for FMC EBI bus
       ARM: dts: stm32: Add KS8851 on FMC2 to STM32MP1 DHCOM
       dt-bindings: arm: stm32: Add compatible strings for DH SoMs and 
boards
       ARM: dts: stm32: Add DHCOM based PicoITX board

Nicolas Toromanoff (1):
       ARM: dts: stm32: enable CRC1 by default on stm32mp15

Patrick Delaunay (1):
       ARM: dts: stm32: reorder spi4 within stm32mp15-pinctrl

Serge Semin (1):
       ARM: dts: stm32: Harmonize EHCI/OHCI DT nodes name on stm32mp15

Yann Gautier (1):
       ARM: dts: stm32: update sdmmc IP version for STM32MP15

  .../bindings/arm/stm32/st,stm32-syscon.yaml        |   4 +
  .../devicetree/bindings/arm/stm32/stm32.yaml       |  23 +++-
  .../bindings/connector/usb-connector.yaml          |  24 ++++
  .../devicetree/bindings/usb/st,stusb160x.yaml      |  87 +++++++++++++
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32429i-eval.dts               |   1 +
  arch/arm/boot/dts/stm32h743.dtsi                   |   2 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  90 +++++++++++--
  arch/arm/boot/dts/stm32mp151.dtsi                  |  41 ++++--
  arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts    |  35 +++++
  arch/arm/boot/dts/stm32mp157c-dk2.dts              |   4 +
  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  12 ++
  arch/arm/boot/dts/stm32mp157c-ev1.dts              |   1 +
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |   2 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 143 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |  37 ++++++
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |  38 ++++++
  18 files changed, 517 insertions(+), 30 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
  create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-picoitx.dts
  create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi
