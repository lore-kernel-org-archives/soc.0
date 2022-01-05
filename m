Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8501C433F5
	for <soc@archiver.kernel.org>; Wed,  5 Jan 2022 21:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56B93C36AED; Wed,  5 Jan 2022 21:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69DEC36AE9;
	Wed,  5 Jan 2022 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641418565;
	bh=tCpl9+NbFivznkzNRPoC+FOA2DZco+xPksZeDjA/Z78=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=TV67VmaK27+0NPjf5fX/y0D+215kYbnp+mHGLDwgfeFRB1fzKjBiTNnFDVClyq6VG
	 8lhFqhmG4GEsnKU8PtCtvjM4y+ZJ1mzy8ApIAPgHW/00ET34tnXqBnmBiI+724Jo4d
	 vkYZxIESGO0TcPAGDYNdWDj5BojnjQdscD5hnA6Sh2foGQaQtCZ/WZeoj5Xp/Y9lPn
	 SvfIEKFOxzDTh1TBAiUE+pFrDHE6bgQKLjMxQI1AmK/augA/IX6dFvhEo5vpXEg7AM
	 QkNLHQXB5OZXekUm9+bf1bE4/dS91sadFGxg1MiKUMEQWRzIFHq56+J0K21Lstcjpp
	 EQx9pnV4qiiEQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
Date: Wed,  5 Jan 2022 15:36:03 -0600
Message-Id: <20220105213603.804026-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8dce88fe80a858f34bb5b46470218fe478d251ee:

  arm64: dts: Update NAND MTD partition for Agilex and Stratix 10 (2021-12-01 08:07:41 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.17_part2

for you to fetch changes up to 0020e9e1f8d3348dd5c9a37612b1089c1a47553d:

  arm64: dts: agilex: align mmc node names with dtschema (2021-12-29 04:57:47 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.17, part 2
- Cleanup of Altera/Intel ARMv7 and ARMv8 DTS and bindings

----------------------------------------------------------------
Krzysztof Kozlowski (17):
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

 Documentation/devicetree/bindings/arm/altera.yaml  | 46 +++++++++++++++++++---
 .../devicetree/bindings/arm/intel,socfpga.yaml     | 26 ++++++++++++
 .../devicetree/bindings/clock/intc_stratix10.txt   | 20 ----------
 .../devicetree/bindings/clock/intel,stratix10.yaml | 35 ++++++++++++++++
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts  |  2 +-
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         |  2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 21 +++++-----
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  3 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  1 +
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |  1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |  1 +
 14 files changed, 123 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/intc_stratix10.txt
 create mode 100644 Documentation/devicetree/bindings/clock/intel,stratix10.yaml
