Return-Path: <SRS0=j6oP=F6=foss.st.com=prvs=8653f1e1f6=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4733CDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 09:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86F8FC433CC; Mon, 16 Oct 2023 09:19:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE281C433C9;
	Mon, 16 Oct 2023 09:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE281C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39G7HwZc005543;
	Mon, 16 Oct 2023 11:18:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=selector1; bh=efqM+/QTM7WZOSgoeXb4
	pQXxBFpj+I+CjH2TD08Szxk=; b=QePDIoDsPaaCcUQs6bi/4PwSc4j7Yv5kF9Ii
	F3AoY2TfWw7gYOj9K355t+r06G37gVTA1/1D6yu2KLhFQKMam2UIB6YdGhnGBq+r
	ZjzKbMzsFnPkz96Ydsm7fpgFzlStrsTRCGS+y1tsSiB2uO33VNhj5mpfT+GjYjJo
	GqbWRuENVDIpYljtK9eaQLI9sqOj1TV4j6eFRd4n+gVnPGQtUiIhLHpY6TO9OvO8
	JF2UlVqkzNy7jaeerEBlggZK2iLqN7+17QVc/41pZT88JR6xS1UJong7sUGHeO3d
	GwFvkdZFdJEuKdYuKXtStClyrVDJtceKe6BxHB+c6q1vfzEDkA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tqkdfxery-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 11:18:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD0B810005B;
	Mon, 16 Oct 2023 11:18:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A99F21A212;
	Mon, 16 Oct 2023 11:18:54 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 11:18:53 +0200
Message-ID: <8a6b3ca9-f10d-825e-e371-8aeff3289a25@foss.st.com>
Date: Mon, 16 Oct 2023 11:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
Subject: [GIT PULL] STM32 DT changes for v6.7 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_03,2023-10-12_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.7 cycle. New OCTAVO 
board has been added.

Thanks
Alex

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.7-1

for you to fetch changes up to 1aeb02d3f2c5a7a9f132ea748877012a48036d90:

   ARM: dts: stm32: add SDIO pinctrl sleep support on stm32f7 boards 
(2023-10-09 14:04:53 +0200)

----------------------------------------------------------------
STM32 DT for v6.7, round 1

Highlights:
----------

- MCU:
   - Add SDIO  sleep pins for F7 boards.

- MPU:
   - STM32MP13:
     - Add HASH and RNG support.

   - STMP32MP15:
     - OCTAVO:
       - Fix regulators (LDO1/2/6 and 3v3_hdmi) by removing "always-on"
         property on OSD32 common file.
       - Add new OS32MP1-RED board. It embeds a STM32157C SoC,
         512 MB of DDR3, CAN-FD, HDMI, USB-C OTG.

   - STM32MP25:
     - Add and enable SDCARD support.
     - Add and enable ARM watchdog support and set it to 32 seconds.

----------------------------------------------------------------
Alexandre Torgue (2):
       arm64: dts: st: add arm-wdt node for watchdog support on stm32mp251
       arm64: dts: st: enable secure arm-wdt watchdog on stm32mp257f-ev1

Ben Wolsieffer (2):
       ARM: dts: stm32: add stm32f7 SDIO sleep pins
       ARM: dts: stm32: add SDIO pinctrl sleep support on stm32f7 boards

Dario Binacchi (1):
       ARM: dts: stm32: stm32f7-pinctrl: don't use multiple blank lines

Gatien Chevallier (1):
       ARM: dts: stm32: add RNG node for STM32MP13x platforms

Lionel Debieve (1):
       ARM: dts: stm32: add HASH on stm32mp131

Sascha Hauer (1):
       ARM: dts: stm32: omit unused pinctrl groups from stm32mp15 dtb files

Sean Nyekjaer (9):
       ARM: dts: stm32: Add alternate pinmux for i2s pins
       ARM: dts: stm32: Add alternate pinmux for ldtc pins
       ARM: dts: stm32: Add alternate pinmux for can pins
       ARM: dts: stm32: osd32: fix ldo1 not required to be always-on
       ARM: dts: stm32: osd32: fix ldo2 not required to be always-on
       ARM: dts: stm32: lxa-tac: remove v3v3_hdmi override
       ARM: dts: stm32: osd32: fix ldo6 not required to be always-on
       dt-bindings: arm: stm32: add extra SiP compatible for 
oct,stm32mp157c-osd32-red
       ARM: dts: stm32: Add Octavo OSD32MP1-RED board

Yann Gautier (3):
       arm64: dts: st: add sdmmc1 node in stm32mp251 SoC file
       arm64: dts: st: add sdmmc1 pins for stm32mp25
       arm64: dts: st: add SD-card support on STM32MP257F-EV1 board

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
  arch/arm/boot/dts/st/Makefile                      |   1 +
  arch/arm/boot/dts/st/stm32746g-eval.dts            |   3 +-
  arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi          |  23 +-
  arch/arm/boot/dts/st/stm32f746-disco.dts           |   3 +-
  arch/arm/boot/dts/st/stm32f769-disco.dts           |   3 +-
  arch/arm/boot/dts/st/stm32mp131.dtsi               |  19 ++
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi        | 342 
+++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts  | 225 ++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      |   4 -
  arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi        |   6 -
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  54 ++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  19 ++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  27 ++
  14 files changed, 716 insertions(+), 14 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
