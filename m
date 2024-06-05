Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54A9C25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 16:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 819F8C4AF0B; Wed,  5 Jun 2024 16:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0872C2BD11;
	Wed,  5 Jun 2024 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717604340;
	bh=d9PcXS9wR/nOoRRiAvG4FkxSp+KRRqjONneR9KkC3gY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=UnfPkxKL5Zr114qlcR5Qchkr1sVs3mTtZA1h+LiiqqglR+r5G67w3jb813oqy1PMj
	 PZC9FxMypkWYFe85OrGvVRfF7Tsz1NKf3JDdYzF6bg01Gm22gdJGDpLauEaUaXqkD0
	 WUruC42a12kVefgrUZmqyzfFsSHFOSRQLj22KsSl2QKTrpGQ/vvLPNoUeFx7Jruwqx
	 IpytmlCwOQ20wHNIVEZpooEGd5c2BtX1XqOtSd3ptBO5H/IeaLT09xOnEbWljz77ca
	 TTKBiD5AOl4DWmH7hbExhmhgjOMuqd3Ng1mL9Lvh5rkcCgkD41LNnTBluEI0j63q9P
	 xlsq43aWf1o/g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v11 0/8] Turris Omnia MCU driver
Date: Wed,  5 Jun 2024 18:18:43 +0200
Message-ID: <20240605161851.13911-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,

this is v11 of the series adding Turris Omnia MCU driver.

Changes since v10:
- dropped patch 7 from v10 ("Add support for digital message signing via
  debugfs"). This must be done via different kernel API (should be
  doable via keyctl), but this requires more work which I currently
  don't have, unfortunately
- in patch 3 where I introduce support for MCU connected GPIOs
  changed u32 types to unsigned long where it made sense, in order
  to be able to use __assign_bit(), __set_bit(), test_bit().
  This was suggested by Andy.
- in patch 3 deduplicated code in omnia_gpio_get_multiple()
- moved the "fixing" in patch 3 of functions introduced in patch 2
  to patch 2, this was a rebasing error in v10
- changed date to September 2024 and KernelVersion to 6.11 in
  Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu

Links to previous cover letters (v1 to v10):
  https://patchwork.kernel.org/project/linux-soc/cover/20230823161012.6986-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20230919103815.16818-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231023143130.11602-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20231026161803.16750-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240323164359.21642-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240418121116.22184-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240424173809.7214-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240430115111.3453-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240508103118.23345-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240510101819.13551-1-kabel@kernel.org/

Marek Behún (8):
  dt-bindings: firmware: add cznic,turris-omnia-mcu binding
  platform: cznic: Add preliminary support for Turris Omnia MCU
  platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
  platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
  platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
  platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
  ARM: dts: turris-omnia: Add MCU system-controller node
  ARM: dts: turris-omnia: Add GPIO key node for front button

 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  113 ++
 .../firmware/cznic,turris-omnia-mcu.yaml      |   86 ++
 MAINTAINERS                                   |    4 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   35 +-
 drivers/platform/Kconfig                      |    2 +
 drivers/platform/Makefile                     |    1 +
 drivers/platform/cznic/Kconfig                |   48 +
 drivers/platform/cznic/Makefile               |    8 +
 .../platform/cznic/turris-omnia-mcu-base.c    |  407 +++++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1071 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  257 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  103 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  128 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  194 +++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 15 files changed, 2705 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
 create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
 create mode 100644 drivers/platform/cznic/Kconfig
 create mode 100644 drivers/platform/cznic/Makefile
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-base.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-trng.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu.h
 create mode 100644 include/linux/turris-omnia-mcu-interface.h

-- 
2.44.2

