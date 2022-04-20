Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450ACC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29C61C385A8; Wed, 20 Apr 2022 07:22:01 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 587C7C385AC
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 587C7C385AC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id s25so1060125edi.13
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h6Yd9N7wbWEw54Sdiq3zmnk3cJ49/izp1UT6h3P+NWU=;
        b=swuD2twFKnyevnlN32QlModZGN5PERaIW4JGMVzwbnuR/F06sZTBIOCgthcxjyimsl
         dWY4lsDVRFyFXvcsl9FXzTQATjFk3K6HtaVHPrBr7C5RdSGJpVj/23+vDScn2U9blmnF
         RJ4DquD5AF4bPory6XJnHZwJb+8ulaktewnjJFHPAnBDWOsJ/pBDjvyGqYudS9lAVhGQ
         Yd92ykUG7miGgUXE/Qn1PrMFd4e85Owxp3pRPNqIfjvZG2iRkHpF2VLMn8gC+EK4RnkB
         zKCQFdAwF+xuZQ3vtGvmujFRaudoad5ewwjypKwNkWz9irUbiZxXSoc1regQk/HpGoOJ
         Okdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6Yd9N7wbWEw54Sdiq3zmnk3cJ49/izp1UT6h3P+NWU=;
        b=GghoK76DrKrChq6rn+yin2kHwGXjiKOnRBZ80BrmoGJ6dEPBtLHgi0ohIMrekVIO+e
         IOfoPk+PHCvZ3p+a3zpGzSLXHH6/op6oHr/oS71SCUF8n6WO6vZCRkgIIxAFlrC3pGlJ
         Z8Ovff6FS70eZAQ+3U4Zc7cwwFdY7ZX+JW2M9v93cATNqaEjNRm8TFBrrqBd4sD2ygL6
         QigcwHjP3yv9aK/xSpuO0+2yWdAj0lWpxKHciuuBh6H2UxCgij84RvpYZ4SiZ2qM0A4C
         DyuHPpY/djMVeGk7Xo5s+69QG5pqPDUetTNAd9n15hp38s175ebf32BdZus286EGEDGK
         /nfQ==
X-Gm-Message-State: AOAM533wfI8osIarED/f3OIlCTbb4owhd4cKycwnwQbB7tMg3vGCGb4T
	CjSobBVspJ7xkn5ksb68fB5Bsg==
X-Google-Smtp-Source: ABdhPJxGVrhfaOD5JDiROq+//GQCbSajTSv47RqHe//JFBr/9MrnkpwOtHu3ycSFCpWPnSAl5aXaXg==
X-Received: by 2002:a05:6402:3584:b0:423:e4d0:34f with SMTP id y4-20020a056402358400b00423e4d0034fmr15250992edc.72.1650439317609;
        Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
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
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v5.19
Date: Wed, 20 Apr 2022 09:21:51 +0200
Message-Id: <20220420072152.11696-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
References: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.19

for you to fetch changes up to 9e916fb9bc3d16066286f19fc9c51d26a6aec6bd:

  ARM: dts: s5pv210: align DMA channels with dtschema (2022-04-09 18:50:05 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.19

1. Several DT schema related changes to make DTBs passing schema checks:
   EHCI/OHCI/DMA/Ethernet node names, DMA channels order, USB-like
   compatibles.
2. Add specific compatibles to Multi Core Timer to allow stricter DT
   schema matching.
3. Cleanup from deprecated bindings:
   - Remove deprecated unit-address workaround for Exynos5422 Odroid XU3
     LPDDR3 memory timings.
   - Do not use unit-address (and SFR region) in Exynos5250 MIPI phy in
     favor of syscon node (unit-address deprecated in 2016).
   - Use standard generic PHYs for EHCI/OHCI device in S5PV210.
4. Fix inverted SPI CS (thus blank panel) on S5PV210 Aries boards.
5. Correct Bluetooth interupt name on S5PV210 Aries boards.

----------------------------------------------------------------
Jonathan Bakker (4):
      ARM: dts: s5pv210: Remove spi-cs-high on panel in Aries
      ARM: dts: s5pv210: Correct interrupt name for bluetooth in Aries
      ARM: dts: s5pv210: Adjust memory reg entries to match spec
      ARM: dts: s5pv210: Adjust DMA node names to match spec

Krzysztof Kozlowski (7):
      ARM: dts: exynos: remove deprecated unit address for LPDDR3 timings on Odroid
      ARM: dts: exynos: add a specific compatible to MCT
      ARM: dts: exynos: drop deprecated SFR region from MIPI phy
      ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
      ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
      ARM: dts: s5pv210: Use standard arrays of generic PHYs for EHCI/OHCI device
      ARM: dts: s5pv210: align DMA channels with dtschema

Oleksij Rempel (2):
      ARM: dts: exynos: fix ethernet node name for different odroid boards
      ARM: dts: exynos: fix compatible strings for Ethernet USB devices

 arch/arm/boot/dts/exynos3250.dtsi               |  3 +-
 arch/arm/boot/dts/exynos4.dtsi                  |  4 +--
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |  4 +--
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  8 ++---
 arch/arm/boot/dts/exynos5250.dtsi               |  8 ++---
 arch/arm/boot/dts/exynos5260.dtsi               |  3 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts       |  4 +--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   |  7 ++---
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts |  6 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts      |  6 ++--
 arch/arm/boot/dts/exynos54xx.dtsi               |  3 +-
 arch/arm/boot/dts/s5pv210-aquila.dts            |  3 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi            | 11 ++++---
 arch/arm/boot/dts/s5pv210-goni.dts              |  6 ++--
 arch/arm/boot/dts/s5pv210.dtsi                  | 40 ++++++++++---------------
 15 files changed, 52 insertions(+), 64 deletions(-)
