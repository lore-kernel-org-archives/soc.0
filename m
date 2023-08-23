Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136A1EE49A0
	for <soc@archiver.kernel.org>; Wed, 23 Aug 2023 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD095C433C7; Wed, 23 Aug 2023 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66666C433C8;
	Wed, 23 Aug 2023 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807016;
	bh=xq73xdRnCcL0bnQPwVu9tQIeHuXpmZ7FdGKm2MiXfj0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=H6qtqiCSdkAd6+wLsmgT1Izh81F6nemSOdLM+EQgX/fmNza33eX7pzto2USvj7DdC
	 sNGWA1Hjp1IlHVJPQpO99Nm73CxJoKfRhCO2KjMZIwS51x0ZBa37owi9ctCRY1uWoU
	 U4LYYkRAOKeka0lM9xXiS4TGmpZUYDLHkkhlJ7bFWWnnuhTGSHjq3WUqCpiyElZmho
	 nweHiYytO3iF4ocGYC/79FoQ/feogzzcK5bLPo0cAVqWYw+aMAET3gw2nlFSfDTMml
	 NWwgjqsr6s7LA5NQyPlngKZWzmd4ie1etvq7hKg+tfBwiP1G4ii5yyr5w7SO4c92fQ
	 mnyAiysNzuvYQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/4] Turris Omnia MCU driver
Date: Wed, 23 Aug 2023 18:10:08 +0200
Message-ID: <20230823161012.6986-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd, Gregory,

this series adds support for the MCU provided features on Turris Omnia:
- board poweroff and wakeup (via rtcwake),
- MCU watchdog,
- GPIOs and interrupts.

The first two parts are simple enough.

The GPIOs and interrupts part is a little bit more complicated because
boards with newer MCU firmware support new interrupt reading API, but
I wanted to also add support for older MCU firmwares, for users who do
not use our system and won't get automatic upgrade to newer version.

There are 4 patches:
- 1st adds device-tree binding,
- 2nd adds the driver proper,
- 3rd and 4th add nodes to Omnia's device tree.

The driver is added to the drivers/platform/cznic directory.

Gregory, could you give ack/review for the device-tree patches so that
they can be merged with the series if everything else is ok?

Marek

Marek Behún (4):
  dt-bindings: arm: add cznic,turris-omnia-mcu binding
  platform/cznic: Add support for Turris Omnia MCU
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  77 ++
 .../bindings/arm/cznic,turris-omnia-mcu.yaml  |  72 ++
 MAINTAINERS                                   |   4 +
 .../dts/marvell/armada-385-turris-omnia.dts   |  37 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/cznic/Kconfig                |  48 +
 drivers/platform/cznic/Makefile               |   7 +
 .../platform/cznic/turris-omnia-mcu-base.c    | 275 +++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 967 ++++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 245 +++++
 .../cznic/turris-omnia-mcu-watchdog.c         | 126 +++
 drivers/platform/cznic/turris-omnia-mcu.h     | 161 +++
 include/linux/turris-omnia-mcu-interface.h    | 194 ++++
 14 files changed, 2215 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

-- 
2.41.0

