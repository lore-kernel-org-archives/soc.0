Return-Path: <nsaenz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8097C433C1
	for <soc@archiver.kernel.org>; Mon, 22 Mar 2021 17:42:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB43C6199F; Mon, 22 Mar 2021 17:42:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB19C61994;
	Mon, 22 Mar 2021 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616434955;
	bh=FnX0Z1CHdnjFaEH5KqqvBazlu1hFYW32+/NY1ezz+GE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=i++MPjQ9A+nLVpfJF/El6wF9eXDiJajXZkUxgnQm+10JHlbRR1KztvjfRXuTrXMj8
	 W+vDnaHbWwfQWQi5eMLRd7onONrxb9sjT5ffM33+8WRgJKhpDZ2TjBy2xF4kxckRh6
	 GQqT5Gul//2U/58EBQGVOtUYCuOYGjioUcjUqZ3y3vp+wAA2LE4ASrwXIcg5WAKfx3
	 CAbSe2wKsjyw129hE/Hjq6UDrfcSsm0D0457luU66wLhRdAoICdQUmHRElZjRE9iMT
	 f8O0fscz5s/3Xw1QmzQKKBr7aBP0FSVNHVuMJxxKVmy2cP/iMH4qiG/SZjDcTAkRmn
	 aHqUQ6Fp0TkPA==
From: Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	u.kleine-koenig@pengutronix.de,
	f.fainelli@gmail.com,
	sboyd@kernel.org,
	bgolaszewski@baylibre.com,
	gregkh@linuxfoundation.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	thierry.reding@gmail.com
Subject: [GIT PULL] Raspberry Pi driver updates for v5.13
Date: Mon, 22 Mar 2021 18:42:32 +0100
Message-Id: <20210322174232.29549-1-nsaenz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git tags/rpi-poe-v5.13

for you to fetch changes up to 79caa362eab6569297210eda375d6ea358a81161:

  pwm: Add Raspberry Pi Firmware based PWM bus (2021-03-22 17:59:52 +0100)

----------------------------------------------------------------
Raspberry Pi driver updates for v5.13:
  - Fix-up all RPi firmware drivers so as for unbind to happen in an
    orderly fashion
  - Support for RPi's PoE hat PWM bus

----------------------------------------------------------------
Nicolas Saenz Julienne (10):
      firmware: raspberrypi: Keep count of all consumers
      firmware: raspberrypi: Introduce devm_rpi_firmware_get()
      clk: bcm: rpi: Release firmware handle on unbind
      gpio: raspberrypi-exp: Release firmware handle on unbind
      reset: raspberrypi: Release firmware handle on unbind
      soc: bcm: raspberrypi-power: Release firmware handle on unbind
      staging: vchiq: Release firmware handle on unbind
      input: raspberrypi-ts: Release firmware handle when not needed
      dt-bindings: pwm: Add binding for RPi firmware PWM bus
      pwm: Add Raspberry Pi Firmware based PWM bus

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++
 drivers/clk/bcm/clk-raspberrypi.c                  |   2 +-
 drivers/firmware/raspberrypi.c                     |  69 ++++++-
 drivers/gpio/gpio-raspberrypi-exp.c                |   2 +-
 drivers/input/touchscreen/raspberrypi-ts.c         |   2 +-
 drivers/pwm/Kconfig                                |   9 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-raspberrypi-poe.c                  | 206 +++++++++++++++++++++
 drivers/reset/reset-raspberrypi.c                  |   2 +-
 drivers/soc/bcm/raspberrypi-power.c                |   2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |   2 +-
 .../dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h |  13 ++
 include/soc/bcm2835/raspberrypi-firmware.h         |  10 +
 13 files changed, 331 insertions(+), 9 deletions(-)
 create mode 100644 drivers/pwm/pwm-raspberrypi-poe.c
 create mode 100644 include/dt-bindings/pwm/raspberrypi,firmware-poe-pwm.h
