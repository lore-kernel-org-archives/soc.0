Return-Path: <SRS0=7Kaj=L6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B814C4345F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 07:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55C94C2BBFC; Thu, 25 Apr 2024 07:19:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E73A9C3277B
	for <soc@kernel.org>; Thu, 25 Apr 2024 07:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E73A9C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5709cb80b03so544248a12.2
        for <soc@kernel.org>; Thu, 25 Apr 2024 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714029541; x=1714634341; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UiWg4ZuYlxN9cQPVnhmdQjPdfi8HEtEf8/z5K2DVwdU=;
        b=Nen8upHN4vk6Ehra1j8vxI97xVDIKQQqYHh9d0rATALZmnL4QKOGdiBNApC4TsJjip
         0fxEb3kO6QIu6LRCcm3MVEVNqQhWCzd5DWzhx2laz2Nekxi4YVnBkIOMrtv2uYrVuaPf
         om4M8VIROKk+hTNtvBW2/ElOxgAt01THqehV3h3MIZvdSALqvJ6HiJ7sTEqXddr4r3wO
         qyy/a8cRgZ8t+JK7pej7nHIO+7YBnoFg4JIxyFkLzuvaFAtX3cUl+nihD7v+jwi1wY4t
         trSgPZad4yHzEqGSYSQ36pgO1p/lflIBpnAOkCVRnl3xNa9Aw6EzsY0wESSkJABN2mnz
         SWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029541; x=1714634341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiWg4ZuYlxN9cQPVnhmdQjPdfi8HEtEf8/z5K2DVwdU=;
        b=qK0vYxo6Y+XnFZWAlyrRlX3OOiAl7B/sEKEmahrpNNaeYKfmjCaSNkZChjLpmoQlk0
         EQ+fjpAqRFjlFpKfS/F/q3loTD1VZ9E8GWuYZTcQ1wzKtH5H+xmBb3tuEtDZl/8KLmdM
         UmtZUeXo5FI7vSI8B7GgVLjHrV2LQntcmej/PYZflKZhVXb6e3f2zDhWwz6w8OcwC3sc
         enl0xuTxE+bZT/O/mAXfC7G7lT4kOOi8Ep7+nneiqynSEzIli+ha9TKw3WzBb4Nt2bQG
         ru5BUudWyYG4ANP4zxjjruwzKu8/B5udYRaig9/+VKzR8fgnQvCWkj3BKWWUVGn2BqvX
         WkIA==
X-Forwarded-Encrypted: i=1; AJvYcCXAkjB5+gGvOkmM2ODbRPlT3Uc0i4V0WSQ9pFVngwO+DEr/Dxoha2RkFHM74owbOr0FfGCXV2PpjsKkYcUSWQ==
X-Gm-Message-State: AOJu0YxRTKC0e09MKJJbIvK4wXSdFAcz7i9Je5a7HKRxkiyI73EY7l0C
	ZTFuX+R1dxkeob+woW+hRTcrcsy5ErHAhJh3S4alDsXsxFZBrk3P65zTo7wSlJU=
X-Google-Smtp-Source: AGHT+IHIPqKC4UKrFERHT+wWEYW/Paz6CXd8QxzmTWJl10ZcPGrFWZEyzu2/SlGkUFW1fQN5nzOzBg==
X-Received: by 2002:a17:906:cec7:b0:a58:7edb:f4be with SMTP id si7-20020a170906cec700b00a587edbf4bemr3172637ejb.46.1714029541042;
        Thu, 25 Apr 2024 00:19:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id hd38-20020a17090796a600b00a556f41c68asm9091174ejc.182.2024.04.25.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 00:19:00 -0700 (PDT)
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
Subject: [GIT PULL 1/2] ARM: dts: samsung: dts for v6.10
Date: Thu, 25 Apr 2024 09:18:54 +0200
Message-ID: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.10

for you to fetch changes up to 7bff1d35c1294c011b0269b8eaeb8f930df386fe:

  ARM: dts: exynos4212-tab3: limit usable memory range (2024-03-26 10:06:05 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.10

1. Few cleanups of deprecated properties and node names pointed out by
   bindings newly converted to DT schema.
2. Fix S5PV210 NAND node size-cells, pointed out by DT schema.
3. Add FIFO depth to each SPI node so we can avoid matching this through
   DTS alias.  Difference SPI instances on given SoC have different FIFO
   depths.
4. Fix Exynos4212 Galaxy Tab3 usable memory, because stock bootloader is
   not telling us truth.

----------------------------------------------------------------
Artur Weber (1):
      ARM: dts: exynos4212-tab3: limit usable memory range

Krzysztof Kozlowski (7):
      ARM: dts: samsung: smdkv310: fix keypad no-autorepeat
      ARM: dts: samsung: exynos4412-origen: fix keypad no-autorepeat
      ARM: dts: samsung: smdk4412: fix keypad no-autorepeat
      ARM: dts: samsung: smdk4412: align keypad node names with dtschema
      ARM: dts: samsung: exynos5800-peach-pi: switch to undeprecated DP HPD GPIOs
      ARM: dts: samsung: s5pv210: align onenand node name with bindings
      ARM: dts: samsung: s5pv210: correct onenand size-cells

Tudor Ambarus (5):
      ARM: dts: samsung: exynos3250: specify the SPI FIFO depth
      ARM: dts: samsung: exynos4: specify the SPI FIFO depth
      ARM: dts: samsung: exynos5250: specify the SPI FIFO depth
      ARM: dts: samsung: exynos5420: specify the SPI FIFO depth
      ARM: dts: samsung: s5pv210: specify the SPI FIFO depth

 arch/arm/boot/dts/samsung/exynos3250.dtsi         |  2 ++
 arch/arm/boot/dts/samsung/exynos4.dtsi            |  3 +++
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts |  2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi    |  6 ++++++
 arch/arm/boot/dts/samsung/exynos4412-origen.dts   |  2 +-
 arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts | 12 ++++++------
 arch/arm/boot/dts/samsung/exynos5250.dtsi         |  3 +++
 arch/arm/boot/dts/samsung/exynos5420.dtsi         |  3 +++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts |  2 +-
 arch/arm/boot/dts/samsung/s5pv210.dtsi            |  6 ++++--
 10 files changed, 30 insertions(+), 11 deletions(-)
