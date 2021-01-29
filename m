Return-Path: <SRS0=PP6i=HA=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11EE9C433DB
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 08:42:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94C9064E17; Fri, 29 Jan 2021 08:42:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97FD64E14;
	Fri, 29 Jan 2021 08:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97FD64E14
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10T8XPjO011614;
	Fri, 29 Jan 2021 09:42:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=IqJU5WTFYVxYg64ikp2SjE9H3c+g+ahecAqCnFEQUro=;
 b=ZAgTj3SWPtME85E8/2MxHMzHSB68Cdm8PqgenpmIN2I7vv9IToXa6O3ZQzBW+JlegSYv
 aatLo3RxESSjqoTe99leCc+lbLgjZibW07jwhnj6ZZa+RanK8/RM0zXcwUscFvxj3VPc
 p37aXmDWBbvvD30Oa7m+P+v0BxdxT1p8+3bqQto2qP7dqN3GAYrPUJQcrHJ3e+KdnjYc
 wtjoY8Jhs/849ptKKZR5S0LVflXvYJfM0zy1Tm4r/UkTuT6Jw5YwI1enMW/lEZRqbDDO
 IX8CcZYavwcMOnNF9vpwlcPYERznOOcqsi5axPvbEUBIRgiKv6rGTmhZXHbDKOW/tHyh tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 368a57463r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jan 2021 09:42:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F5710002A;
	Fri, 29 Jan 2021 09:42:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F37F2296D5;
	Fri, 29 Jan 2021 09:42:39 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 09:42:38 +0100
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marek Vasut <marex@denx.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre TORGUE
	<alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v5.12 #1
Message-ID: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
Date: Fri, 29 Jan 2021 09:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-29_03:2021-01-28,2021-01-29 signatures=0

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.12. As usual 
main changed concern MPU part. Main changes concern DHCOM SDMMC1.

regards
Alex

The following changes since commit 83d411224025ac1baab981e3d2f5d29e7761541d:

   ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02 (2021-01-14 
18:17:26 +0100)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.12-1

for you to fetch changes up to 36be90f5362a3174071a543fa73eb0f6d66bdf52:

   ARM: dts: stm32: add #clock-cells property to usbphyc node on 
stm32mp151 (2021-01-29 09:20:01 +0100)

----------------------------------------------------------------
STM32 DT updates for v5.12, round 1

Highlights:
----------

MCU part:
  -Rename mmc nodes to match with yaml validation.

MPU part:
  -Rename mmc nodes to match with yaml validation.
  -Move vdda1v1 & vdda1v8 (used by usbphyc) from boards files
   to SoC dtsi file.

  -LXA:
   -Fix leds schema for yaml validation.

  -DH:
   -Enable SDMMC1 internal pull-ups and disable CKIN feedabck clock
    on DHCOM.
   -Add SDMMC1 init state inorder to use some gpios during probing phase.
   -Disable KS8851 and FMC on PicoITX board.

----------------------------------------------------------------
Alexander Dahl (1):
       ARM: dts: stm32: Fix schema warnings for pwm-leds on lxa-mc1

Amelie Delaunay (3):
       ARM: dts: stm32: add usbphyc vdda1v1 and vdda1v8 supplies on 
stm32mp151
       ARM: dts: stm32: remove usbphyc ports vdda1v1 & vdda1v8 on 
stm32mp15 boards
       ARM: dts: stm32: add #clock-cells property to usbphyc node on 
stm32mp151

Jagan Teki (1):
       ARM: dts: stm32: Add STM32MP1 I2C6 SDA/SCL pinmux

Marek Vasut (6):
       ARM: dts: stm32: Enable internal pull-ups for SDMMC1 on DHCOM SoM
       ARM: dts: stm32: Disable SDMMC1 CKIN feedback clock on DHCOM
       ARM: dts: stm32: Disable KS8851 and FMC on PicoITX board
       ARM: dts: stm32: Add additional init state for SDMMC1 pins
       ARM: dts: stm32: Enable voltage translator auto-detection on DHCOM
       ARM: dts: stm32: Rename mmc controller nodes to mmc@

  arch/arm/boot/dts/stm32f429.dtsi                   |  2 +-
  arch/arm/boot/dts/stm32f746.dtsi                   |  4 +--
  arch/arm/boot/dts/stm32h743.dtsi                   |  2 +-
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           | 40 
++++++++++++++++++++++
  arch/arm/boot/dts/stm32mp151.dtsi                  |  9 +++--
  arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       |  4 ---
  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  4 ---
  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts          | 13 +++----
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  2 --
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      |  4 ---
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 12 ++++---
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi       | 20 ++++++++++-
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  4 ---
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             |  4 ---
  14 files changed, 84 insertions(+), 40 deletions(-)
