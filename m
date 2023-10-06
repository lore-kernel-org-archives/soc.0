Return-Path: <SRS0=u+Dz=FU=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC8E92FFB
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A138C433CB; Fri,  6 Oct 2023 09:39:51 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E0A7C433CA
	for <soc@kernel.org>; Fri,  6 Oct 2023 09:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E0A7C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so3544672a12.0
        for <soc@kernel.org>; Fri, 06 Oct 2023 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696585188; x=1697189988; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GValG6j8RNZe/VVFaV+ji1MJUR/qCB/Q7tXe9d+VUds=;
        b=YuUQ33V64JCGsUrGEtl/JDb0viABDwAfKH/skLgmlzMQw7MKm+dnrqg74Xhwo6jf1D
         ZXKUM0FC2ajzAhwj1k01Fmh4CAWheA/WWqUjCpwwdW/ioo8dCGWjZlny0sI4Wu9SjDve
         eeYiDxu7FzF+ONNitS7OwJKsM5AJuVKSOMJvnZ5F63LUFlv1kp1MpvoZQhHZSRUZLoj5
         yW36E8w8f3FYqnTnpqkJyu2LHhRi8enJ4LpxIZ+UyPuIYN4h1Pkfzk8Sz/RnyC4HSL9Q
         j5kMocAaEnbK/lP5MvIezP55bSY2kf9tiyvtDzT4bKjoYR6yuSJSK1k85UURKan/KJKl
         G4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585188; x=1697189988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GValG6j8RNZe/VVFaV+ji1MJUR/qCB/Q7tXe9d+VUds=;
        b=RfJ4FK8m/CwWJCUwNyqT6xwZ2O0FKB5PFvAmCC7bEuKrOSgmO6PQnBudZXKTUaE6Br
         jNIUsv7eBbhrHUCIToaRiEgsPofi69wAO/TFRkUEmHg+i6dVIqBx1Ph/u7MxX2TafPNb
         niIUpeD+D55sflJPaOjRmGGY7zGX2m3zvDgQHVKtma0W8sP1p5WJMjy09WumwvZ57bxS
         pfgLOewXETYXkQFj4bBYd9tinxTMZI+giIM3B28IQWcQda/F9oULlCHTigSI1fth4ajB
         +YDKNb5laKp8QU0bybVeEifcTKvd3rg71SwZSqwfsSqssfRfFQgksRbvGcuODuKhI9Ly
         qvhA==
X-Gm-Message-State: AOJu0Yy3W1Aoum9v6OmrzbmrT0Ab4BU1FMcar651ERI8ckTxVH5KTB+3
	QUWtu7VYq1oK4uGMx5fEzIjU0Q==
X-Google-Smtp-Source: AGHT+IF3Vfgt3fpYEEU1JdjAoV9ABhEWf5VbjC67mu7J86cXzN1EweHSYIV0d2PHtTSL5DORtZjjbA==
X-Received: by 2002:a17:906:19b:b0:9b6:e6ff:b20b with SMTP id 27-20020a170906019b00b009b6e6ffb20bmr6398018ejb.8.1696585188442;
        Fri, 06 Oct 2023 02:39:48 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id gx13-20020a170906f1cd00b009ad8d444be4sm2583412ejb.43.2023.10.06.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:39:48 -0700 (PDT)
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
Subject: [GIT PULL 2/2] ARM: dts: samsung: DTS for v6.7
Date: Fri,  6 Oct 2023 11:39:43 +0200
Message-Id: <20231006093943.106002-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
References: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.7

for you to fetch changes up to ef399736c3ba77fb82d778b1b7285baa65a7e079:

  ARM: dts: samsung: exynos4210: enable polling (2023-09-14 10:05:21 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.7

1. Switch all sound cards to generic audio-routing property, supported
   since previous release for Samsung drivers.  The old
   samsung,audio-routing property is deprecated.
2. Correct Exynos4210 thermal by using polling.  Apparently interrupts in
   Thermal Monitoring Unit are broken.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      ARM: dts: samsung: exynos4212-tab3: switch sound card to audio-routing
      ARM: dts: samsung: exynos4412-galaxy-s3: switch sound card to audio-routing
      ARM: dts: samsung: exynos4412-n710x: switch sound card to audio-routing
      ARM: dts: samsung: exynos4412-odroid: switch sound card to audio-routing
      ARM: dts: samsung: exynos5422-odroid: switch sound card to audio-routing
      ARM: dts: samsung: s5pv210-fascinate4g: switch sound card to audio-routing
      ARM: dts: samsung: s5pv210-galaxys: switch sound card to audio-routing

Mateusz Majewski (1):
      ARM: dts: samsung: exynos4210: enable polling

 arch/arm/boot/dts/samsung/exynos4210.dtsi          | 12 +++++-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     | 41 ++++++++++-----------
 .../arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi | 43 +++++++++++-----------
 arch/arm/boot/dts/samsung/exynos4412-n710x.dts     | 39 ++++++++++----------
 arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts  | 13 +++----
 arch/arm/boot/dts/samsung/exynos4412-odroidx.dts   |  9 ++---
 .../dts/samsung/exynos5422-odroidxu3-audio.dtsi    | 19 +++++-----
 arch/arm/boot/dts/samsung/exynos5422-odroidxu4.dts |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts  | 33 ++++++++---------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts      | 37 +++++++++----------
 10 files changed, 124 insertions(+), 124 deletions(-)
