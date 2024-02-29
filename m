Return-Path: <SRS0=wyKM=KG=foss.st.com=prvs=378904e4a5=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE8C54798
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 10:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07CFCC43394; Thu, 29 Feb 2024 10:23:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 322DEC433F1;
	Thu, 29 Feb 2024 10:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 322DEC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41TAJL6H020919;
	Thu, 29 Feb 2024 11:23:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=selector1; bh=5LPraC5Ke1QUuqM3uvuf
	8Y0t7zNfl01i7GhOtXZ5qT8=; b=mfDs2187i5erCavAqGCMKlMS98Dv6rFr+scv
	qP1hpGC6IrWWiaLMx9+eiKu8ZUSeMvebp8CjIxVLRj8EdCmTBrvz4IIeH+vSwxpm
	Nofd6OxkMhqXXf/7YxJ3kbzjDqeFWDX2Xmi+1lCQecWQAf+aX+nIuFh1+cIFVTez
	j2Ig8Mxsu2ityt7jdBfBS7pHagKZFf37Zb9h50BUO4XNV1eZ01iSl/WmxCPrGEFT
	gaW5OBg1cRIHXWNxSdMMe35ULcHuEIWvnGjD9hEmZiVacWU+ZNBWIZ7yiubwybjc
	3Tw1uKwSZtnD+LUpyeXhs6IzWfNe3U9jLaSO0Rujc68FPYyb1w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4d1kgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 11:23:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A51C640050;
	Thu, 29 Feb 2024 11:23:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D542C25AB96;
	Thu, 29 Feb 2024 11:23:13 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 11:23:13 +0100
Message-ID: <a7ae1058-e24d-4a6b-900f-401f0e3ae17c@foss.st.com>
Date: Thu, 29 Feb 2024 11:23:12 +0100
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
Subject: [GIT PULL] STM32 DT changes for v6.9#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-27_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT for v6.9 cycle.
Sorry to be late.

Thanks
Alex

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.9-1

for you to fetch changes up to a7b9ab6c880d4ce2c216f14482a6d3e24fc0c87a:

   arm64: dts: st: add video encoder support to stm32mp255 (2024-02-29 
10:28:54 +0100)

----------------------------------------------------------------
STM32 DT for v6.9, round 1

Highlights:
----------

- MCU:
   - Add DSI support on stm32f769.
   - Add display support on stm32f769-disco.
   - Add stm32f769-disco-mb1166-reva09 board support which belongs to
     the novatek NT35510 panel.

- MPU:
   - STM32MP13:
     - Add CRC support an enable it on stm32mp135f-dk.
     - Enable CRYP on stm32mp135f-dk.

   - STMP32MP15:
    - Fix DSI peripheral clock: use bus clock instead of kernel clock
      for pclk.

    - LXA: driver powerboard lines as open drain.
    - LXA: reduce RGMII drive strenght to reduce EMI emmissions.

   - STM32MP25:
     - Add video encoder / video decoder support.

----------------------------------------------------------------
Dario Binacchi (6):
       dt-bindings: nt35510: document 'port' property
       dt-bindings: mfd: stm32f7: Add binding definition for DSI
       ARM: dts: stm32: add DSI support on stm32f769
       ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
       ARM: dts: stm32: add display support on stm32f769-disco
       ARM: dts: add stm32f769-disco-mb1166-reva09

Hugues Fruchet (2):
       arm64: dts: st: add video decoder support to stm32mp255
       arm64: dts: st: add video encoder support to stm32mp255

Leonard Göhrs (2):
       ARM: dts: stm32: lxa-tac: drive powerboard lines as open-drain
       ARM: dts: stm32: lxa-tac: reduce RGMII interface drive strength

Lionel Debieve (2):
       ARM: dts: stm32: add CRC on stm32mp131
       ARM: dts: stm32: enable CRC on stm32mp135f-dk

Raphael Gallais-Pou (1):
       ARM: dts: stm32: fix DSI peripheral clock on stm32mp15 boards

Thomas Bourgoin (1):
       ARM: dts: stm32: enable crypto accelerator on stm32mp135f-dk

  Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml | 
  1 +
  arch/arm/boot/dts/st/Makefile                                        | 
  1 +
  arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts               | 
13 +++++++++++++
  arch/arm/boot/dts/st/stm32f769-disco.dts                             | 
70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
  arch/arm/boot/dts/st/stm32f769.dtsi                                  | 
20 ++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp131.dtsi                                 | 
  7 +++++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts                              | 
  8 ++++++++
  arch/arm/boot/dts/st/stm32mp157.dtsi                                 | 
  2 +-
  arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts                        | 
  2 +-
  arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts                        | 
  2 +-
  arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts                        | 
  2 +-
  arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts                        | 
  2 +-
  arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts                    | 
  2 +-
  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi                        | 
  6 +++++-
  arch/arm64/boot/dts/st/stm32mp251.dtsi                               | 
12 ++++++++++++
  arch/arm64/boot/dts/st/stm32mp255.dtsi                               | 
17 +++++++++++++++++
  include/dt-bindings/mfd/stm32f7-rcc.h                                | 
  1 +
  17 files changed, 157 insertions(+), 11 deletions(-)
  create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts
  create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi
