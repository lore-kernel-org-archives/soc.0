Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC2C433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16229C433B5; Sat, 19 Nov 2022 12:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1ABEC433C1;
	Sat, 19 Nov 2022 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862697;
	bh=br0Vs8kBL8jiNHUyWsCxdTYd/yteS5402j6EVGgSkN0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WULG1Spt8hGaS2N5r6yNDKDdUhqF0AZ+BHo7kj/VwerbZ50QgD7Z9fbYTKlud0o14
	 dzEbOhorxT9PH4xMw0v0g3O1qxDb8ZvKsdTEzIsBlOAWqfWprguq1kqaGVxNZhkqrF
	 DGOsZV2gQJoJMIrV99j+dJrHLfcAfA1xlp97FqGp7wBqX/QxulvfSQnGiKBjNkd8+M
	 lUFbMtPQe/9FZyFvcOWfR63JejVZiu8F+HjTCutx69uY1jqsafCAw26l4KGipugnVk
	 fnGYp3pvoJuxY39W1Ls/YJ3H+BMFrerWgAcnbzj4zhgvsRPt3z/3PPDiagl+JjVnX5
	 khVIbYtvEfbBA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX arm device tree update for 6.2
Date: Sat, 19 Nov 2022 20:57:31 +0800
Message-Id: <20221119125733.32719-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
References: <20221119125733.32719-1-shawnguo@kernel.org>

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.2

for you to fetch changes up to bd5880e109827f244636e9b8fba64fa0d41bf18d:

  ARM: dts: colibri-imx6ull: Enable dual-role switching (2022-11-19 09:04:09 +0800)

----------------------------------------------------------------
i.MX arm device tree update for 6.2:

- New device tree for Kobo Aura 2 E-Boot reader which is built on i.MX6SL
  SoC.
- Enable backlight and boost support for imx6sl-tolino-shine2hd.
- Enable CYTTSP5 touchscreen support for E60K02.
- Enable Silergy SY7636A EPD PMIC on imx7d-remarkable2 epaper tablet.
- Add watchdog property 'fsl,suspend-in-wait' for i.MX6UL Phytec Phycore
  SoM to avoid watchdog triggering in 'freeze' low power mode.
- Correct the polarity of AT86RF233 reset line for vf610-zii-dev-rev-c
  board.
- A bunch of Colibri device tree updates from Marcel Ziswiler and Philippe
  Schenker, correct USBH_PEN property, remove spurious debounce property,
  add USB dual-role switching, and some cosmetic change.
- Other small and random changes.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: dts: imx7d-remarkable2: Enable silergy,sy7636a

Andreas Kemnade (4):
      ARM: dts: imx: Add devicetree for Kobo Aura 2
      ARM: dts: imx6sl-tolino-shine2hd: Add backlight
      ARM: dts: imx6sl-tolino-shine2hd: Add backlight boost
      ARM: dts: imx: e60k02: Add touchscreen

Andrej Picej (1):
      ARM: dts: imx6ul/ull: suspend i.MX6UL watchdog in wait mode

Detlev Casanova (1):
      ARM: dts: imx6qdl-sabre: Add mmc aliases

Dmitry Torokhov (1):
      ARM: dts: vf610-zii-dev-rev-c: fix polarity of at86rf233 reset line

Krzysztof Kozlowski (1):
      ARM: dts: ls1021: correct indentation

Marcel Ziswiler (3):
      ARM: dts: colibri-imx6: move vbus-supply to module level device tree
      ARM: dts: colibri-imx6: specify usbh_pen gpio being active-low
      ARM: dts: imx7-colibri: remove spurious debounce property

Philippe Schenker (6):
      ARM: dts: colibri-imx6: usb dual-role switching
      ARM: dts: colibri-imx6ull: keep peripherals disabled
      ARM: dts: colibri-imx6ull: enable default peripherals
      ARM: dts: colibri-imx6ull: add -hog to gpio hogs
      ARM: dts: colibri-imx7: fix confusing naming
      ARM: dts: colibri-imx6ull: Enable dual-role switching

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/e60k02.dtsi                      |  11 +-
 arch/arm/boot/dts/imx6dl-colibri-aster.dts         |   1 -
 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts       |   1 -
 arch/arm/boot/dts/imx6dl-colibri-iris.dts          |   1 -
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |  22 +-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |   5 +
 arch/arm/boot/dts/imx6sl-kobo-aura2.dts            | 555 +++++++++++++++++++++
 arch/arm/boot/dts/imx6sl-tolino-shine2hd.dts       |  30 +-
 arch/arm/boot/dts/imx6sl-tolino-shine3.dts         |   7 +
 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts         |   7 +
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi   |   4 +
 arch/arm/boot/dts/imx6ull-colibri-aster.dts        |  40 ++
 arch/arm/boot/dts/imx6ull-colibri-eval-v3.dts      |  24 +
 arch/arm/boot/dts/imx6ull-colibri-iris-v2.dts      |  48 +-
 arch/arm/boot/dts/imx6ull-colibri-iris.dts         |  22 +-
 arch/arm/boot/dts/imx6ull-colibri-iris.dtsi        |   4 +-
 arch/arm/boot/dts/imx6ull-colibri-wifi-aster.dts   |  40 ++
 arch/arm/boot/dts/imx6ull-colibri-wifi-eval-v3.dts |  24 +
 arch/arm/boot/dts/imx6ull-colibri-wifi-iris-v2.dts |  32 +-
 arch/arm/boot/dts/imx6ull-colibri-wifi-iris.dts    |  20 +
 arch/arm/boot/dts/imx6ull-colibri.dtsi             |  37 +-
 arch/arm/boot/dts/imx7-colibri.dtsi                |   5 +-
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  62 +++
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts        |  10 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts          |   2 +-
 26 files changed, 983 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6sl-kobo-aura2.dts
