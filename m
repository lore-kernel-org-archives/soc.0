Return-Path: <SRS0=bw02=5T=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D1DC25B4E
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 12:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E478C433A0; Sun, 22 Jan 2023 12:26:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49494C4339C
	for <soc@kernel.org>; Sun, 22 Jan 2023 12:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49494C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so6685430wmc.1
        for <soc@kernel.org>; Sun, 22 Jan 2023 04:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pbzwjLdm0DVC3q/9d88DJk7e6Au7jTyV/S/NQHA4YvQ=;
        b=nPDWmeaoM4qH1sAhGzDTP6Lk7+5v9b1fYhu09zSChveOZxrSgSkXYGzmmFdb14SlMR
         orOV6l+4/la9UfYkwAlXtYsnViXr7cuRWFGzu+pu78RWbMA0W3cJYgfqFxJLe39MTST0
         04p1hu5XfGHAdjXw8D33ckO9N9jG7J/50v11ONTHGYBenWKKcjCqpNA02BQoYTuOtRT6
         DyKTnyoJ8RT1UanFeTWYowKjzbh9Yxa8YcKJXxxaIub8L9QS3nlf14TwVMKR4SsYDjEc
         c2/lB/fGmZ5EjdxHFtB4vQ5/T72bJReExynR9zqRXnQkcHsPWJNtbMF+jRqPsPZCV1t3
         HEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbzwjLdm0DVC3q/9d88DJk7e6Au7jTyV/S/NQHA4YvQ=;
        b=6wdrPRUWxSI1utieMN5HEZ2qi4unI/C/TBu6FP9sSebhR4u4TLvecKNU+dWhivjSey
         SpdA3mN9+komzCMLmrRT+wBgUBETSpRAYGkkduEu59j4onKFYqzNuHm+gJle1h6ofoQE
         EWH7NiQDARgtMDVkYM7jdgee5M3MHDcHZdiTAbv7giCzj9+ceD3UafEGfPDKtsCT53Lz
         qt4ft7SIs/MdlzHX3GI4Xgsg/6ovUfbw/E3puNrHWiA+RN1YreqxqzE8dtz8sIc7OH0O
         RuHIKklvblDpQC/YsasgoUxw4W34pr76KShQ4TeF4zxIAAdkZHsDtld7gY0mUepMPxMG
         b0Ug==
X-Gm-Message-State: AFqh2koJZY95z1L3p8ZsSuG9VG4++nEmLjoLrJ/t15r8NppSmNbaIz8b
	TlBmhJLVcRnlH0UUY+C48HiHTA==
X-Google-Smtp-Source: AMrXdXu/6PQg++gYWXKyUi6cdUY1gDvsqc99mVb/kYG1nBNvmI6JVYY7oL9PwPDxTXg+37znE49t3g==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id v24-20020a05600c4d9800b003d35c7da5f3mr28557197wmp.37.1674390369527;
        Sun, 22 Jan 2023 04:26:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b003d9aa76dc6asm10663808wmq.0.2023.01.22.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 04:26:08 -0800 (PST)
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
Subject: [GIT PULL] samsung: soc for v6.3
Date: Sun, 22 Jan 2023 13:26:04 +0100
Message-Id: <20230122122605.30720-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Driver-related binding changes and one maintainer's entry. I called it a
"drivers" update but it is really rather generic SoC stuff.

Best regards,
Krzysztof


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.3

for you to fetch changes up to 5e487164afbcd917225fb701e8956f388f43b601:

  MAINTAINERS: arm64: tesla: correct pattern for directory (2023-01-15 12:17:44 +0100)

----------------------------------------------------------------
Samsung SoC bindings changes for v6.3

1. System Controller: use dedicated/specific compatibles to identify
   different controllers with different register layout (Exynos, Tesla
   FSD). Extend the bindings with missing clocks.
2. Correct maintainers entry for Tesla FSD DTS.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      dt-bindings: soc: samsung: exynos-sysreg: split from syscon
      dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynos5433
      dt-bindings: soc: samsung: exynos-sysreg: add clocks for Exynos850
      dt-bindings: soc: samsung: exynos-sysreg: correct indentation for deprecated
      MAINTAINERS: arm64: tesla: correct pattern for directory

Sriranjani P (3):
      dt-bindings: soc: samsung: exynos-sysreg: Add tesla FSD sysreg compatibles
      dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynos850
      dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynosautov9

 Documentation/devicetree/bindings/mfd/syscon.yaml  |  6 --
 .../soc/samsung/samsung,exynos-sysreg.yaml         | 87 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 88 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
