Return-Path: <SRS0=k7H9=52=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2C2C05027
	for <soc@archiver.kernel.org>; Sun, 29 Jan 2023 14:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 175F5C433D2; Sun, 29 Jan 2023 14:39:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14E54C4339E
	for <soc@kernel.org>; Sun, 29 Jan 2023 14:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14E54C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id k16so6432840wms.2
        for <soc@kernel.org>; Sun, 29 Jan 2023 06:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3N6vf7d9YqgQO0xbinr/8i1dp426tGC7mdRVcVYqt8=;
        b=CyQfxw6+djzwaeaWAI4+2lsyBsjZ9bKAASa/NQa24HGj7lRToYuZaZsum+kVwtHYYu
         LjkKZlffPh1fBLNHKUoT0gjy8DG6e9tFI88t+rVstd73Tum0yyZ0pIVrileH3lQNqJlH
         3Ia3wisp42rR+xEZMtiRlkjbhKDKjMylI2Db8skJYEihzL5b7IJvL9zGZXphgaIpi3he
         WWTsgK/nJrB7SZEIfHDCjgob6Z3/KUgoEDZ70dakpo30NKY25FVFUizWcStbEy0QokOm
         Hp7VdnprVcqlgkqVR42z30pkMc+fRz2eGZSYtgBh7qE9aCPWk5fjza4dtOpM1tFNOfXS
         M1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3N6vf7d9YqgQO0xbinr/8i1dp426tGC7mdRVcVYqt8=;
        b=M/PmcghCY/jqPai+h6msl24wz6DIAByz2puiOsWNb3GOmcCQzjezka9oIphgnNVUHa
         JWfquYOHdPqhcT+YHxAAvOX+D4TYkLzMNyiBFmfgR9G3+NhEi7AxUUJaH9TivXfh3Bp/
         t3mu1NhiuMGQEf5WFv+NGj1ecmFhpwLphSTxROgmEUPzp9dMphxdW/zlAcHKVZqaDcwe
         FOf8xofa9ygIW2QtAGY5uS+cuobsXb7jOcq8audIYCMwRXmKTlpnEFZZErhmf6PQ8Eqb
         3PnsT5D1ht2bplyYRmVcgICDol11KGyWXoAO97hydc4uCN4y9ASEEQjEBfnC8fJNGJES
         ovfw==
X-Gm-Message-State: AO0yUKVZwTwQek+JRIEoaq4ol3oCuL+r3xPdxqh+FvS5oyESvXXIpBO7
	rbRelclit0gR27rwmyazkuA9aA==
X-Google-Smtp-Source: AK7set+1gEkytHfnRrF3YhhOU6Y4o7hT6tQ6rb7HkQeDmhMhykJfZpfli4/RtuHfElnJbWJ+9tdAHw==
X-Received: by 2002:a1c:4c19:0:b0:3dc:5342:9f53 with SMTP id z25-20020a1c4c19000000b003dc53429f53mr2390597wmf.38.1675003189342;
        Sun, 29 Jan 2023 06:39:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bi5-20020a05600c3d8500b003db0bb81b6asm10477843wmb.1.2023.01.29.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:39:49 -0800 (PST)
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
Subject: [GIT PULL 2/3] arm64: dts: samsung: second for v6.3
Date: Sun, 29 Jan 2023 15:39:43 +0100
Message-Id: <20230129143944.5104-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
References: <20230129143944.5104-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 56a14f01a54568e049e22c46ffc654602bbd01d1:

  arm64: dts: fsd: Add sound card node for Tesla FSD (2023-01-17 12:15:39 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.3-2

for you to fetch changes up to 28dd277e54ebb499bc59c166078596767bbbbdd7:

  arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos7 (2023-01-29 11:34:29 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.3, part two

Big cleanup and rework towards achieving zero-warning of dtbs_check and
dtc W=1:
 - drop or correct incorrect properties in several boards,
 - add dummy regulator supplies when necessary to fullfil bindings
   requirements,
 - use lowercase hex,
 - move non-MMIO exynos-bus nodes out of soc node,
 - add unit address to USB DWC3 nodes.

----------------------------------------------------------------
Krzysztof Kozlowski (11):
      arm64: dts: exynos: drop unsupported UFS properties in ExynosAutov9 SADK
      arm64: dts: exynos: disable non-working GPU on Exynos7 Espresso
      arm64: dts: exynos: add ADC supply on Exynos7 Espresso
      arm64: dts: exynos: correct Bluetooth LED triger on E850-96
      arm64: dts: exynos: add VPH_PWR regulator on TM2
      arm64: dts: exynos: add interrupt-controller to WM5110 on TM2
      arm64: dts: exynos: correct wlf,micd-dbtime on TM2
      arm64: dts: exynos: use lowercase hex addresses
      arm64: dts: exynos: move exynos-bus nodes out of soc in Exynos5433
      arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos5433
      arm64: dts: exynos: add unit address to DWC3 node wrapper in Exynos7

 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  2 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 17 ++++++++++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 28 +++++++++++-----------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  4 ++--
 arch/arm64/boot/dts/exynos/exynos7.dtsi            | 14 +++++------
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  2 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |  2 --
 7 files changed, 39 insertions(+), 30 deletions(-)
