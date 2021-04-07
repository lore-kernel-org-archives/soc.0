Return-Path: <SRS0=Yh/P=JE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6F1C433B4
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 16:13:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD3C861130; Wed,  7 Apr 2021 16:13:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA9061260
	for <soc@kernel.org>; Wed,  7 Apr 2021 16:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EA9061260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lUAoE-0001r9-3K
	for soc@kernel.org; Wed, 07 Apr 2021 16:13:38 +0000
Received: by mail-wr1-f69.google.com with SMTP id y14so1964069wro.23
        for <soc@kernel.org>; Wed, 07 Apr 2021 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Srw9aPFAfT6trVNtgydDAxzyZ1eybVMpNyRiKQWc/rY=;
        b=jEeK0qtEqbFJGyDLRBRYmOPJ9Fz7OlUbV280h7atjT6CW4V6sP8SpfXN6VXsYzqTRn
         s+X22yRnEqnoWcDkRVsC7kTdNqJn4YXC1Kxcs06GLH531tMuqoK1bhCcvZqpC8ENLZyt
         I3Sbjjuwi+eD41TxDniM1cvadvA6Yd5WxPZYIdCMvdaG1YDP7ZPittx1GOTnLKnulKjf
         pWK3uZFejQsCom6GnEL0V1l3oHuE25RU5IedfUoFFqQyuoycI/XCjB2XHVJ5mYNkm5k3
         qI0wRgB/DfUO+XEI4uBdE16dZMSNM63myM2xYiaslhwV7y1+QDgSKeRYTlhUFVJr6S2p
         2wNg==
X-Gm-Message-State: AOAM532BQkl5MkJFVMCrwLCgVNWbVH37vnz0OSkDEc+vLJbZBkeM3y7Y
	uYySjwkHhll7cIeYKIa6aTphaSTlnPy+74euZxvq4ftUnYkgJR/OB3DfvhViH5RLk7oZPB8g3J+
	UhJVsbfDzoBer7hy7WxFnl38=
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr3768764wmc.83.1617812017842;
        Wed, 07 Apr 2021 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTXNUbV0m3g0bqClRZwiW2bxwFUmfJ0xhpYtI9EgCRAx0pK9haRiCu12aENJwkmhwA2CmZ6w==
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr3768737wmc.83.1617812017569;
        Wed, 07 Apr 2021 09:13:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id k16sm20856105wrl.47.2021.04.07.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:13:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL 2/2] memory: tegra for v5.13
Date: Wed,  7 Apr 2021 18:13:33 +0200
Message-Id: <20210407161333.73013-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com>
References: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.13

for you to fetch changes up to d8d5cbc619e86b8f2167ae40d029a9d07e97b303:

  dt-bindings: memory: tegra20: mc: Convert to schema (2021-04-01 19:58:22 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.13 - Tegra SoC

1. Few cleanups.
2. Add debug statistics to Tegra20 memory controller.
3. Update bindings and convert to dtschema.  This update is not
   backwards compatible (ABI break) however the broken part was added
   recently (v5.11) and there are no users of it yet.

----------------------------------------------------------------
Dmitry Osipenko (8):
      memory: tegra20: Add debug statistics
      memory: tegra20: Correct comment to MC_STAT registers writes
      memory: tegra20: Protect debug code with a lock
      memory: tegra: Print out info-level once per driver probe
      dt-bindings: memory: tegra20: emc: Replace core regulator with power domain
      dt-bindings: memory: tegra30: emc: Replace core regulator with power domain
      dt-bindings: memory: tegra124: emc: Replace core regulator with power domain
      dt-bindings: memory: tegra20: mc: Convert to schema

Yang Li (1):
      memory: tegra: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

 .../memory-controllers/nvidia,tegra124-emc.yaml    |   7 +-
 .../memory-controllers/nvidia,tegra20-emc.txt      |   4 +-
 .../memory-controllers/nvidia,tegra20-mc.txt       |  40 ---
 .../memory-controllers/nvidia,tegra20-mc.yaml      |  79 +++++
 .../memory-controllers/nvidia,tegra30-emc.yaml     |   7 +-
 drivers/memory/tegra/mc.c                          |   9 +
 drivers/memory/tegra/mc.h                          |   4 +-
 drivers/memory/tegra/tegra124-emc.c                |  16 +-
 drivers/memory/tegra/tegra20-emc.c                 |  20 +-
 drivers/memory/tegra/tegra20.c                     | 332 +++++++++++++++++++++
 drivers/memory/tegra/tegra30-emc.c                 |  18 +-
 include/soc/tegra/mc.h                             |   7 +
 12 files changed, 466 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
