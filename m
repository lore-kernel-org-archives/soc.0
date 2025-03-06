Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0FD211476
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260958; cv=none; b=c1DSSNhsM5pSMzT8znB0ubBFYswMpeTrBRygZtc9T1x7N1RdLwboZZSUrExmSC7nzAFPNhWlBMoWJRpf847pmAnFpRPVFMEpg6yrsKcI0/i6bOTZ/PbbxkQUIBK05PGgFTr5aXxD4gucpmtpU/Ko5wIV/ZeMcXc4waCdMOoZwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260958; c=relaxed/simple;
	bh=rKDNbvpRbRo31mPlwFN0GzLQBxytG0a+UvjZcL3yDdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rom2ju8y2FETgZYR7n9BXzuTktgh7Ft5MtwRRRypymdPX8djudLSfcosiiim+h92K2DFRvc5iFq4wtfUf7YZTMsQ4LNwx+3z/gZpUG+cy0BOBDGEONS6v6jiYIecRLDNagtNjmI8Pvv7Difd5wFxmpNivurHnQjsW/KeqHEJUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tsa4/Nci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tsa4/Nci"
Received: by smtp.kernel.org (Postfix)
	id 81366C4CEE8; Thu,  6 Mar 2025 11:35:57 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60020C4CEE0;
	Thu,  6 Mar 2025 11:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60020C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741260948;
	bh=rKDNbvpRbRo31mPlwFN0GzLQBxytG0a+UvjZcL3yDdk=;
	h=From:To:Cc:Subject:Date:From;
	b=Tsa4/NcivS40dSdQreSG1Eb59F37D1Ghsbu5spIDUnDtPq71HjWmhuLiGRXx4otQh
	 HOVxk8WSUJrW/ewnhm3cyrwy7wyfWfUnnqLNJxlvDrQRfD5DLtJ8Kf2oc0SIyU58hh
	 ngSy2qJDsdJbRouSx5V7PIY6Wr1E+UyrGVF1ZihAl++XnLTmg82GcWUkg/IzfeV8HM
	 lQ2mGlUtz4QymdoJ089OyxdtYnIVsyalmEYrSH1uWtJIAVFZ48CYH2l5YTknaXCYnB
	 G1P8KUFW7abGtN9UrohvtdlOPjl2WE3Po4f1iSaRUZYcEWYtbMLjbI9Ou0IWQ/CkbW
	 QAWC+l3VEt9RA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD1C517E05E7;
	Thu,  6 Mar 2025 12:35:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
Date: Thu,  6 Mar 2025 12:34:52 +0100
Message-ID: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.15

for you to fetch changes up to 4c8ff61199a70e73e6c4d5e8a03f02d32730821c:

  arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel (2025-03-06 10:53:07 +0100)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.15

This adds new SoCs and new machines, other than improving support for
currently supported ones.

In particular, for SoCs:
 - Airoha EN7581 gets support for its SCU clock controller, SPI NAND,
   hardware RNG, pinctrl, and i2c controllers;
 - MediaTek MT8365 SoC gets support for all of its Display Controller
   components;
 - MediaTek Genio 510 MT8370 - a lower binned variant of Genio 700
   MT8390 (which, in turn, is the same as MT8188) - is introduced;
 - MT8188 gets support for more Display Controller components (DSC
   and MERGE), for the tertiary MSDC (eMMC/SD/SDIO) controller, and
   for the MTU3 USB DRD controllers;
 - MT8195 and MT8188 both get migrated to the new OF Graph used for
   defining a pipeline for the Display Controller components (as
   this was previously hardcoded per-board in the drm driver, ugh!);

..and for boards:
 - Google Kukui (MT8183) is switched to Elan touchscreen driver
   instead of hid-over-i2c to fix probe failures in some cases;
 - Google Cherry (MT8195) and Geralt (MT8188) Chromebooks get
   migrated to using OF Graph for defining their board specific
   part of the display pipeline;
 - MediaTek Genio 350 (mt8365) EVK board adds support for HDMI output
   through the iTE IT66121 chip, and for DSI output to the Startek
   KD070FHFID015 display;
 - MediaTek Genio 510 EVK board is introduced with a common devicetree
   between mt8390 and mt8370 (Genio 700 and Genio 510) EVKs;
 - MediaTek Genio 700 (and 510) EVKs get support for their integrated
   dual Digital Microphones, for their RichTek RT1715 USB Type-C
   Controller with USB-PD capability, the iTE IT5205 Alternate Mode
   Passive MUX (USB3.1/DP1.4), and for USB Gadget/Host switching
   through the MTU3 DRD Controller, other than for USB in general;
 - MediaTek Genio 1200 EVK gets support for its MediaTek MT6360 PMIC
   integrated Type-C Controller, and the IT5205 MUX;
 - Radxa NIO-12L gets its DSI display pipeline preconfigured and also
   the introduction of a devicetree overlay for the official Radxa
   8HD DSI panel, enabling display output over DSI.

And fixes/cleanups:
 - MT8173 gets fixes for bindings validation: PMIC node drops the
   unnecessary address/size cells, disp-pwm gets its compatibles
   list fixed (as mt6595 was not expected there), and some nodes
   got the right name (clock controllers were disguides as power
   controllers, and intpol was changed to interrupt-controller);
 - MT8188-based (MT8390) Genio boards get a fix for duplicated
   regulator name;
 - MT6359 PMIC gets fixes for audio-codec node validation.

----------------------------------------------------------------
Alexandre Mergnat (2):
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

AngeloGioacchino Del Regno (11):
      arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
      arm64: dts: mediatek: mt8188: Add tertiary eMMC/SD/SDIO controller
      dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
      arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe USB
      arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
      arm64: dts: mediatek: mt8188: Add base display controller graph
      arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
      arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins
      arm64: dts: mediatek: mt8195: Add base display controller graph
      arm64: mediatek: mt8195-cherry: Add graph for eDP and DP displays
      arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
      arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
      arm64: dts: mediatek: mt8173: Fix some node names

Christian Marangi (3):
      arm64: dts: airoha: en7581: Add Clock Controller node
      arm64: dts: airoha: en7581: Add SNAND node
      arm64: dts: airoha: en7581: Add default partition table for EVB board

Fabien Parent (1):
      arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port

Hsin-Te Yuan (1):
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver

Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel

Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add more nodes to EN7581 SoC evaluation board
      arm64: dts: airoha: en7581: Fix clock-controller address

Louis-Alexis Eyraud (5):
      dt-bindings: arm: mediatek: add mt8370-evk board
      arm64: dts: mediatek: add support for MT8370 SoC
      arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
      arm64: dts: mediatek: add device-tree for Genio 510 EVK board
      arm64: dts: mediatek: mt8390-genio-common: Fix duplicated regulator name

Macpaul Lin (2):
      arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec
      dt-bindings: usb: mtu3: Add ports property

Nícolas F. R. A. Prado (3):
      arm64: dts: mediatek: mt8188: Assign apll1 clock as parent to avoid hang
      arm64: dts: mediatek: mt8390-genio-common: Add routes for DMIC
      arm64: dts: mediatek: mt8390-genio-common: Add delay codec for DMIC

 Documentation/devicetree/bindings/arm/mediatek.yaml               |    5 +
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml      |    4 +
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml          |   12 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                         |   44 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi                            |   91 ++++++
 arch/arm64/boot/dts/mediatek/Makefile                             |    3 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                          |    3 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                      |    2 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                          |   12 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts        |    9 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                   |  173 +++++++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                          |  307 +++++++++++++++---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                   |  184 ++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                          |  129 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                       |  245 +++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                          |  336 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts             |   19 ++
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                          |   64 ++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts             | 1033 +----------------------------------------------------------
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi             | 1223 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts            |  102 ++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso |   84 +++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts             |   71 +++++
 26 files changed, 3051 insertions(+), 1128 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
