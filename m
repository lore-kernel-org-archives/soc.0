Return-Path: <SRS0=O1yF=P2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1D4C54734
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 12:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EC06C61045; Tue, 27 Aug 2024 12:16:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D969C61041
	for <soc@kernel.org>; Tue, 27 Aug 2024 12:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D969C61041
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso7824785e9.2
        for <soc@kernel.org>; Tue, 27 Aug 2024 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761004; x=1725365804; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnEbZFJ44c29HA1TxWo0cIEU8ZZqNT1LBIsiqX+Pjlo=;
        b=EwE3yDalFlhEL5u8jQhK5AzchFhS5iluU72T8MK+15RbKGapok9EPqAwqLm7VHrEn2
         8Pd6A/RmuVvr2dz8+N06HIxX+5F6Vpsne14b4PURNCpOIqpQ7RucYz7xmA2wEFULd3BF
         d/ILgNe9arEIoqKaLMYjDAlHrkT38n1dOBSC57JAqys57UofkL8ToyNVFct9kxJ3TPrI
         xAZ6S45Q2m01QcbMXVHoC71EoT9L+rnErGXBO7KHkmbTTeFftJIHtFjb8M9FaF3qEEFU
         Kqla1ded/okjI+uwTZKfAXg3tIdtbeZWF/z5K1ZMtKmEsPujKwodAfgwp5zjqHy7hqfH
         F1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761004; x=1725365804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnEbZFJ44c29HA1TxWo0cIEU8ZZqNT1LBIsiqX+Pjlo=;
        b=PWX1Au+PSl26Mm1foBkMRi8a+O8ohHWMp1yiC4Y71uJyqRaAxWXbrbSTMwrKuY7oxX
         ItshkQxy5aCpg0G8boRMfQX8nodVCqOhqkOyGtLG58HxWLYsB0DM0rFBIuQykfGKE7Aq
         jQJxHMO6Ks6Oj+qcKUdXc4HfC+Ixy4/thML524qj+wqv05GLnSmdjGj/yOJ6CdQn8oII
         Y+UoPFFSL6/LD3fUzhtOq1qbI9C2VyEFrDY5Qra78e6rWwZ4qmIJ2SqTdiLNTI7i/g1i
         gsIMjIhFNIEGu6D8te4wSgtBV4MBn0oQqWWxOlzg819eiRH1NdTQc23OQKMxHNO1GRQ8
         Un3g==
X-Forwarded-Encrypted: i=1; AJvYcCXSRuyw8Z7FxNyRjFdKuXNu0PIt3Y2zPzckS5Ij6eGfqrF4BAFeRzfSIyoOlWPvCtGBcCI=@kernel.org
X-Gm-Message-State: AOJu0YybNb7W4tJ4wui1KDhEYDKepBhOH5u3wFfkremmCDHuCk4oaTFj
	YiX0BG3oMCCdfcxybmFKbOzEjnomgMDSazUYC826LBYAFVhx5+g7cPptpQ0AyBM=
X-Google-Smtp-Source: AGHT+IF4No28LsKRWaN0NTlD6PDhR1XvnFF1olqMjPVqMhBmdTAToVMw4YfhoMTTHeg+gG+PbElOjQ==
X-Received: by 2002:a05:600c:5118:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42acc8dca6dmr58251725e9.2.1724761004329;
        Tue, 27 Aug 2024 05:16:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:43 -0700 (PDT)
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
Subject: [GIT PULL 2/3] arm64: dts: samsung: dt for v6.12
Date: Tue, 27 Aug 2024 14:16:34 +0200
Message-ID: <20240827121638.29707-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.12

for you to fetch changes up to 4d06000979cda26e914552d486e5364248025fcd:

  arm64: dts: exynosautov920: add initial CMU clock nodes in ExynosAuto v920 (2024-08-23 09:20:52 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.12

1. Exynos7885: Correct amount of RAM on Samsung Galaxy A8.
2. ExynosAutov9: Add new DPUM clock controller and DPUM IOMMU (SysMMU).
3. ExynosAutov920: Add initial (incomplete) clock controllers: TOP and
   PERIC0 controllers.
4. Google GS101: Add reboot and poweroff support.
5. Add binding headers with clock IDs for several devices, used by the
   DTS.

----------------------------------------------------------------
David Virag (4):
      arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
      dt-bindings: clock: exynos7885: Fix duplicated binding
      dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
      dt-bindings: clock: exynos7885: Add indices for USB clocks

Krzysztof Kozlowski (2):
      Merge branch 'for-v6.12/clk-dt-bindings' into next/dt64
      Merge branch 'for-v6.12/clk-dt-bindings' into next/dt64

Kwanghoon Son (3):
      dt-bindings: clock: exynosautov9: add dpum clock
      arm64: dts: exynosautov9: add dpum clock DT nodes
      arm64: dts: exynosautov9: Add dpum SysMMU

Peter Griffin (1):
      arm64: dts: exynos: gs101: add syscon-poweroff and syscon-reboot nodes

Sam Protsenko (1):
      dt-bindings: clock: exynos850: Add TMU clock

Sunyeal Hong (2):
      dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
      arm64: dts: exynosautov920: add initial CMU clock nodes in ExynosAuto v920

 .../bindings/clock/samsung,exynosautov9-clock.yaml |  19 ++
 .../clock/samsung,exynosautov920-clock.yaml        | 162 +++++++++++++++++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   2 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  46 +++++
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  40 +++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  15 ++
 include/dt-bindings/clock/exynos7885.h             |  32 ++--
 include/dt-bindings/clock/exynos850.h              |   1 +
 include/dt-bindings/clock/samsung,exynosautov9.h   |  11 ++
 include/dt-bindings/clock/samsung,exynosautov920.h | 191 +++++++++++++++++++++
 10 files changed, 494 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
