Return-Path: <SRS0=RKQx=ZP=foss.st.com=prvs=5254de64c4=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B8C6FA86
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83D15C433D7; Mon, 12 Sep 2022 13:38:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25865C433D6;
	Mon, 12 Sep 2022 13:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25865C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9kNVq018084;
	Mon, 12 Sep 2022 15:38:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=ZRNYOM3L9daSnBMooPao8KQaKxsm/IoB+3vNwvGXBes=;
 b=QE8cI09lNQzmNSSThVSuhmJ0hMQ6JPT9FVpWn3NqB+g8kcgr9GdsjuuRjI7W4fiijzAW
 MtHq0o8AC/la1JKHKxYcF0k/Znc2iTDECnxWcm0H8cHObFIls5s7zKCtvKnKRGypFvDn
 GVq1If0yL09eM5Sr2rKVEhjewkyqbJQ7oBXYj+mbh8TWiAgt1rry0f99VuHO8ALTdyW2
 1UWq44WqoQ7YHwq4gAY0pj1xfKEdnbqg+g8xaokW8Xy7Gj5f6kSIbhPbwSuwHJz9fh4l
 8RqoGn13XjClFVL4iuciYLwGaQEfxCZMiz7tM1nRrQUV6+vJgfNFtWGfk+GzwfDmm9Yc Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjtxe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 15:38:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40D5110002A;
	Mon, 12 Sep 2022 15:38:45 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 036182309E8;
	Mon, 12 Sep 2022 15:38:45 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 15:38:44 +0200
Message-ID: <d80afc20-2745-24a2-ab70-a5a03439bd50@foss.st.com>
Date: Mon, 12 Sep 2022 15:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v6.1 #1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_09,2022-09-12_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v6.1.

Thanks
Alex

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v6.1-1

for you to fetch changes up to 04c26c5a2da8591fe7e37146592d907ef37492bd:

   ARM: dts: stm32: argon: remove spidev node (2022-09-12 15:19:12 +0200)

----------------------------------------------------------------
STM32 DT for v6.1, round 1

Highlights:
----------

- MPU:
   - General:
     - Add I2C support (5 instances) on STM32MP13.
     - Add SPI support (5 instabces) on STM32MP13.
     - Add timer interrupts support on STM32MP15.

   - ST boards:
     - Enable I2C1 and I2C5 on stm32mp135f-dk board.
     - Add SPI5 on stm32mp135f-dk board but disabled as only available on
       the GPIO expansion connector.

   - ARGON:
     - Remove spidev node as not used by the code.

----------------------------------------------------------------
Alain Volmat (4):
       ARM: dts: stm32: add i2c nodes into stm32mp131.dtsi
       ARM: dts: stm32: enable i2c1 and i2c5 on stm32mp135f-dk.dts
       ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
       ARM: dts: stm32: add pinctrl and disabled spi5 node in stm32mp135f-dk

Jagan Teki (1):
       ARM: dts: stm32: Fix typo in license text for Engicam boards

Patrice Chotard (1):
       ARM: dts: stm32: Create separate pinmux for qspi cs pin in 
stm32mp15-pinctrl.dtsi

Uwe Kleine-König (1):
       ARM: dts: stm32: Add timer interrupts on stm32mp15

Wolfram Sang (1):
       ARM: dts: stm32: argon: remove spidev node

  arch/arm/boot/dts/stm32mp13-pinctrl.dtsi           |  57 ++++++++
  arch/arm/boot/dts/stm32mp131.dtsi                  | 160 
+++++++++++++++++++++
  arch/arm/boot/dts/stm32mp135f-dk.dts               |  33 +++++
  arch/arm/boot/dts/stm32mp15-pinctrl.dtsi           |  50 ++++---
  arch/arm/boot/dts/stm32mp151.dtsi                  |  34 +++++
  .../stm32mp157a-icore-stm32mp1-ctouch2-of10.dts    |   2 +-
  .../dts/stm32mp157a-icore-stm32mp1-ctouch2.dts     |   2 +-
  .../dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts    |   2 +-
  arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi  |   2 +-
  ...m32mp157a-microgea-stm32mp1-microdev2.0-of7.dts |   2 +-
  .../stm32mp157a-microgea-stm32mp1-microdev2.0.dts  |   2 +-
  .../boot/dts/stm32mp157a-microgea-stm32mp1.dtsi    |   2 +-
  arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi   |   6 -
  arch/arm/boot/dts/stm32mp157c-ev1.dts              |  12 +-
  14 files changed, 334 insertions(+), 32 deletions(-)
