Return-Path: <SRS0=bw02=5T=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A12C54EB4
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 12:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E69F1C4339C; Sun, 22 Jan 2023 12:26:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB40BC433D2
	for <soc@kernel.org>; Sun, 22 Jan 2023 12:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB40BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so8772968wml.3
        for <soc@kernel.org>; Sun, 22 Jan 2023 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMQ10RBmLGcQFRoj4Vv+LHDJlKcFXLJnPbw9MQ53bW0=;
        b=dpL32Fe0H297Vx10D2uKYUw0KIxhov0SZxFNqLMop/RPQB443mWBRf0/uXZ14h2Tnq
         4Fl1Qf/xlK/PE6LHY3iVt+gbrHdWTkrtaR9RTH5lEd9YwlSeMOJ1FvdgjhF4SEXn6zte
         9pd1tvARt9J5fHWAF2oKpFGfJaYJomEtX6uIg2xMzxo62ZOa+zsk4fAd2DewrFusd7j1
         RLJLV8ozyKonMmzYlcQFaHaaBcr+friy+4kgs3UUFK9yC6KUoxMronnuMktEJQV/O3da
         c/fB6jIdDGXQYBm4W2yKHboUMuZagF68EOX+oxaabTMHJepdSm973wpTzL9SuXtdC98C
         J+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMQ10RBmLGcQFRoj4Vv+LHDJlKcFXLJnPbw9MQ53bW0=;
        b=ubcVzB3Es1ZK8TAabcNOqvuvGKxR6gr2m9OZ+4znJ+D8I01gp1m1vNuz1MjSWcqXNa
         79lARqhr7V1Zo7hMWw1/7RB5Gzh1DEyVsKg5k7lKvngjUKgBqxqqsOnvDal/Oe90peOC
         /w4bQBXQWdQ5YPMED9UDPVgJJUYGI+hHYlgaWppFCM/qzEMUnvqbwGtU/2Y4RupS8FfY
         z6tPUxYuAzvb/36c8lxsEHe2dKUsHMcxMseviTxlsNgkPnflMKFWiP5Gu6dN3S3kYBg/
         OAibitlGtpgEfiOt5BCb0yb7i9djG8PXCcH+YoEVlfdo+OUr7DrqwpNLwDlqcGmI4Emh
         aIEQ==
X-Gm-Message-State: AFqh2kp8Vqvy9gvIPnDKQr/efWk3DqkU5zYtodS52gAsS7sr0I0Cnaf5
	ArgT5ON/352rpSa3Wz+BjcH1jg==
X-Google-Smtp-Source: AMrXdXthFm7tjzb2lm692mvw4lLPvhCBI7Wz1PepK28R53R6k/QxYdC87b0fNYtMjDUf+mIpbEHWcg==
X-Received: by 2002:a05:600c:1d22:b0:3d9:6bc3:b8b9 with SMTP id l34-20020a05600c1d2200b003d96bc3b8b9mr20671700wms.9.1674390371217;
        Sun, 22 Jan 2023 04:26:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b003d9aa76dc6asm10663808wmq.0.2023.01.22.04.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 04:26:10 -0800 (PST)
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
Subject: [GIT PULL] arm64: dts: samsung: for v6.3
Date: Sun, 22 Jan 2023 13:26:05 +0100
Message-Id: <20230122122605.30720-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230122122605.30720-1-krzysztof.kozlowski@linaro.org>
References: <20230122122605.30720-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Tesla and Exynos ARM64 DTS.

Best regards,
Krzysztof


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.3

for you to fetch changes up to 56a14f01a54568e049e22c46ffc654602bbd01d1:

  arm64: dts: fsd: Add sound card node for Tesla FSD (2023-01-17 12:15:39 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.3

1. Add L2 cache properties (Exynos, Tesla FSD).
2. Tesla FSD: add Bosch MCAN (CAN bus), sound card (audio card with
   codec and I2S controllers), system controller nodes.
3. Tesla FSD: correct pin pull up/down properties to match
   recommendation in user manual.
4. Minor cleanups: use dedicated/specific sysreg compatibles, fix
   dtbs_check warnings, drop unsupported properties1

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos5433
      arm64: dts: exynos: use 8-bit for SPI IR LED duty-cycle in TM2
      arm64: dts: exynos: drop pwm-names from MAX77843 haptic in TM2
      arm64: dts: exynos: drop clock-frequency from CPU nodes in TM2
      arm64: dts: exynos: correct properties of MAX98504 in TM2
      arm64: dts: exynos: drop unsupported I2C properties in Espresso

Padmanabhan Rajanbabu (4):
      arm64: dts: fsd: fix PUD values as per FSD HW UM
      arm64: dts: fsd: Add I2S DAI node for Tesla FSD
      arm64: dts: fsd: Add codec node for Tesla FSD
      arm64: dts: fsd: Add sound card node for Tesla FSD

Pierre Gondois (2):
      arm64: dts: exynos: Update cache properties
      arm64: dts: fsd: Update cache properties

Sriranjani P (3):
      arm64: dts: fsd: add sysreg device node
      arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos850
      arm64: dts: exynos: add dedicated SYSREG compatibles to Exynosautov9

Vivek Yadav (1):
      arm64: dts: fsd: Add MCAN device node

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  11 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |  24 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   2 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   2 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   9 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |  69 ++++++++++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  54 ++++++++-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 124 +++++++++++++++++++++
 9 files changed, 270 insertions(+), 31 deletions(-)
