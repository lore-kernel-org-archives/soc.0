Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C6E92718
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 135FCC433C9; Thu,  5 Oct 2023 15:57:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50605C433C8
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50605C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-405505b07dfso14144475e9.0
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521438; x=1697126238; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqhZbDetpDSPGH9tcjVMG0XAAmJGH9VuKuWc007JldY=;
        b=nDAalKacjyjyN28pFu/nCPpp59MbYzlNslYfWFVdV+mMnKS6ODmVoXcD9RL1z1bDOW
         zPtTOOTJGwktKOac51b3Yqtx1hJqgqCl8rqXFdO6pmJkIM/SgGPEMnykPuyZD+3GUGQ3
         QZHWXaGapbIwsM8H+Rga79i6DD9yrP7x/8rkjZJPkyP3uDtkxG836qdQdo8GLC0hYAkT
         nlr+PWSzyZlzRjmQO06ekeIonenFS00vVHe4UHmMZVZ04A2J+oUaVRbQMk52frCvf/Fv
         JjFcHjVBBlG68NGaW3nDkSC+njAH81R7WM5uPNDsEe2wxQ7AyrzdOFG12psUT3s8ppND
         e+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521438; x=1697126238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqhZbDetpDSPGH9tcjVMG0XAAmJGH9VuKuWc007JldY=;
        b=NC7oEwPOem/HosdMfVPDiV/dEb26JSZQCjc0t1LqIMfwKuEKQtkyO/7Fal73ODI6xv
         R3k9CUh+TSfjWcAtUrKpUgi+p/Ipi97kgnxKkpxtT3dEPT5FGprEJ83664JmI3awavIR
         sHtRt7RuDHJpdXf8v1IYYu9ZmaV5+njAutvBDsHtvpb1c39YqLZQImiruzooHTixyb/X
         GJ1KRrqYZ5vp8d7A8D0EB37RaKEADuGsGsUBdWyBmIyofZCltQNq4+10wYPt40ppLGp8
         zdF5lBokXH8Jca5dFZ1qAnCsz3oEVw2DU0Lc5IgUe2Zb1IfMMhppiYdas7/V8qgLdX6b
         vmbw==
X-Gm-Message-State: AOJu0YwF31LQkh4zXezZN+rrvOxkKqGfJJ0GlbQJ7qC4D/GcZbf3gO+C
	LejtTIUTW/76ktA8tKWytakNUg==
X-Google-Smtp-Source: AGHT+IG/GeJb2r19mj4jeu5ZFEFUp7ngzuC6ozd49h0DMFGWzzEf3HPXrcm2cFOkZ8TfC72H5BArow==
X-Received: by 2002:a5d:668c:0:b0:317:6579:2b9f with SMTP id l12-20020a5d668c000000b0031765792b9fmr2534206wru.30.1696521438335;
        Thu, 05 Oct 2023 08:57:18 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:17 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
Date: Thu,  5 Oct 2023 16:55:57 +0100
Message-ID: <20231005155618.700312-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial SoC support for the GS101 SoC and also initial board
support for Pixel 6 phone (Oriole).

The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
Currently DT is just added for the gs101 SoC and Oriole.

The support added in this series consists of:
* cpus
* pinctrl
* some CCF clock implementation
* watchdog
* uart
* gpio

This is enough to boot through to a busybox initramfs and shell using an upstream
kernel though :) More platform support will be added over the following weeks
and months. Currently we boot with clk_ignore_unused parameter but this will be
updated as more clocks and platform support lands.

For further information on how to build and flash the upstream kernel on your
Pixel 6, with a prebuilt busybox initramfs please refer to the script and
README.md here:

https://git.codelinaro.org/linaro/googlelt/pixelscripts

I've also included the dtbo overlay containing board_id and board_rev in this
series as otherwise the LK bootloader will bootloop if this is not present in
the dtbo partition. It seems like it would be nicer for the upstream kernel to
build all the DT required to boot upstream kernel on a production phone rather
than having to obtain this dtbo from some other place, but if it is a pain point
then I can remove it.

Many thanks,

Peter.

Peter Griffin (21):
  dt-bindings: interrupt-controller: Add gs101 interrupt controller
  dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
  dt-bindings: clock: Add Google gs101 clock management unit bindings
  dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
    compatibles to GS101
  dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
  dt-bindings: arm: google: Add bindings for Google ARM platforms
  dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
  dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
  dt-bindings: clock: gs101: Add cmu_top clock indices
  dt-bindings: clock: gs101: Add cmu_apm clock indices
  dt-bindings: clock: gs101: Add cmu_misc clock indices
  clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
  clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
  clk: samsung: clk-gs101: add CMU_APM support
  clk: google: gs101: Add support for CMU_MISC clock unit
  pinctrl: samsung: Add gs101 SoC pinctrl configuration
  watchdog: s3c2410_wdt: Add support for Google tensor SoCs
  arm64: dts: google: Add initial Google gs101 SoC support
  google/gs101: Add dt overlay for oriole board
  arm64: defconfig: Enable Google Tensor SoC
  MAINTAINERS: add entry for Google Tensor SoC

 .../devicetree/bindings/arm/google.yaml       |   46 +
 .../bindings/clock/google,gs101-clock.yaml    |  109 +
 .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    4 +-
 .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    7 +
 .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
 MAINTAINERS                                   |   11 +
 arch/arm64/Kconfig.platforms                  |    6 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/google/Makefile           |    7 +
 arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
 arch/arm64/boot/dts/google/gs101-oriole.dtso  |   21 +
 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++
 arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
 arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Kconfig                   |    9 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-gs101.c               | 2171 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    9 +-
 drivers/clk/samsung/clk-pll.h                 |    3 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   68 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   44 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
 drivers/watchdog/s3c2410_wdt.c                |  116 +-
 include/dt-bindings/clock/gs101.h             |  232 ++
 .../dt-bindings/interrupt-controller/gs101.h  |  758 ++++++
 30 files changed, 5533 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
 create mode 100644 drivers/clk/samsung/clk-gs101.c
 create mode 100644 include/dt-bindings/clock/gs101.h
 create mode 100644 include/dt-bindings/interrupt-controller/gs101.h

-- 
2.42.0.582.g8ccd20d70d-goog

