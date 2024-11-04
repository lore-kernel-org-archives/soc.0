Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069D1AF0A6
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719601; cv=none; b=Xifrwoz5/orCuMKScd0A5zhmyDiFCzUTi/Sg3g5YdxgpUrgTRmriAKs7w934JvFFrvr6VOaFm6tE0bCTK8i7Fh942GqZjNrof4KC6ZZabt5X8A/dd4QnkBWraux4gdNy1avq1Bwc80FeGczVeKs2SSK2H5boDmRWCb+MRuZ+Q/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719601; c=relaxed/simple;
	bh=2M6vBjVHF1WnquR+ikjsHwhWCf3RjSuDSCRA4FhNpk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pgfljHIxd/URuTqK8J4gVO6ytrOO9MuajAZ5Mkbr5rUnGtw9Fj68uqW+RQmsbbbUq5sEP/+9+u8B63kT6VuIdniq7NaK56027A1p5rcAnCwviHZefTuZdxuWC8EhFuT/WabBl3Auh3tsJKoZ3GG9PGIYz3uHCM+ebGN5ZQv1gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xzuyz0ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xzuyz0ok"
Received: by smtp.kernel.org (Postfix)
	id 836B8C4CED5; Mon,  4 Nov 2024 11:26:41 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95B75C4CECE;
	Mon,  4 Nov 2024 11:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95B75C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730719597;
	bh=2M6vBjVHF1WnquR+ikjsHwhWCf3RjSuDSCRA4FhNpk0=;
	h=From:To:Cc:Subject:Date:From;
	b=Xzuyz0okuPMXLeP1nDovbTYi7o5v3zTuSmEj/UvzPY19Vt8+X3NCrLnvCFA2OA3ue
	 ACKJJzP+tNhhUbN/hs99iRYe5gc69APykvdgtVP2+hpW30utjvO1bGpxrY/2CTxDXx
	 1feX7i/eqEN7weVvXSiP/Ybdvc9NBD3XA7Jkoyjrt34HH1+5RlxOLfEdXGwpTSbLA1
	 GGgbJwifJJ7oRYa/qXL6c8mNUP3Be3wV37RDjY1pbkiD76WeVc/eoPfTpgu1bxsMCA
	 F9OCFdL8SAsmq2q/r5gZ8YLy3eB4A9ges1p5QLJsYlOF27objh8Ib+7zOgpfbpG8tJ
	 3ugmynkmtEL7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C41C17E35FC;
	Mon,  4 Nov 2024 12:26:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
Date: Mon,  4 Nov 2024 12:26:20 +0100
Message-ID: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.13

for you to fetch changes up to 436142058e5dec67df71c0a4b159338bdda24b6b:

  arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators (2024-11-04 11:12:35 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.13

MT8195 (also called MT8395)
 - Enabled GPU support on Genio 1200 EVK
 - Added sound-dai-cells for audio codec on MT8195 Cherry Chromebooks

MT8192:
 - Added support Asurada Chromebook variants with Synaptics trackpad

MT8188 (also called MT8390):
 - Added support for CPU DVFS, IOMMU, PWM hardware, SPMI bus,
   Audio, socinfo, PCI-Express, DisplayPort, MIPI DSI, Ethernet,
   Video HW Encoders (Stateful) and HW Decoders (Stateless),
   JPEG HW Encoder/Decoder.
 - Enabled GPU support on Genio 700 EVK

MT8183:
 - Added support for Video HW Encoders (Stateful)
 - Added HDMI support on MT8183 Pumpkin board
 - Fixed some regulators to provide the actual description of the
   power rails in MT8183 Kukui Chromebooks
 - Disabled DPI display interface on MT8183 Kukui Chromebooks
   to fix internal display probing
 - Fixed address of EEPROM found on MT8183 Kakadu/Kodama Chromebooks
 - Added SCL internal delay on I2C2 bus for improved I2C-HID devices
   reliability on MT8183 Jacuzzi Chromebooks

MT7988:
 - Added support for eFuses and UART controllers

Plus, addition of OF Graph support in MediaTek MMSYS and some cleanups
and dtbs_check fixes for MT8195 and for all machines using the MT6358
PMIC.

----------------------------------------------------------------
Alper Nebi Yasak (1):
      arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface

AngeloGioacchino Del Regno (1):
      dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path

Chen-Yu Tsai (7):
      arm64: dts: mediatek: mt8186-corsola-voltorb: Merge speaker codec nodes
      arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
      arm64: dts: mediatek: mt8186-corsola: Fix GPU supply coupling max-spread
      arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset line polarity
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
      arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators

Daolong Zhu (4):
      arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

Fabien Parent (1):
      arm64: dts: mediatek: mt8183-pumpkin: add HDMI support

Fei Shao (21):
      arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
      arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
      arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
      arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
      arm64: dts: mediatek: mt8188: Add CPU performance controller for CPUFreq
      arm64: dts: mediatek: mt8188: Add SMI/LARB/IOMMU support
      arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
      arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
      arm64: dts: mediatek: mt8188: Add audio support
      arm64: dts: mediatek: mt8188: Add socinfo nodes
      arm64: dts: mediatek: mt8188: Assign GCE aliases
      arm64: dts: mediatek: mt8188: Add PCIe nodes
      arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
      arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
      arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
      arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
      arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
      arm64: dts: mediatek: mt8188: Add DP-INTF nodes
      arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
      arm64: dts: mediatek: mt8188: Fix USB3 PHY port default status
      arm64: dts: mediatek: mt8195-cherry: Use correct audio codec DAI

Hsin-Te Yuan (3):
      arm64: dts: mt8183: Add encoder node
      arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
      arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4

Macpaul Lin (7):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Fix dtbs_check error for phy
      arm64: dts: mt8195: Fix dtbs_check error for mutex node
      arm64: dts: mt8195: Fix dtbs_check error for infracfg_ao node
      arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
      arm64: dts: mediatek: mt8390-genio-700-evk: update regulator names
      arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB
      arm64: dts: mediatek: mt6358: fix dtbs_check error

Nícolas F. R. A. Prado (2):
      arm64: dts: mediatek: mt8188: Add ethernet node
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet

Pablo Sun (3):
      arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power domain
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU
      arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU

Pin-yen Lin (2):
      arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support
      arm64: dts: mt8183: Add port node to dpi node

Rafał Miłecki (2):
      arm64: dts: mediatek: mt7988: add UART controllers
      arm64: dts: mediatek: mt7988: add efuse block

max_weng (1):
      arm64: dts: mediatek: mt8186: add FHCTL node

 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml |   28 ++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi                           |    4 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                          |   42 ++++-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi                  |    8 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts       |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts        |    2 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts         |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi      |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi             |   30 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi              |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts          |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts          |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi              |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi               |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |   30 +---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                    |  123 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                           |   21 +++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi           |   21 +--
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                   |   14 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                           |    7 +
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts                        |    2 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                           | 1124 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts        |   11 ++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                   |    4 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                    |    6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                           |    4 +-
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts              |  192 +++++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts             |   21 ++-
 28 files changed, 1586 insertions(+), 133 deletions(-)

