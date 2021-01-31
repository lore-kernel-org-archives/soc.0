Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF60C433E6
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 18:01:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3EC9864E10; Sun, 31 Jan 2021 18:01:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C924D64E4C;
	Sun, 31 Jan 2021 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612116076;
	bh=UPfEBsh3l/arPX81UXhscTfEGUvOJMt8yL9y5QTTTts=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OjG2iweK7h7vkQXFkHisZe6A8ZJPZrRTQAFc2oQKA+gAx1b34L5VFbTN06avcAFIS
	 p1ZBJ3k1Gwk4AhwIXemB5b+FjIxbCyz+BOwsixnfQku4vEYAC7c0bKZMHwx0kSi8HP
	 DOp0XzHhdtmpateQZyMQgfE7AqlXw7iOCAXhn212NNMmGF/Ja4l9iZrya0VwdUu/Ki
	 Ehq6fJ82aPBFITh/0eIPhaksB+3CJ9UbVSOqR/2wjPSQUjVUZB8dyUWdpBuTclQ0M/
	 3iI10XCkKUzdRcJeBVoYR4CbpFvZ7fyHNmXrNwxxnFRUdzQvf0CcL+Vdt2iYMZ0rCQ
	 Uz4Qa5QC9pXbw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL 2/2] memory: tegra drivers for v5.12
Date: Sun, 31 Jan 2021 19:01:09 +0100
Message-Id: <20210131180109.11510-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131180109.11510-1-krzk@kernel.org>
References: <20210131180109.11510-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.12

for you to fetch changes up to 25d987706abce0a425332a41ec984390fd03350a:

  memory: tegra: Remove calls to dev_pm_opp_set_clkname() (2021-01-29 07:59:01 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.12 - Tegra SoC

1. Make the tegra124-emc driver modular.
2. Add interconnect support to Tegra124 memory controller drivers.
3. Minor fixes.

----------------------------------------------------------------
Dmitry Osipenko (4):
      memory: tegra124-emc: Make driver modular
      memory: tegra124-emc: Continue probing if timings are missing in device-tree
      memory: tegra124: Support interconnect framework
      memory: tegra: Check whether reset is already asserted

Viresh Kumar (1):
      memory: tegra: Remove calls to dev_pm_opp_set_clkname()

 drivers/clk/tegra/Kconfig            |   3 +
 drivers/clk/tegra/Makefile           |   2 +-
 drivers/clk/tegra/clk-tegra124-emc.c |  41 +++-
 drivers/clk/tegra/clk-tegra124.c     |  26 ++-
 drivers/clk/tegra/clk.h              |  18 +-
 drivers/memory/tegra/Kconfig         |   4 +-
 drivers/memory/tegra/mc.c            |   7 +
 drivers/memory/tegra/tegra124-emc.c  | 368 +++++++++++++++++++++++++++++++----
 drivers/memory/tegra/tegra124.c      |  82 +++++++-
 drivers/memory/tegra/tegra20-emc.c   |  13 +-
 drivers/memory/tegra/tegra30-emc.c   |  13 +-
 include/linux/clk/tegra.h            |   8 +
 include/soc/tegra/emc.h              |  16 --
 13 files changed, 508 insertions(+), 93 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h
