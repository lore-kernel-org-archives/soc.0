Return-Path: <SRS0=5H41=56=foss.st.com=prvs=03972141f3=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B6DC05027
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 12:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28FABC4339B; Thu,  2 Feb 2023 12:57:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB1CBC433D2;
	Thu,  2 Feb 2023 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB1CBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312BcPv8004028;
	Thu, 2 Feb 2023 13:57:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=FRrOlPoLGshk2ugiIl1XFFrFNI9pnP4+tvTaVUWHofs=;
 b=NkcURONDd/QrvfOy+ncNsuwdp3PBCPhV8JLeaOZKsPAis6CBe+8qJ9bD56o+dERxQHd0
 73RRq/q/0g+ciTjTsTU5b2YU0WXjdZV7nCLGhVRVGg1rCUWnuVRF0dTeujwLSuIEwIl9
 4vhHNr6dOUuYvE5FfAZdiQJ4WlH+4fTXmGSZFC9JqoV6PGgnMxWYfK+JQj5rOND/YbG7
 +UgUYZm+nbBQCk10tZpEplbE0X1eIf3dsVfjZTBfKij1+PH5wAEqWOeyJjAU2n0DcIj6
 n/y8VY7BHDajzyCoKPFI+IM1J0da87Ea1mxIc6qT/BT1YqggaNMudoHio2L/LMXgdxFh jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfn39h053-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 13:57:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA72D10002A;
	Thu,  2 Feb 2023 13:57:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2352217B89;
	Thu,  2 Feb 2023 13:57:23 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 2 Feb
 2023 13:57:23 +0100
Message-ID: <3e815504-e85e-cbd3-6e6d-4e5a7aa7469a@foss.st.com>
Date: Thu, 2 Feb 2023 13:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
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
Subject: [GIT PULL] STM32 DT changes for v6.3 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this (late) first round of STM32 DT for v6.3 cycle. Main 
changes concern peripheral support on STM32MP13 and yaml fixes.

Thanks
Alex

The following changes since commit 175281f80695569c7f9cf062e5d0ddc4addc109f:

   ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l 
(2023-01-17 14:48:44 +0100)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.3-1

for you to fetch changes up to 7e1790d26a92e05cc6a2d0bab98d8ea40ae28d9d:

   ARM: dts: stm32: fix compatible for BSEC on STM32MP13 (2023-02-02 
13:29:59 +0100)

----------------------------------------------------------------
STM32 DT for v6.3, round 1

Highlights:
----------

- MPU:
   - ST boards:
     - Add following peripherals support on stm32mp13:
       i2s, SAI, SPDIFRX, DFSDM, Timers
     - Add timers support on stm32mp135f-dk board.
     - Add decicated BSEC compatible on STM32MP13.
     - Rename sound card on STM32MP15 DKx.
     - Fix yaml validation issues.

----------------------------------------------------------------
Amelie Delaunay (1):
       ARM: dts: stm32: Fix User button on stm32mp135f-dk

Bernhard Rosenkränzer (1):
       ARM: dts: stm32: Remove the pins-are-numbered property

Laurent Pinchart (1):
       ARM: dts: stm32: Use new media bus type macros

Olivier Moysan (9):
       ARM: dts: stm32: remove sai kernel clock on stm32mp15xx-dkx
       ARM: dts: stm32: rename sound card on stm32mp15xx-dkx
       ARM: dts: stm32: add i2s nodes on stm32mp131
       ARM: dts: stm32: add sai nodes on stm32mp131
       ARM: dts: stm32: add spdifrx node on stm32mp131
       ARM: dts: stm32: add dfsdm node on stm32mp131
       ARM: dts: stm32: add timers support on stm32mp131
       ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
       ARM: dts: stm32: add timers support on stm32mp135f-dk

Patrick Delaunay (2):
       ARM: dts: stm32: Update part number NVMEM description on stm32mp131
       ARM: dts: stm32: fix compatible for BSEC on STM32MP13

  arch/arm/boot/dts/stm32429i-eval.dts     |   3 +-
  arch/arm/boot/dts/stm32f4-pinctrl.dtsi   |   1 -
  arch/arm/boot/dts/stm32f7-pinctrl.dtsi   |   1 -
  arch/arm/boot/dts/stm32h743.dtsi         |   1 -
  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi |  60 +++
  arch/arm/boot/dts/stm32mp131.dtsi        | 710 
++++++++++++++++++++++++++++++-
  arch/arm/boot/dts/stm32mp135f-dk.dts     |  60 ++-
  arch/arm/boot/dts/stm32mp151.dtsi        |   2 -
  arch/arm/boot/dts/stm32mp157c-ev1.dts    |   3 +-
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   |   4 +-
  10 files changed, 832 insertions(+), 13 deletions(-)
