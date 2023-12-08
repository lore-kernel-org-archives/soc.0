Return-Path: <SRS0=1HNv=HT=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E9BC4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 12:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E424FC433CB; Fri,  8 Dec 2023 12:18:38 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9B03C433C8;
	Fri,  8 Dec 2023 12:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9B03C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4660C604F7;
	Fri,  8 Dec 2023 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037916;
	bh=h07OVGQlyvpAqQQ6mlTbyIVIFAeP4bhm65lgRvuUX2w=;
	h=From:To:Cc:Subject:Date:From;
	b=DrXiJ53VKbWthyMVBSjpJoyKkg5f6eBmcZA64RGxFFWAmIvmg3HOZLvfw6H4I2alg
	 cW4npmVD6/c5v16zR5TRUKmc51Hw4buUSUXgbiHQisUAmFMLkb5yaom4Wlpj8RthYR
	 m7P/ZYO2KM2ut9x1Jsa9Expdeee9F1PQI6dL8U5BBDFMlB/EwCksErXP1WthGbTWK1
	 /U4gISYO6KxWpVFt8igYL6CePMKGStkkXIzOSDq1ZQoAHSyT9e4pQYaTfD70QSWE9v
	 szO48M6DBU8b1PmKCuMAgrw3P26IvsLmMJSV84FK/cb2WFXUTw3u7Ea2rsF0WfPq1n
	 j8bC36/9GuOwQ==
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Devicetree changes for omaps for v6.8
Date: Fri,  8 Dec 2023 14:18:17 +0200
Message-ID: <pull-1702037869-295608@atomide.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.8/dt-signed

for you to fetch changes up to 10dfde4bec529aa1d78e4b3acce7882a312880b7:

  ARM: dts: omap4-embt2ws: Add Bluetooth (2023-12-01 08:24:55 +0200)

----------------------------------------------------------------
Devicetree changes for omaps

- A series of patches to reorganize Motorola Mapphone related files to add
  support for tablets as the peripherals are different compared to the
  phones

- Apply am57xx-idk overlays to base dtbs

- Extcon update to use id-gpios and vbus-gpios

- Update omap4-epson-embt2ws to enable wlan clock and bluetooth-gnss

- Update for logicpd-torpedo to use bluetooth-gnss node name

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: ti/omap: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties

Andreas Kemnade (3):
      ARM: dts: omap4-embt2ws: enable 32K clock on WLAN
      ARM: dts: omap: logicpd-torpedo: do not disguise GNSS device
      ARM: dts: omap4-embt2ws: Add Bluetooth

Rob Herring (1):
      arm: dts: omap: Apply am57xx-idk overlays to base dtbs

Tony Lindgren (4):
      dt-bindings: omap: Add Motorola mapphone mz609 and mz617 tablets
      ARM: dts: motorola-mapphone: Move LCD to common file for xt875 and xt894
      ARM: dts: motorola-mapphone: Move handset devices to a common file
      ARM: dts: motorola-mapphone: Add basic support for mz609 and mz617

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   2 +
 arch/arm/boot/dts/ti/omap/Makefile                 |  14 +-
 arch/arm/boot/dts/ti/omap/am571x-idk.dts           |   4 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi   |   4 +-
 arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi     |   4 +-
 arch/arm/boot/dts/ti/omap/dra71-evm.dts            |   4 +-
 arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi    |   4 +-
 arch/arm/boot/dts/ti/omap/dra76-evm.dts            |   4 +-
 .../dts/ti/omap/logicpd-torpedo-37xx-devkit.dts    |   2 +-
 .../boot/dts/ti/omap/motorola-mapphone-common.dtsi | 298 ---------------------
 .../dts/ti/omap/motorola-mapphone-handset.dtsi     | 234 ++++++++++++++++
 .../dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi |  21 ++
 .../boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi  |  75 ++++++
 .../boot/dts/ti/omap/omap4-droid-bionic-xt875.dts  |  11 +-
 arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts   |  19 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  |  18 +-
 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts  |  46 ++++
 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts  |  17 ++
 19 files changed, 459 insertions(+), 324 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-mz607-mz617.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dts
