Return-Path: <SRS0=8RcH=KE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B64C54798
	for <soc@archiver.kernel.org>; Tue, 27 Feb 2024 08:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1FD7C43399; Tue, 27 Feb 2024 08:08:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26D72C43394
	for <soc@kernel.org>; Tue, 27 Feb 2024 08:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26D72C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso5113435a12.2
        for <soc@kernel.org>; Tue, 27 Feb 2024 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709021280; x=1709626080; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3X6X6/tz50wnZDUvbb5WN4nVEsnFWe25Xdt4g8Ugnig=;
        b=WA1kvA+Syw7evEUN1gZFo/Wp45ldaDL4IEWgkBj6tWDP0C7iG3Os7HCizN/CuTF+dd
         RwIijcUqMv7Z1b4ueVLmo6v8v9e9x78cVvnRQyx+uPfqCiDyrV8dMGroo84TDUMlvUh8
         bVHaJTR7o5pQJF5G9YeFa3PXenDBwMURocTqscI6UAZrE5EGrYTApB9fxKJFkiZcDW73
         W/qPdW8l3d4SloLu2/nnLhSSGZ0dmQqJjZbq3OKg+yBG9bpT3XISziOeQc0Q6CK5tbCn
         nva+tPJ9j5avl5a6BS8TjcL5iOA9GRjusfX6Z0RJusyGhXC8IvBU1tzQy0eFENXE79+w
         cxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709021280; x=1709626080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X6X6/tz50wnZDUvbb5WN4nVEsnFWe25Xdt4g8Ugnig=;
        b=KvBC3SpJED0DcB3aJMqLPD6cngIyxZkOQuCYchQg6E2/B4eF24LubEAFpjXCgp9QUk
         AKRWmCnr1aJaVdSj/Y5OJGfdEY+GpWTzjfikz92Jt9HK+hKzVvmw7MQjMwIwNNX881L3
         Zr5d+dF/1i98Q/5O6NW+fidP43G41ZkOUPh3PjtclcNqBnUcg/5h+O9jWK+wwaIki13Q
         BWK35VVAgUHNTVHNHXOqwpigfHaCo5FncnfS7U6lqXqw2/dROi4OjfUK911ty4CDU5vM
         u4/a8d0s9Bqu7wmRf9ALo5D+HfPR5E33163tu73OtV6ddcSvHPMQoiNTGv98KbhaBOo0
         ZVdg==
X-Forwarded-Encrypted: i=1; AJvYcCWaR5ePV0LEabyjBczdWSdu5vn2yauopt/jpw5sxY23xZmYV1vumtaq+7wzl7DTtLnjU0qnerS4gmvRQJCoXw==
X-Gm-Message-State: AOJu0Yw/tMMMan8QaDn0ebfivaAihA86GTeviRGDxRriaCJWl8WaV7rM
	Y4kpO127WXBTbyk8CGfGIY3CBuwhc0do0ilC2sI/hw48/VIAs0yTAZTem2jiRIQ=
X-Google-Smtp-Source: AGHT+IFaapiS/FFG8BskCGhtgplEMxtjTEE3oU8cJgGqNh5gbBgUjZ/8L7PXjg1DmlNnflpw/Pm3Qw==
X-Received: by 2002:a05:6402:b2d:b0:564:87c1:a1e8 with SMTP id bo13-20020a0564020b2d00b0056487c1a1e8mr6917441edb.13.1709021280356;
        Tue, 27 Feb 2024 00:08:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b00564d7d23919sm509662edu.67.2024.02.27.00.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:07:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] samsung: drivers for v6.9, part two
Date: Tue, 27 Feb 2024 09:07:53 +0100
Message-Id: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 97d4b55111efd72926eb92cbd81c5ad8e6a7b3b1:

  MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries (2024-02-07 16:35:26 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.9-2

for you to fetch changes up to 746f0770f916e6c48e422d6a34e67eae16707f0e:

  watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs (2024-02-25 11:39:25 +0100)

----------------------------------------------------------------
Samsung SoC driver changes for v6.9, part two

1. Extend Exynos PMU (Power Management Unit) driver being also the
   syscon to main system controller registers block, to support Google
   GS101.  The Google GS101 has PMU registers protected and writing is
   available only via SMC.  The Exynos PMU will register its own custom
   regmap for such case of mixed MMIO+SMC.

2. Rework Samsung watchdog driver to get the regmap to PMU block not
   via syscon API, but from the Exynos PMU driver.  This is necessary
   for the watchdog driver to work on Google GS101.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      MAINTAINERS: samsung: gs101: match patches touching Google Tensor SoC

Peter Griffin (2):
      soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs
      watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs

 MAINTAINERS                            |   1 +
 drivers/soc/samsung/Kconfig            |   1 +
 drivers/soc/samsung/exynos-pmu.c       | 235 ++++++++++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h       |   1 +
 drivers/watchdog/Kconfig               |   1 -
 drivers/watchdog/s3c2410_wdt.c         |   8 +-
 include/linux/soc/samsung/exynos-pmu.h |  11 +-
 7 files changed, 250 insertions(+), 8 deletions(-)
