Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B2FA374A
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 12:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B0DFC4CEC7; Fri, 13 Sep 2024 12:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DB9C4CED4;
	Fri, 13 Sep 2024 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230669;
	bh=9zbXLs01rJN0ObAMBm52pWCMloxHSGISDzqIEVGl3o4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=aLo5XgDR0oiFrLoC5NDgki1hsAHhvzoWoGCxrAgPehMKkGEpSahDcwiy08PzK5kXa
	 fYez0ivrsFSWXX5HPFIgDpc0UCKl/8WQowSpiTNY2FwinGO+TeNOm0qgjzlsXng1b1
	 2F6wrDFief7HfVbSL1VxwajYRXiATxnHv/lCJm0ueXALmKHPMjLep2xL7+e491FIcO
	 m4XO7I7qyDixmz1eq8xWCmQ+8iaqC9tAD/WL20C8xHX9eV3FRJh8jGOk8UsihWhM5B
	 0lUKBe7bmBEHb9Z6z0RaLXB1+eQ+drfVb4C+D9lUooxTzOmIVzhsxfW0oW/tCTzsXo
	 u8CIUcf41RBUw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 00/11] Turris Omnia LED driver changes
Date: Fri, 13 Sep 2024 14:30:52 +0200
Message-ID: <20240913123103.21226-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Lee,

this is v3 of Turris Omnia LED driver changes.
v1 and v2 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
  https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/

This series is for 6.12 (alternatively 6.13), but it depends on changes
that have been merged to 6.11-rc3. Your for-leds-next branch is based on
6.11-rc1, so it won't apply there.

Changes since v2:
- added interrupts property description to device-tree binding to fix
  the device-tree binding check reported by Rob's bot (new patch 05/11
  in this series)
- dropped the patch that converted to 100 column wrapping, as suggested
  by Arnd
- took Andy's suggestions into the patch that converts to
  dev_err_probe()

Marek

Marek Behún (11):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  leds: turris-omnia: Use dev_err_probe() where appropriate
  leds: turris-omnia: Use uppercase first letter in all comments
  ARM: dts: turris-omnia: Add global LED brightness change interrupt

 .../leds/cznic,turris-omnia-leds.yaml         |   8 +
 .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
 drivers/leds/leds-turris-omnia.c              | 262 +++++++-----------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 ---------
 include/linux/turris-omnia-mcu-interface.h    | 148 +++++++++-
 6 files changed, 258 insertions(+), 294 deletions(-)

-- 
2.44.2

