Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F46DC433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 18:01:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8711764E43; Sun, 31 Jan 2021 18:01:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E8F661492;
	Sun, 31 Jan 2021 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612116074;
	bh=PIUWQfJpT2o52uB0dgKxgKPINo8Pd54gqjDjt+c2HHY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=pJFjRIXblvoTfFNz0pTp2gIGly1+wO/Dxv3DrxP/SZOJkLny+8XimNFFKLIot4Aw0
	 yjMYa67efXNzKodv/2XMGk6hYjKpKoqM6+k4iNdVzvVJO96FZQ0sWZxr4oE3b5QOas
	 rKfKT38N0K0WhWpAl6ofLreaWaEiafzETB6Et3tQ+Ydm1pCxBbRTaBNn5AW0Ruk+Di
	 g3702hwK+4ksq/WomzJ8YZKlq30WCCBK8/KaBFMuDMQGViKZ3FGMw3QTZl+uMlUg1l
	 koWEIOU4rqNynbMtgREduZwHnLl99GXTLWj88X4zFd+CptwZ3ypvYBeu6x3HaeDAY0
	 il/CdcranpBjQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] memory: drivers for v5.12
Date: Sun, 31 Jan 2021 19:01:08 +0100
Message-Id: <20210131180109.11510-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.12

for you to fetch changes up to 50fc8d9232cdc64b9e9d1b9488452f153de52b69:

  memory: mtk-smi: Allow building as module (2021-01-26 20:47:51 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.12

1. Mediatek SMI: fix PM usage counter and make the driver modular.
2. Renesas RPC-IF: add support for RZ/G2 series.
3. Minor fixes.

----------------------------------------------------------------
Adam Ford (2):
      dt-bindings: memory: renesas,rpc-if: Add support for RZ/G2 Series
      memory: renesas-rpc-if: Add RZ/G2 to Kconfig description

Pan Bian (1):
      memory: ti-aemif: Drop child node when jumping out loop

Yong Wu (2):
      memory: mtk-smi: Use platform_register_drivers
      memory: mtk-smi: Allow building as module

Zhang Qilong (1):
      memory: mtk-smi: Fix PM usage counter unbalance in mtk_smi ops

Zheng Yongjun (1):
      memory: emif: Use DEFINE_SPINLOCK() for spinlock

 .../memory-controllers/renesas,rpc-if.yaml         |  6 +++-
 drivers/memory/Kconfig                             |  8 ++---
 drivers/memory/emif.c                              |  3 +-
 drivers/memory/mtk-smi.c                           | 36 ++++++++++------------
 drivers/memory/ti-aemif.c                          |  8 +++--
 include/soc/mediatek/smi.h                         |  2 +-
 6 files changed, 33 insertions(+), 30 deletions(-)
