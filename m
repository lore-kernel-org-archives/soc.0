Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A3DC433DB
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 11:04:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2AE761989; Tue, 30 Mar 2021 11:04:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AD4161985;
	Tue, 30 Mar 2021 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617102271;
	bh=WItIEkcv1jIXljsuLzmbBpBnmQuP4kRby5C1UMEJTqA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=jwH+XFK7XtJhxQ15bJh+1rGSLpHyYAZYdFXIKTBBg07jyofCWjsDePImI0WfDmke8
	 fu0mYuyWKCNfbRFp1p7KLt8PPohfYrx6SOZy6oZbBchOhznAaTxCMlB3vyeRzUEi9K
	 4QcinPoVuijCXQgNmfWv+zJLzWu0oHwYoYKSMW2hLKyzsQRMMsyhBcwP0iLYi9gMDw
	 4VhQhKKZ4Pf7D/YY4gC2KRzQiaM39VZUrpEpO5sDc/Y3+AjrZxMeCaJUlsQuIL5n39
	 /BPZoZZwjMQwgvDttX3egJk2uStMQhFqPap7wCa91x41NwECqZ73ra29Oc7mQj36US
	 hH26nTL2Ffr5g==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL 1/3] SoCFPGA updates for v5.13
Date: Tue, 30 Mar 2021 06:04:28 -0500
Message-Id: <20210330110430.558182-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Kevin, and Olof:

Please pull in these SoCFPGA updates for v5.13.

Thanks,
Dinh

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_update_for_v5.13

for you to fetch changes up to 4483397b03536506535d611b0cb28a81a69e8edf:

  ARM: socfpga: drop ARCH_SOCFPGA (2021-03-23 11:03:36 -0500)

----------------------------------------------------------------
SoCFPGA updates for v5.13
- Patches from Krzysztof Kozlowski the cleans up and consolidate support for
  SoCFPGA platforms
	- Rename ARCH_SOCFPGA into ARCH_INTEL_SOCFPGA
	- Consolidate ARCH_STRATIX10 into ARCH_INTEL_SOCFPGA
	- Consolidate ARCH_AGILEX into ARCH_INTEL_SOCFPGA
	- Consolidate ARCH_N5X into ARCH_INTEL_SOCFPGA

----------------------------------------------------------------
Krzysztof Kozlowski (15):
      clk: socfpga: allow building N5X clocks with ARCH_N5X
      ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
      mfd: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
      net: stmmac: merge ARCH_SOCFPGA and ARCH_STRATIX10
      clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
      clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
      EDAC: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
      arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA
      clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
      clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs (and compile test)
      dmaengine: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      fpga: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      i2c: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      reset: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
      ARM: socfpga: drop ARCH_SOCFPGA

 arch/arm/Kconfig                            |  2 +-
 arch/arm/Kconfig.debug                      |  6 +++---
 arch/arm/Makefile                           |  2 +-
 arch/arm/boot/dts/Makefile                  |  2 +-
 arch/arm/configs/multi_v7_defconfig         |  2 +-
 arch/arm/configs/socfpga_defconfig          |  2 +-
 arch/arm/mach-socfpga/Kconfig               |  4 ++--
 arch/arm64/Kconfig.platforms                | 17 ++++-------------
 arch/arm64/boot/dts/altera/Makefile         |  2 +-
 arch/arm64/boot/dts/intel/Makefile          |  6 +++---
 arch/arm64/configs/defconfig                |  2 +-
 drivers/clk/Kconfig                         |  1 +
 drivers/clk/Makefile                        |  4 +---
 drivers/clk/socfpga/Kconfig                 | 19 +++++++++++++++++++
 drivers/clk/socfpga/Makefile                | 11 +++++------
 drivers/dma/Kconfig                         |  2 +-
 drivers/edac/Kconfig                        |  2 +-
 drivers/edac/altera_edac.c                  | 17 +++++++++++------
 drivers/firmware/Kconfig                    |  2 +-
 drivers/fpga/Kconfig                        |  8 ++++----
 drivers/i2c/busses/Kconfig                  |  2 +-
 drivers/mfd/Kconfig                         |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
 drivers/reset/Kconfig                       |  6 +++---
 24 files changed, 71 insertions(+), 58 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig
