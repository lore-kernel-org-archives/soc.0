Return-Path: <SRS0=3QlF=H7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA11C46CCD
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 08:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91AD7C433C7; Wed, 20 Dec 2023 08:47:31 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2186DC433CB
	for <soc@kernel.org>; Wed, 20 Dec 2023 08:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2186DC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67f645f2e3fso7603126d6.1
        for <soc@kernel.org>; Wed, 20 Dec 2023 00:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703062049; x=1703666849; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkUnotLHiwUHunRMJ74rg2n/XXNGCcUjwtUyRu/WLvI=;
        b=S4dqqGZX3PLgOw9z/WaSi9OAW9Cbeok39ZlSNsuyJs75YWp83EAnV6M3wpLzgf8EaB
         BlCpydb5cHsk+OmgeLbp0quRq0UR+fr0NPjrhVOpD0dT35+QEMf9Zmj0r0BhX2GsVdac
         pd4xJuZlXl3EqqhmbNqJl2yIsFxtvn7psG+z+bRKLf7buHAxl9HPDA7CJkEjN8wZxWne
         HvAQOS0N1bAtl6iu9smY1Ft4cYXOOOqeqzvxuUaNXmlBh83jIZ96oTdifMlBX9T7Or01
         NA6YEzINVu5YGG4v0KnQp/ac3sizLEv30F5BvFopk57BY6IVV99NwgC2iwLyjpPMe8Fu
         AJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062049; x=1703666849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkUnotLHiwUHunRMJ74rg2n/XXNGCcUjwtUyRu/WLvI=;
        b=ndALcqzSZvnXkzMXBMUBX1ROkhxP8ZISN2srsdFeG/kgHvUnXSmDYxEg7CU/O7q8el
         c+aUMnDwy74qe+R/Z/tSFDEkgH1ZpwzLjGyDzEBU4cJLZxNFsVTD8/w1g5IGKMfYV5TX
         GNPStSA/PfydfmX6lHc9EJOayuenCqKWQQpzfLCTmuNFAgdPUpugBh34WE78lQcTFtJl
         viawncVY4KNJ5lqz5aC+hS2e8aiv8Be/8ZWvHHp5tasuhbAAobKe7vRKIhDf57IZek6j
         eyvyaLDfcRTeQ2s6Dwhrrj7NAtSjkqveCe3zV442UY7p3C3ZkjeGsDirNf64j3BIzbcz
         7PGQ==
X-Gm-Message-State: AOJu0YyfqHwzbM9uVC4zz2c4BfVagOleyvn0rGUSAUDhtmZUatswHf3i
	16tGcAh02dIvzP0X+dHymbNCLw==
X-Google-Smtp-Source: AGHT+IEdfszLOaIesNW+7ESBIjUWCUZ2vKw4gM2QUlrYD4MHAlBGCggMU5JjWuGySGOTJMs9kxjrng==
X-Received: by 2002:ad4:5c6a:0:b0:67f:43f4:d058 with SMTP id i10-20020ad45c6a000000b0067f43f4d058mr5857968qvh.105.1703062048881;
        Wed, 20 Dec 2023 00:47:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g18-20020a0ce752000000b0067abfe5709dsm11168847qvn.139.2023.12.20.00.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:47:28 -0800 (PST)
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
Subject: [GIT PULL 1/2] samsung: drivers for v6.8
Date: Wed, 20 Dec 2023 09:47:21 +0100
Message-Id: <20231220084722.22149-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Driver changes needed for Google GS101 SoC, plus usual Samsung SoC driver
updates.

This includes topic branch, see explanation in pull-request/tag.

Best regards,
Krzysztof


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.8

for you to fetch changes up to 35f32e39b4d9b436354c2a37623c393a2ac7cf87:

  dt-bindings: clock: google,gs101: rename CMU_TOP gate defines (2023-12-18 09:59:20 +0100)

----------------------------------------------------------------
Samsung SoC driver changes for v6.8

1. Add support for Google GS101 SoC to different drivers: clock
   controller, serial and watchdog.

   The clock driver changes depend on few bindings headers, which I put
   in a topic branch with the bindings refactoring and GS101 support,
   therefore this this pull request includes that bindings topic branch.

   The rest of the bindings topic branch is not necessary here, however
   keeping everything together makes it easier to share between
   branches.  The bindings topic branch is mostly refactoring all the
   compatibles to add SoC-specific compatible followed by fallback.

2. Exynos ChipID: recognize ExynosAutov920.

----------------------------------------------------------------
Jaewon Kim (8):
      soc: samsung: exynos-chipid: add exynosautov920 SoC support
      dt-bindings: samsung: exynos-sysreg: add exynosautov920 sysreg
      dt-bindings: samsung: exynos-pmu: add exynosautov920 compatible
      dt-bindings: samsung: usi: add exynosautov920-usi compatible
      dt-bindings: serial: samsung: add exynosautov920-uart compatible
      dt-bindings: pwm: samsung: add exynosautov920 compatible
      dt-bindings: arm: samsung: Document exynosautov920 SADK board binding
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynosautov920 compatible

Krzysztof Kozlowski (18):
      dt-bindings: hwinfo: samsung,exynos-chipid: add specific compatibles for existing SoC
      dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
      dt-bindings: i2c: samsung,s3c2410-i2c: add specific compatibles for existing SoC
      dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for existing SoC
      dt-bindings: rtc: s3c-rtc: add specific compatibles for existing SoC
      dt-bindings: serial: samsung: add specific compatibles for existing SoC
      dt-bindings: samsung: exynos-pmu: add specific compatibles for existing SoC
      dt-bindings: gpu: arm,mali-midgard: add specific compatibles for existing Exynos SoC
      dt-bindings: iio: samsung,exynos-adc: add specific compatibles for existing SoC
      ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing SoC
      dt-bindings: pwm: samsung: add specific compatibles for existing SoC
      dt-bindings: i2c: exynos5: add specific compatible for Tesla FSD
      dt-bindings: pwm: samsung: add specific compatible for Tesla FSD
      dt-bindings: serial: samsung: add specific compatible for Tesla FSD
      dt-bindings: samsung: exynos-pmu: add specific compatible for Tesla FSD
      dt-bindings: watchdog: samsung: add specific compatible for Tesla FSD
      dt-bindings: samsung: exynos-sysreg: combine exynosautov920 with other enum
      Merge tag 'samsung-dt-bindings-refactoring-and-google-gs101-6.8' into next/drivers

Peter Griffin (13):
      dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
      dt-bindings: clock: Add Google gs101 clock management unit bindings
      dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
      dt-bindings: watchdog: Document Google gs101 watchdog bindings
      dt-bindings: serial: samsung: Add google-gs101-uart compatible
      dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
      dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
      clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
      clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
      tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
      watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
      watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
      watchdog: s3c2410_wdt: Add support for Google gs101 SoC

Tudor Ambarus (2):
      dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
      dt-bindings: clock: google,gs101: rename CMU_TOP gate defines

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 .../bindings/clock/google,gs101-clock.yaml         |  106 +
 .../devicetree/bindings/gpu/arm,mali-midgard.yaml  |    5 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   18 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |   11 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   22 +-
 .../bindings/iio/adc/samsung,exynos-adc.yaml       |   29 +-
 .../bindings/mfd/samsung,exynos5433-lpass.yaml     |    2 +-
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |   25 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml       |    4 +
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml |    5 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |   28 +-
 .../bindings/soc/samsung/exynos-pmu.yaml           |   10 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    7 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    5 +
 .../devicetree/bindings/sound/samsung-i2s.yaml     |   19 +-
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |   29 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-gs101.c                    | 2518 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    6 +
 drivers/clk/samsung/clk-pll.h                      |    3 +
 drivers/soc/samsung/exynos-chipid.c                |    1 +
 drivers/tty/serial/samsung_tty.c                   |   16 +
 drivers/watchdog/s3c2410_wdt.c                     |   85 +-
 include/dt-bindings/clock/google,gs101.h           |  392 +++
 25 files changed, 3285 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-gs101.c
 create mode 100644 include/dt-bindings/clock/google,gs101.h
