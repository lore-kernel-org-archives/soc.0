Return-Path: <SRS0=d+Py=76=foss.st.com=prvs=24616de62a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB923C76196
	for <soc@archiver.kernel.org>; Fri,  7 Apr 2023 09:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C4A8C4339C; Fri,  7 Apr 2023 09:27:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90494C433EF;
	Fri,  7 Apr 2023 09:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90494C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3377g9kT031387;
	Fri, 7 Apr 2023 11:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=cr6EllTPJ92Jd1uAjJpevUxenxxEQk5TY+o9OiGzZBs=;
 b=MkSuyC0O1voLWVaJeiEbj805SOhPCESzxZcKKq4TKC18ll7LhRdUgPKBLhF5xlrEbnAT
 URJQ5t1BRrUZToaipQc0HQ3AOsYvOJ6Tv18JD8aqO90VBXiowuCpcuypJ26I0oi6le5o
 CyeSXTTr2jBt6GilNtvvM31+7H8zjgU6/bazyhzIGvJNm1+VOXf86l3nGwpTpNFjQvge
 9C+Gy8lN9nOpP4U6i0r8VHaFP7k6DyfYv7LdsYQDrqr5CshBWUNDA4xCi3mMbC9uHeiZ
 /miiiqzCRSruUvc2E/aq0TBVKF8WO8pR9atcvB1LU2QlGI6Mjt4V9aT9n9OkdT+VkLJN LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ptf110m2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Apr 2023 11:27:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3008D10002A;
	Fri,  7 Apr 2023 11:27:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8637222C90;
	Fri,  7 Apr 2023 11:27:01 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 7 Apr
 2023 11:27:01 +0200
Message-ID: <63987ed6-2813-15ff-e058-73312a730d61@foss.st.com>
Date: Fri, 7 Apr 2023 11:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.4 #1
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
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.4 cycle. Main 
changes concern peripheral support on STM32MP13 and yaml fixes.

Note that I added documentation and machine STM32 patches inside. Let me 
know if you prefer a separate PR.

Thanks
Alex

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.4-1

for you to fetch changes up to 49f1d0b65f87692a11386a8b8cd3a4aa3a1d0daa:

   ARM: stm32: add initial documentation for STM32MP151 (2023-04-07 
09:40:47 +0200)

----------------------------------------------------------------
STM32 DT for v6.4, round 1

Highlights:
----------
- MPU:
   - STM32MP13:
     - Add FMC support.
     - Add QSPI support.
     - Add 8 UART instances nodes.
     - Enable UART on STM32MP135F-DK:
       -UART1/UART8 used on expansion connector.
       -UART2 used for BT.
       -UART4 used for console.
   - STMP32MP15:
     - Add STM32MP151 support ( documentation + machine).
     - Uart fixes (slew rate, aliases clean-up).
     - Fix GPU YAMl issue.

----------------------------------------------------------------
Alexandre Torgue (1):
       ARM: dts: stm32: fix spi1 pin assignment on stm32mp15

Christophe Kerello (1):
       ARM: dts: stm32: add FMC support on STM32MP13x SoC family

Krzysztof Kozlowski (1):
       ARM: dts: stm32: drop invalid simple-panel compatible on 
stm32mp157c-lxa

Leonard Göhrs (1):
       ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15xx-osd32 SoM

Patrice Chotard (1):
       ARM: dts: stm32: Add QSPI support on STM32MP13x SoC family

Pierre-Yves MORDRET (3):
       ARM: dts: stm32: YAML validation fails for STM32MP15 ST Boards
       ARM: dts: stm32: YAML validation fails for Odyssey Boards
       ARM: dts: stm32: YAML validation fails for Argon Boards

Roan van Dijk (2):
       ARM: stm32: add support for STM32MP151
       ARM: stm32: add initial documentation for STM32MP151

Valentin Caron (6):
       ARM: dts: stm32: fix slew-rate of USART2 on stm32mp15xx-dkx
       ARM: dts: stm32: clean uart aliases on stm32mp15xx-dkx boards
       ARM: dts: stm32: clean uart aliases on stm32mp15xx-exx boards
       ARM: dts: stm32: add uart nodes on stm32mp13
       ARM: dts: stm32: add pins for usart2/1/4/8 in stm32mp13-pinctrl
       ARM: dts: stm32: add uart nodes and uart aliases on stm32mp135f-dk

  Documentation/arm/index.rst                      |   1 +
  Documentation/arm/stm32/stm32mp151-overview.rst  |  36 ++++++
  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi         | 129 
++++++++++++++++++++
  arch/arm/boot/dts/stm32mp131.dtsi                | 145 
++++++++++++++++++++++-
  arch/arm/boot/dts/stm32mp135f-dk.dts             |  42 ++++++-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi         |  34 +++---
  arch/arm/boot/dts/stm32mp157a-dk1.dts            |   3 -
  arch/arm/boot/dts/stm32mp157c-dk2.dts            |   3 -
  arch/arm/boot/dts/stm32mp157c-ed1.dts            |  17 +--
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi |   9 --
  arch/arm/boot/dts/stm32mp157c-ev1.dts            |   9 +-
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts        |   2 +-
  arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi   |  10 --
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi           |  15 +--
  arch/arm/boot/dts/stm32mp15xx-osd32.dtsi         |   4 +-
  arch/arm/mach-stm32/board-dt.c                   |   1 +
  16 files changed, 386 insertions(+), 74 deletions(-)
  create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst
