Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC571BD035
	for <soc@lists.linux.dev>; Wed, 14 May 2025 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214552; cv=none; b=Ao+fxQk7FHl3M84fgys6V/52ZZHxJ7ZZ/U/cl2s4mqIsonFtmSxjlTKZLXet6qVlpsBu9Vlb63pTDmPAjQlpr34lTg+wj7TDoi7tDdAfkx3v1DBRNo82VmP1Iv7ht9UA7kceRMs9DINAIwu6KGnOXE/gfvrYeXIw03Whnt+8iuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214552; c=relaxed/simple;
	bh=0WP354XpaWRUK6CknUhthOM7RQMkqoUx3HlfaCsoH/8=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=WOxjSdaYwAkqAWkOscIyXLrr/80RvRn57IcS05/vr8cgbLdBmkhi+J7SaHINkNXtjTfbYWVBeP49W9rXNFhabw4f871Sd2ljEfwNu1AHjCXrE8Fi4Y+almOXYCG8hB4/1r/aSOjfA9wgwRVT2Zi7r+zebnbY8kJokbpzflJ27UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1yaSuGds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1yaSuGds"
Received: by smtp.kernel.org (Postfix)
	id 2A5E0C4CEF0; Wed, 14 May 2025 09:22:32 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA7D8C4CEE9;
	Wed, 14 May 2025 09:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA7D8C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E7vsGI012183;
	Wed, 14 May 2025 11:22:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=lQB0X+FYDQ0v+rbqk+Ve5A
	iVWv/hgl/qmWvvPvfsaEM=; b=1yaSuGdsEL+WpzOg8CEqkNEqmIBSlKnN6amN6i
	h20kr3Ddf4IT3p6AmlL8fN4P7gz5UjL+LYqfiCgREs3ojCN5ocfXKce1NtZsVVL/
	B5qTkcZzAwIc+YJV65KJMKDOLEvyOcAXeA4FFMOVU9XwJbcJSZoC3JNjcvLKB1J/
	fPIfdm8kcfEFRQUh9ZSiJBJk3XhdqFtv17OOHZPl1bujbVdvCRrqFllBSGtanJ4g
	K5owwsznHvpDvKd8xNPhyFzHnBw8tzh2678NX8qw7NrlVb5JnvpGykxxegWP0vbr
	xU+9IZTcNNREOaf1dt8w5p+3FNNOVufCOm13+cQQpbPQh/nw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdw2sdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 11:22:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA80F40087;
	Wed, 14 May 2025 11:21:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81678B35FDB;
	Wed, 14 May 2025 11:21:08 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 May
 2025 11:21:08 +0200
Message-ID: <2f101efb-6d58-48d8-983a-57e30a34827c@foss.st.com>
Date: Wed, 14 May 2025 11:21:08 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.16#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.16 cycle.
I added a config patch inside. Let me know if you prefer a separate patch.

Thanks
Alex

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.16-1

for you to fetch changes up to 518e8ffa00c8744bef586079b73e22fb79d93b3c:

   ARM: dts: stm32: add initial support for stm32mp157-ultra-fly-sbc 
board (2025-05-14 10:36:16 +0200)

----------------------------------------------------------------
STM32 DT for v6.16, round 1

Highlights:
----------

- MCU:
   - Add low power timer on STM32F746
   - Add STM32H747 High end MCU support. It embeds:
     - dual-core (Cortex-M7 + Cortex-M4)
     - up to 2 Mbytes flash
     - 1 Mbyte of internal RAM
   - Add STM32H747i-disco board support. Detailed information can be
     found at:
     https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

- MPU:
   - STM32MP13:
     - Add VREFINT calibration support based on ADC.

   - STMP32MP15:
     - Add new Ultratronik Fly board support:
       - based on STM32MP157C SoC
       - 1GB of DDR3
       - Several connections are available on this boards:
         2*USB2.0, 1*USB2.0 MiniUSB, Debug UART, 1*UART, 1*USART,
	SDcard, RJ45, ...

   - STM32MP25:
     - Add OCTOSPI support on STM32MP25 SoCs
     - Add SPI NOR flash support on STM32MP257F-EV1 connected to OSPI1
     - Add Low power timer TIMER (LPTIM) on STM32MP25 SoCs and use
       LPTIM3 as low power broadcast timer on STM32MP257F-EV1.

----------------------------------------------------------------
Ben Wolsieffer (1):
       ARM: dts: stm32: add low power timer on STM32F746

Dario Binacchi (8):
       ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
       dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
       ARM: stm32: add a new SoC - STM32H747
       dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
       ARM: dts: stm32: add uart8 node for stm32h743 MCU
       ARM: dts: stm32: add pin map for UART8 controller on stm32h743
       ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
       ARM: dts: stm32: support STM32h747i-disco board

Fabrice Gasnier (3):
       arm64: defconfig: enable STM32 LP timer clockevent driver
       arm64: dts: st: add low-power timer nodes on stm32mp251
       arm64: dts: st: use lptimer3 as tick broadcast source on 
stm32mp257f-ev1

Goran Rađenović (4):
       dt-bindings: vendor-prefixes: Add Ultratronik
       dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
       MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT
       ARM: dts: stm32: add initial support for stm32mp157-ultra-fly-sbc 
board

Krzysztof Kozlowski (1):
       ARM: dts: st: stm32: Align wifi node name with bindings

Olivier Moysan (2):
       ARM: dts: stm32: add vrefint calibration on stm32mp13
       ARM: dts: stm32: add vrefint support to adc on stm32mp13

Patrice Chotard (3):
       arm64: dts: st: Add OMM node on stm32mp251
       arm64: dts: st: Add ospi port1 pinctrl entries in 
stm32mp25-pinctrl.dtsi
       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml |    9 ++
  Documentation/devicetree/bindings/vendor-prefixes.yaml |    2 +
  MAINTAINERS                                            |    6 +
  arch/arm/boot/dts/st/Makefile                          |    4 +-
  arch/arm/boot/dts/st/stm32f746.dtsi                    |   34 +++++
  arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi              |   34 ++++-
  arch/arm/boot/dts/st/stm32h743.dtsi                    |    8 ++
  arch/arm/boot/dts/st/stm32h743i-disco.dts              |    2 +-
  arch/arm/boot/dts/st/stm32h743i-eval.dts               |    2 +-
  arch/arm/boot/dts/st/stm32h747i-disco.dts              |  136 
++++++++++++++++++
  arch/arm/boot/dts/st/stm32h750i-art-pi.dts             |    8 +-
  arch/arm/boot/dts/st/stm32mp131.dtsi                   |    5 +
  arch/arm/boot/dts/st/stm32mp133.dtsi                   |    2 +
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                |    2 +-
  arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi        |    2 +-
  arch/arm/boot/dts/st/stm32mp157a-iot-box.dts           |    2 +-
  arch/arm/boot/dts/st/stm32mp157c-dk2.dts               |    2 +-
  arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts     | 1152 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi  |    2 +-
  arch/arm/mach-stm32/board-dt.c                         |    1 +
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi          |   51 +++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                 |  231 
++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts             |   40 ++++++
  arch/arm64/configs/defconfig                           |    2 +
  include/dt-bindings/clock/stm32h7-clks.h               |    4 +-
  25 files changed, 1725 insertions(+), 18 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
