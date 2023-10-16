Return-Path: <SRS0=fNzu=F6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA0CDB482
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 07:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7514C433C8; Mon, 16 Oct 2023 07:29:20 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3D62C433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 07:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3D62C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso671639066b.2
        for <soc@kernel.org>; Mon, 16 Oct 2023 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697441357; x=1698046157; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzKbeL+RltdAkMywXo6rwpyMCBTadikUP8iBiYw2KH8=;
        b=Z9XboPFmQsNPk9pvkQbw4wccAm8pZSSbgY2+8ssjGFNsCd9GhWItM1N4+UwGolcHOu
         3vQr3VYupep+ZFzyTRneuFrxtoZa6V+Nx+sAkDyaG4Q8Bgd8DRZCFqmWELEBUYXE93mA
         DTUh5Bc4yprl+fai+SaQyBOtKgbnhQG59Cim2SR2o/g+/EfapVCIU6NZ73N3y0zg+TzH
         YSl5HqF/AfGIp7DuqfFYNbMvXeb2AZ0mDranKldRnsgrPkAXJm7jZcX0HMTgLY86ot2r
         zzBshrcZoChWkZG0uwz0gXZ24QqQdu+/ow/ugamG5hOGk7x76/aCfJV/cN3a25CdUznD
         SAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441357; x=1698046157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzKbeL+RltdAkMywXo6rwpyMCBTadikUP8iBiYw2KH8=;
        b=fAxelq6x1fj5ypv+XPDH1g7SI6/x08efDOxvdLeR0T/+KbnEl5Nm+gINtesuBKann/
         ycj8LAynEBkvG3ydOs30vzDmUiodYltZ/eAEvN3ARGfjHUX0ZtNP5tnd9DC01U4UOoK5
         ofsz2OB7MZ/4jp2qP3RzU/RLZfpOj5G/L18LTv006+t2PnRF5EkrvmiTtDi8YLnN0wEP
         fAbqLeAC/5Uybcur3MiLwpjNJiys2XOkAA7bbXKkd6r79gF3yzaBzt+trLVLMT2owr6G
         gYR7RETQ8MwAIUweyCf8I6aXKwuoUJKbC27J7hpaV0xL4X1ilPk7skSgPDfLqBf5/j3y
         XW1Q==
X-Gm-Message-State: AOJu0YyZZ3ZZcTE4U+lMjcdCiZEM5F/61eFxT4sQpZde6Fo8iSTWxL49
	xEDgcQHnMHVyEqpOPIReTI1wmg==
X-Google-Smtp-Source: AGHT+IGYRxGC8BqeUozOgg4NTbh/Jlhq/lYDZ8UNbvwPqpI4s0ghq19dNlzi0lfqffb4DNNxhWxA5w==
X-Received: by 2002:a17:906:3012:b0:99d:e617:abeb with SMTP id 18-20020a170906301200b0099de617abebmr27876199ejz.23.1697441357118;
        Mon, 16 Oct 2023 00:29:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090606c300b009b29668fce7sm3480791ejb.113.2023.10.16.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:29:16 -0700 (PDT)
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
Subject: [GIT PULL 1/2] ARM: defconfig: pull for v6.7
Date: Mon, 16 Oct 2023 09:29:10 +0200
Message-Id: <20231016072911.27148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.7

for you to fetch changes up to 438fb575463fc490e6200e5e28d02159492a97f8:

  ARM: exynos_defconfig: add driver for ISL29018 (2023-10-06 13:57:37 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v6.7

Enable several drivers for boards with Samsung Exynos ARM SoCs in
exynos_defconfig and multi_v7_defconfig: display PHYs, AHCI DWC, TM2
touchkey (used on ARM and ARM64 Exynos-based boards), Samsung camera
sensors and Intersil 29018 light sensor.

Enable also IIO in s5pv210_defconfig used by MAX17040 fuel gauge driver.

----------------------------------------------------------------
Marek Szyprowski (6):
      ARM: multi_v7_defconfig: make Exynos related PHYs modules
      ARM: multi_v7_defconfig: add AHCI_DWC driver
      ARM: exynos_defconfig: replace SATA_AHCI_PLATFORM with AHCI_DWC driver
      ARM: multi_v7_defconfig: add tm2-touchkey driver
      ARM: multi_v7_defconfig: add drivers for S5C73M3 & S5K6A3 camera sensors
      ARM: exynos_defconfig: add driver for ISL29018

Svyatoslav Ryhel (1):
      ARM: s5pv210_defconfig: enable IIO required by MAX17040

 arch/arm/configs/exynos_defconfig   | 3 ++-
 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 arch/arm/configs/s5pv210_defconfig  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)
