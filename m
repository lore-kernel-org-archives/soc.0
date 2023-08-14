Return-Path: <SRS0=SbT8=D7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE8FC001B0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 12:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E712C433C8; Mon, 14 Aug 2023 12:00:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42D03C433CA
	for <soc@kernel.org>; Mon, 14 Aug 2023 12:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42D03C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c93638322so876122766b.1
        for <soc@kernel.org>; Mon, 14 Aug 2023 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692014455; x=1692619255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUdIDf7zWkQ1oZDqOD5DaWZEhwUPDaqe+wZ5bmsclQw=;
        b=BVCX5P+if0bPpKH4BJKmo4xu6FxdU8+GfcMcPXOd6In2+meECsJErTt9nSwuUCAlsu
         zFIerEZDcMMtL1iCIyhTn+/qhNOSwB/QOtaJVRMZXoK4LB/3DZkMR+EYQxqLcxO7Lw4H
         f0Hx9IGlFgOKU/I30JlC2ay6pZEN/6sCEGkrgz/lIHFJehP6iUJOgPruGgf0VqDwg9yA
         1blr9himQBipW54+lAFFL7N8wwjSejADbyc2UhkMzo6sal0Mtwq2pTAZ/B4qQ8eVsKLh
         lXjETXvHp9AwKkeqGMSW2QMlaUKxSyhJz+v4d/GZxzRrIyhB3JgHE1shvYabOoCoRSut
         /3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692014455; x=1692619255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUdIDf7zWkQ1oZDqOD5DaWZEhwUPDaqe+wZ5bmsclQw=;
        b=BQriBb3hZsSoDxPI0VkbwatFRruG7sX4We1uIyR8I8iZcT3rAX67sUJ4UECxKIFgMJ
         OmycUz1L4kOKyMuy/Rb0RfL80+SVkdi2blhTCv7xLQ2ed40E9L9erR/Ejf9qGL4QbRqW
         ckVUBC1hR6AMzkbR528d5DOm3geI7hpJkDtQ66cv3ph++97aGw0leF+qIuwXPeozTRyX
         aAxbMgNLQg9bIWJw9y1pm3FQd9nNNQVbnCeCLI2+uAfBT6h2atL5+8BeO0S4ImKQkZky
         0wsDSWeY2yQu2LPAiZCBSo+Fv6pk43z1UaoB3lTP4L2oucANXgz+YSPNOInNgq4Gq0sp
         Vtxw==
X-Gm-Message-State: AOJu0YxarJ2HtCLSbwThpAYe0x+zz1gYHP8cDTvbh5cXYS+WTr5jlVte
	kMaKKsjTTK6Y+cGRQyM546Joqg==
X-Google-Smtp-Source: AGHT+IEIPxRWYGp5QGk28mUiSI7xgxjdFBG2ZwHkOcklXyO3RRtc06fihc+rBvtalMHVsb02wJR+cA==
X-Received: by 2002:a17:907:2c59:b0:99c:ae54:6654 with SMTP id hf25-20020a1709072c5900b0099cae546654mr10285817ejc.14.1692014455190;
        Mon, 14 Aug 2023 05:00:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090622cc00b009929d998abcsm5582034eja.209.2023.08.14.05.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 05:00:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.6
Date: Mon, 14 Aug 2023 14:00:52 +0200
Message-Id: <20230814120052.27485-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of my previous fixes pull (tag: memory-controller-drv-fixes-6.5),
because of code dependency.

The memory-controller-drv-fixes-6.5 includes two commits not listed in below
git-pull-diff:

      memory: tegra: make icc_set_bw return zero if BWMGR not supported
      memory: tegra: Add dummy implementation on Tegra194

Best regards,
Krzysztof


The following changes since commit faafd6ca7e6e7100d21d3f43ec17674f36c9f843:

  memory: tegra: make icc_set_bw return zero if BWMGR not supported (2023-07-25 22:09:20 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.6

for you to fetch changes up to 35bd78cf252245f11dd1c9d5f1b414c25e727b5a:

  memory: tegra: add MC client for Tegra234 GPU (2023-08-05 09:01:31 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.6

1. Tegra:
 - Extend support for Tegra234 SoC Memory Controllers with DRM and GPU
   clients.
 - Tegra186: Skip MRQ DVFS where it is not supported and do not fail
   probe.
2. Wide cleanup of DT includes.
3. Devicetree bindings:
 - Reference common peripheral (client) properties in Ingenic NEMC and
   TI GPMC.
 - Convert Davicom DM9000 to DT schema.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      dt-bindings: memory-controllers: ingenic,nemc: reference peripheral properties
      dt-bindings: memory-controllers: reference TI GPMC peripheral properties
      dt-bindings: net: davicom,dm9000: convert to DT schema

Rob Herring (1):
      memory: Explicitly include correct DT includes

Sumit Gupta (4):
      memory: tegra: sort tegra234_mc_clients table as per register offsets
      memory: tegra: Add clients used by DRM in Tegra234
      memory: tegra: add check if MRQ_EMC_DVFS_LATENCY is supported
      memory: tegra: add MC client for Tegra234 GPU

Thierry Reding (1):
      memory: tegra: Prefer octal over symbolic permissions

 .../bindings/memory-controllers/ingenic,nemc.yaml  |   1 +
 .../memory-controllers/mc-peripheral-props.yaml    |   2 +
 .../devicetree/bindings/net/davicom,dm9000.yaml    |  59 ++
 .../devicetree/bindings/net/davicom-dm9000.txt     |  27 -
 drivers/memory/brcmstb_dpfe.c                      |   3 +-
 drivers/memory/da8xx-ddrctl.c                      |   1 -
 drivers/memory/fsl_ifc.c                           |   2 +-
 drivers/memory/jz4780-nemc.c                       |   1 -
 drivers/memory/pl353-smc.c                         |   1 +
 drivers/memory/renesas-rpc-if.c                    |   1 -
 drivers/memory/samsung/exynos5422-dmc.c            |   2 +-
 drivers/memory/stm32-fmc2-ebi.c                    |   2 +
 drivers/memory/tegra/mc.c                          |   2 +-
 drivers/memory/tegra/tegra124.c                    |   2 +-
 drivers/memory/tegra/tegra186-emc.c                | 136 ++---
 drivers/memory/tegra/tegra186.c                    |   3 +-
 drivers/memory/tegra/tegra20.c                     |   3 +-
 drivers/memory/tegra/tegra210-emc-core.c           |   4 +-
 drivers/memory/tegra/tegra234.c                    | 620 +++++++++++++--------
 drivers/memory/tegra/tegra30-emc.c                 |   2 +-
 drivers/memory/tegra/tegra30.c                     |   2 +-
 21 files changed, 526 insertions(+), 350 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/davicom,dm9000.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/davicom-dm9000.txt
