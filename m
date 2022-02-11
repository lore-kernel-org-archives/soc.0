Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0ACC433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51BF0C36AE3; Fri, 11 Feb 2022 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5E9C340E9;
	Fri, 11 Feb 2022 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644578758;
	bh=HKgwZ66V8qVYSQ+/WsV1+TGot4pg140/WoMszlNKzOc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=YgrvFgVWyc/zyPGVsiOZzsas2jabbemglV5kpQHBDl+NEx0zhBbovXXwrSN9dx05D
	 31StyIfFx6+qEazkkDE9CEvBZuDmgZ+jvybKykQD/BXEQvd5ipp7+A2vsZs0GM5DWq
	 f2bj5+fkVtKmryYrTLBFj0EHVf4HX+gzm6xqtybRFH/om1tvGePznBbIuNFYf3oN4q
	 01M7myJXk9XKH8euaKpUnZ9bo7VX9Z/cKgpQqaAmeURVX4ISseWymZ/i4LCVhHH08g
	 dGT1L+1dv/jYwbAEO4dRRYdmR3Dx/kFGQ5YuKMU2UcKtsigHc6G1Y4Ad8RUZ8B64bn
	 htakuLnUaMEqQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
Date: Fri, 11 Feb 2022 05:25:55 -0600
Message-Id: <20220211112556.98940-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part1

for you to fetch changes up to 0f7b715101f097cd1784272f67a8c3f570d7958f:

  ARM: dts: socfpga: cyclone5: align regulator node with dtschema (2022-02-09 20:58:10 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.18, part 1
- Cleanup of Altera/Intel ARMv7 and ARMv8 DTS and bindings

----------------------------------------------------------------
Dinh Nguyen (2):
      ARM: dts: socfpga: arria10: align regulator node with dtschema
      ARM: dts: socfpga: cyclone5: align regulator node with dtschema

Krzysztof Kozlowski (20):
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

 Documentation/devicetree/bindings/arm/altera.yaml  | 46 +++++++++++++++++++---
 .../devicetree/bindings/arm/intel,socfpga.yaml     | 26 ++++++++++++
 .../devicetree/bindings/clock/intc_stratix10.txt   | 20 ----------
 .../devicetree/bindings/clock/intel,stratix10.yaml | 35 ++++++++++++++++
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts  |  2 +-
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |  2 +-
 arch/arm/boot/dts/socfpga_arria5_socdk.dts         |  4 +-
 arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts |  2 +-
 .../arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dts |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |  2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  | 23 +++++------
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  3 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  4 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts |  7 ++--
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   |  1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    |  1 +
 19 files changed, 134 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/intc_stratix10.txt
 create mode 100644 Documentation/devicetree/bindings/clock/intel,stratix10.yaml
