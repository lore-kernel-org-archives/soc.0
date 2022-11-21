Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D2EC4332F
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 16:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E7F9C433D6; Mon, 21 Nov 2022 16:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5402C433C1;
	Mon, 21 Nov 2022 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669048381;
	bh=r+2ZkLX5BXm/ArDugtiCtmkNchvjsuUfS7XwWxQA/jM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=r87lI5RUYJRBlnhqY3LdY20rr/8M/X9vxpKHWbzDr8ygZBrcFCyUBYYU/6nq+DGCB
	 zX79U68xk64Nzlm8eAbnu8syKuUwWSklNxMMQp1SCul/CUIDkUccrBCKznJxBZKCfd
	 a5QO3rjZDNwVWis8Ib5A7dOnYtbxjsBBqgMSrbTQpGE0GAUaRBeA9czsGxstqSNptC
	 m8mZsiIVjrSSN5uGh/j4OFX57lurt1QjCKazbn6Ig12rLlqEGGm1RMIOJPqyaedRss
	 6CDNv75+uN2Hg7qmnKuSRyWJhK8X2bPWqu/oVjup7QBVIFGC8zBIq/3z8MksIQLyEk
	 93QoX4l30tsHQ==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: dts updates for v6.2
Date: Mon, 21 Nov 2022 10:32:59 -0600
Message-Id: <20221121163259.341974-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.2

for you to fetch changes up to 31354121bf03dac6498a4236928a38490745d601:

  arm64: dts: socfpga: Add clk-phase-sd-hs property to the sdmmc node (2022-11-18 11:13:49 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v6.2
- Use the "clk-phase-sd-hs" property for SDMMC
- Remove the "clk-phase" fom the sdmmc_clk that is no longer used
- Clean dtschema for mmc node
- Increase NAND partition for Arria10

----------------------------------------------------------------
Dinh Nguyen (4):
      arm: dts: socfpga: align mmc node names with dtschema
      arm: dts: socfpga: remove "clk-phase" in sdmmc_clk
      arm: dts: socfpga: Add clk-phase-sd-hs property to the sdmmc node
      arm64: dts: socfpga: Add clk-phase-sd-hs property to the sdmmc node

Teoh Ji Sheng (1):
      ARM: dts: socfpga: arria10: Increase NAND boot partition size

 arch/arm/boot/dts/socfpga.dtsi                         | 4 ++--
 arch/arm/boot/dts/socfpga_arria10.dtsi                 | 4 ++--
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi     | 1 +
 arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts       | 4 ++--
 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts      | 1 +
 arch/arm/boot/dts/socfpga_arria5.dtsi                  | 3 ++-
 arch/arm/boot/dts/socfpga_cyclone5.dtsi                | 3 ++-
 arch/arm/boot/dts/socfpga_cyclone5_mcv.dtsi            | 1 +
 arch/arm/boot/dts/socfpga_vt.dts                       | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi      | 1 +
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi          | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts     | 1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts        | 1 +
 14 files changed, 19 insertions(+), 9 deletions(-)
