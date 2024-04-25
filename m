Return-Path: <SRS0=7Kaj=L6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C53C10F15
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 07:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C433DC2BBFC; Thu, 25 Apr 2024 07:19:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3F4DC2BD11
	for <soc@kernel.org>; Thu, 25 Apr 2024 07:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3F4DC2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso85436766b.2
        for <soc@kernel.org>; Thu, 25 Apr 2024 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714029543; x=1714634343; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDtBGib/Y6SrLcaq1T7Za9185cOkevaJjpxXmDQw774=;
        b=zTHGGsHZsRbaVz0j3rF2OcBJSjYm0OmdkVKQcg2ByELH6Zm8QdkUuzzULgMYBxvhfr
         H+GamnqhK9WxXiBmOZh6C1o2BBaAF18bYr19AKRKZ4ZhW3lckXFllu54PrRHGeMIXCf2
         njnwObEbu0E7JptNzKKPdMQaikKuhwsz2H6M/4MVWLME0QItVgi0x9qkBD6xEAxslj9S
         ERsVqCVE+GUP/IwBlkKKvMLwenM0yJTHVECFWkEha4x+3OY9kjdpTVUAZXaWdXOLG2ZM
         Z6wVGO0wR8o3jFSZVhZEENnGMWeZQliVafhKtlhmGR9nou5hAsjRyaYOe3CDep+5Cd3a
         b1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029543; x=1714634343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDtBGib/Y6SrLcaq1T7Za9185cOkevaJjpxXmDQw774=;
        b=c/83V4ap2akMHzqCt2avEIvbmTn6hcSUL0b+spKATDEX5BO503EDZFWTJ8k2Vk9p8I
         +wX0OaQF2jD7hVB/4Q0RJtkO368/h/ETae/4MZ5j4ULY36dJ+NCiAVWJQJ8q91myQkSD
         ZlHOcjioP0nTt7ojUgM17QKeHUPz9UL2hkS5nMvduQq1Zk1HiWLgShnfYdMMUXthV8NQ
         e/bX83r9yIXA2zE44PRrU5lDIjJi+86zGbUBQbdF/Kyi69CdDed0DTMt+zp/N8qPEgq+
         9u7WZ3JJa7VSeEnIaCQ36YtJz+ZBkF78gQVNnJNXkUAmZPBYOZ7jOD3IVFckuHfaoJs8
         Ds8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHsIXZIqP1ovxeJc8Cnno1kxsxMrxXERTVvKneVJK4Ag8qoij/cyU/1c8yv+BuJGabOQXdXyfgDwHP8U42RA==
X-Gm-Message-State: AOJu0YyDxO/keI4kw5GpKKGGp/sAl9QfNPxNU/3tzTZ+INoN0NBJ9Oy4
	ztwXuEbQQ6oUmqJTaFPd3GixR0FFB5Ndnd5FhIPhyDLtLy1oi7w7SAiWA+tyrIA=
X-Google-Smtp-Source: AGHT+IHcW+odnUXlsGsaZcYoRQyADpE9jTnNF7imEjFFLWjqptBhedzpNGemXljntpCtWYL/qIg9/w==
X-Received: by 2002:a17:906:3953:b0:a52:4394:888b with SMTP id g19-20020a170906395300b00a524394888bmr3292157eje.65.1714029543241;
        Thu, 25 Apr 2024 00:19:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id hd38-20020a17090796a600b00a556f41c68asm9091174ejc.182.2024.04.25.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 00:19:02 -0700 (PDT)
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
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts for v6.10
Date: Thu, 25 Apr 2024 09:18:55 +0200
Message-ID: <20240425071856.9235-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
References: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.10

for you to fetch changes up to a45c3a9b1ef9571741d40bf10f22ce3c60bc5111:

  arm64: dts: exynos: gs101: define all PERIC USI nodes (2024-03-28 10:51:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.10

1. Add FIFO depth to each SPI node so we can avoid matching this through
   DTS alias.  Difference SPI instances on given SoC have different FIFO
   depths.
2. Exynos850: add clock controllers providing clocks to CPUs.
3. Google GS101: few cleanups and add missing serial engine (USI)
   interface nodes.

----------------------------------------------------------------
André Draszik (1):
      arm64: dts: exynos: gs101: reorder pinctrl-* properties

Sam Protsenko (1):
      arm64: dts: exynos850: Add CPU clocks

Tudor Ambarus (6):
      arm64: dts: exynos5433: specify the SPI FIFO depth
      arm64: dts: exynosautov9: specify the SPI FIFO depth
      arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names to dtsi
      arm64: dts: exynos: gs101: move pinctrl-* properties after clocks
      arm64: dts: exynos: gs101: join lines close to 80 chars
      arm64: dts: exynos: gs101: define all PERIC USI nodes

 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  26 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  12 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 791 ++++++++++++++++++++-
 5 files changed, 823 insertions(+), 15 deletions(-)
