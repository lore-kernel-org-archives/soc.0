Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170B3C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:58:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D174022582; Mon,  7 Dec 2020 07:58:02 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] memory: Second pull for v5.11
Date: Mon,  7 Dec 2020 08:57:57 +0100
Message-Id: <20201207075758.5501-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 5445a0c0d3366358e7ac44efa108b6fd359873e3:

  memory: pl353-smc: fix compile test on !ARM_AMBA (2020-11-18 17:14:54 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.11-2

for you to fetch changes up to 4bfa07300b9334b487ed4f3d4901c35ebb31b7ca:

  memory: jz4780_nemc: Fix potential NULL dereference in jz4780_nemc_probe() (2020-12-05 14:57:52 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.11, part two

1. Several fixes for Renesas RPC-IF driver.
2. Correct compile testing of TI EMIF SRAM driver.
3. Fix potential NULL pointer in JZ4780 NEMC driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: ti-emif-sram: only build for ARMv7

Lad Prabhakar (4):
      memory: renesas-rpc-if: Return correct value to the caller of rpcif_manual_xfer()
      memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in rpcif_{enable,disable}_rpm
      memory: renesas-rpc-if: Fix a node reference leak in rpcif_probe()
      memory: renesas-rpc-if: Make rpcif_enable/disable_rpm() as static inline

Zhang Changzhong (1):
      memory: jz4780_nemc: Fix potential NULL dereference in jz4780_nemc_probe()

 drivers/memory/Kconfig          |  2 +-
 drivers/memory/jz4780-nemc.c    |  2 ++
 drivers/memory/renesas-rpc-if.c | 18 ++++--------------
 include/memory/renesas-rpc-if.h | 13 +++++++++++--
 4 files changed, 18 insertions(+), 17 deletions(-)
