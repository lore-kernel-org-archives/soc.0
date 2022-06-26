Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE6EC433EF
	for <soc@archiver.kernel.org>; Sun, 26 Jun 2022 00:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5653C341CB; Sun, 26 Jun 2022 00:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706B1C3411C;
	Sun, 26 Jun 2022 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656204279;
	bh=LWjrSjZr4GgE3OEqd7gebZLddhSNEPvS0C4NbgskPwA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=a/gqG2B6Gtc6hE4iyDSYdv0eLvowuZSiWBRomFmaC/oHFtXdmv6tZpgi/H9MPCxIT
	 2o4Lm1PCnoWb/61Cx4iCfxMfmMaKdlW8mHWmuazUVRz2JtxU5tSYVjRBz3L6l64W6j
	 f2mwz6jg4Ku2SIzfN6m0+7mv/ro973sSolhuO2BBBgJmAlMmaPZNp4JKMgYPy+TzUs
	 fjpi2m/kCytAYzWp11rNPs4YzfQ4AcoZOkbIEWq1FG0eEjVLxEFLOTOsxPg/UFycn+
	 0JHBAZaZACugh9n2ULi3sSvcESC9ElHFHvsMDdJ5//rtIsjqn8HbvVdpyJ4Pkik+fp
	 vB5+meZQzd9wg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: dts updates for v5.20
Date: Sat, 25 Jun 2022 19:44:37 -0500
Message-Id: <20220626004437.1224820-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

Please pull in these updates for v5.20.

Thanks,
Dinh

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v5.20

for you to fetch changes up to 357513c052e10945427dd341bdf7a7ee5bf065a9:

  arm64: dts: altera: socfpga_stratix10: move clocks out of soc node (2022-06-24 14:10:04 -0500)

----------------------------------------------------------------
SoCFPGA dts updates for v5.20
- Clean up the Mercury++ AA1 dts
- Add support the Google Chameleon v3 board
- Add defined GIC interrupt type for Agilex ECC
- Fix coding style around Stratix10 QSPI dts entry
- Add support for Stratix10 SW Virtual platform
- Move clocks entry out of the Stratix10 soc node

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: altera: adjust whitespace around '='

Niravkumar L Rabara (2):
      arm64: dts: intel: socfpga_agilex: use defined GIC interrupt type for ECC
      arm64: dts: altera: socfpga_stratix10: move clocks out of soc node

Paweł Anikiel (5):
      ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
      ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
      ARM: dts: socfpga: Add atsha204a node to Mercury+ AA1 dts
      ARM: dts: socfpga: Add Google Chameleon v3 devicetree
      dt-bindings: altera: Add Chameleon v3 board

Teh Wen Ping (2):
      dt-bindings: altera: document Stratix 10 SWVP compatibles
      arm64: dts: Add support for Stratix 10 Software Virtual Platform

 Documentation/devicetree/bindings/arm/altera.yaml  |  10 +-
 arch/arm/boot/dts/Makefile                         |   2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |  10 ++
 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts  |  90 ++++++++++++++++
 ...ry_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} |  48 ++-------
 arch/arm64/Kconfig.platforms                       |   3 +-
 arch/arm64/boot/dts/altera/Makefile                |   3 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  58 +++++-----
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    |  10 +-
 .../dts/altera/socfpga_stratix10_socdk_nand.dts    |  10 +-
 .../boot/dts/altera/socfpga_stratix10_swvp.dts     | 117 +++++++++++++++++++++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |  14 +--
 12 files changed, 283 insertions(+), 92 deletions(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
 rename arch/arm/boot/dts/{socfpga_arria10_mercury_aa1.dts => socfpga_arria10_mercury_aa1.dtsi} (70%)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dts
