Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31A1A8400
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683404; cv=none; b=lJQxnDoSSJrIABqnCO9KOjzMSYzzEOtLlibYrFicErwI6EU+9VspLxXdKwkYFJe+Tf/L1dgnOiiOqHTwVCrujFwA9em87zLjE444ON/6Ob2I6jdZoaR/YsSvon82iJ5q1b2O+8/ttaktIMKS5dfH2bpMjGq/wmisRW6wOZeKoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683404; c=relaxed/simple;
	bh=z91eviDiK7DOV36KuyN6ofqA9Yzi0XJ67kQh/m91FLE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=W0l7EX2XZ5tZuzLFcifLVo+rT96s9a70B2ltsyCt0VNHxYTL+tEK06b5BQgRa/ZrSuBVSaUrCGNrSkNDiXNFg6eXqcyZ6qg1fTPKLTs3RSdhvbJRygPR9C21yWeO2GwRZ0uMMp3u68uZBi2QW+vQB6g1441smHyDiPPxJOIsSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Fmuwt8tW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Fmuwt8tW"
Received: by smtp.kernel.org (Postfix)
	id A189DC4CEDC; Fri, 20 Dec 2024 08:30:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5829C4CECD;
	Fri, 20 Dec 2024 08:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5829C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK89Efn001221;
	Fri, 20 Dec 2024 09:29:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=olAidU/gs7RAx2OHWK36gh
	9sp6603toVRgItbS5yVwM=; b=Fmuwt8tWIk1SKcvWWOX1djkrkcRYakcRXsauZH
	huiUieYMlZdLoubvfRX24N8EcKOyvLFmqrXm0V39iMbbtWU/L+RDIN3sXn/cv1nq
	onUgCDkipC7ugW3CKHcCqvjJKVP5VzGv+bNMyL8WhvVdKWAHeFR0kA5ZidbwRtYE
	KypBwRB+2oagYmo3HRhi4DmZ0zn7IaT1F0TSLaF7uJIWCoT37UM9tA9zCJNZ5sMd
	KXqJMlpjc927sM8FyeN1JoFf7RmUWVJgU4v7iCi/fq9SR0rmjaoNu0rLdrxruBed
	iLxfAuFVMTvX9PQdzWqeMeqDqmnTRQ2HT+47Rd1U6+MgHSrQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n4d887u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:29:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD9024004D;
	Fri, 20 Dec 2024 09:29:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9C3C250EAE;
	Fri, 20 Dec 2024 09:27:56 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 09:27:56 +0100
Message-ID: <7ffcca65-3953-413a-bcf3-0702a6b0518b@foss.st.com>
Date: Fri, 20 Dec 2024 09:27:55 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.14#1
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.14 cycle (a 
bit early due to coming vacation period). Main changes are the add of 
new Octavo board based on STM32MP153 and the STM32MP2 support enhancement.

Thanks
Alex

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.14-1

for you to fetch changes up to 8df9bff2788973e16263ca86df7574d527c84405:

   arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1 
(2024-12-20 08:20:25 +0100)

----------------------------------------------------------------
STM32 DT for v6.14, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Populate all timer counter nodes in Soc file.
     - Enable counter (timers) on stm32mp135f-dk.
     - DH core: increase CPU voltage to fit with STM32MP135F datasheet.

   - STMP32MP15:
     - Populate all timer counter nodes in Soc file.
     - Enable counter (timers) on stm32mp15 EV1 and DK boards.

     - OCTAVO:
       - LXA-TAC (gen1/2): disable RTC, update aliases and
         adjust USB gadget.
       - Add LXA-TAC gen3 based on OSD32MP153x SIP:
         STMP32MP153, RAM, PMIC.

     - DH: minor fixes.

   - STM32MP25:
     - Enable imx335/CSI/DCMIPP pipeline on stm32mp257f-ev1.
     - Add I2S, SAI, SPDIFRX supports.
     - Add and enable COMBOPHY on stm32mp257f-ev1. Combophy is used
       by PCIe and USB3.

----------------------------------------------------------------
Alain Volmat (2):
       arm64: dts: st: add csi & dcmipp node in stm32mp25
       arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32mp257f-ev1

Arnaud Pouliquen (1):
       ARM: dts: stm32: Fix IPCC EXTI declaration on stm32mp151

Christian Bruel (2):
       arm64: dts: st: Add combophy node on stm32mp251
       arm64: dts: st: Enable COMBOPHY on the stm32mp257f-ev1 board

Fabrice Gasnier (5):
       ARM: dts: stm32: populate all timer counter nodes on stm32mp13
       ARM: dts: stm32: populate all timer counter nodes on stm32mp15
       ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
       ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1
       ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards

Leonard Göhrs (6):
       ARM: dts: stm32: lxa-tac: disable the real time clock
       ARM: dts: stm32: lxa-tac: extend the alias table
       ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi 
function
       dt-bindings: arm: stm32: add compatible strings for Linux 
Automation LXA TAC gen 3
       ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
       ARM: dts: stm32: lxa-tac: Add support for generation 3 devices

Marek Vasut (4):
       ARM: dts: stm32: Deduplicate serial aliases and chosen node for 
STM32MP15xx DHCOM SoM
       ARM: dts: stm32: Increase CPU core voltage on STM32MP13xx DHCOR SoM
       ARM: dts: stm32: Sort M24256E write-lockable page in DH 
STM32MP13xx DHCOR SoM DT
       ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15xx DHCOM SoM

Olivier Moysan (3):
       arm64: dts: st: add i2s support to stm32mp251
       arm64: dts: st: add sai support on stm32mp251
       arm64: dts: st: add spdifrx support on stm32mp251

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml |   7 ++++++
  arch/arm/boot/dts/st/Makefile                          |   1 +
  arch/arm/boot/dts/st/stm32mp131.dtsi                   |  40 
+++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                |  12 ++++++++++
  arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi        |  16 
+++++++-------
  arch/arm/boot/dts/st/stm32mp151.dtsi                   |  43 
+++++++++++++++++++++++++++++++++++-
  arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts      | 267 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157c-ev1.dts               |   9 ++++++++
  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts      |  84 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts      |  84 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi          | 100 
++++++++++------------------------------------------------------------------------
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi      |  12 ----------
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi       |  10 ---------
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi    |  10 ---------
  arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi        |   7 ++++++
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi              |  18 
+++++++++++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                 | 234 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts             |  97 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  18 files changed, 922 insertions(+), 129 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts
