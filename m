Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FACC433EF
	for <soc@archiver.kernel.org>; Thu, 19 May 2022 23:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE9A9C34113; Thu, 19 May 2022 23:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D51C385AA;
	Thu, 19 May 2022 23:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653002599;
	bh=ZnPtNULfegY3JcTDTgD/sKvxLVE2AwdxWOXU+Y/215M=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=rQSntKSLDrsUse6ggcpHNi1eEuew1CZ4JIX7vz5mImOOZYwuurMoX06pFy/aM0Ckb
	 YnME/I90ypruJf9HSQ6ae65KYSJOZDKMo5UKuf51kkUXUcb+i4XHIvddWJ0qzVh8gS
	 O1vV9cOzZjmW7RVMve2uEYHjTfhhCm/HDTRGBJRQvyi2mLIC0Qx1oXEkgPUI0tFueI
	 VF4t4EWOKybi424yXSyc1YQyaFJk43VwKnTTvKg65Noy6REFlrW30dBNoq+WmNVL3z
	 WEMuEie3Ii+2Qxi7hyvnmBbQsuXwWKkjBWS8yEv3ylFh+u1trqTk1rTXS0FPqs/b6Q
	 4xF6zpgysVzDw==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: updates for v5.19
Date: Thu, 19 May 2022 18:23:17 -0500
Message-Id: <20220519232317.16079-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd/Olof,

Please pull in these updates for v5.19.

Thanks,
Dinh


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v5.19

for you to fetch changes up to 22511e665eadc2c49021886d07aaef39db90ca82:

  arm64: dts: intel: add device tree for n6000 (2022-05-19 18:13:25 -0500)

----------------------------------------------------------------
SoCFPGA dts updates for v5.19
- dtschema fix SPI NOR node
- correct dt-bindings doc for Altera gpio driver
- add support for n6000 Agilex platform and dt-bindings documentation

----------------------------------------------------------------
Dinh Nguyen (1):
      dt-bindings: gpio: altera: correct interrupt-cells

Krzysztof Kozlowski (1):
      ARM: dts: socfpga: align SPI NOR node name with dtschema

Matthew Gerlach (3):
      dt-bindings: soc: add bindings for Intel HPS Copy Engine
      dt-bindings: intel: add binding for Intel n6000
      arm64: dts: intel: add device tree for n6000

 .../devicetree/bindings/arm/intel,socfpga.yaml     |  1 +
 .../devicetree/bindings/gpio/gpio-altera.txt       |  5 +-
 .../bindings/soc/intel/intel,hps-copy-engine.yaml  | 51 +++++++++++++++++
 arch/arm/boot/dts/socfpga_arria10_socdk_qspi.dts   |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts       |  2 +-
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts |  4 +-
 arch/arm64/boot/dts/intel/Makefile                 |  3 +-
 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts | 66 ++++++++++++++++++++++
 9 files changed, 128 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/intel/intel,hps-copy-engine.yaml
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
