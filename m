Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC55A3D76
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795535; cv=none; b=qmuexNnqIBphK8+ViLPN2dHXsbIaY793BOt8m0Rwqtyo+S5DOh9uH7k+u7xtdFAbc86DXbD/aQ0ZKLLb5MXGPpQ9xPuYs8se4LNy7c6AIniMI4zsQsgbgTw8rjoulC2THHRZU0Roolg3VLuPzusKSu4MTbmE1nbmN/NQyuPh9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795535; c=relaxed/simple;
	bh=lJxZXmWecmWrMwOG70/buymyI/zcvB/Lt7Qc5JAqYiw=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=ngrgs60OFXViM/VoWWUz2ez2GlwVhSWt22bNXj8HlYPTCPDFSK0Hs3josJ4Fk5TfeA2H1NQEQUo4Os3phsdAa6cQ+grVgTFpO1SXxzKXy/vCNKpbXUVDOHNs2wMsLomv+aAZtWqE30d/BrSUnrHJbVPFtvktcUZA4SPME9OZK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3MB5o7t5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3MB5o7t5"
Received: by smtp.kernel.org (Postfix)
	id 6934DC4CEED; Wed, 12 Mar 2025 16:05:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C36CFC4CEDD;
	Wed, 12 Mar 2025 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C36CFC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CFW9nS022206;
	Wed, 12 Mar 2025 17:05:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=JC0vlVDYxPGDljhE7HGvCc
	VHMVuX6yZTY4KSm+G7ykc=; b=3MB5o7t5ai0gdgcU7oGcT6BqHHK3SL7R8sUPD/
	7KupER3a3nRQ91G5SxjwwCMQ6eQ9z0JETkOXCNsss+gZ1RvUAIFn6TJn9MH2PHjR
	V+CiABLz+tGBqWVMHZqC2lQK+iijWjBdoJ1ZxAbgs4MmjQTEiKsiOwufmG60H4xh
	J3RJxdgIBOhaoJfp+bQg7KI5/i0b4feqTQG+p7fKDzCDMGoUAZsbj27gBkfFz6Nj
	WJTOyhXbo1DpNDU2LuH2nKLFbyRmJ6C2wtg8HMFvzMTGT0g1EBVxkiihFS3z144L
	dSGGLJ8vp7LQmrhGK3pQ7wlhZxN8WsuwWTjk9JqHSYmM6rEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45au3ncmpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 17:05:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 19CB04004A;
	Wed, 12 Mar 2025 17:04:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DD4559591E;
	Wed, 12 Mar 2025 17:04:10 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 17:04:09 +0100
Message-ID: <b3f47ba9-04e4-4649-8f7e-9738757529b8@foss.st.com>
Date: Wed, 12 Mar 2025 17:04:10 +0100
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
Subject: [GIT PULL] STM32 DT changes for v6.15#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.15 cycle (a 
bit late sorry). Main changes are the add of new boards (OCTAVO, 
Plymovent AQM, Priva E-Measuringbox) based on STM32MP1 SoC family but 
also the add of new derivatives of STM32MP257 SoC with their associated 
discovery boards.

Thanks
Alex


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.15-1

for you to fetch changes up to 65954899a157832f68536b488194cf698248a26e:

   arm64: dts: st: add stm32mp215f-dk board support (2025-03-12 14:24:56 
+0100)

----------------------------------------------------------------
STM32 DT for v6.15, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Add thermal support.
     - Add Priva E-Measuringbox board support based on sTM32MP133C SoC.
       It embeds Ethernet RMII with TI phy, SDCard, eMMC and some
       sensors.
     - Add support for DHCOR SoM and DHSBC rev.200 board:
       TPM interrupts and gpio reset + LDO2/LDO5 support.

   - STMP32MP15:
     - Add new Octavo support: LXA FairyTux 2 based on OSD32MP153C SiP.
       It contains eMMC for storage, a gigabit Ethernet, a CAN bus and
       a RS485 transceiver.
     - Add Plymovent AQM board based on STM32MP151 SoC. It embeds:
       ETH RMII, WLAN, BT, Sensors (CO2, PM, pressure), Audio (I2S),
       Storage (SDCard, eMMC).

   - STM32MP25:
     - Add STM32MP257F Discovery board: It embeds a STM32MP257FAL SoC,
       with 4GB of LPDDR4, 2*USB typeA, 1*USB3 typeC, 1*ETH,
       wifi/BT combo, DSI HDMI, LVDS connector ...

     - Introduce STM32MP23 SoC and add STM32MP235F Discovery board:
       It embeds a STM32MP235FAK SoC, with 4GB of LPDDR4, 2*USB typeA,
       1*USB3 typeC, 1*ETH, wifi/BT combo, DSI HDMI, LVDS connector ...

     - Introduce STM32MP21 SoC and STM32MP215F discovery board:
       It embeds a STM32MP235FAN SoC, with 2GB of LPDDR4,
       1*USB2 peripheral bus powered typeC, 1*ETH, wifi/BT combo,
       LCD 18bit connector, CSI camera connector, ...

----------------------------------------------------------------
Alexandre Torgue (3):
       arm64: dts: st: add stm32mp257f-dk board support
       arm64: dts: st: introduce stm32mp23 SoCs family
       arm64: dts: st: introduce stm32mp21 SoCs family

Amelie Delaunay (7):
       dt-bindings: stm32: document stm32mp257f-dk board
       arm64: Kconfig: expand STM32 Armv8 SoC with STM32MP21/STM32MP23 
SoCs family
       dt-bindings: stm32: add STM32MP21 and STM32MP23 compatibles for 
syscon
       dt-bindings: stm32: document stm32mp235f-dk board
       arm64: dts: st: add stm32mp235f-dk board support
       dt-bindings: stm32: document stm32mp215f-dk board
       arm64: dts: st: add stm32mp215f-dk board support

Dario Binacchi (5):
       ARM: dts: stm32: add led to stm32f746 Discovery board
       ARM: dts: stm32: add push button to stm32f746 Discovery board
       ARM: dts: stm32: rename LEDs nodes for stm32f769-disco
       ARM: dts: stm32: add usr3 LED node to stm32f769-disco
       ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2

Leonard Göhrs (2):
       dt-bindings: arm: stm32: add compatible strings for Linux 
Automation GmbH LXA FairyTux 2
       ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2

Marek Vasut (1):
       ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC 
rev.200 board

Oleksij Rempel (6):
       dt-bindings: vendor-prefixes: Add prefix for Priva
       dt-bindings: arm: stm32: Add Priva E-Measuringbox board
       dt-bindings: sound: convert ICS-43432 binding to YAML
       dt-bindings: arm: stm32: Add Plymovent AQM board
       ARM: dts: stm32: Add pinmux groups for Plymovent AQM board
       ARM: dts: stm32: Add Plymovent AQM devicetree

Roan van Dijk (2):
       ARM: dts: stm32: Add thermal support for STM32MP131
       ARM: dts: stm32: Add Priva E-Measuringbox devicetree

  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml |    2 +
  Documentation/devicetree/bindings/arm/stm32/stm32.yaml           | 
22 ++++
  Documentation/devicetree/bindings/sound/ics43432.txt             | 
19 ----
  Documentation/devicetree/bindings/sound/invensense,ics43432.yaml | 
51 +++++++++
  Documentation/devicetree/bindings/vendor-prefixes.yaml           |    2 +
  arch/arm/boot/dts/st/Makefile                                    |    4 +
  arch/arm/boot/dts/st/stm32f746-disco.dts                         | 
18 ++++
  arch/arm/boot/dts/st/stm32f769-disco.dts                         |    7 +-
  arch/arm/boot/dts/st/stm32mp131.dtsi                             | 
35 ++++++
  arch/arm/boot/dts/st/stm32mp133c-prihmb.dts                      | 
496 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts                 | 
30 +++++-
  arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi                      | 
292 ++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts                      | 
376 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts          | 
103 ++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts          | 
147 ++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi              | 
397 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157c-dk2.dts                         |    2 +-
  arch/arm64/Kconfig.platforms                                     |    4 +
  arch/arm64/boot/dts/st/Makefile                                  |    6 +-
  arch/arm64/boot/dts/st/stm32mp211.dtsi                           | 
128 ++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp213.dtsi                           |    9 ++
  arch/arm64/boot/dts/st/stm32mp215.dtsi                           |    9 ++
  arch/arm64/boot/dts/st/stm32mp215f-dk.dts                        | 
49 +++++++++
  arch/arm64/boot/dts/st/stm32mp21xc.dtsi                          |    8 ++
  arch/arm64/boot/dts/st/stm32mp21xf.dtsi                          |    8 ++
  arch/arm64/boot/dts/st/stm32mp231.dtsi                           | 
1214 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp233.dtsi                           | 
94 +++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp235.dtsi                           | 
16 +++
  arch/arm64/boot/dts/st/stm32mp235f-dk.dts                        | 
113 ++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp23xc.dtsi                          |    8 ++
  arch/arm64/boot/dts/st/stm32mp23xf.dtsi                          |    8 ++
  arch/arm64/boot/dts/st/stm32mp257f-dk.dts                        | 
113 ++++++++++++++++++++
  32 files changed, 3765 insertions(+), 25 deletions(-)
  delete mode 100644 Documentation/devicetree/bindings/sound/ics43432.txt
  create mode 100644 
Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
  create mode 100644 arch/arm/boot/dts/st/stm32mp133c-prihmb.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp211.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp213.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp215.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp215f-dk.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp21xf.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp231.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp233.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp235.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp235f-dk.dts
  create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp23xf.dtsi
  create mode 100644 arch/arm64/boot/dts/st/stm32mp257f-dk.dts
