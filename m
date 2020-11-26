Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6798C56202
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 19:13:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 985FB21D91; Thu, 26 Nov 2020 19:13:08 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E1E892087C;
	Thu, 26 Nov 2020 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606417988;
	bh=BY/AVlzYl6i2KyUwv3ph4ypkGquGpgmwrA81J2fe7ck=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=iUi58tlHEzP0I469EdzXroSQwvv9hC2BX7YfKNJEIiO380ke8HgisXtWomvNuVZ8S
	 OfkwpwSCW/Uh5wHm0kh5BGHi7vmYLyLek/2w75z62Cs2igt/UgRptUCUrr/H01c4t7
	 gCz61vUAIlB7U3BAXTudVAGcWu1YevwtcHY7wEwY=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL] memory: tegra for v5.11, fixed (2nd)
Date: Thu, 26 Nov 2020 20:12:41 +0100
Message-Id: <20201126191241.23302-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This replaces my pull 2/2 from yesterday as few dt-binding headers should go
via SoC tree (to make everyone's life easier - drivers do not depend on them so
there is no cross-tree merge).

The Tegra memory controllers work was big enough to get its own branch and tag.
It also includes few SoC and clock patches, which I shared externally via a
stable tag to devfreq tree.

The work is not yet finished, so more patches from Dmitry will be coming.
However I want to flush my queue now.

Best regards,
Krzysztof


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.11-2

for you to fetch changes up to 0e1bcf2c05d0a681c04351fbd60812aea99354b6:

  memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe (2020-11-26 18:50:37 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.11 - Tegra SoC

There is a bigger work from Dmitry Osipenko around Tegra SoC memory
controller drivers, mostly towards adding interconnect support and
integration with devfreq.  This work touches all Tegra memory controller
drivers and also few other SoC-related parts.  It's not yet finished but
the intermediate stage seems ready to merge.

Beside that Tegra 210 memory controller got few fixes and received new
swgroups (work of Nicolin Chen).

----------------------------------------------------------------
Dmitry Osipenko (32):
      dt-bindings: memory: tegra20: emc: Correct registers range in example
      clk: tegra: Export Tegra20 EMC kernel symbols
      soc/tegra: fuse: Export tegra_read_ram_code()
      soc/tegra: fuse: Add stub for tegra_sku_info
      dt-bindings: memory: tegra20: emc: Document nvidia, memory-controller property
      dt-bindings: memory: tegra20: mc: Document new interconnect property
      dt-bindings: memory: tegra20: emc: Document new interconnect property
      dt-bindings: memory: tegra20: emc: Document OPP table and voltage regulator
      dt-bindings: memory: tegra30: mc: Document new interconnect property
      dt-bindings: memory: tegra30: emc: Document new interconnect property
      dt-bindings: memory: tegra30: emc: Document OPP table and voltage regulator
      dt-bindings: memory: tegra124: mc: Document new interconnect property
      dt-bindings: memory: tegra124: emc: Document new interconnect property
      dt-bindings: memory: tegra124: emc: Document OPP table and voltage regulator
      dt-bindings: tegra30-actmon: Document OPP and interconnect properties
      dt-bindings: host1x: Document new interconnect properties
      memory: tegra: Add and use devm_tegra_memory_controller_get()
      memory: tegra: Use devm_platform_ioremap_resource()
      memory: tegra: Remove superfluous error messages around platform_get_irq()
      memory: tegra: Add missing latency allowness entry for Page Table Cache
      memory: tegra-mc: Add interconnect framework
      memory: tegra20-emc: Make driver modular
      memory: tegra20-emc: Continue probing if timings are missing in device-tree
      memory: tegra20: Support interconnect framework
      memory: tegra: Correct stub of devm_tegra_memory_controller_get()
      memory: tegra20-emc: Use dev_pm_opp_set_clkname()
      memory: tegra20-emc: Factor out clk initialization
      memory: tegra20-emc: Remove IRQ number from error message
      memory: tegra20-emc: Add devfreq support
      memory: tegra30: Add FIFO sizes to memory clients
      memory: tegra30-emc: Make driver modular
      memory: tegra30-emc: Continue probing if timings are missing in device-tree

Krzysztof Kozlowski (1):
      Merge tag 'tegra-soc-clk-drivers-5.11' into for-v5.11/tegra-mc

Nathan Chancellor (1):
      memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe

Nicolin Chen (5):
      memory: tegra: Correct la.reg address of seswr
      memory: tegra: Correct tegra210_mc_clients def values
      memory: tegra: Sort tegra210_swgroups by reg address
      dt-bindings: memory: tegra: Add missing swgroups
      memory: tegra: Complete tegra210_swgroups

 .../bindings/arm/tegra/nvidia,tegra30-actmon.txt   |  25 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |  68 +++
 .../memory-controllers/nvidia,tegra124-emc.yaml    |  19 +
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   5 +
 .../memory-controllers/nvidia,tegra20-emc.txt      |  22 +-
 .../memory-controllers/nvidia,tegra20-mc.txt       |   3 +
 .../memory-controllers/nvidia,tegra30-emc.yaml     |  18 +
 .../memory-controllers/nvidia,tegra30-mc.yaml      |   5 +
 drivers/clk/tegra/clk-tegra20-emc.c                |   3 +
 drivers/memory/tegra/Kconfig                       |   9 +-
 drivers/memory/tegra/mc.c                          | 155 +++++-
 drivers/memory/tegra/mc.h                          |  22 +
 drivers/memory/tegra/tegra114.c                    |   6 +
 drivers/memory/tegra/tegra124-emc.c                |  22 +-
 drivers/memory/tegra/tegra124.c                    |   6 +
 drivers/memory/tegra/tegra20-emc.c                 | 528 +++++++++++++++++++--
 drivers/memory/tegra/tegra20.c                     |  77 +++
 drivers/memory/tegra/tegra210-emc-core.c           |  39 +-
 drivers/memory/tegra/tegra210.c                    |  60 ++-
 drivers/memory/tegra/tegra30-emc.c                 |  73 ++-
 drivers/memory/tegra/tegra30.c                     |  72 +++
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   2 +
 include/dt-bindings/memory/tegra210-mc.h           |  10 +
 include/soc/tegra/fuse.h                           |   4 +
 include/soc/tegra/mc.h                             |  27 ++
 25 files changed, 1111 insertions(+), 169 deletions(-)
