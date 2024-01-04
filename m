Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57EBC3DA6E
	for <soc@archiver.kernel.org>; Thu,  4 Jan 2024 00:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68C5BC433CC; Thu,  4 Jan 2024 00:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3E8C433C7;
	Thu,  4 Jan 2024 00:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704327236;
	bh=Vo576v4WqJj38D328y/4wGPLb3Lf9+vjEANjD9msEw4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=R9qkcCP82I5iAqjQo2YE8oyIuY/pMnOqCLMB+CAT4dn8T8HFPe5q8XttpJPxRl2Mx
	 wTIKrG1guf8J25RuNbYWd0FfKx/sVq/9E/koMPGdWCx52AH0KXzcainmp7c2CZTr08
	 me1P0ugfYhsE9ueZrN49QkLYyQBLWOpvAuvQsq35I4HOexs4NdNemm19DoV/bdxpBY
	 kcFXMt4GeTV90yevKxBqVwPHepmy/1EPxGUYbVq1vyIKKlWTYzfE5L/obXAXHtkM0y
	 ynuTrGAzPDKjs695wRLuDylWibTvr18SUHmK3MDet2sdBDZXN7fqSbqGIH+bm0/dub
	 ynYv/AFGEyxOw==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v6.8
Date: Wed,  3 Jan 2024 18:13:54 -0600
Message-ID: <20240104001354.152410-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.8

for you to fetch changes up to 16615a2aa5370a3f16422e9bfdbe07c2204f8513:

  arm64: dts: intel: minor whitespace cleanup around '=' (2024-01-03 18:10:40 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.8
- Fix dtbs_check warnings for nand, usb, FPGA firmware, and pin-controller
- Clean up of DTS for Agilex5

----------------------------------------------------------------
Krzysztof Kozlowski (16):
      ARM: dts: socfpga: drop unsupported cdns,page-size and cdns,block-size
      ARM: dts: socfpga: align NAND controller name with bindings
      arm64: dts: socfpga: drop unsupported cdns,page-size and cdns,block-size
      arm64: dts: socfpga: stratix10: add clock-names to DWC2 USB
      arm64: dts: socfpga: stratix10: align pincfg nodes with bindings
      arm64: dts: socfpga: stratix10: move FPGA region out of soc node
      arm64: dts: socfpga: stratix10: move firmware out of soc node
      arm64: dts: socfpga: stratix10: add unit address to soc node
      arm64: dts: socfpga: stratix10_socdk: align NAND chip name with bindings
      arm64: dts: socfpga: stratix10_swvp: drop unsupported DW MSHC properties
      arm64: dts: socfpga: agilex: align pin-controller name with bindings
      arm64: dts: socfpga: agilex: move FPGA region out of soc node
      arm64: dts: socfpga: agilex: move firmware out of soc node
      arm64: dts: socfpga: agilex: add unit address to soc node
      arm64: dts: socfpga: agilex: drop redundant status
      arm64: dts: intel: minor whitespace cleanup around '='

 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |  2 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |  2 +-
 .../intel/socfpga/socfpga_arria10_socdk_qspi.dts   |  2 --
 .../dts/intel/socfpga/socfpga_arria5_socdk.dts     |  2 --
 .../dts/intel/socfpga/socfpga_cyclone5_socdk.dts   |  2 --
 .../dts/intel/socfpga/socfpga_cyclone5_sockit.dts  |  2 --
 .../dts/intel/socfpga/socfpga_cyclone5_sodia.dts   |  2 --
 .../intel/socfpga/socfpga_cyclone5_vining_fpga.dts |  4 ---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 41 ++++++++++-----------
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  8 ++---
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  6 ++--
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     |  2 --
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      | 42 +++++++++++-----------
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |  4 +--
 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts |  2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  2 --
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |  5 +--
 17 files changed, 53 insertions(+), 77 deletions(-)
