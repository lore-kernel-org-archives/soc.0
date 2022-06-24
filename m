Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E45C433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6553FC341C0; Fri, 24 Jun 2022 08:18:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 945C1C34114
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 945C1C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id z19so2323546edb.11
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVB8bxx/r3S0fdgYdnv0n6Orbk3zdo+20SameD8/IKc=;
        b=h1oK/vu/uSxYa5LkNyd81gudxYa95rDOqzAavEXzV+f0GyVRNjKdN8pPA3mXK418xG
         rBYWIs83RfC3BkFrlQerH89Pa89ZxxiG0P5A4obM1r5X5PPKSRwYQ3rg1z1tlmD+fCpr
         +EKpEXbvvRhD0teOgVgPpJ/IuznJx+bk/+3uYfJ1RerThkowl9zTOkZCsf//lJK3jlka
         Epuyw14kA0b1v5zd8+9ktnmlHr6iQdpsjirkhX2+SJBQOSDM+70gO4f8jBVuVmGlHJNV
         LT43hlt2pTxvI0fe8XEaUn3ppYYkzku/ENo+LFEHoV173tfnSHFWNyUOUG7k3Bvk8pm+
         1baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qVB8bxx/r3S0fdgYdnv0n6Orbk3zdo+20SameD8/IKc=;
        b=f0fbfQlWDlwxBO1NEwCaHlQcmZb4U7pbQlBtrr6zFPpDndfPa/4bEf8+9aYTqoFjZ4
         rl11g+oNCmzH9So0BzbtxXBg4QQeaYwTFhrvAccmF8cyrrEWpCM7jSDTqOwkmaguCJ9+
         /8YrnWS7R/IlPQ5YfibeFnmr2ND7lKlLKkkTFJBuD3dlHYJW/3MDwkbbizfGXYb3MRRa
         ET/NaGfRcInj+OgjG+Cw3NHFNxCrJ8ZOBFpXBb8W4PrmKzLQdJghWcYuzEsbO3OXR+Hf
         JP8a3TvF9vIsfWvAz6yWPwkT9LTjT2lItwPTNHUWIpLPFDru6jYN8vPqk5Idgqy9OgS3
         F8Tw==
X-Gm-Message-State: AJIora/2/6IMdR9BXSclF+VFNSZPBLmF6hpsrmGwIoLEehFi6dnQ7rsb
	sJv481qWGGOpJiXrDbl73d5UeA==
X-Google-Smtp-Source: AGRyM1vHr4xowKwQ5Nwu/LWw9TGrDN7QBcEOmV5mZLUL+m+jloOePEt0fBnbVZQzfQD0OBvHj1ZtAg==
X-Received: by 2002:aa7:d6c9:0:b0:435:6698:589a with SMTP id x9-20020aa7d6c9000000b004356698589amr16029481edr.59.1656058703927;
        Fri, 24 Jun 2022 01:18:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906705600b00703e09dd2easm701619ejj.147.2022.06.24.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:18:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] memory: fixes: for v5.19
Date: Fri, 24 Jun 2022 10:18:19 +0200
Message-Id: <20220624081819.33617-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-5.19

for you to fetch changes up to 1332661e09304b7b8e84e5edc11811ba08d12abe:

  memory: samsung: exynos5422-dmc: Fix refcount leak in of_get_dram_timings (2022-06-06 11:18:20 +0200)

----------------------------------------------------------------
Memory controller drivers - fixes for v5.19

Broken in current cycle:
1. OMAP GPMC: fix Kconfig dependency for OMAP_GPMC, so it will not be visible
   for everyone (driver is specific to OMAP).

Broken before:
1. Mediatek SMI: fix missing put_device() in error paths.
2. Exynos DMC: fix OF node leaks in error paths.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      memory: omap-gpmc: OMAP_GPMC should depend on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3

Miaoqian Lin (2):
      memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common
      memory: samsung: exynos5422-dmc: Fix refcount leak in of_get_dram_timings

 drivers/memory/Kconfig                  |  1 +
 drivers/memory/mtk-smi.c                |  5 ++++-
 drivers/memory/samsung/exynos5422-dmc.c | 29 ++++++++++++++++++-----------
 3 files changed, 23 insertions(+), 12 deletions(-)
