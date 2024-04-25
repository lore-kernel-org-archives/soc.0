Return-Path: <SRS0=obtq=L6=foss.st.com=prvs=4845d8dc0a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE82C19F4F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 13:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3E70C2BD11; Thu, 25 Apr 2024 13:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 702D8C113CC;
	Thu, 25 Apr 2024 13:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 702D8C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PCtDeq012275;
	Thu, 25 Apr 2024 15:22:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=selector1; bh=LgD+SDobhxw14Hvk6XEU
	bwsvQuSESmzGrKihkw7kf+c=; b=JzzDNbPEOxaIpHqho3BDUoNEwG+fFjZSdUJ6
	NMAngUUPEKJq/oQ3piJTnTUF38j+FgPO3AJy2OYBC4EHzFYXeAy3VcGHVk5Dq8YH
	NP1agErUM5LZi4bVCWHULs1X8f/sigramPsHiRECt+Ta3EjIo0PzRBZrIle71pR4
	A1ZqmUAsjd8t23zggZSwx9cQ3n8xs95d+Qpy4fBBl3TUi0W82htkrrAEDcU/JFbA
	k/Sba8M1pvpEE789mGfhNKQro5PNClifIO2IC4wLlEfX7GKjpTjJozNIkSm4wHOA
	38ZxoRs+kUsjSCpP8ua62DQ1wC1+P5mycmNO8yu995WFMM/TGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq90uww4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 15:22:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A84894002D;
	Thu, 25 Apr 2024 15:22:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A451D2207A8;
	Thu, 25 Apr 2024 15:22:16 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 15:22:16 +0200
Message-ID: <2040767c-413e-4447-b354-c44999930e4c@foss.st.com>
Date: Thu, 25 Apr 2024 15:22:15 +0200
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
Subject: [GIT PULL] STM32 DT changes for v6.10#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_13,2024-04-25_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.10 cycle.
Main changes are the introduction of the firewall bus for all platform
and the the add of the STM32MP25 clock support.

This PR depends on "[GIT PULL] STM32 Bus firewall for v6.10" PR I just 
sent and to clk-next tree.

Thanks
Alex


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.10-1

for you to fetch changes up to 36cf0d86d760f30b59bc61ffc72c58503c353a17:

   arm64: dts: st: correct masks for GIC PPI interrupts on stm32mp25 
(2024-04-25 15:00:31 +0200)

----------------------------------------------------------------
STM32 DT for v6.10, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Add and enable LTDC display (rocktech,rk043fn48h)
       on stm32mp135f-dk.
     - Add firewall bus based on  ETZPC firewall controller.
     - Add PWR regulator support: Can be only used if the platform is
       set as "no-secure" (RCC_SECCFGR cleared) either use SCMI
       regulator.

   - STMP32MP15:
     - Add firewall bus based on  ETZPC firewall controller.
     - Add heartbeat on stm32mp157c-ed1.

   - STM32MP25:
     - Add firewall bus based on  RIFSC firewall controller.
     - Add clock support (RCC) based on SCMI clock protocol for root clocks.
     - Add all I2C instances and declare i2c2/i2c8 on stm32mp257f-ev1.
     - Add all SPI instances. and declare spi3/spi8 on stm32mp257f-ev1.

----------------------------------------------------------------
Alain Volmat (6):
       arm64: dts: st: add all 8 i2c nodes on stm32mp251
       arm64: dts: st: add i2c2/i2c8 pins for stm32mp25
       arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1
       arm64: dts: st: add all 8 spi nodes on stm32mp251
       arm64: dts: st: add spi3/spi8 pins for stm32mp25
       arm64: dts: st: add spi3 / spi8 properties on stm32mp257f-ev1

Alexandre Torgue (1):
       ARM: dts: stm32: put ETZPC as an access controller for STM32MP13x 
boards

Dario Binacchi (1):
       ARM: dts: stm32: move can3 node from stm32f746 to stm32f769

Gabriel Fernandez (1):
       arm64: dts: st: add rcc support for STM32MP25

Gatien Chevallier (4):
       arm64: dts: st: add RIFSC as an access controller for STM32MP25x 
boards
       ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
       ARM: dts: stm32: put ETZPC as an access controller for STM32MP15x 
boards
       ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards

Hugues Fruchet (1):
       media: dt-bindings: add access-controllers to STM32MP25 video codecs

Marek Vasut (1):
       ARM: dts: stm32: add PWR regulators support on stm32mp131

Patrice Chotard (1):
       ARM: dts: stm32: add heartbeat led for stm32mp157c-ed1

Patrick Delaunay (1):
       arm64: dts: st: correct masks for GIC PPI interrupts on stm32mp25

Raphael Gallais-Pou (4):
       dt-bindings: display: simple: allow panel-common properties
       ARM: dts: stm32: add LTDC support for STM32MP13x SoC family
       ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC family
       ARM: dts: stm32: enable display support on stm32mp135f-dk board

  Documentation/devicetree/bindings/display/panel/panel-simple.yaml 
|   11 +-
  Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml 
|    4 +
  arch/arm/boot/dts/st/stm32f746.dtsi 
|   17 --
  arch/arm/boot/dts/st/stm32f769.dtsi 
|   17 ++
  arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi 
|   57 +++++
  arch/arm/boot/dts/st/stm32mp131.dtsi 
| 1088 
++++++++++++++++++++++++++++++++++++++++++--------------------------------------
  arch/arm/boot/dts/st/stm32mp133.dtsi 
|   51 ++--
  arch/arm/boot/dts/st/stm32mp135.dtsi 
|   11 +
  arch/arm/boot/dts/st/stm32mp135f-dk.dts 
|   53 ++++
  arch/arm/boot/dts/st/stm32mp13xc.dtsi 
|   19 +-
  arch/arm/boot/dts/st/stm32mp13xf.dtsi 
|   19 +-
  arch/arm/boot/dts/st/stm32mp151.dtsi 
| 2764 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------------------
  arch/arm/boot/dts/st/stm32mp153.dtsi 
|   52 ++--
  arch/arm/boot/dts/st/stm32mp157c-ed1.dts 
|   12 +
  arch/arm/boot/dts/st/stm32mp15xc.dtsi 
|   19 +-
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi 
|   82 ++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi 
|  359 +++++++++++++++++++++++----
  arch/arm64/boot/dts/st/stm32mp253.dtsi 
|    7 +
  arch/arm64/boot/dts/st/stm32mp255.dtsi 
|   33 ++-
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts 
|   34 +++
  20 files changed, 2683 insertions(+), 2026 deletions(-)
