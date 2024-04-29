Return-Path: <SRS0=B5jS=MC=broadcom.com=florian.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B05C19F4F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 551B9C113CD; Mon, 29 Apr 2024 21:37:09 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED88EC4AF18;
	Mon, 29 Apr 2024 21:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED88EC4AF18
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B5CE7C0000E7;
	Mon, 29 Apr 2024 14:37:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B5CE7C0000E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714426625;
	bh=78VsP6qraeEQ4ttMWjXbErr3M7JVzQ2ezbZC8elUxrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mbx9KcdT5xZXPtNSEkqFFC5Ze0QhmoZrkiaEUqnHAs3cVAw8MlZQSVl1dwIKy/eIY
	 GOHPDcxCA8XoCScMjE+PocVrSN7xvBSraQe/bUTwABDJbxHzGhd/dEXjmwgXp9EVyU
	 3YxK8XC6A8Svjnhe/lepWHvk2nJXRGFDTLYBv808=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BA1FE18041CAC6;
	Mon, 29 Apr 2024 14:37:03 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tom Brautaset <tbrautaset@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree changes for 6.10
Date: Mon, 29 Apr 2024 14:37:01 -0700
Message-Id: <20240429213703.2327834-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
References: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/devicetree

for you to fetch changes up to a3592fae4d6674bf88834ad7fbba20678f20bdac:

  arm: dts: bcm2711: Describe Ethernet LEDs (2024-04-26 11:21:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 6.10, please pull the following:

- Laurent converts the Raspberry Pi firmware DT binding to YAML, updates
  the firmware driver to use the proper 'struct device' reference for
  DMA mappings and drops unneeded properties from the DT node and
  finishes by removing the duplicate firmware-clocks property to
  bcm2835-rpi.dtsi. He also added support for the CAM1 camera interface
  regulator.

- Uwe adds a pinctrl-based multiplexing description to allow the use of
  I2C0 pins to allow usage between the 40-pin Raspberry Pi header and
  the CSI and DSI connectors. He then describes the PCF85063 RTC device
  available on the CM4 I/O board making use of that pinctrl-based
  muxing.

- Arinc updates the Asus RT-AC3100 and RT-AC88U DTs to have proper LED
  colors and function properties, NVMEM MAC addresses and removes
  duplicates and unnecessary properties and does a few Device Tree
  cleanups.. He then adds support for the Asus RT-AC3200 (BCM4709-based)
  and RT-AC3500 routers.

- Jean-Michel adds DT nodes for the CSI Unicam camera interfaces on the
  Raspberry Pi 4 / BCM2711 SoCs

- Florian adds support for the Ethernet LEDs on Raspberry Pi 4 B and
  Raspberry Pi 4 CM boards.

----------------------------------------------------------------
Arınç ÜNAL (9):
      ARM: dts: BCM5301X: use color and function on ASUS RT-AC3100 and RT-AC88U
      ARM: dts: BCM5301X: provide address for SoC MACs on ASUS RT-AC3100 & AC88U
      ARM: dts: BCM5301X: remove duplicate compatible on ASUS RT-AC3100 & AC88U
      ARM: dts: BCM5301X: remove earlycon on ASUS RT-AC3100 and ASUS RT-AC88U
      dt-bindings: arm: bcm: add bindings for ASUS RT-AC3200
      dt-bindings: arm: bcm: add bindings for ASUS RT-AC5300
      ARM: dts: BCM5301X: Add DT for ASUS RT-AC3200
      ARM: dts: BCM5301X: Add DT for ASUS RT-AC5300
      ARM: dts: BCM5301X: Conform to DTS Coding Style on ASUS RT-AC3100 & AC88U

Florian Fainelli (1):
      arm: dts: bcm2711: Describe Ethernet LEDs

Jean-Michel Hautbois (1):
      ARM: dts: bcm2835: Add Unicam CSI nodes

Laurent Pinchart (5):
      dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add gpio child node
      firmware: raspberrypi: Use correct device for DMA mappings
      ARM: dts: bcm283x: Drop unneeded properties in the bcm2835-firmware node
      ARM: dts: bcm2835-rpi: Move duplicate firmware-clocks to bcm2835-rpi.dtsi
      ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator

Uwe Kleine-König (2):
      ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
      ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   2 +
 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  30 ++++
 .../bindings/gpio/raspberrypi,firmware-gpio.txt    |  30 ----
 arch/arm/boot/dts/broadcom/Makefile                |   2 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts     |  29 ++++
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts     |   1 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts  |  33 +++++
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |  34 ++++-
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |   8 ++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi |   7 -
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  23 ++-
 arch/arm/boot/dts/broadcom/bcm283x.dtsi            |  24 ++++
 .../boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 150 ++++++++++++++++++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dts  |  13 +-
 .../boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 133 +++++++++---------
 .../boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 156 +++++++++++++++++++++
 .../boot/dts/broadcom/bcm47094-asus-rt-ac88u.dts   |  65 +++++----
 drivers/firmware/raspberrypi.c                     |   7 +-
 18 files changed, 603 insertions(+), 144 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac3200.dts
 create mode 100644 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts
