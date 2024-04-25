Return-Path: <SRS0=obtq=L6=foss.st.com=prvs=4845d8dc0a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE25BC10F15
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 13:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72083C3277B; Thu, 25 Apr 2024 13:00:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A046EC113CC;
	Thu, 25 Apr 2024 12:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A046EC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P7WlCc014451;
	Thu, 25 Apr 2024 14:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:from:subject:to:cc:content-type
	:content-transfer-encoding; s=selector1; bh=iFI/pPGANMxm89JA+f5R
	co9tjdWs0GoSvGzII5jlimI=; b=KN4IpWTP1yWRAMc7kHLdP/FNsDwA9nOrO+4A
	BnH0QftfsLpUfJQVHDg83ZCS/Ul05P2AU7TgQdT2TpnJgMExqt9W+uWf2sKNVpr8
	Bct8mWDHxiyyPmYfoFGMDDI9cAFCvYYTZRCWmlIQSdOdR2dJLCttP61PkrqjNHjp
	qDFrPvEGdlh2J5jRvKrPMJ6C/g1klOvPSYCfODpyAfmyzi8aJHxUaiiYxjtueSei
	W5CxMbwHo8mrhtlg9vH0LLeVoCLuhcL5OUzm8/yvNqYMHcKWhAnQREHAv1mqjW8M
	hr5D2tIcmaXNP2ChKeSYYGRqfkysmcBea5Y363xjKFQneeo8Iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4kbde2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 14:59:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD6264002D;
	Thu, 25 Apr 2024 14:59:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0B2321ED2E;
	Thu, 25 Apr 2024 14:59:17 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 14:59:17 +0200
Message-ID: <7dc64226-5429-4ab7-a8c8-6053b12e3cf5@foss.st.com>
Date: Thu, 25 Apr 2024 14:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 Bus firewall for v6.10
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC: <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien CHEVALLIER
	<gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_13,2024-04-25_01,2023-05-22_02

Hi Arnd,

Please consider the first round of STM32 firewall bus patch-set. DT part 
for all MPU SoC will come with teh STM32 DT pull request.

Note that conflict merge have been seen on linux-next for this patch:
"of: property: fw_devlink: Add support for "access-controller"

Regards
Alex


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-bus-firewall-for-v6.10-1

for you to fetch changes up to e4500d7525f9223a0a46431caa6d0f2d165f05ce:

   bus: stm32_firewall: fix off by one in stm32_firewall_get_firewall() 
(2024-04-25 14:44:39 +0200)

----------------------------------------------------------------
STM32 Firewall bus for v6.10, round 1

Highlights:
---------

Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
register to the framework to offer firewall services such as access
granting.

This series of patches is a new approach on the previous STM32 system
bus, history is available here:
https://lore.kernel.org/lkml/20230127164040.1047583/

The need for such framework arises from the fact that there are now
multiple hardware firewalls implemented across multiple products.
Drivers are shared between different products, using the same code.
When it comes to firewalls, the purpose mostly stays the same: Protect
hardware resources. But the implementation differs, and there are
multiple types of firewalls: peripheral, memory, ...

Some hardware firewall controllers such as the RIFSC implemented on
STM32MP2x platforms may require to take ownership of a resource before
being able to use it, hence the requirement for firewall services to
take/release the ownership of such resources.

On the other hand, hardware firewall configurations are becoming
more and more complex. These mecanisms prevent platform crashes
or other firewall-related incoveniences by denying access to some
resources.

The stm32 firewall framework offers an API that is defined in
firewall controllers drivers to best fit the specificity of each
firewall.

For every peripherals protected by either the ETZPC or the RIFSC, the
firewall framework checks the firewall controlelr registers to see if
the peripheral's access is granted to the Linux kernel. If not, the
peripheral is configured as secure, the node is marked populated,
so that the driver is not probed for that device.

The firewall framework relies on the access-controller device tree
binding. It is used by peripherals to reference a domain access
controller. In this case a firewall controller. The bus uses the ID
referenced by the access-controller property to know where to look
in the firewall to get the security configuration for the peripheral.
This allows a device tree description rather than a hardcoded peripheral
table in the bus driver.

The STM32 ETZPC device is responsible for filtering accesses based on
security level, or co-processor isolation for any resource connected
to it.

The RIFSC is responsible for filtering accesses based on Compartment
ID / security level / privilege level for any resource connected to
it.

----------------------------------------------------------------
Dan Carpenter (1):
       bus: stm32_firewall: fix off by one in stm32_firewall_get_firewall()

Gatien Chevallier (7):
       dt-bindings: treewide: add access-controllers description
       dt-bindings: bus: document RIFSC
       dt-bindings: bus: document ETZPC
       firewall: introduce stm32_firewall framework
       of: property: fw_devlink: Add support for "access-controller"
       bus: rifsc: introduce RIFSC firewall controller driver
       bus: etzpc: introduce ETZPC firewall controller driver

Oleksii Moisieiev (1):
       dt-bindings: document generic access controllers

 
Documentation/devicetree/bindings/access-controllers/access-controllers.yaml 
|  84 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml 
       |  96 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml 
       | 105 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml 
       |   4 +++
  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml 
       |   4 +++
  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml 
       |   4 +++
  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml 
       |   4 +++
  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml 
       |   4 +++
  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml 
       |   4 +++
  Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml 
       |   4 +++
  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml 
       |   4 +++
  Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml 
       |   4 +++
  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml 
       |   4 +++
 
Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml 
  |   4 +++
  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml 
       |   4 +++
  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml 
       |   4 +++
  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml 
       |   4 +++
  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml 
       |   4 +++
  Documentation/devicetree/bindings/net/stm32-dwmac.yaml 
       |   4 +++
  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml 
       |   4 +++
  Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml 
       |   4 +++
  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml 
       |   4 +++
  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml 
       |   4 +++
  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml 
       |   4 +++
  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml 
       |   4 +++
  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml 
       |   4 +++
  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml 
       |   4 +++
  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml 
       |   4 +++
  Documentation/devicetree/bindings/usb/dwc2.yaml 
       |   4 +++
  MAINTAINERS 
       |   7 +++++
  arch/arm/mach-stm32/Kconfig 
       |   1 +
  arch/arm64/Kconfig.platforms 
       |   1 +
  drivers/bus/Kconfig 
       |  10 +++++++
  drivers/bus/Makefile 
       |   1 +
  drivers/bus/stm32_etzpc.c 
       | 141 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/bus/stm32_firewall.c 
       | 294 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/bus/stm32_firewall.h 
       |  83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/bus/stm32_rifsc.c 
       | 252 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/of/property.c 
       |   2 ++
  include/linux/bus/stm32_firewall_device.h 
       | 142 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  40 files changed, 1323 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
  create mode 100644 
Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
  create mode 100644 
Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
  create mode 100644 drivers/bus/stm32_etzpc.c
  create mode 100644 drivers/bus/stm32_firewall.c
  create mode 100644 drivers/bus/stm32_firewall.h
  create mode 100644 drivers/bus/stm32_rifsc.c
  create mode 100644 include/linux/bus/stm32_firewall_device.h
