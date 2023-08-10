Return-Path: <SRS0=YdSh=D3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5070AC04FDF
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 15:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09084C433C7; Thu, 10 Aug 2023 15:13:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E708C433CB
	for <soc@kernel.org>; Thu, 10 Aug 2023 15:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E708C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso9325285e9.0
        for <soc@kernel.org>; Thu, 10 Aug 2023 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691680377; x=1692285177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihehJxrTNK++d1PA1IF6JXA5I34hdQPx/lmWfAqYS0A=;
        b=zwRAzjdKw5Uh7/H/QGM4/xh5m+K71vN1qXj+4jCP0zPQr0q/vev4zD5LhpVy/KCyRf
         woeTNCiAOQBGoS20pnwwtLRbZ1F4JgvEpTLZupE4V1IOj6LhL0Rm61uWFBACMuqdWCsU
         Om2FD2ffPV14yvg7Hx4RcUX2ORnptVgmHHWixFrXZ6L0nMaFieTSDU1kJolzSgg3/yOl
         HSOQNNhks1e+B1ixM5XXfbQTm+mCA6hazx9ZY9yUeNatanM/p4gTisHFQ+eWjiG6lMHM
         41iaqXYqk+3cQdfXhj2tEJCR9quprc6Ho7Gu+5GE9dKx+GJmvlr0/g3qlJS1wZbfFj8z
         y8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680377; x=1692285177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihehJxrTNK++d1PA1IF6JXA5I34hdQPx/lmWfAqYS0A=;
        b=EsMW1huheRwBFyfqVMLrTrCmBe3qjTA8qu/JXqpzS4kUQ4apQ0CYp17d6mCda7VB0D
         GPZODWeiHzXiwWZP1lsDpDyalOybqDOorGOWkbY31fU6eVaFZ11rJjfLB5gStMmz5mA4
         fUpwctPNAYGw+POFNcvUsch5nXSGOuY1ClTY9bTqdavZvnv6h+jl0V4F+vTJPpK5LiTQ
         33amamoEBOi/ZwTqxhJdn5dQ5v14t3KeQeoRAAbMvNmlqpULOsEcLQ+D+EnBg061aaKx
         MQpvifg1a7ICbH5cfoKfrVVedCiRa/x8QoRhpoGEAzm/P4Kaoi5DxNXh0yTFx/zjX72K
         dmtg==
X-Gm-Message-State: AOJu0Yxoip7vO0AQzbq0L8itLtdDbVPmfddqyiMAXAUHW6pZuGUpc6TI
	Q697NC1jcU2RaRZgoxNEPbQcMg==
X-Google-Smtp-Source: AGHT+IFHMAVzT051cf++Anz0qtU1svuxejGcPcBz1h7lnMWe48wUCEK4q+TCvF2P2ZCCdXgg00KGbw==
X-Received: by 2002:adf:e843:0:b0:313:e8b6:1699 with SMTP id d3-20020adfe843000000b00313e8b61699mr2218576wrn.55.1691680377133;
        Thu, 10 Aug 2023 08:12:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c020500b003fe29dc0ff2sm2416242wmi.21.2023.08.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:12:56 -0700 (PDT)
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
Subject: [GIT PULL 2/3] arm64: dts: samsung: DTS for v6.6
Date: Thu, 10 Aug 2023 17:12:49 +0200
Message-Id: <20230810151250.220202-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
References: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.6

for you to fetch changes up to d157d43754582f3981b7eefc691abc4d865430e1:

  arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay (2023-08-06 17:42:22 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.6

1. Add dedicated compatibles for PWM block.
2. Add PWM to ExynosAutov9 SADK board.
3. Few white-space and other cleanups.

----------------------------------------------------------------
Jaewon Kim (2):
      dt-bindings: pwm: samsung: add exynosautov9 compatible
      arm64: dts: exynos: add pwm node for exynosautov9-sadk

Krzysztof Kozlowski (4):
      arm64: dts: exynos: add missing space before {
      arm64: dts: exynos: minor whitespace cleanup around '='
      arm64: dts: fsd: minor whitespace cleanup around '='
      arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay

 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 17 +++++++++++------
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi  |  1 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi                |  8 ++++----
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts       |  6 ++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi           | 13 ++++++++++++-
 arch/arm64/boot/dts/tesla/fsd.dtsi                     |  4 ++--
 6 files changed, 35 insertions(+), 14 deletions(-)
