Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E301EC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:58:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9ED54225A9; Mon,  7 Dec 2020 07:58:04 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL 2/2] memory: Second pull for Tegra MC for v5.11
Date: Mon,  7 Dec 2020 08:57:58 +0100
Message-Id: <20201207075758.5501-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207075758.5501-1-krzk@kernel.org>
References: <20201207075758.5501-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request. This will remove annoying warning coming from
the previous patches, so it would be good if it goes this cycle.  The warning
itself does not mean anything is broken - just message that new features are
not supported yet.

Best regards,
Krzysztof


The following changes since commit 0e1bcf2c05d0a681c04351fbd60812aea99354b6:

  memory: tegra30-emc: Remove unnecessary of_node_put in tegra_emc_probe (2020-11-26 18:50:37 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.11-3

for you to fetch changes up to d76fa3f2c252421faf326afd5f445bed5d34075f:

  memory: tegra30: Support interconnect framework (2020-12-05 14:54:36 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.11 - Tegra SoC, part two

Continuation of work on Tegra SoC memory controllers towards adding
interconnect support and integration with devfreq.

This brings few more patches including one which removes/fixes annoying
warning if the DTS patches get applied.  This is expected and only
informs that new features of Tegra memory controller drivers will not be
enabled however the warning itself could look worrying.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt-bindings: memory: tegra20-emc: Document opp-supported-hw property
      memory: tegra20: Support hardware versioning and clean up OPP table initialization
      memory: tegra30: Support interconnect framework

 .../memory-controllers/nvidia,tegra20-emc.txt      |   6 +
 drivers/memory/tegra/Kconfig                       |   1 +
 drivers/memory/tegra/tegra20-emc.c                 |  48 ++-
 drivers/memory/tegra/tegra30-emc.c                 | 344 +++++++++++++++++++--
 drivers/memory/tegra/tegra30.c                     | 173 ++++++++++-
 5 files changed, 522 insertions(+), 50 deletions(-)
