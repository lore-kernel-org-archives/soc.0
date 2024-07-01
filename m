Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF5C30653
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 11:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54B93C4AF10; Mon,  1 Jul 2024 11:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A73DC116B1;
	Mon,  1 Jul 2024 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719833424;
	bh=+OWOpDrJZchPfmLK+I6MmT9xsjGXnDm/PgEQ5i8jc7g=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=nng7Ietv8746Qmyk72eF6HkQfwN868Cn+LOeGd0kofGmb1dcmN/o+kvc/ZdzQ0hpE
	 MmWEAGGTemyge+t/O5M6+0zCngJIZ2T0uv3fIcvIjPf5qLdV+AUCupt1BnCRLA0v7O
	 gP2zGelCxlD6fgIu+7PuJIVjULtjb1RXsX8OOGub3s/lSVZI6GHI28dy9RxST6Yo/B
	 7fcMQ6uFKdJtsylPzgT8cl/skkyQf7/9+di6Kx+xNM7RixDT7Ke76Z2vU5ABBZ/bnj
	 o4TRg53Qoug1INfKWRYsDfdj+oa1rljDzxF5AZlRHXwT25MJRzZCFp3tE2eiEExb8l
	 tLB6rvtF/JJBA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v13 0/8] Turris Omnia MCU driver
Date: Mon,  1 Jul 2024 13:30:02 +0200
Message-ID: <20240701113010.16447-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd et al.

this is v13 of the series adding Turris Omnia MCU driver.

Changes since v12:
- added blank lines between _DEF_GPIO macro definitions in patch 3,
  requested by Bart

Links to previous cover letters (v1 to v12):
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
  https://patchwork.kernel.org/project/linux-soc/cover/20240605161851.13911-1-kabel@kernel.org/
  https://patchwork.kernel.org/project/linux-soc/cover/20240617152606.26191-1-kabel@kernel.org/

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
 .../platform/cznic/turris-omnia-mcu-base.c    |  408 ++++++
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1095 +++++++++++++++++
 .../cznic/turris-omnia-mcu-sys-off-wakeup.c   |  260 ++++
 .../platform/cznic/turris-omnia-mcu-trng.c    |  103 ++
 .../cznic/turris-omnia-mcu-watchdog.c         |  130 ++
 drivers/platform/cznic/turris-omnia-mcu.h     |  194 +++
 include/linux/turris-omnia-mcu-interface.h    |  249 ++++
 15 files changed, 2735 insertions(+), 1 deletion(-)
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

