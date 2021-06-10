Return-Path: <SRS0=H49W=LE=foss.st.com=prvs=0795380aa1=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07902C48BE0
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 16:01:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC55161419; Thu, 10 Jun 2021 16:01:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CEA60E0B;
	Thu, 10 Jun 2021 16:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CEA60E0B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=prvs=0795380aa1=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15AFpHRk011785;
	Thu, 10 Jun 2021 18:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=A9DmyvPCllcOG5+PI6vbGbebM1Cm8Cshi5CAB6LuuYM=;
 b=X0HLqBWz5yfSn/I0NpVL1LtnsUrTg3SsemvKwUibyVnosZFnvrQRybSXK8N1c5gSleJf
 x2jWrCkgALTNnyQiT5FYmCxJ0bw6qSf1COk2E1njESuMpxvM43oqgzOQ3M7mlherjkP2
 6pG8Umn5RVmTQdZvRDpwCXOgbLC5oaSHq4K960Zm4ZwIRzx6R8qZpsXwQcPrsm+dBcLU
 hW3L1mXRM8j9SrA6sat7vqdASElbar2tp7nEs6AjFCD0HHVQYmsMzO9dcDsZxuhtvULo
 ySULrCIeXhyVJh5Ohq878u2dcxSEGdsVC/MSiiKNYfg2/3EurRT7HcVT3bGs2jXIUuoY Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 393eqyjshk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jun 2021 18:01:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38B8F10002A;
	Thu, 10 Jun 2021 18:01:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 131D422A6CE;
	Thu, 10 Jun 2021 18:01:15 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 18:01:14 +0200
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Marek Vasut <marex@denx.de>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Jagan Teki
	<jagan@amarulasolutions.com>,
        dillon min <dillon.minfei@gmail.com>
Subject: [GIT PULL] STM32 DT changes for v5.14 #1
Message-ID: <e4bfb255-63fb-74a8-d591-eb09821c93ee@foss.st.com>
Date: Thu, 10 Jun 2021 18:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-10_10:2021-06-10,2021-06-10 signatures=0

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.14. This PR 
provides mainly DT yaml verification fixes.

regards
Alex

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.14-1

for you to fetch changes up to 4bf4abe19089245b7b12f35e5cafb5477b3e2c48:

   ARM: dts: stm32: fix stpmic node for stm32mp1 boards (2021-06-10 
16:08:18 +0200)

----------------------------------------------------------------
STM32 DT updates for v5.14, round 1

Highlights:
-----------

MCU part:
  - Fixes for Yaml verifications

MPU part:
  - Configure qspi's mdma transfer to block for stm32mp151

  - ST boards:
   - Fixes for yaml verifications

  - DH boards:
   - Fixes for yaml verifications
   - Rework of LAN8710i on DHCOM SoM to fit with requested reset sequence.

  - Odyssey boards:
   - fix Sd card detectection (gpio line updated)
   - fix eMMC VQMMC suuply (use vdd instead of v3v3)

----------------------------------------------------------------
Alexandre Torgue (9):
       ARM: dts: stm32: fix gpio-keys node on STM32 MCU boards
       ARM: dts: stm32: fix RCC node name on stm32f429 MCU
       ARM: dts: stm32: fix timer nodes on STM32 MCU to prevent warnings
       ARM: dts: stm32: update pinctrl node name on STM32 MCU to prevent 
warnings
       ARM: dts: stm32: fix i2c node name on stm32f746 to prevent warnings
       ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
       dt-bindings: net: document ptp_ref clk in dwmac
       ARM: dts: stm32: fix ltdc pinctrl on microdev2.0-of7
       ARM: dts: stm32: fix stpmic node for stm32mp1 boards

Grzegorz Szymaszek (3):
       ARM: dts: stm32: fix stm32mp157c-odyssey card detect pin
       ARM: dts: stm32: add a new DCMI pins group on stm32mp15
       ARM: dts: stm32: fix the Odyssey SoM eMMC VQMMC supply

Marek Vasut (6):
       ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM
       ARM: dts: stm32: Remove extra size-cells on dhcom-pdk2
       ARM: dts: stm32: Fix touchscreen node on dhcom-pdk2
       ARM: dts: stm32: Drop unused linux,wakeup from touchscreen node 
on DHCOM SoM
       ARM: dts: stm32: Rename eth@N to ethernet@N on DHCOM SoM
       ARM: dts: stm32: Rename spi-flash/mx66l51235l@N to flash@N on 
DHCOM SoM

Patrice Chotard (1):
       ARM: dts: stm32: Configure qspi's mdma transfer to block for 
stm32mp151

  .../devicetree/bindings/net/stm32-dwmac.yaml       |  6 +-
  arch/arm/boot/dts/stm32429i-eval.dts               |  8 +--
  arch/arm/boot/dts/stm32746g-eval.dts               |  6 +-
  arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  2 +-
  arch/arm/boot/dts/stm32f429-disco.dts              |  6 +-
  arch/arm/boot/dts/stm32f429-pinctrl.dtsi           | 72 
++++++++++-----------
  arch/arm/boot/dts/stm32f429.dtsi                   | 10 +--
  arch/arm/boot/dts/stm32f469-disco.dts              |  6 +-
  arch/arm/boot/dts/stm32f469-pinctrl.dtsi           | 74 
++++++++++------------
  arch/arm/boot/dts/stm32f7-pinctrl.dtsi             |  2 +-
  arch/arm/boot/dts/stm32f746.dtsi                   | 12 +---
  arch/arm/boot/dts/stm32f769-disco.dts              |  6 +-
  arch/arm/boot/dts/stm32h743.dtsi                   |  4 --
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           | 33 ++++++++++
  arch/arm/boot/dts/stm32mp151.dtsi                  | 16 ++---
  ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |  2 +-
  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |  7 +-
  arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi     |  7 +-
  arch/arm/boot/dts/stm32mp157c-odyssey.dts          |  2 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |  7 +-
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       | 17 +++--
  arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi       |  2 +-
  arch/arm/boot/dts/stm32mp15xx-osd32.dtsi           |  7 +-
  23 files changed, 151 insertions(+), 163 deletions(-)
