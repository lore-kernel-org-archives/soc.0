Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F9AC48BF6
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA8EBC433F1; Sun, 18 Feb 2024 18:21:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00A2CC433A6
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00A2CC433A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3392b12dd21so2091560f8f.0
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280508; x=1708885308; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBUvsJh7J3bbNyhiGiF4j3z5FqJ0WMiX5JDP4IiaR8=;
        b=u1pBUGKhn4jZOkRF5DZ4u7QeRTVDAg1iK4LJIVbIv1P1jfNtZrwp9fBtQMA8vNb/1W
         +MiSOChx9zOwcfgyi6wt9gSgbhLhpvjVQb9RM2mwVvwObN+NBxvF4c4aN6avDS9VGXa+
         Gf9sWhErRXPuf3bnakRBYmsq1YNUmQWF8Sw5bXgxxHstmr2NVKlc0Hy00J95ekgMK18Y
         PGEvtFwA6aNGGBm9bjJMkb+aD2kBknaIc3RE6eeMjKB6tgOhwsywKhhgda51/nY/v+U3
         sgIkL85V1f5gyOIJkckbp7jOjBWhz9ReASB8f9I4aH/sOEY5EdAm6FTZC+wU4Qr4NQ0U
         Rp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280508; x=1708885308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgBUvsJh7J3bbNyhiGiF4j3z5FqJ0WMiX5JDP4IiaR8=;
        b=j375wx3QZCiF4yH/kHHGJDDzy1C/lvFUAJOM90f+HelOZTEAGDEAbZ6ZX9ez00hbcm
         kql+AZn8Vq1i2J0z3WWN5Kkyo1LwIC2v1SMVrUvaPaQappmiTQvj6FTuR6Reb3P9lH2l
         Cxxjk7dujRjx/lLMN4D+5d5dxfuoNGA8KiNbMd2OL4QuV7/tu3o2YHCvbfjOBhKX7TDH
         eWOADY99r0L/Uv/slOlFk4P43Ezrk6ae5SPPwvnWuJC2yU7+By61XWMKNslnhuYfWVXA
         R0JNROhCG8gilJyuGJ2yH/K62F50X0DwBlULCmBQDjC9sZo7w3HUezpIrdwR3Fybk2il
         oq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWatOtHMFoJdloFdKv+0S8VJRlO8vdYGeAA2SZtKxy0Nq1LXodx5JCRy97/ysUubUOg411v/NtEpISe+3D0Cg==
X-Gm-Message-State: AOJu0YwGC8dQcgNFYTbevo+FVgU15RkXgv3YlQpcjAE5yNjDzpSwjtje
	bBeCBrpKLKqtg8VfnUrqiqLNdwSJXB/6M5fZ65z5HhITHaugMIjX4wyhG6s+uNk=
X-Google-Smtp-Source: AGHT+IEMWzddT4jRRM3mO0QYTgawsI5pX0vK8dPJPiXyovwwBFb00vCi6jL6NpInJqDKlgAVNajVuA==
X-Received: by 2002:adf:f352:0:b0:33d:1145:8787 with SMTP id e18-20020adff352000000b0033d11458787mr6409743wrp.25.1708280508015;
        Sun, 18 Feb 2024 10:21:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:47 -0800 (PST)
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
Subject: [GIT PULL 2/4] arm64: dts: samsung: exynos and google for v6.9
Date: Sun, 18 Feb 2024 19:21:39 +0100
Message-Id: <20240218182141.31213-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.9

for you to fetch changes up to 0791f541ff42f0ba7301f8caa7f3ab257284dc8f:

  arm64: dts: fsd: Add fifosize for UART in Device Tree (2024-02-12 14:21:29 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.9

Mostly work around Google GS101 SoC and Pixel phone (Oriole) adding
support for:

1. Multi Core Timer (MCT) clocksource.
2. Several clock controllers (DTS and DT bindings) and use new clocks in
   several other device nodes.
3. More serial-interface instances: USI8 and USI12 with I2C.

Exynos850:
1. SPI and DMA controllers (PL330).

----------------------------------------------------------------
André Draszik (7):
      arm64: dts: exynos: gs101: sysreg_peric0 needs a clock
      arm64: dts: exynos: gs101: use correct clocks for usi8
      arm64: dts: exynos: gs101: use correct clocks for usi_uart
      dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
      arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
      arm64: dts: exynos: gs101: define USI12 with I2C configuration
      arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole

Krzysztof Kozlowski (2):
      Merge tag 'samsung-dt-bindings-clk-6.9-3' into next/dt64
      arm64: dts: exynos: gs101: minor whitespace cleanup

Peter Griffin (1):
      arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node

Sam Protsenko (3):
      dt-bindings: clock: exynos850: Add PDMA clocks
      arm64: dts: exynos: Add PDMA node for Exynos850
      arm64: dts: exynos: Add SPI nodes for Exynos850

Tamseel Shams (1):
      arm64: dts: fsd: Add fifosize for UART in Device Tree

Tudor Ambarus (6):
      dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
      arm64: dts: exynos: gs101: remove reg-io-width from serial
      arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
      arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
      arm64: dts: exynos: gs101: define USI8 with I2C configuration
      arm64: dts: exynos: gs101: enable eeprom on gs101-oriole

 .../bindings/clock/google,gs101-clock.yaml         |  28 ++++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  64 ++++++++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  24 ++++
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi      |   2 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 131 ++++++++++++++++++---
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   2 +
 include/dt-bindings/clock/exynos850.h              |   2 +
 include/dt-bindings/clock/google,gs101.h           | 129 ++++++++++++++++++++
 8 files changed, 360 insertions(+), 22 deletions(-)
