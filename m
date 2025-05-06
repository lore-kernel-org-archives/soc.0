Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A726AAA3
	for <soc@lists.linux.dev>; Tue,  6 May 2025 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523079; cv=none; b=tFjE3HSkIo3dItoCmd7TLu1CcptKs76UALFU8iawPnvAMhudQ8NzJo3LsdgU3XgthpPOv6BrjWlePwbAdeb8YORQ6pZSF6Qh9uYJgqb5+KuH/9G2sLpsTeZJj//e6XNnjHChjIHrbtecHAbQyERfeo+9rfYIkI4qHTISRn9cEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523079; c=relaxed/simple;
	bh=g9uR/nQOA/ZuUqaNkBigHW5Nr4WkTOkDR5cVAA5mdbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MBNfcTxS7Y57Eu3+zcXvZfIOFnFpZYEdJsoyjhuTGPhUgji4OQYWWJtQt/Y3I2ZPsrLq/C427HWu5NvW2kPHlUymEtWJCoSFbda5r4yL03yySRh5hKbfyQrBjHYRFCudgsf02EvkJj8t9DMSSFDfrrad/o4PoUhU6ldAVskJ0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H0rErT+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H0rErT+h"
Received: by smtp.kernel.org (Postfix)
	id DB223C4CEED; Tue,  6 May 2025 09:17:58 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B2E0C4CEE4;
	Tue,  6 May 2025 09:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B2E0C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746523073;
	bh=g9uR/nQOA/ZuUqaNkBigHW5Nr4WkTOkDR5cVAA5mdbE=;
	h=From:To:Cc:Subject:Date:From;
	b=H0rErT+hcov7ZEzilF34pRRwyK+ygGlosnSPFx5bFFBDzqmay9ST/J7lmdEJxRmZd
	 d1IBRHaqH5IkDwYkkudTWimpLzAfNzPPWIso3NGGstRdT4dvBXQHN8xZ9h4x0w8e6q
	 SSDSzquAD3KPPGzSeGbCdEx21R/lVDUSUFdBGEcrrk4RiHLQhxhWFrMz9nk2fgOvp4
	 s4Y8dJZxHLafvheqMF4loY7UbbzB+uVjXJDwTH/kWGT8PyOMaODsz0xhG/7lhYQ2lZ
	 /DIoqeDiBIoeXeQcclY7ggxxTEK/Y/fkpNP/Is2fN0LxCZO/eDzCV10OdvHAZ2sugC
	 nDyKASo+cGmBA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE60D17E078A;
	Tue,  6 May 2025 11:17:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
Date: Tue,  6 May 2025 11:17:32 +0200
Message-ID: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16

for you to fetch changes up to 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:

  arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.16

This adds new MT8186-based Google Ponyta Chromebooks and improves
support for already supported SoCs and machines.

In particular, SoCs changes:
 - MT6893
   - Added pinmux header for this SoC
 - MT8183
   - Added port	node for dsi_out in mt8183.dtsi	to fix some DT
     validation	warnings.
 - MT8188
   - Adds an important fix for its Display Controller's Read DMA 0
     (RDMA0), as it was using the wrong IOMMU and failing;
   - Multimedia Data Path 3 (MDP3) devicetree nodes were added: now
     hardware assisted color format conversions are available;
   - Since SCP firmwares are available on linux-firmware, the
     necessary nodes for the dual-core SCP were added to devicetree
     along with the firmware-name property in mt8390-genio-common,
     enabling hardware video encoders and decoders on the MediaTek
     Genio 510 and Genio 700 EVKs.
 - MT8195
   - Power domains for video decoders and encoders were reparented
     as the secondary vdec/venc core needs the primary core to be
     also powered, as those are sharing the LAT hardware and SRAM;
   - Missing power domain was added to the primary DisplayPort
     Interface (dp_intf0) node.
 - MT8196
   - Added pinmux header for this SoC

... and machine-specific changes:
 - Radxa NIO-12L (MT8395)
   - Added support for Audio DSP and sound output through 3.5mm jack;
 - MediaTek Genio 1200 EVK (MT8395)
   - Support for this EVK's DSI display was added and enabled;
   - Secondary display backlight was disabled as it was unused
 - MediaTek Genio 510/700 (MT8370/MT8390)
   - Added support for the DSI display on these EVKs too;
   - Fixed an issue with integrated USB Bluetooth getting unplugged
     permanently due to wrong declaration of the ID GPIO polarity of
     the secondary USB port on the SSUSB2 controller;

Other than that, some other devicetree validation fixes were added
on the MT6357 and MT6359 PMIC DTs: for the former, all of the
compatible strings in all regulators were dropped as those were
wrong and causing DT kselftest failures - and for the latter, the
compatible string for the main `regulators` node was added as it
was missing.

----------------------------------------------------------------
AngeloGioacchino Del Regno (6):
      arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
      dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      arm64: dts: mediatek: Add MT6893 pinmux macro header file
      arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0

Axe Yang (1):
      arm64: dts: mediatek: mt8186-corsola: make SDIO card removable

Cathy Xu (1):
      arm64: dts: mediatek: mt8196: Add pinmux macro header file

Chen-Yu Tsai (1):
      arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0

Jianeng Ceng (2):
      dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

Julien Massot (4):
      arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
      arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card
      arm64: dts: mt6359: Add missing 'compatible' property to regulators node

Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_check error
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
      arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual role mode to host

Macpaul Lin (1):
      arm64: dts: mediatek: mt8195: Add power domain for dp_intf0

Nícolas F. R. A. Prado (4):
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0
      arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
      arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlight

Pin-yen Lin (1):
      arm64: dts: mt8183: Add port node to mt8183.dtsi

Rob Herring (Arm) (1):
      arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco

Łukasz Majczak (1):
      arm64: dts: mediatek: mt8186: starmie: Fix external display

 Documentation/devicetree/bindings/arm/mediatek.yaml                      |    7 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml     |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml   |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml   |    4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml |   10 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml            |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml           |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml           |    1 +
 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml        |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml           |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml         |    8 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml          |    1 +
 arch/arm/boot/dts/mediatek/mt2701-evb.dts                                |    1 +
 arch/arm64/boot/dts/mediatek/Makefile                                    |    2 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi                                 |   10 -
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                                 |    2 +
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                            | 1356 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                           |   11 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                                 |    4 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts              |   18 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts              |   22 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi                  |   49 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi                 |   45 --
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                         |    1 -
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts                              |    6 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                                 |  349 ++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                                 |   51 ++-
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h                            | 1574 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                    |  170 ++++++-
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                   |  127 +++++-
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts                    |   59 ++-
 31 files changed, 3797 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h

