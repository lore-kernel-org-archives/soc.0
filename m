Return-Path: <SRS0=7j7m=XM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D4BC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 08:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CA1DC341C8; Thu,  7 Jul 2022 08:04:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E9E0C341C0
	for <soc@kernel.org>; Thu,  7 Jul 2022 08:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E9E0C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id t25so29771845lfg.7
        for <soc@kernel.org>; Thu, 07 Jul 2022 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9dYgQ35cdd5QcwdHZmKr6Q8Vl0RugkCrkWrdr8ld24=;
        b=AeV56w8X6d0UUFxOQOh6iNGq9TyUYX8ofNmERk0UhTdG9g3q6Rd8ibW7E60fMU73N/
         E/HlUkN/PpEXf1DM786OvOL7jyPe4cDT63s//co2l2T3vtIxbVNy+Jzm49G2nCMu7wxC
         U5jOYRdmdvIy6sVDYyjEGqUb3P04X/1iK2UTTbyoBqZ+X1aJLgHCEekcW895rw0Dekhb
         CeiFBn9raIWf/7ACKj2h/05hz/TKzzaFob3nEcs0p2c8tC+tA/lnMUKrgMm/yYTOXaOe
         TWLrSJWQrLkFHIva/c9meAiKyZvUYQDLgiftcbMLwtiCP5vytl4iA4dg4HBhW3NrLauf
         VFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9dYgQ35cdd5QcwdHZmKr6Q8Vl0RugkCrkWrdr8ld24=;
        b=TSJGZzXQmLKnBm/nu756vkQT+HUi+r1uQ+rgExdARjPahGWuxAUUUHwLCGDQ+rglcn
         pDrkvtpIcB/I3LyU7ASTzUlTv05dA/R85wbZjmyFTT+PIpj1wNiBIhI+OMjdk0mZuaw/
         t2qHXOFsU3diyq2eGcTEFX1K3wt6UtuKxb5XA8wkRltcJROGOKGMJAtijHysVexBjdWo
         EGnW8cYypeOcanXXnn3rgvrxjDVX/d/2yUtv76t6kDJXpAwAwobfpUPdAEI3IBgro80z
         gWaIu5sljs35UOOx9lEVeIbZ1e8/szL5N7KdDptjr68AMT9GtjsRPu0tRH4a+FfD/BZZ
         f1Kg==
X-Gm-Message-State: AJIora/7osOm22ONyaE1jVbKErcjqoMIIPWRyeyHruCApcNJwa4sa07p
	y1ER3lkA8GD29xIIJnC2j5Q5tw==
X-Google-Smtp-Source: AGRyM1sFsafUoEd5OpC5bdbiu44MmM3ARKbnb0/kpVDSpu/pZHsf52Uy0hJBrMCVvqCZac/uRBLmBg==
X-Received: by 2002:a05:6512:3051:b0:47f:7945:83d0 with SMTP id b17-20020a056512305100b0047f794583d0mr26620431lfb.99.1657181055571;
        Thu, 07 Jul 2022 01:04:15 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651220d000b00478ea0e4f66sm6702687lfr.169.2022.07.07.01.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:04:14 -0700 (PDT)
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
Subject: [GIT PULL 1/2] ARM: dts: samsung: 2nd round for v5.20
Date: Thu,  7 Jul 2022 10:04:07 +0200
Message-Id: <20220707080408.69251-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request. This also includes DT bindings for
convenience, although nothing depends on the bindings itself.

Best regards,
Krzysztof


The following changes since commit 82cd16902a51773cfc0ee05bbd1ab470db5181ab:

  ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3 (2022-06-22 13:58:01 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.20-2

for you to fetch changes up to 3e27bf719303b1b19edd37bd04e9e586c73f6511:

  dt-bindings: soc: samsung: exynos-pmu: add reboot-mode (2022-07-06 18:24:32 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.20, part two

1. Cleanups: align SDHCI node names.
2. DT bindings: Document preferred compatible naming schema.
3. DT bindings: fixes and improvements to Exynos PMU bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (8):
      ARM: dts: exynos: align SDHCI node name with dtschema
      ARM: dts: s3c24xx: align SDHCI node name with dtschema
      ARM: dts: s3c64xx: align SDHCI node name with dtschema
      ARM: dts: s5pv210: align SDHCI node name with dtschema
      dt-bindings: samsung: document preferred compatible naming
      dt-bindings: soc: samsung: exynos-pmu: cleanup assigned clocks
      dt-bindings: soc: samsung: exynos-pmu: use abolute ref paths
      dt-bindings: soc: samsung: exynos-pmu: add reboot-mode

 .../bindings/arm/samsung/samsung-soc.yaml          | 40 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 13 ++++---
 arch/arm/boot/dts/exynos4.dtsi                     |  8 ++---
 arch/arm/boot/dts/s3c2416.dtsi                     |  4 +--
 arch/arm/boot/dts/s3c64xx.dtsi                     |  6 ++--
 arch/arm/boot/dts/s5pv210.dtsi                     |  8 ++---
 6 files changed, 61 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
