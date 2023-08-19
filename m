Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D70BEE4993
	for <soc@archiver.kernel.org>; Sat, 19 Aug 2023 16:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EAA3C433CA; Sat, 19 Aug 2023 16:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E279EC433C8;
	Sat, 19 Aug 2023 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692461660;
	bh=PcxL3EleiskJvl8zHGtsDqdtxJz02DfzQXf/CRXYQB4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Re3tuOvuw4LHhojdd0VtE8jzJBZpqu1bQncog8O4igOvtEhL/bbdwuvVRmnMk+VVs
	 AAfHVWNkVZZ0Ui/tzcebhMGoeODYD+ynj4TR1ClSbB1/zHMNE7B8BUgByhhZ2LUM/P
	 xZiCxNLcn1mJS6JdCBGnu2fjoECZO406w7X2cmWkRqKXB3ASd84VMefNdoYr4LIi1A
	 ZPT+olzKYPNI0q3qoQbAKdZnGmsDa7iUVLHmOGs4X0DeF+ORvswul6ovS4RMeTmAGS
	 x/fVdMiTaeEA44lQ2bM1QNv7MpInZ1gCrlk1hvGlyWswOaUq/r8B2njJXjxJPREEBQ
	 h38U9lEv2hX9w==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v6.6
Date: Sat, 19 Aug 2023 11:14:18 -0500
Message-ID: <20230819161418.931258-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.6

for you to fetch changes up to 2d599bc43813cbcceeb6b0bfe864671ab517c207:

  arm64: dts: agilex5: add initial support for Intel Agilex5 SoCFPGA (2023-08-14 05:33:41 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.6
- Fix dtbs_check warnings for usbphy, sram, rstmgr, memory, partitions
- Updated "stmmaceth-ocp" reset-names to "ahb" for stmmac ethernet
- Add initial support for Agilex5

----------------------------------------------------------------
Alif Zakuan Yuslaimi (1):
      arm64: dts: agilex/stratix10: Updated QSPI Flash layout for UBIFS

Dinh Nguyen (6):
      arm64: dts: socfpga: agilex/stratix10: fix dtbs_check warnings for sram
      arm64: dts: socfpga: stratix10: fix dtbs_check warning for usbphy
      arm64: dts: stratix10/agilex/n5x: fix dtbs_check warning for memory node
      arm64: dts: agilex/stratix10/n5x: fix dtbs_check for rstmgr
      arm64: dts: socfpga: n5x/stratix10: fix dtbs_check warning for partitions
      arm64: dts: socfpga: change the reset-name of "stmmaceth-ocp" to "ahb"

Niravkumar L Rabara (4):
      dt-bindings: intel: Add Intel Agilex5 compatible
      dt-bindings: reset: add reset IDs for Agilex5
      dt-bindings: clock: add Intel Agilex5 clock manager
      arm64: dts: agilex5: add initial support for Intel Agilex5 SoCFPGA

 .../devicetree/bindings/arm/intel,socfpga.yaml     |   5 +
 .../bindings/clock/intel,agilex5-clkmgr.yaml       |  40 ++
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   6 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  20 +-
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  12 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |   8 +-
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |   2 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  13 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 468 +++++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |  39 ++
 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts |   4 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  12 +-
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |   4 +-
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |   6 +-
 include/dt-bindings/clock/intel,agilex5-clkmgr.h   | 100 +++++
 include/dt-bindings/reset/altr,rst-mgr-s10.h       |   5 +-
 17 files changed, 703 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/intel,agilex5-clkmgr.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
 create mode 100644 include/dt-bindings/clock/intel,agilex5-clkmgr.h
