Return-Path: <SRS0=F2Wa=H2=foss.st.com=prvs=0713607e55=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B540EC4167B
	for <soc@archiver.kernel.org>; Fri, 15 Dec 2023 10:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71743C433C8; Fri, 15 Dec 2023 10:04:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2EE9C433C7;
	Fri, 15 Dec 2023 10:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2EE9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BF9ja84006661;
	Fri, 15 Dec 2023 11:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=selector1; bh=vmzap/0jhhsfYqLAC+8t
	IbS1RD1ONBwq5ngKQ6uk9Cw=; b=R0QrJQbd1Ls5fjH7cXo5Q+uWCeL/wueruPh2
	RUXOsbuYWiBLg9mbRQBjVVCKETEUvkuRmSAvq4RiVjPRioEs5NIztvcoDdEzPbGr
	77S0UhGgRdD/eC1d0jw+u0YQqTXWDjngHkuHuuaaerUbqW7iZCIMon7FvOwxFLaf
	YD1iRPKwl02dvOmTpP1eY9y4Z4kTAk+2q9t59uu+h/7DYWI0Jq2weucfDbijv7oN
	j+VVbLI9tR7qcOQ8+7uEb7TTh27Qtm13c5LTgJeSwYhkv0Cr6DCD1j11H2m93ISk
	pBI0dh+UExaAvzeMERa/NQiwoqaULvMVK42YNBSEM8U67Nk0Wg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0h8w18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 11:03:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31706100058;
	Fri, 15 Dec 2023 11:03:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1471020F2C2;
	Fri, 15 Dec 2023 11:03:48 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 11:03:47 +0100
Message-ID: <9363227b-1c44-4a20-b245-efbbbf9ab1dd@foss.st.com>
Date: Fri, 15 Dec 2023 11:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.8 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_05,2023-12-14_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.8 cycle.

Thanks
Alex


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.8-1

for you to fetch changes up to 2de1bb183a6999521a114d3ed0b17d15b8e75e04:

   ARM: dts: stm32: add dcmipp support to stm32mp135 (2023-12-15 
09:28:06 +0100)

----------------------------------------------------------------
STM32 DT for v6.8, round 1

Highlights:
----------

- MCU:
   -  Add SPI support on STM32F746.
   -  Better describe vcc_3v3 for SD and DSI on stm32f469-disco.

- MPU:
   - STM32MP13:
     - Add DCMIPP (Digital Camera Memory Interface Piwel Processor)  on 
STM32MP135.

   - STMP32MP15:
     - Change "phys" affectation from board to Soc dtsi file for USB 
host as it is hard  linked
       to the port 0 of usbphyc.
     - Fix SCMI and No-SCMI compatible in boards.

   - STM32MP25:
     - Add BSEC support to read the device part number OTP and the 
package data register OTP.

----------------------------------------------------------------
Ahmad Fatoum (2):
       dt-bindings: arm: stm32: don't mix SCMI and non-SCMI board 
compatibles
       ARM: dts: stm32: don't mix SCMI and non-SCMI board compatibles

Ben Wolsieffer (2):
       ARM: dts: stm32: add STM32F746 syscfg clock
       ARM: dts: stm32: add SPI support on STM32F746

Dario Binacchi (1):
       ARM: dts: stm32: use the same 3v3 for SD and DSI nodes on 
stm32f469-disco

Hugues Fruchet (1):
       ARM: dts: stm32: add dcmipp support to stm32mp135

Krzysztof Kozlowski (1):
       ARM: dts: stm32: minor whitespace cleanup around '='

Patrick Delaunay (1):
       arm64: dts: st: add bsec support to stm32mp25

Uwe Kleine-König (1):
       ARM: dts: stm32: Consolidate usbh_[eo]hci phy properties on stm32mp15

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml      | 16 
+++-------------
  arch/arm/boot/dts/st/stm32f469-disco.dts                    | 15 
++++-----------
  arch/arm/boot/dts/st/stm32f746.dtsi                         | 61 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp135.dtsi                        | 11 
+++++++++++
  arch/arm/boot/dts/st/stm32mp151.dtsi                        |  4 ++++
  arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi                |  2 --
  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts               |  4 ++--
  arch/arm/boot/dts/st/stm32mp157a-stinger96.dtsi             |  2 --
  arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts               |  4 ++--
  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts               |  4 ++--
  arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi         |  4 ----
  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts               |  5 ++---
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts                    |  1 -
  arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts           |  4 ----
  arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi |  4 ----
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi               |  3 ---
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi           |  1 -
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi            |  1 -
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi         |  2 --
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi       |  2 --
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi     |  2 --
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-testbench.dtsi       |  2 --
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                   |  1 -
  arch/arm64/boot/dts/st/stm32mp251.dtsi                      | 16 
++++++++++++++++
  24 files changed, 107 insertions(+), 64 deletions(-)
