Return-Path: <SRS0=MZId=JM=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0EBC433ED
	for <soc@archiver.kernel.org>; Thu, 15 Apr 2021 06:55:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F01B5613DD; Thu, 15 Apr 2021 06:55:48 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6169B61153
	for <soc@kernel.org>; Thu, 15 Apr 2021 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6169B61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f72.google.com ([209.85.208.72])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lWvuk-0001lD-Ox
	for soc@kernel.org; Thu, 15 Apr 2021 06:55:46 +0000
Received: by mail-ed1-f72.google.com with SMTP id m2-20020aa7c4820000b0290382b0bad9e7so4651766edq.9
        for <soc@kernel.org>; Wed, 14 Apr 2021 23:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jW5ksZJL5w6HMjRF02e9r52MndUZOjt+ECOTfix66Mo=;
        b=Y/jmuBLQkR3llWwwuD0ydmpox112Aat0HfU1JPw3aoAcK03TIbeEBb2VZZgXYzQZAG
         M+X7WWrAdGBmkOvTaUzcQW9CAdMS236ahVMwA1msbZSzT8jcczLXSNY9xi6SUsaNYS6t
         L+wn+BIhhQGLhW17sYM5D5bxHqg2bauTCRVgsz/dSrgk8/pHZdIcFbzETEQsltIZ3DXo
         2VdhyddmrbOU6OohoEj7E07V9p73/eSG9kkXToYTJLVZEjYe8ForvPgdZYxPFnPJRYKr
         PsCmxxkEegidYnupCrL+jVZH1hSg9ZmmnpklG0YuKGGN47ps4doMGu7g5o2Ugo9sll18
         7+SA==
X-Gm-Message-State: AOAM5325c6r1XjJEGxZh7murlfv6ai7/kENUh8rQ+syULTyTfE9Tohbe
	xab67lPZAFickxqkSgbusFSLgsCUUeHqS/5olnzxqvrTUQfZr7xQjOczBNftgbstXcXFLTu3srX
	h96MmeWfBN2HWhx401F6UPFs=
X-Received: by 2002:a17:906:1749:: with SMTP id d9mr1845230eje.12.1618469746495;
        Wed, 14 Apr 2021 23:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZZpiRats6JlqAzERLcvThQ/1Bvbg8u4Oo8oDQSgbgDgrnQpDMqGMikyN2SEpgOVvxMDYVfA==
X-Received: by 2002:a17:906:1749:: with SMTP id d9mr1845209eje.12.1618469746265;
        Wed, 14 Apr 2021 23:55:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id m14sm1526561edd.63.2021.04.14.23.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 23:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: Second pull for v5.13
Date: Thu, 15 Apr 2021 08:55:14 +0200
Message-Id: <20210415065514.7385-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request - few remaining minor fixes.

Best regards,
Krzysztof


The following changes since commit 25dcca7fedcd4e31cb368ad846bfd738c0c6307c:

  memory: pl353: fix mask of ECC page_size config register (2021-04-05 16:15:58 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.13-2

for you to fetch changes up to 6ce2c05b21189eb17b3aa26720cc5841acf9dce8:

  memory: mtk-smi: Add device-link between smi-larb and smi-common (2021-04-13 16:56:31 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.13, part two

1. Renesas RPC: fix possible NULL pointer.
2. Exynos5422 DMC: add proper error checking for clk_prepare.
3. Mediatek SMI: use device-links instead of explicit PM runtime calls.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      memory: renesas-rpc-if: fix possible NULL pointer dereference of resource
      memory: samsung: exynos5422-dmc: handle clk_set_parent() failure

Yong Wu (1):
      memory: mtk-smi: Add device-link between smi-larb and smi-common

 drivers/memory/mtk-smi.c                | 19 ++++++++++---------
 drivers/memory/renesas-rpc-if.c         |  2 +-
 drivers/memory/samsung/exynos5422-dmc.c |  4 +++-
 3 files changed, 14 insertions(+), 11 deletions(-)
