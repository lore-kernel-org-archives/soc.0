Return-Path: <SRS0=rUpC=PD=foss.st.com=prvs=492207a22c=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF688C433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 15:21:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD42861181; Fri, 15 Oct 2021 15:21:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB73E61213;
	Fri, 15 Oct 2021 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB73E61213
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FEnmGU027159;
	Fri, 15 Oct 2021 17:21:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=Mkaj12dibkBzdWAkMtP9VRXJfdCnp9ec+N70YxAdiDw=;
 b=AlJP1t+dMw4pUyCXuXlyNlV5yJXLIMOeLJu4CNo2XsNbm8I9qomOL5+nL+VaqODTDxDt
 I5/HDVV/iCZiL6KLJtJDIqjx+sNctANemea3yzG4Uj7CAxWJmsQaxNFmTv4cPKnMrpGI
 QoAuHlwwTdnjB/NC/gNTlWy3BHkfHFlvBYsknAl53fNffW+rGxnd66LkUnM03BFoLCoa
 DZTLW7MLOp3N52HeaIyfXHChYkz7yjd1MVnW4SIEwLgpVDwFbGCOrdgtBFBfbKV09FNH
 MH4yUCI1bi74gXNv+Ljr7QrLrhWFl5YI8rS8ehykbr9wl68127vHMjiGYsQPCYPMe3Te 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3bqbrj058g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Oct 2021 17:21:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F01310002A;
	Fri, 15 Oct 2021 17:21:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2511B24FE13;
	Fri, 15 Oct 2021 17:21:13 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 17:21:12 +0200
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Marek Vasut
	<marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v5.16 #1
Message-ID: <9d52c3e2-a3b9-89f3-1896-7cd3560e7010@foss.st.com>
Date: Fri, 15 Oct 2021 17:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_04,2021-10-14_02,2020-04-07_01


Dear ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.16. It 
mainly adds the stm32mp135f-dk board based on the new STM32MP135 SoC.
Several fixes are also pushed for DH, Odyssey and ST boards.

Regards
Alex


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.16-1

for you to fetch changes up to db7be2cb87ae65e2d033a9f61f7fb94bce505177:

   ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on 
stm32mp151 (2021-10-15 16:51:09 +0200)

----------------------------------------------------------------
STM32 DT for v5.16, round 1

Highlights:
----------

- MPU:
  - ST boards:
   - Add new stm32mp135f-dk board. It embedds new STM32MP135 SoC,
     with 512 MB of DDR3. Several connections are available on this
     board:
     4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI,
     Combo Wifi/BT, ...
     Only SD card, uart4 (console) and watchdog IPs are enabled in
     this tag.
   - Change IRQ level for STUSB1600 on DKx boards.
   - Fix SAI subclocks range.
   - Add ck_usb0_48m clock in USB OHCI node device to match with
     STM32MP15 datasheet.

  - DH boards:
   - Reduce DHCOR SPI NOR frequency to 50 MHz to avoid sporadic issues.
   - Fix SAI pin muxing.

  - Odyssey:
   - Set DCMI pins.

----------------------------------------------------------------
Alexandre Torgue (3):
       ARM: dts: stm32: add STM32MP13 SoCs support
       dt-bindings: stm32: document stm32mp135f-dk board
       ARM: dts: stm32: add initial support of stm32mp135f-dk board

Amelie Delaunay (1):
       ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on 
stm32mp151

Fabrice Gasnier (1):
       ARM: dts: stm32: fix STUSB1600 Type-C irq level on stm32mp15xx-dkx

Grzegorz Szymaszek (1):
       ARM: dts: stm32: set the DCMI pins on stm32mp157c-odyssey

Marek Vasut (1):
       ARM: dts: stm32: Reduce DHCOR SPI NOR frequency to 50 MHz

Olivier Moysan (2):
       ARM: dts: stm32: fix SAI sub nodes register range
       ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15

  .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
  arch/arm/boot/dts/Makefile                         |   1 +
  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |  64 +++++
  arch/arm/boot/dts/stm32mp131.dtsi                  | 283 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp133.dtsi                  |  37 +++
  arch/arm/boot/dts/stm32mp135.dtsi                  |  12 +
  arch/arm/boot/dts/stm32mp135f-dk.dts               |  56 ++++
  arch/arm/boot/dts/stm32mp13xc.dtsi                 |  17 ++
  arch/arm/boot/dts/stm32mp13xf.dtsi                 |  17 ++
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |   8 +-
  arch/arm/boot/dts/stm32mp151.dtsi                  |  18 +-
  arch/arm/boot/dts/stm32mp157c-odyssey.dts          |   6 +
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |   2 +-
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |   2 +-
  14 files changed, 512 insertions(+), 15 deletions(-)
  create mode 100644 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp131.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp133.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp135.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp135f-dk.dts
  create mode 100644 arch/arm/boot/dts/stm32mp13xc.dtsi
  create mode 100644 arch/arm/boot/dts/stm32mp13xf.dtsi
