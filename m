Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6026FA7B
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161798; cv=none; b=jQ5k2rJSHhM6zUAfjC6qap7TcXG1dTKmqk/WS/C61nMWawD3dsg/E4UmLj/GqfJaTlpKMBbzIG7pIxJI4KVFf6E5zdRKUs+A+6UFWLzMpvaNgb7g6vEdpMXqeMBOBZPVfqc65Dq4oQ4ZzvpG4MxGo+G5ml3nbMvnn+GN5+8WiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161798; c=relaxed/simple;
	bh=kloJDvnk5TssDi2bhZ5O7aDFQDka/31Rwq/YcMH0hfE=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=Ii97/4DxPRXJxSHv6ixAKzX+uFAd5sMbq+BED7R9vBNvOhh9a7AekX8I3X3cMcoxrQA8+9hmhiCHvdYWBdBRWoEUUPsgaAfnzs7YEH43glvsmV+VJlExWmRXn7LhQAY1nNxUTfO/qH49hXBGw/2YFIaYQk72sCDn0Dmgn/jlV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lsxCRHRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lsxCRHRb"
Received: by smtp.kernel.org (Postfix)
	id C02C6C4CEF6; Thu, 10 Jul 2025 15:36:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7341BC4CEE3;
	Thu, 10 Jul 2025 15:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7341BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AFPij1003754;
	Thu, 10 Jul 2025 17:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=KzAzOUNX3up9WMQCB7MqOT
	zOvJNFeyyub5F+P4jf5qM=; b=lsxCRHRbNjQ/9zQewQtP0wwHl9RzC2qQeY9/7Y
	EhODSKMa4ySHAbtwKLDOltmwzZHNBLs6dnrESG1atSpDh+RcHAfC8zGopS0eMgdW
	Jzt0L13iNu8MWFfZfotWAVJ3s+WR6nOr4d4zw4XI/2wDpi1F47tA0CcrEb3ITsTO
	U/rn01DbiAJgahsL9r2Axz3K72gxfXmyR0VcQioCRzpWkH92MMhI9Mx/e5/VynS+
	SEOXn7GXBW0PJsvhxyS1Iy92c+AEgrIoeuzn0cU8mb62dd/rphstUnV32PQEHRaD
	+Q0N0abltr1bbWWqbp4u5H7DTt+z3zogCuPg5X6IvyI43o6w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3j4y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 17:36:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 542B04005B;
	Thu, 10 Jul 2025 17:35:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C05BB1F9A8;
	Thu, 10 Jul 2025 17:33:08 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 17:33:07 +0200
Message-ID: <b3e3363b-1ea5-457c-b244-2cbe26f7d6e4@foss.st.com>
Date: Thu, 10 Jul 2025 17:33:07 +0200
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
Subject: [GIT PULL] STM32 DT changes for v6.17#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v6.17 cycle.
I added a config patch inside.

Thanks
Alex


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.17-1

for you to fetch changes up to 1a32f7427eb3d1248bc64cd745b93f88cc838933:

   arm64: dts: st: remove empty line in stm32mp251.dtsi (2025-07-10 
17:05:56 +0200)

----------------------------------------------------------------
STM32 DT for v6.17, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     -Add Ethernet MAC adress efuse support.

   - STMP32MP15:
     - Add stm32mp157f-DK2 board support. This board embedds the same
       conectivity devices, DDR ... than stm32mp157c-dk2.
       However there are two differences: STM32MP157F SoC which allows
       overdrive OPP and the SCMI support for system features like
       clocks and regulators.

   - STM32MP25:
     - Fix tick timer for low power use cases.
     - Add timer support.

----------------------------------------------------------------
Alexandre Torgue (1):
       ARM: dts: stm32: fullfill diversity with OPP for STM32M15xF SOCs

Amelie Delaunay (3):
       ARM: dts: stm32: use 'typec' generic name for stusb1600 on 
stm32mp15xx-dkx
       ARM: dts: stm32: use internal regulators bindings for MP15 scmi 
variants
       ARM: dts: stm32: add stm32mp157f-dk2 board support

Etienne Carriere (2):
       dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers
       ARM: dts: stm32: optee async notif interrupt for MP15 scmi variants

Fabrice Gasnier (4):
       arm64: dts: st: add timer nodes on stm32mp251
       arm64: dts: st: add timer pins for stm32mp257f-ev1
       arm64: dts: st: add timer nodes on stm32mp257f-ev1
       arm64: defconfig: enable STM32 timers drivers

Himanshu Bhavani (1):
       dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

Olivier Moysan (1):
       ARM: dts: stm32: add system-clock-direction-out on stm32mp15xx-dkx

Patrice Chotard (1):
       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI 
driver

Patrick Delaunay (2):
       arm64: dts: st: fix timer used for ticks
       arm64: dts: st: remove empty line in stm32mp251.dtsi

Uwe Kleine-König (1):
       ARM: dts: stm32: Add nvmem-cells to ethernet nodes for constant 
mac-addresses

  Documentation/devicetree/bindings/arm/stm32/stm32.yaml |   1 +
  arch/arm/boot/dts/st/Makefile                          |   3 +-
  arch/arm/boot/dts/st/stm32mp131.dtsi                   |   2 +
  arch/arm/boot/dts/st/stm32mp133.dtsi                   |   2 +
  arch/arm/boot/dts/st/stm32mp15-scmi.dtsi               |  10 ++-
  arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi         | 196 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp157f-dk2.dts               | 179 
++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15xf.dtsi                  |  17 +++++
  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi              |   3 +-
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi          |  61 
++++++++++++++++++
  arch/arm64/boot/dts/st/stm32mp251.dtsi                 | 527 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts             |  58 
+++++++++++++++++
  arch/arm64/configs/defconfig                           |   6 ++
  include/dt-bindings/regulator/st,stm32mp15-regulator.h |  40 ++++++++++++
  14 files changed, 1098 insertions(+), 7 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
  create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts
  create mode 100644 arch/arm/boot/dts/st/stm32mp15xf.dtsi
  create mode 100644 include/dt-bindings/regulator/st,stm32mp15-regulator.h
