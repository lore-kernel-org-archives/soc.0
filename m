Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7354CC56202
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 18:45:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27662206CA; Wed, 25 Nov 2020 18:45:35 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C1AF520674;
	Wed, 25 Nov 2020 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606329935;
	bh=wYs7yKzr01gmOFi/hPQSCmHXWhDupFK2+1oBhemb6X4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=pqAnVkmBA8N5/I04t2LRtof88xVi6mMC3bVDK6M7fzJ9o+uxAaNOcrHtuhvAkT8Nt
	 IN/k/VfXmodcnxLKULwrMxQWs3EuqbjvKxhof4o6ebC1ZL78ANN/IGncZ6qZTEO8mx
	 E+nHTwmSbvyU9G2LH7iU+22Ghd8F3+BqoFRK4VQ8=
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] memory: Memory controller for v5.11
Date: Wed, 25 Nov 2020 19:45:28 +0100
Message-Id: <20201125184529.5392-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few early changes for v5.11.

Best regards,
Krzysztof


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.11

for you to fetch changes up to 5445a0c0d3366358e7ac44efa108b6fd359873e3:

  memory: pl353-smc: fix compile test on !ARM_AMBA (2020-11-18 17:14:54 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.11

1. jz4780_nemc: fix devm_ioremap() return value check leading to
   potential NULL pointer dereference.
2. mediatek: Convert bindings to dtschema and add support for mt8192.
3. pl353-smc: Fix compile test.

----------------------------------------------------------------
Dan Carpenter (1):
      memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()

Krzysztof Kozlowski (2):
      MAINTAINERS: add dt binding headers to memory controller drivers entry
      memory: pl353-smc: fix compile test on !ARM_AMBA

Yong Wu (3):
      dt-bindings: memory: mediatek: Convert SMI to DT schema
      dt-bindings: memory: mediatek: Add mt8192 support
      memory: mtk-smi: Add mt8192 support

 .../memory-controllers/mediatek,smi-common.txt     |  50 --------
 .../memory-controllers/mediatek,smi-common.yaml    | 142 +++++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt       |  50 --------
 .../memory-controllers/mediatek,smi-larb.yaml      | 132 +++++++++++++++++++
 MAINTAINERS                                        |   1 +
 drivers/memory/Kconfig                             |   4 +-
 drivers/memory/jz4780-nemc.c                       |   4 +-
 drivers/memory/mtk-smi.c                           |  19 +++
 8 files changed, 298 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
