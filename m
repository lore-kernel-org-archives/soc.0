Return-Path: <SRS0=u+Dz=FU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0BCE92FF9
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE803C433C7; Fri,  6 Oct 2023 09:39:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E88CC433C9
	for <soc@kernel.org>; Fri,  6 Oct 2023 09:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E88CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c3c8adb27so332521666b.1
        for <soc@kernel.org>; Fri, 06 Oct 2023 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696585187; x=1697189987; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLoSSC1UZ/duJw3hpKoUG62FpPtnA3XGq+6z+gTs89o=;
        b=E1RpWwo4MHsPFKS1XamyZxvHfCTPMh2vkX3zMDX/d60LFqrMOFcUSDCD7i/VzbQtcF
         8jOy5nkItGVY7OF/9Vt2OToIEh3GvGwUnvTEUxSNi+Adada5m3uO3yF1bjJqkafJ9x7x
         C3xoFyFYincAoaQHTYg1tZEFc2XmqOCqBZPGwBFUfV9j9eS/vS8onBecG8jyBndRVutM
         7dlbr9wadhrdiCxgBrBAeD+mvEvh5U6vmEcM9a28qORKRBjWsLpHsawkD7I7i8w/qWQe
         8GCj7a/vKfjEDn4KT0Jx1jU1lE+M1VUw6l5BdGKIwl/FvJKlpGSvKepXZxETfKrfNy4e
         9wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585187; x=1697189987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLoSSC1UZ/duJw3hpKoUG62FpPtnA3XGq+6z+gTs89o=;
        b=MR3E5HIIgbQJY100ZIM3640peatjIxbhYTI/iJn+gM/2mf8/+DQM+kDKtMNs+jUS2v
         CQI0iKTecEUvjy9MuqUKkSrzaGqWC6ADNpqOKHd7LuwH+G5xiHEfX5pKIipSiGce5JYd
         au6tpkVaHw2AuURYhwgmnnhQDHI58hXd6HW7wQ7lNex5iTF/PKI+lGw6tePtWD5U7exJ
         fqPM4EkU3pPZa29vfqzERB2d95hbSG1omgfQO4LI+7C1AmKAXd4OHhQDyLuu+HnEPOyr
         eTMykhpYLCG5Kluo1DajeiLLPVx3yR8g9S0X0VGizbfoNgnyoxMoLWO1L+2C1w7fYKnb
         xLHA==
X-Gm-Message-State: AOJu0YyU+KzOfInzp9aDn+Znnn93I2P+niNUNgMR2n2EESBnrmfbcQBJ
	XDQOfXuTywhQLJQRFUiJ120x6A==
X-Google-Smtp-Source: AGHT+IHckojQyurNLeQ/G2riZtqxasLlCFF8XS3S+MkODSkeGkhvnMpArmgxvcKqLy8dfsM2vl/kSg==
X-Received: by 2002:a17:906:518f:b0:9a5:c4c0:2d8a with SMTP id y15-20020a170906518f00b009a5c4c02d8amr6236348ejk.24.1696585186900;
        Fri, 06 Oct 2023 02:39:46 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id gx13-20020a170906f1cd00b009ad8d444be4sm2583412ejb.43.2023.10.06.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:39:46 -0700 (PDT)
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
Subject: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.7
Date: Fri,  6 Oct 2023 11:39:42 +0200
Message-Id: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.7

for you to fetch changes up to f28dde395937e000585ac87c0d1c18885661161d:

  arm64: dts: exynos: remove unused TMU alias (2023-09-14 10:03:47 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.7

1. Exynos850: Add support for USB 2.0 (host and device) and enable it on
   E850-96 board.

2. Exynos5433: Switch sound card to generic audio-routing property,
   supported since previous release for Samsung drivers.  The old
   samsung,audio-routing property is deprecated.

3. Few cleanups.

----------------------------------------------------------------
Jaewon Kim (1):
      arm64: dts: exynos: Use pinctrl macros for exynos5433-tm2

Krzysztof Kozlowski (1):
      arm64: dts: exynos: exynos5433-tm2: switch sound card to audio-routing

Mateusz Majewski (1):
      arm64: dts: exynos: remove unused TMU alias

Sam Protsenko (2):
      arm64: dts: exynos: Enable USB in Exynos850
      arm64: dts: exynos: Enable USB support on E850-96 board

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 23 ++++-----
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  1 -
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 58 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 30 +++++++++++
 4 files changed, 99 insertions(+), 13 deletions(-)
