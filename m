Return-Path: <SRS0=O1yF=P2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94899C54735
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 12:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67A6EC6104D; Tue, 27 Aug 2024 12:29:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AC93C6104A
	for <soc@kernel.org>; Tue, 27 Aug 2024 12:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AC93C6104A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37353ba8eddso45230f8f.0
        for <soc@kernel.org>; Tue, 27 Aug 2024 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761770; x=1725366570; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fL31jwiSCqggQr8vCejcnZYNEtXeVayNVEVXtcMxsQo=;
        b=KBM+4c7ObSnPsIIaoroUQq9CLjheE8XtrbUiZ5Sbj1a7ki9B3Xnk77l2jpxZDzL9+X
         CLrsp7eitZC7FH0VIFspdOAacAs+FKFGO1YpWvQDqmiYpyR34kNCqKDNud/Q7NG+DPO5
         GHm/ZJRMD2EvwwcMcxwYrj2GpsgvNjdLdkxjfaZ9ukIOXBi1j4ioh+8q4CURXZTkv8fp
         6Pi6Db4MGp9r8WkGiwn62j2Qe/c/6AJRseybU/36y/fk8aK0Nl8v10YUd1i3rKGQ5k7r
         80LWuHrjxrPDnCzUjbr+i46Mw1VgAShGeom1GBTsmqMesHczDwRPILlg6OX85H3B1kPr
         WPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761770; x=1725366570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fL31jwiSCqggQr8vCejcnZYNEtXeVayNVEVXtcMxsQo=;
        b=eO/ndy4Gd0s9rimz/NfTR6e5B9kiv6w3t3oo0GBFYefIHT4NqWW1+fedzP29BE8xys
         PUVo40NQWW/tZJQXqFZlKvnd7z7wfQht3PWhy3Sgvd8pOOPX1tcj1pcipQjOSCVW0h66
         a1QSq1rENB8S4/hB8uCe7JTsI34PT6fodMg9EB0+MGiz6FVmkKZqk3VCHdhLUohozJSb
         6L77HO2wQ9ZlzHOwsckjDxg4OeSp0rXJBHCbQtOJYAQ193jUadzE3XgF9d9t6nN8KYRm
         6lpOzgNAiPBBWgYD0L+3RN2Mk7mesGkYu6+PDEgUw0xu0SYNas0iuNF3uMgpRP7oWsjd
         DxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzDCX0/ToYNqSOnijfe2koJpWM+o480DSIUnJ2FIKcjZxKi28Zoq3geqtG/VrwXMWJeMk=@kernel.org
X-Gm-Message-State: AOJu0YwXe9unl/+X4UKHvUy7fEAI0CkQhdUHuBaerI7wAWe86LPdXBDr
	sYEIqpvpMgSVH/sN0oVfAprRYQhfytjymtZqfS1ydbKZz9xr12ZJnMGN7xWBoVAA01DZsLue2eA
	4
X-Google-Smtp-Source: AGHT+IEs/GSUZdufo34i3JJju+48AQe7CSrCAmrcnZ54qyfZuxk0qpho9VhpbqydQfb6yzephaTVZQ==
X-Received: by 2002:a5d:648e:0:b0:373:6bf:9608 with SMTP id ffacd0b85a97d-37311843370mr5383974f8f.2.1724761770204;
        Tue, 27 Aug 2024 05:29:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730821a9fcsm12900533f8f.94.2024.08.27.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:29:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.12
Date: Tue, 27 Aug 2024 14:29:25 +0200
Message-ID: <20240827122926.30794-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I might have one more smaller pull request coming later.

Best regards,
Krzysztof


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.12

for you to fetch changes up to ff390189b7f2cfa20c644bc58b4462b5e2621838:

  memory: mtk-smi: Use devm_clk_get_enabled() (2024-08-25 11:02:17 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.12

1. Tegra210 EMC: Driver refactoring and rework.
2. Tegra186 EMC: Drop unused function.
3. FSL WEIM: Correct fsl,weim-cs-timing property to properly validate it
   as an array.
4. TI AEMIF: Drop platform data support.
5. TI EMIF: Switch to of_property_read_bool().

6. Several cleanups in multiple drivers: TI AEMIF and EMIF, Tegra
   EMC/MC, Atmel EBI, Samsung Exynos5422 DMC, STM32 FMC2 EBI, OMAP GPMC,
   PL172 and PL1353 SMC.  These are mostly code simplifying around
   probe() like using
    - devm_clk_get_enabled(),
    - dev_err_probe(),
    - scoped device node handling (cleanup.h),
    - scoped for each OF child loops,
    - scoped/guard locks.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      memory: ti-aemif: remove platform data support
      memory: ti-aemif: use devm_clk_get_enabled() and shrink the code
      memory: ti-aemif: don't needlessly iterate over child nodes
      memory: ti-aemif: Revert "memory: ti-aemif: don't needlessly iterate over child nodes"

Diogo Ivo (7):
      memory: tegra: Remove periodic compensation duplicate calls
      memory: tegra: Move DQSOSC measurement to common place
      memory: tegra: Reword and correct comments
      memory: tegra: Change macros to interpret parameter as integer
      memory: tegra: Loop update_clock_tree_delay()
      memory: tegra: Move compare/update current delay values to a function
      memory: tegra: Rework update_clock_tree_delay()

Krzysztof Kozlowski (21):
      memory: tegra186-emc: drop unused to_tegra186_emc()
      dt-bindings: memory-controllers: renesas,rpc-if: add top-level constraints
      memory: atmel-ebi: use scoped device node handling to simplify error paths
      memory: atmel-ebi: simplify with scoped for each OF child loop
      memory: samsung: exynos5422-dmc: simplify dmc->dev usage
      memory: samsung: exynos5422-dmc: use scoped device node handling to simplify error paths
      memory: stm32-fmc2-ebi: simplify with scoped for each OF child loop
      memory: stm32-fmc2-ebi: simplify with dev_err_probe()
      memory: tegra-mc: simplify with scoped for each OF child loop
      memory: tegra124-emc: simplify with scoped for each OF child loop
      memory: tegra20-emc: simplify with scoped for each OF child loop
      memory: tegra30-emc: simplify with scoped for each OF child loop
      memory: ti-aemif: simplify with dev_err_probe()
      memory: ti-aemif: simplify with scoped for each OF child loop
      memory: emif: drop unused 'irq_state' member
      memory: emif: simplify locking with guard()
      memory: omap-gpmc: simplify locking with guard()
      memory: pl172: simplify with dev_err_probe()
      memory: pl172: simplify with devm_clk_get_enabled()
      memory: pl353-smc: simplify with dev_err_probe()
      memory: pl353-smc: simplify with devm_clk_get_enabled()

Rob Herring (Arm) (2):
      memory: emif: Use of_property_read_bool()
      dt-bindings: memory-controllers: fsl,imx-weim: Fix "fsl,weim-cs-timing" schema

Rong Qianfeng (1):
      memory: mtk-smi: Use devm_clk_get_enabled()

 .../memory-controllers/fsl/fsl,imx-weim.yaml       |  25 +-
 .../memory-controllers/renesas,rpc-if.yaml         |   4 +-
 drivers/memory/atmel-ebi.c                         |  35 +-
 drivers/memory/emif.c                              |  31 +-
 drivers/memory/mtk-smi.c                           |   6 +-
 drivers/memory/omap-gpmc.c                         |  24 +-
 drivers/memory/pl172.c                             |  30 +-
 drivers/memory/pl353-smc.c                         |  50 +--
 drivers/memory/samsung/exynos5422-dmc.c            |  90 ++--
 drivers/memory/stm32-fmc2-ebi.c                    |  23 +-
 drivers/memory/tegra/mc.c                          |  11 +-
 drivers/memory/tegra/tegra124-emc.c                |   7 +-
 drivers/memory/tegra/tegra186-emc.c                |   5 -
 drivers/memory/tegra/tegra20-emc.c                 |   7 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c      | 455 +++++----------------
 drivers/memory/tegra/tegra30-emc.c                 |   7 +-
 drivers/memory/ti-aemif.c                          |  74 +---
 include/linux/platform_data/ti-aemif.h             |  45 --
 18 files changed, 236 insertions(+), 693 deletions(-)
 delete mode 100644 include/linux/platform_data/ti-aemif.h
