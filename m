Return-Path: <SRS0=k7H9=52=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAC9C636CD
	for <soc@archiver.kernel.org>; Sun, 29 Jan 2023 14:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F6E4C433A0; Sun, 29 Jan 2023 14:39:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CA85C4339E
	for <soc@kernel.org>; Sun, 29 Jan 2023 14:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3CA85C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id bg26so586877wmb.0
        for <soc@kernel.org>; Sun, 29 Jan 2023 06:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vwCDrwzwASozRbMEd2/FLEyNdaiBVfiRFqS2U6PKXc=;
        b=Pm/FTmbEWjDAnrrTHvkJVTaTJjIiy6wc94E/+NvkP7UiES9qVlY1UDn/S4jZUOgLPc
         ORM+hKN5n7ic3IX7LIct5rfgeMWPC7SlNLrJxFW9agNNMoq6Ii0fNPghKcfpOvDWD7CQ
         tFYnO4LYjrvm/9vV6C7DRptNJBns+X78TUdIVXgaqW78KtqFNCT02Jmg29P823rJUUUM
         GqkYzTA5UPv1PrZEAuYNLgGDJMDUHwtgzfYOBc3+KIG7BqtR8p+2xegMO26EYLAPdHwG
         bHv4VYbWWMYDGcBRMnfbWkt1wh0nURzpaImp+O1RmZbz9QWhgmsuKwduc82U0qU+C3f7
         sXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vwCDrwzwASozRbMEd2/FLEyNdaiBVfiRFqS2U6PKXc=;
        b=eaFToEmcz3wsAJZi+mVAGUNybCUVjOK+ThjOOd0nWawlNwQ8rEpdnEA9ip3/CVkg+X
         xwWVBEVKNgGwg/rv8+1PM49jnTAbCEp4/lRLYGgFW2JSsLQhX9ZxBhNdVxOUqkQmDZc7
         BXBV/g5UIhuvVJ80vAbJm+WMkLnqLChfZf85VNt89Gmnobl+EwvoJIEP3clz+jIGXLVv
         nx9pk0OhDo1qu7FHPfI6a9bGy+GtVl1wXbU4l0bMC8ib2jOMrbVZUTyWKMXsU5+Yg0gV
         S57JxNig8+3br2eX7Q5EJ+T0D9p9b1EcizxuQug+KHXtJakJtx4ZFqRB9mic0hikjTDk
         H4qA==
X-Gm-Message-State: AFqh2kpp6zMOb3pw5z1PsMb2OG1kHSSxPo4Rh5WaUnfjQiAWC4rn+yK0
	Wp2n374+UraRNJybtY0DYZLWpw==
X-Google-Smtp-Source: AMrXdXv3fE5FTTFWA26uLIOONUJtpIGmWATa5HWqBPiG3vrqxwsYYqapa5akPDlv2UDeILCfAmhVYw==
X-Received: by 2002:a05:600c:c05:b0:3db:2252:e50e with SMTP id fm5-20020a05600c0c0500b003db2252e50emr38909020wmb.24.1675003190556;
        Sun, 29 Jan 2023 06:39:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db0bb81b6asm10477843wmb.1.2023.01.29.06.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:39:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: pull for v6.3
Date: Sun, 29 Jan 2023 15:39:44 +0100
Message-Id: <20230129143944.5104-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
References: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.3

for you to fetch changes up to fe6a952b567f6a771d087d2e969914f31574d6ab:

  dt-bindings: soc: samsung: exynos-pmu: allow phys as child (2023-01-29 11:36:10 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.3

1. Correct s3c64xx_set_timer_source() prototype.
2. Re-work MIPI and DP phys as children of Exynos PMU system controller.
   This both better reflects actual device hierarchy and allows to
   remove later few warnings from dtc W=1 and dtbs_check.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c: fix s3c64xx_set_timer_source prototype

Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: exynos-pmu: allow phys as child

 .../bindings/soc/samsung/exynos-pmu.yaml           | 71 +++++++++++++++++-----
 arch/arm/mach-s3c/s3c64xx.c                        |  3 +-
 2 files changed, 59 insertions(+), 15 deletions(-)
