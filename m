Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A14C352A1
	for <soc@archiver.kernel.org>; Tue,  6 Dec 2022 21:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C00A2C43470; Tue,  6 Dec 2022 21:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3386DC433D7;
	Tue,  6 Dec 2022 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670362808;
	bh=3cDOf0WIx8OtYoBMPREfsDzfWikhA4FeAUFJn23n8Xc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=dW1EuoQUOLr3C4IWqnzzgcHbvwrOpkWq8SV9zGZP5tHJNwHet2+fCah2WQg8nlj32
	 N/c0573t8zZky41MSkd2r0Izlml+IMTjP1pobPg9BM1bTUzPoPWL1vdKOfi7EUDowz
	 PhJjItrxeuxib2a/0oDYZ7PMFt3yv/g6ncgXg9glxY1Df+7jeUK0L2iSliQ/GD6GbO
	 DOla7x/i2npZRG6rD1/J9syJsyLpI91IpI99novq+T30A258BYy8Xj2lHgFEVSUO6W
	 GT0GjTPbHqZZjuCfEZwLEd6pvoZsHYFQYyjs5MtM6FxPD+1Ho6+u1J2NHigqyhSMIK
	 tcz81qX41aG3g==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: dts updates for v6.2, part 2
Date: Tue,  6 Dec 2022 15:40:06 -0600
Message-Id: <20221206214006.590562-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 31354121bf03dac6498a4236928a38490745d601:

  arm64: dts: socfpga: Add clk-phase-sd-hs property to the sdmmc node (2022-11-18 11:13:49 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.2_part2

for you to fetch changes up to 88615cfb3184085a8a903bf94818985e8f3bf325:

  ARM: dts: socfpga: Fix pca9548 i2c-mux node name (2022-12-06 14:55:51 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v6.2, part 2
- Fix dtschema for LED node
- Fix dtschema for i2c-mux

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: socfpga: Fix pca9548 i2c-mux node name

Krzysztof Kozlowski (2):
      arm64: dts: altera: align LED node names with dtschema
      ARM: dts: socfpga: align LED node names with dtschema

 arch/arm/boot/dts/socfpga_arria5_socdk.dts                  | 8 ++++----
 arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dts         | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts                | 8 ++++----
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts          | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      | 6 +++---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 6 +++---
 6 files changed, 16 insertions(+), 16 deletions(-)
