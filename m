Return-Path: <SRS0=zY6S=CA=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA1BC88CB2
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 17:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B96C3C433A0; Mon, 12 Jun 2023 17:55:14 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BCFFC4339B
	for <soc@kernel.org>; Mon, 12 Jun 2023 17:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BCFFC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-97668583210so681159466b.1
        for <soc@kernel.org>; Mon, 12 Jun 2023 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686592512; x=1689184512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Squ91Z4L8pOO8FBU1p7ZrCFyIyZdcQMOn+fzsX1h9Zg=;
        b=ez3iFojasVfZlCjJF3b+iCqKNMSw2Z6Xg7mDv4qemtPc8JGFBm3fWYFet2OKupt1kh
         yUPCP3VpVyETA/Ik65Tbyf46UdsESUpcw2BvBtyXMc0nuEctmPMGD4yxSzgFkQUgLzd1
         xzAiR0gq0Vm8jz24cO/zdTpBWDEca2qGRyzHWfQ9cm2QRqGaX5UeIZSWOJGNWHJUX/5h
         0klIoTx88JSrDC3VpuJimz4/pdNGbCbuqfCAh/CiqxOiJ86S9BpdDxcY5Yik7sGl2fS/
         XmyiIBZDU60LiidmpxkdT3QtO5LF+tMFrlnvxrL50S0L+EoORJyn64E7CBUSH7NXsxXG
         TuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686592512; x=1689184512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Squ91Z4L8pOO8FBU1p7ZrCFyIyZdcQMOn+fzsX1h9Zg=;
        b=KjdmNrt/SbuJr21Pt4/B42Zn84YaKnut9R/LaVUOTX0KyX7YYtkAa6zpi9LXiff8VI
         +d3VON3+Scf79u0dzohbqlAgv4AlNZEk8KTWUcfiJHXdHpR+zCHwTzHq0nFh5DXwrTb8
         ZWMQnTT6K0dqwIBqXSOGxO4suj+ixjisFs8Neeel4Bpw+AHSDKLTaWHhobhke1nkvyjj
         wEZ/Z6XtKVkre89h/SxPh4XSdJdYEcjEaLUOQDs0aqNOj0kQLlMS5wiZIqwXKh+YcU1Y
         MzyNTC97O33a8oPNyxoA9wihwteAwmAiM0xXDRGBN6IoR6hN/XUCTEWRDNpJYMuUqm5n
         tt3A==
X-Gm-Message-State: AC+VfDziv/BKLn0rpW5d1ipGt0JHPG23otxYh+g7kHYP+6MF6QHqJF3e
	lfk1LUWdE8GSWkXeGdGuluY2Bw==
X-Google-Smtp-Source: ACHHUZ7CckBJeuU9n3DZ+TVIpEDUbZdOoyPuxOcH4CnMt6cbKzBbmPiZKCHn0IGUgcuf97t4FmPMdA==
X-Received: by 2002:a17:907:7ea5:b0:96f:8ea4:a72c with SMTP id qb37-20020a1709077ea500b0096f8ea4a72cmr10259940ejc.62.1686592511772;
        Mon, 12 Jun 2023 10:55:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z6-20020a1709060ac600b009745ecf5438sm5470032ejf.193.2023.06.12.10.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 10:55:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.5
Date: Mon, 12 Jun 2023 19:55:08 +0200
Message-Id: <20230612175508.288775-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.5

for you to fetch changes up to 6a66fb9ffe7b4558c04f73593c01ee484a5c9ddf:

  dt-bindings: memory-controllers: drop unneeded quotes (2023-06-12 19:50:48 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.5

1. Renesas RPC IF: correct the Strobe Timing Adjustment.
2. Broadcom DPFE: fix smatch warning for testing array offset after use.
3. Atmel SDRAMC: drop driver because it was just a wrapper over enabling
   clock which is not handled by its clock controller.
4. Minor bindings cleanup.

----------------------------------------------------------------
Claudiu Beznea (1):
      memory: atmel-sdramc: remove the driver

Krzysztof Kozlowski (2):
      memory: brcmstb_dpfe: fix testing array offset after use
      dt-bindings: memory-controllers: drop unneeded quotes

Wolfram Sang (1):
      memory: renesas-rpc-if: Fix PHYCNT.STRTIM setting

 .../memory-controllers/nvidia,tegra20-emc.yaml     |  2 +-
 .../bindings/memory-controllers/ti,gpmc.yaml       |  2 +-
 arch/arm/mach-at91/Kconfig                         |  4 --
 drivers/memory/Kconfig                             | 11 ----
 drivers/memory/Makefile                            |  1 -
 drivers/memory/atmel-sdramc.c                      | 74 ----------------------
 drivers/memory/brcmstb_dpfe.c                      |  4 +-
 drivers/memory/renesas-rpc-if.c                    | 53 ++++++++++++----
 8 files changed, 44 insertions(+), 107 deletions(-)
 delete mode 100644 drivers/memory/atmel-sdramc.c
