Return-Path: <SRS0=k7H9=52=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6355DC61D97
	for <soc@archiver.kernel.org>; Sun, 29 Jan 2023 14:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F299C433A4; Sun, 29 Jan 2023 14:39:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE534C433D2
	for <soc@kernel.org>; Sun, 29 Jan 2023 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE534C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id bg26so586850wmb.0
        for <soc@kernel.org>; Sun, 29 Jan 2023 06:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/xwwbOs7efGaQMD0UIaeGQeP0AwlUSs0l695B7gQqs=;
        b=H37AxqvpkcQPDY31nuqRg2AOOocJfGxNxKC58KcEuQOl088wgsSKto7c4b2NNC+yWW
         KBf01la7BInnT9ieP8DrFMYnPnL0AT34srYjpVYDIC25GsL9Vzku0u/EOGjyIDg5Vgsb
         sG/IIs9loCETu/2kyIPrhK0fH0Ag+7CH2p+0LQNnflIWziqg2Jr91jfir9JvuL+gsLM4
         bUslMG33lFQxVjyxIQprAF2nETIUxBFx9byKCH0PxkA+7R21ul+fkgvaPepETkdnamQ8
         JyxXajHCJvmF86109hiJRXXAfd7y/4uk+kYUFMlg3zcz5KAVkoP8GWB1l/mlY9wro37N
         O6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/xwwbOs7efGaQMD0UIaeGQeP0AwlUSs0l695B7gQqs=;
        b=qrt4Um0BlgQS1+1peVvFQPBtSn3rfx3mWjgArl+jXObDjECyE1tOsC7eLKk9bWolNO
         zP9fDSKune+6V4X9LS4KV8RdJtUCIfQMloWqvQlpc2kp67/F9SMXBaXoBaFlJaptOA/c
         vS9Z2DMAGe3nXckm0c2nIFT/pBKSBWerhDApyqdL9hFpOpU5TN15C28Yha70AyajqY/x
         MS5A2GMKnWxqx0scu/xtbyZTEQnEYVdE6PC6GsEZSZTeIQEOiok39ropxRV3mx22AG+H
         Et5p55n5O7rrTLN1U7WJKwHKCEghK87h2M/FSnqoygQUyqlvzK//d5fS8oNskb8M51j/
         WOqg==
X-Gm-Message-State: AO0yUKUSy/+pDdPkDcB3o6RUn7qrl5j9W4mqkrPzKGHYJB8XfLv9YmPT
	vfW8DCGM6J/QsEyQqinPnJ3a8A==
X-Google-Smtp-Source: AK7set82BeaboxstGi6b9jRgXk4CsYI4beNgiDWOusTguSgRBlIDNkQyRbiYOh9/lkWhcJL+jDkl7g==
X-Received: by 2002:a05:600c:4f93:b0:3dc:2b62:ee9f with SMTP id n19-20020a05600c4f9300b003dc2b62ee9fmr12897820wmq.3.1675003188063;
        Sun, 29 Jan 2023 06:39:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db0bb81b6asm10477843wmb.1.2023.01.29.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:39:47 -0800 (PST)
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
Subject: [GIT PULL 1/3] ARM: dts: samsung: exynos for v6.3
Date: Sun, 29 Jan 2023 15:39:42 +0100
Message-Id: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.3

for you to fetch changes up to 27be20e3b9d125f2c1b066d1d238c67bf5b89dc3:

  ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx (2023-01-29 11:34:12 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.3

1. Big cleanup and rework towards achieving zero-warning of dtbs_check
   and dtc W=1:
    - align node names with the bindings,
    - drop or correct incorrect properties in several boards,
    - correct HDMI bridge ports nodes on Exynos4412 Midas,
    - add dummy regulator supplies when necessary to fullfil bindings
      requirements,
    - use lowercase hex,
    - move non-MMIO exynos-bus nodes out of soc node,
    - add unit address to USB DWC3 nodes.

2. Correct Exynos5420 MIPI DSI and phy compatibles.
3. Correct Exynos4210 and Exynos4412 HDMI phy compatibles.
4. Add Samsung Galaxy S5 (SM-G900H) board.

----------------------------------------------------------------
Krzysztof Kozlowski (23):
      ARM: dts: exynos: drop unused pinctrl-names from Galaxy Tab
      ARM: dts: exynos: align OPP table names with DT schema
      ARM: dts: exynos: drop incorrect power-supplies in P4 Note
      ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
      ARM: dts: exynos: drop unsupported desc-num in Exynos3250
      ARM: dts: exynos: correct cd-gpios property in Exynos4412 Itop Elite
      ARM: dts: exynos: align pin node names in Exynos4412
      ARM: dts: exynos: add ports in HDMI bridge in Exynos4412 Midas
      ARM: dts: exynos: add panel supply in Tiny4412
      ARM: dts: exynos: add backlight supply in P4 Note
      ARM: dts: exynos: align HSOTG/USB node names
      ARM: dts: exynos: correct SATA clocks in Exynos5250
      ARM: dts: exynos: correct HS200 property in Exynos5260
      ARM: dts: exynos: correct HSI2C properties in Exynos5410 Odroid XU
      ARM: dts: exynos: correct HDMI phy compatible in Exynos4
      ARM: dts: exynos: use generic node names for phy
      ARM: dts: exynos: use lowercase hex addresses
      ARM: dts: exynos: move exynos-bus nodes out of soc in Exynos5420
      ARM: dts: exynos: move exynos-bus nodes out of soc in Exynos3250
      ARM: dts: exynos: move exynos-bus nodes out of soc in Exynos4210
      ARM: dts: exynos: move exynos-bus nodes out of soc in Exynos4412
      ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos5250
      ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx

Markuss Broks (4):
      ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
      ARM: dts: exynos: Use Exynos5422 compatible for the DSI controller
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
      ARM: dts: exynos: Add Samsung Galaxy S5 (SM-G900H) board

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos-syscon-restart.dtsi       |   2 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |   3 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |   5 +-
 arch/arm/boot/dts/exynos3250.dtsi                  | 386 ++++++------
 arch/arm/boot/dts/exynos4.dtsi                     |  66 +-
 arch/arm/boot/dts/exynos4210.dtsi                  | 326 +++++-----
 arch/arm/boot/dts/exynos4412-itop-elite.dts        |   2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi            |  15 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |   2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts           |   2 +-
 arch/arm/boot/dts/exynos4412-odroidx2.dts          |   2 +-
 arch/arm/boot/dts/exynos4412-origen.dts            |   2 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi           |   7 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi          |   2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts          |   8 +
 arch/arm/boot/dts/exynos4412.dtsi                  | 381 ++++++------
 arch/arm/boot/dts/exynos5.dtsi                     |  22 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |  84 +--
 arch/arm/boot/dts/exynos5260-xyref5260.dts         |   2 +-
 arch/arm/boot/dts/exynos5260.dtsi                  |  36 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |   3 +-
 arch/arm/boot/dts/exynos5410.dtsi                  |   2 +-
 .../arm/boot/dts/exynos5420-galaxy-tab-common.dtsi |   1 -
 arch/arm/boot/dts/exynos5420.dtsi                  | 299 +++++----
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |  34 +-
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts       | 674 +++++++++++++++++++++
 arch/arm/boot/dts/exynos54xx.dtsi                  |  16 +-
 arch/arm/boot/dts/exynos5800.dtsi                  |   4 +
 32 files changed, 1541 insertions(+), 853 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-samsung-k3g.dts
