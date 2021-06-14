Return-Path: <SRS0=R97b=LI=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910E8C2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:52:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6F33F6128C; Mon, 14 Jun 2021 19:52:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DDD61166
	for <soc@kernel.org>; Mon, 14 Jun 2021 19:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DDD61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lssct-0001Q3-JR
	for soc@kernel.org; Mon, 14 Jun 2021 19:52:03 +0000
Received: by mail-ed1-f71.google.com with SMTP id x8-20020aa7d3880000b029038fe468f5f4so20719536edq.10
        for <soc@kernel.org>; Mon, 14 Jun 2021 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g40NCw0isARf17PrJeRDjNgvRyngtExig+wrg1pV/+w=;
        b=UJtfTVgQYfw7dC/S0FrwJPXgZO/33Yb4gD9K1MbNwKxusBkUxarQsNZIaC8GOIQQ4p
         hksueNQdIVD4chaY2S7q8DnsvMy7MYQkx54Cpl6jGY1VT5d7JnUImxqURuHmsCSqY/+A
         xTbYhTC+o45KJvBT5GVcFj6eYBxkY9wtGYiFsDTvrSImhVAbnxcxssbiU39Uc327Hrpf
         L1A5aAyLr9/dFpHtr5CTcljgQDZNvGXtnY7BzahPirr7o6Kxqnu2LjSCsrk1U+eFgK5W
         fde9dF0sLfIllOMZK/qfWMRZhnEMEGdKmwZkaT1Du9ppNIUaKvCEsvC5v8taFQ2cBokl
         3onw==
X-Gm-Message-State: AOAM531tHKSjFZK544VaDoaz47DPjQ49erADkauebbWJW+GsxzBRUopm
	UUyCEVQmFCuEMSLHxnTPYmRmFjqBp1u4pkZ2R7jcIq+lZs2m+ZEjfpirdeHHu5s+VpLt42j9eQb
	EPJdm9KBBkAbJBhohcNJfKLQ=
X-Received: by 2002:aa7:d602:: with SMTP id c2mr19077456edr.317.1623700322986;
        Mon, 14 Jun 2021 12:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtT26zZF3miJH40zsNZX/PUVK61FfjtTB6IRaEhDKtCcrAFxyAPayK97nBxMkXlr8L+QTojA==
X-Received: by 2002:aa7:d602:: with SMTP id c2mr19077436edr.317.1623700322784;
        Mon, 14 Jun 2021 12:52:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id cx7sm9795335edb.65.2021.06.14.12.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:52:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Will Deacon <will@kernel.org>
Subject: [GIT PULL] memory: Tegra for v5.14, part two
Date: Mon, 14 Jun 2021 21:52:00 +0200
Message-Id: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Tegra got quite big rework this cycle.  The last piece comes from Thierry,
however it depends on one patch in Will's tree.  Since the last Thierry's
patches depend both on that one patch and other memory controller drivers
changes, they are here.

Best regards,
Krzysztof


The following changes since commit 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a:

  memory: tegra: Implement SID override programming (2021-06-03 21:50:43 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.14-2

for you to fetch changes up to 2c1bc371268862a991a6498e1dddc8971b9076b8:

  iommu/arm-smmu: Use Tegra implementation on Tegra186 (2021-06-11 08:44:53 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Tegra SoC, part two

Second set of changes for Tegra SoC memory controller drivers,
containing patchset from Thierry Reding:

"The goal here is to avoid early identity mappings altogether and instead
postpone the need for the identity mappings to when devices are attached
to the SMMU. This works by making the SMMU driver coordinate with the
memory controller driver on when to start enforcing SMMU translations.
This makes Tegra behave in a more standard way and pushes the code to
deal with the Tegra-specific programming into the NVIDIA SMMU
implementation."

This pulls a dependency from Will Deacon (ARM SMMU driver) and contains
further ARM SMMU driver patches to resolve complex dependencies between
different patchsets.  The pull from Will contains only one patch
("Implement ->probe_finalize()").  Further work in Will's tree might
depend on this patch, therefore patch was applied there.

On the other hand, this ("Implement ->probe_finalize()") patch is also a
dependency for ARM SMMU driver changes for Tegra.  These changes,
bringing seamless transition from the firmware framebuffer to the OS
framebuffer, depend on earlier Tegra memory controller driver patches.

----------------------------------------------------------------
Dan Carpenter (1):
      memory: tegra: Delete dead debugfs checking code

Krzysztof Kozlowski (1):
      Merge branch 'for-thierry/arm-smmu' of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux into for-v5.14/tegra-mc

Thierry Reding (5):
      iommu/arm-smmu: Implement ->probe_finalize()
      dt-bindings: arm-smmu: Add Tegra186 compatible string
      iommu/arm-smmu: tegra: Detect number of instances at runtime
      iommu/arm-smmu: tegra: Implement SID override programming
      iommu/arm-smmu: Use Tegra implementation on Tegra186

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 11 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c         |  3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c       | 90 +++++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 13 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  1 +
 drivers/memory/tegra/tegra124-emc.c                |  4 -
 drivers/memory/tegra/tegra20-emc.c                 |  4 -
 drivers/memory/tegra/tegra210-emc-core.c           |  4 -
 drivers/memory/tegra/tegra30-emc.c                 |  4 -
 9 files changed, 96 insertions(+), 38 deletions(-)
