Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F344C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 19:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86FD5C340F3; Thu, 10 Mar 2022 19:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1580CC340E8;
	Thu, 10 Mar 2022 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646942262;
	bh=1HTBl/mBwdMBT1M6oqyG5Y848+uuIWMztlTOu03JQN4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=uuHUtHkJXNxpkN59V56n2awNMcMznlasqlTU5d1AuvmOVRCX/AaVMV2ievvixtkSU
	 /X0CA7MuAKgGLtg2cpRJyamsRhYDmPaHx/LiL78ALEDODGZmKVhv4snnZHlrWdQ1wR
	 GPCj0xd6QsvpWqKdM/nePWnkAIdpqJtJcTOcpT4oClvlJsnszoS0XWMzv6s4e3Pzic
	 h+zYWEHhX4sSc73f/CI1H3wlHIvOhhBSmH+IN+CYBvSY+TOIqUvmWI00Y4k+uIYlPJ
	 qttcQY2he7tKvXHixNsW8iZ+83jKnQ2XLDr5cVnejSPP/mVURlnB/+nqailNLegFTO
	 ubmwTE3hWxwHQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 1/2] arm64: dts: socfpga: dts updates for v5.18, part 2
Date: Thu, 10 Mar 2022 13:57:39 -0600
Message-Id: <20220310195740.151250-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part2

for you to fetch changes up to ef82c9be844f6b249a69d8fa190d4d686121d55c:

  arm64: dts: n5x: add sdr edac support (2022-03-01 09:43:15 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.18, part 2
- More dt-bindings cleanup, this time, USB DWC2 properties
- Add SDR EDAC dts entry for the N5X platform

----------------------------------------------------------------
Dinh Nguyen (3):
      ARM: dts: socfpga: arria10: align regulator node with dtschema
      ARM: dts: socfpga: cyclone5: align regulator node with dtschema
      arm64: dts: n5x: add sdr edac support

Krzysztof Kozlowski (24):
      dt-bindings: altera: document existing Cyclone 5 board compatibles
      dt-bindings: altera: document Arria 5 based board compatibles
      dt-bindings: altera: document Arria 10 based board compatibles
      dt-bindings: altera: document VT compatibles
      dt-bindings: altera: document Stratix 10 based board compatibles
      dt-bindings: intel: document Agilex based board compatibles
      dt-bindings: clock: intel,stratix10: convert to dtschema
      ARM: dts: arria5: add board compatible for SoCFPGA DK
      ARM: dts: arria10: add board compatible for Mercury AA1
      ARM: dts: arria10: add board compatible for SoCFPGA DK
      arm64: dts: stratix10: add board compatible for SoCFPGA DK
      arm64: dts: stratix10: move ARM timer out of SoC node
      arm64: dts: stratix10: align mmc node names with dtschema
      arm64: dts: stratix10: align regulator node names with dtschema
      arm64: dts: agilex: add board compatible for SoCFPGA DK
      arm64: dts: agilex: add board compatible for N5X DK
      arm64: dts: agilex: align mmc node names with dtschema
      arm64: dts: intel: socfpga_agilex_socdk: align LED node names with dtschema
      arm64: dts: stratix10: align pl330 node name with dtschema
      arm64: dts: agilex: align pl330 node name with dtschema
      dt-bindings: usb: dwc2: fix compatible of Intel Agilex
      dt-bindings: usb: dwc2: add iommus
      dt-bindings: usb: dwc2: add disable-over-current
      arm64: dts: agilex/stratix10: add clock-names to USB DWC2 node

 Documentation/devicetree/bindings/arm/altera.yaml  | 46 +++++++++++++++++++---
 .../devicetree/bindings/arm/intel,socfpga.yaml     | 26 ++++++++++++
 .../devicetree/bindings/clock/intc_stratix10.txt   | 20 ----------
 .../devicetree/bindings/clock/intel,stratix10.yaml | 35 ++++++++++++++++
 Documentation/devicetree/bindings/usb/dwc2.yaml    |  8 ++++
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts  |  2 +-
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         |  4 +-
 arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts |  2 +-
 .../arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dts |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |  2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 24 +++++------
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  3 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  5 ++-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  7 ++--
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |  1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    | 11 ++++++
 20 files changed, 154 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/intc_stratix10.txt
 create mode 100644 Documentation/devicetree/bindings/clock/intel,stratix10.yaml
