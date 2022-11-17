Return-Path: <SRS0=KQo7=3R=foss.st.com=prvs=73200a0741=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26BDC433FE
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 10:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92F4CC433B5; Thu, 17 Nov 2022 10:37:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24357C433D6;
	Thu, 17 Nov 2022 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24357C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH9NLtn012513;
	Thu, 17 Nov 2022 11:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=BoxFCTI8/iA9BmlwGAGKuBF2S5LIJUnk0VxZ2uhl7fo=;
 b=UC7VaRNNxG4rz1rqFdIikKqh3kyZqZh1wFhF4eCdZ+NJk2ctPB3qRzcXv3peNPpMTjxw
 HA/jNMkP/c37WkgtmHzbyUhAbYB96Di5VNKUtEy0keiWHlQB/J/EBChsfBZ2JJ5oF9sI
 GSLRp7I6Fdw9ekkYAdg9E/cCi3/24Y9qHAXhaMOw0JBc9nGW6OCEhJWW+Al2R5O96ubn
 6pIAVLTsH/1oumqRhicymXM75ePrecHyd6/mXtdMEoPHLqn/NqyG/DdA0Qn+KBVujLRo
 g56R2of5eMzASEiEYH50TNud616jVwGBspl1AH4ZRNEsWxqDo7HDQIR1XEjUv2e+e1Ye PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kv9ydp7yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 11:36:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B83CC10002A;
	Thu, 17 Nov 2022 11:36:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85CF221B528;
	Thu, 17 Nov 2022 11:36:47 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 17 Nov
 2022 11:36:46 +0100
Message-ID: <3235e5be-d89f-f76c-5e25-5d1210feb857@foss.st.com>
Date: Thu, 17 Nov 2022 11:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
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
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.2 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01


Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v6.2.

Thanks
Alex

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.2-1

for you to fetch changes up to d8515330a63eda80ac7ad8423de535b747bb2c46:

   ARM: dts: stm32: Rename mdio0 to mdio on DHCOR Testbench board 
(2022-11-17 11:16:05 +0100)

----------------------------------------------------------------
STM32 DT for v6.2, round 1

Highlights:
----------

- MPU:
   - ST boards:
     - Add MCP23017 IO expander support on stm32mp135f-dk board.
     - Add stm32g0 support for USB typeC on stm32mp135f-dk
     - Add USB (EHCI / OTG) on stm32mp135f-dk
     - Add ADC support on stm32mp135f-dk
     - Add USB2514B onboard hub on stm32mp157c-ev1

   - DH:
     - Fix severals Yaml DT validation issues

----------------------------------------------------------------
Alexandre Torgue (1):
       ARM: dts: stm32: add fake interrupt propoerty for ASync notif - 
TEMP/TO REMOVE

Amelie Delaunay (8):
       ARM: dts: stm32: update vbus-supply of usbphyc_port0 on 
stm32mp157c-ev1
       ARM: dts: stm32: add USBPHYC and dual USB HS PHY support on 
stm32mp131
       ARM: dts: stm32: add UBSH EHCI and OHCI support on stm32mp131
       ARM: dts: stm32: add USB OTG HS support on stm32mp131
       ARM: dts: stm32: enable USB HS phys on stm32mp135f-dk
       ARM: dts: stm32: enable USB Host EHCI on stm32mp135f-dk
       ARM: dts: stm32: add mcp23017 pinctrl entry for stm32mp13
       ARM: dts: stm32: add mcp23017 IO expander on I2C1 on stm32mp135f-dk

Fabrice Gasnier (5):
       ARM: dts: stm32: add support for USB2514B onboard hub on 
stm32mp157c-ev1
       ARM: dts: stm32: add PWR fixed regulators on stm32mp131
       ARM: dts: stm32: add fixed regulators to support usb on 
stm32mp135f-dk
       ARM: dts: stm32: add pins for stm32g0 typec controller on stm32mp13
       ARM: dts: stm32: enable USB OTG in dual role mode on stm32mp135f-dk

Marek Vasut (9):
       ARM: dts: stm32: Drop stm32mp15xc.dtsi from Avenger96
       ARM: dts: stm32: Rename mdio0 to mdio
       ARM: dts: stm32: Drop linux,default-trigger = "none" from AV96
       ARM: dts: stm32: Replace SAI format with dai-format DT property
       dt-bindings: arm: stm32: Add compatible string for DH electronics 
DHCOR Testbench board
       ARM: dts: stm32: Add DHCOR based Testbench board
       ARM: dts: stm32: Drop MMCI interrupt-names
       ARM: dts: stm32: Fix AV96 WLAN regulator gpio property
       ARM: dts: stm32: Rename mdio0 to mdio on DHCOR Testbench board

Olivier Moysan (4):
       ARM: dts: stm32: add adc support to stm32mp13
       ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
       ARM: dts: stm32: add dummy vdd_adc regulator on stm32mp135f-dk
       ARM: dts: stm32: add adc support on stm32mp135f-dk

Yann Gautier (1):
       ARM: dts: stm32: add sdmmc cd-gpios for STM32MP135F-DK

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   6 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32h743.dtsi                   |   2 -
  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |  21 +++
  arch/arm/boot/dts/stm32mp131.dtsi                  | 128 ++++++++++++++-
  arch/arm/boot/dts/stm32mp133.dtsi                  |  31 ++++
  arch/arm/boot/dts/stm32mp135f-dk.dts               | 144 ++++++++++++++++-
  arch/arm/boot/dts/stm32mp151.dtsi                  |   3 -
  arch/arm/boot/dts/stm32mp151a-dhcor-testbench.dts  |  17 ++
  arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts  |   1 -
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   |   2 +-
  arch/arm/boot/dts/stm32mp157c-ev1.dts              |  15 +-
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          |   2 +-
  arch/arm/boot/dts/stm32mp157c-odyssey.dts          |   2 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |   4 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       |   2 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   7 +-
  .../boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi    |   2 +-
  arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 171 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   6 +-
  20 files changed, 543 insertions(+), 24 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp151a-dhcor-testbench.dts
  create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
