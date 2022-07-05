Return-Path: <SRS0=+xSr=XK=foss.st.com=prvs=3185bb9d68=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742CC433EF
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 10:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96E69C341CB; Tue,  5 Jul 2022 10:17:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEAAAC341C7;
	Tue,  5 Jul 2022 10:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEAAAC341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26593Bb3007813;
	Tue, 5 Jul 2022 12:17:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=o6YsxP/OCipW+Jn/MvOSlmSg78huV5S6y373JluOE9M=;
 b=HkB/bqI2U+S8WG9fdiIlqYvsd+IZQZir3ZNJFo5+BIfoCGSelUXIl66UD+YVfKlXNCYV
 seGkQMjQbpniJ8zqCJZq0fo8WwXv6/MFWPlx7cuBpgB1NYAO4DVjsO8xuSHZhth+47wg
 Ks3D7fjNScQse257ok8EjDCd0MLCcUeU0PQILeJPD+B4ernkwzRHryufszcfK5Y+kA53
 ncDgZNMzLUBh4C/adgK3FqzC4dRp/DqCfy2GBH329GP8vfJUIX+hhk1DydFmHk97VnHP
 wVhLvo2WLbZwYHSwk+LZyE8uvsh2VYqNaHqLUXjJK1BGKd4we7XsauyQFFe4bTPGUy6m 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2cwj01yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Jul 2022 12:17:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5131610002A;
	Tue,  5 Jul 2022 12:17:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AFC421BF51;
	Tue,  5 Jul 2022 12:17:08 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 5 Jul
 2022 12:17:07 +0200
Message-ID: <a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com>
Date: Tue, 5 Jul 2022 12:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v5.20 #1
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_08,2022-06-28_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.20. It 
mainly adds a new DH board and enables SCMI / OPTEE for STM32MP13.
This PR is based on the PR sent for fixes (tag: stm32-dt-for-v5.19-fixes-2).

Thanks
Alex

The following changes since commit 1d0c1aadf1fd9f3de95d1532b3651e8634546e71:

   ARM: dts: stm32: add missing usbh clock and fix clk order on 
stm32mp15 (2022-07-04 09:10:24 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.20-1

for you to fetch changes up to cc6280cf885ce9ab923b9f9779aa8fbe10983d20:

   ARM: dts: stm32: Add ST MIPID02 bindings to AV96 (2022-07-05 11:42:11 
+0200)

----------------------------------------------------------------
STM32 DT for v5.20, round 1

Highlights:
----------

- MCU:
   -Fix whitespace coding style. No functional changes.

- MPU:
   - General:
     - Remove specific IPCC wakeup interrupt on STM32MP15.
     - Enable OPTEE firmware and scmi support (clock/reset) on
       STM32MP13. It allows to enable RCC clock driver.
     - Add new pins configurations groups.

   - DH boards:
     - Add DHCOR based DRC Compact board. It embeds: 2xETH, 1xCAN,
       uSD, USB, eMMC and SDIO wifi.
     - Add ST MIPID02 bindings to AV96 (not enabled by default)

   - OSD32:
     - Correct vcc-supply for eeprom.
     - fix missing internally connected voltage regulator (ldo3
       supplied by vdd_ddr).

----------------------------------------------------------------
Alexandre Torgue (1):
       dt-bindings: rcc: stm32: select the "secure" path for stm32mp13

Fabien Dessenne (1):
       ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151

Gabriel Fernandez (3):
       ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP13
       ARM: dts: stm32: add RCC on STM32MP13x SoC family
       ARM: dts: stm32: add optee reserved memory on stm32mp135f-dk

Krzysztof Kozlowski (1):
       ARM: dts: stm32: adjust whitespace around '=' on MCU boards

Leonard Göhrs (2):
       ARM: dts: stm32: fix missing internally connected voltage 
regulator for OSD32MP1
       ARM: dts: stm32: correct vcc-supply for eeprom on stm32mp15xx-osd32

Marek Vasut (12):
       ARM: dts: stm32: Move DHCOR BUCK3 VDD 2V9 adjustment to 1V8 DTSI
       ARM: dts: stm32: Fix SPI2 pinmux pin comments on stm32mp15
       dt-bindings: arm: stm32: Add compatible string for DH electronics 
DHCOR DRC Compact
       ARM: dts: stm32: Add alternate pinmux for CAN1 pins
       ARM: dts: stm32: Add alternate pinmux for SPI2 pins
       ARM: dts: stm32: Add alternate pinmux for UART3 pins
       ARM: dts: stm32: Add alternate pinmux for UART4 pins
       ARM: dts: stm32: Add alternate pinmux for UART5 pins
       ARM: dts: stm32: Add DHCOR based DRC Compact board
       ARM: dts: stm32: Add alternate pinmux for DCMI pins
       ARM: dts: stm32: Add alternate pinmux for RCC pin
       ARM: dts: stm32: Add ST MIPID02 bindings to AV96

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   8 +-
  .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml |   1 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32429i-eval.dts               |   8 +-
  arch/arm/boot/dts/stm32h743.dtsi                   |   4 +-
  arch/arm/boot/dts/stm32h743i-disco.dts             |   8 +-
  arch/arm/boot/dts/stm32h743i-eval.dts              |   8 +-
  arch/arm/boot/dts/stm32h750i-art-pi.dts            |   8 +-
  arch/arm/boot/dts/stm32mp131.dtsi                  | 140 ++++-----
  arch/arm/boot/dts/stm32mp133.dtsi                  |   4 +-
  arch/arm/boot/dts/stm32mp135f-dk.dts               |  11 +
  arch/arm/boot/dts/stm32mp13xc.dtsi                 |   3 +-
  arch/arm/boot/dts/stm32mp13xf.dtsi                 |   3 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           | 177 ++++++++++-
  arch/arm/boot/dts/stm32mp151.dtsi                  |   7 +-
  .../arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts |  30 ++
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  55 ++++
  .../boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 322 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi     |   5 +
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |   4 +-
  arch/arm/boot/dts/stm32mp15xx-osd32.dtsi           |   9 +-
  21 files changed, 709 insertions(+), 107 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dts
  create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
