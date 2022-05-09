Return-Path: <SRS0=/tLY=VR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06016C433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 16:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7EE1C385B3; Mon,  9 May 2022 16:08:13 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6348DC385B1
	for <soc@kernel.org>; Mon,  9 May 2022 16:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6348DC385B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id i19so27749553eja.11
        for <soc@kernel.org>; Mon, 09 May 2022 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOVuzkGtUFMZkUhl8LlnbBPQ227MlE7VyG3byjiP1jw=;
        b=mQA5pnSW3NegCJ5ZG+24oCq56yDE2BdbIvXVs7LcZWiDb6bgBUUOl7togdgVnSjexP
         KMWuvadAizO7/gDqhi+GKPU2kFR3v9nn9HSEKYMk/MaNjneK4FNHwD+i9VMSKSgOC5UI
         7DWsWOXoUG8p8OXWZZrwETGmieiZmeQXwNf3Zo9zE0LmNbztUWIudzmeeAx6rNgoWVSo
         G3Q2hhkvooCb4Y/GCTNmx8kXFqLsxKxEL5X4dqNz/1IZ4QOT/dVczpTQWq9ajJ4Ia5uF
         8ceoR0usOt8k2LuMgsLMexR8DBuflKuC6IV9cus4Fv0EUCS/ViJwQQklF8OhoZRCcLDg
         uxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOVuzkGtUFMZkUhl8LlnbBPQ227MlE7VyG3byjiP1jw=;
        b=r6VjoG1wmzcjZmzJFKyECJJebVpfQrkuoYa/QnJxGbubISYWEV3WFJfq59CQ4n9atJ
         65Dg1Oey7grmlUzlZ1fW3n2gubg9NyGT3mu2sQDzxY1rTTNBdUFdHqLnI5ApzymFuur3
         TlAQVGYuzz71BXfByZrxjved6hYhHbWjnqh7rBJQPzZGZZFpP6SoNpuop5nFSQ3HAHpV
         4Vi6Yrsl0X7i+//1I26+ZK4yqnmBd48qecYcnUNujusF/K6eG6CqEkRICALtfNwOq7a3
         gjeB65LV3On4LwrbRVcexDXBIN9azQeNIZHAveK/ZDZzdXYLVeQlQ638+HifzoTWYkNT
         bkQg==
X-Gm-Message-State: AOAM5306khcf/a7NRzEV6m3SiBew3WaG6vK4hHSGSN53br8gfANrkQ+i
	wEDXzqFMKe7D/7duCeYTZsEWvg==
X-Google-Smtp-Source: ABdhPJzdnVrZKcw9d2SLcvlOMJOYlVlkkba+emfNm8k6JJCsHoFH9gvBn4ng6PIjjG5EhiOkU+tr5Q==
X-Received: by 2002:a17:907:7dab:b0:6f4:6650:395d with SMTP id oz43-20020a1709077dab00b006f46650395dmr14833140ejc.82.1652112490673;
        Mon, 09 May 2022 09:08:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jl8-20020a17090775c800b006f3ef214e2dsm5157631ejc.147.2022.05.09.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 09:08:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [GIT PULL] memory: drivers: tegra for v5.19
Date: Mon,  9 May 2022 18:08:07 +0200
Message-Id: <20220509160807.154187-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Topic branch for Tegra specific memory controller drivers.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.19

for you to fetch changes up to 54a85e09f44c5fa322a2d186f50862d09f517225:

  memory: tegra: Add MC error logging on Tegra186 onward (2022-05-09 10:46:14 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.19 - Tegra SoC

Add support for Tegra234 memory controller and for logging memory
controller errors on Tegra186, Tegra194 and Tegra234.

----------------------------------------------------------------
Ashish Mhetre (2):
      memory: tegra: Add memory controller channels support
      memory: tegra: Add MC error logging on Tegra186 onward

Sameer Pujar (1):
      memory: tegra: Add APE memory clients for Tegra234

Thierry Reding (1):
      memory: tegra: Add Tegra234 support

 drivers/memory/tegra/Makefile       |   2 +
 drivers/memory/tegra/mc.c           | 137 +++++++++++++++++++++++++++++++-----
 drivers/memory/tegra/mc.h           |  50 ++++++++++++-
 drivers/memory/tegra/tegra186-emc.c |   3 +
 drivers/memory/tegra/tegra186.c     |  39 ++++++++++
 drivers/memory/tegra/tegra194.c     |   9 +++
 drivers/memory/tegra/tegra234.c     | 110 +++++++++++++++++++++++++++++
 include/soc/tegra/mc.h              |   8 ++-
 8 files changed, 339 insertions(+), 19 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra234.c
