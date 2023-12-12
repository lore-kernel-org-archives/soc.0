Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79179C4167D
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 09:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ABDFC433C7; Tue, 12 Dec 2023 09:31:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6F8AC433CD
	for <soc@kernel.org>; Tue, 12 Dec 2023 09:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6F8AC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c317723a8so45037585e9.3
        for <soc@kernel.org>; Tue, 12 Dec 2023 01:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702373472; x=1702978272; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT1JrNd7Xh9affKUYGufSKLnRgO9NCJPK/+u/p2YNSU=;
        b=zc6qAJ0ciTufvNq+VuN6jn07QniTEJAmQTY8s8arX6YvkTDI+LDd7xB0usJ/mxXXK8
         Fev95b1llp/I4+u/+ZELpMvn+Pv/duKXcYbnE/XeQ6bNJzJP/W5R77sIvKA7f79zGgAA
         USn05zzABD8ukjIff4v7NAP03FIp81O0rQBoFIJuuxzqrfQmBSqPIcKmwwgTRVoD5I9n
         0szQ9/Y5JedrkbXoQsyth/4sIOe7en7DgY++f/BXdlTI2w3F2fQa6gieZCBtRVpaqcqn
         cGR4XaKemIOPYrZVNHhtPd833D+ofAJbeirKSUXo9Q68OLGmowyISHJTmIdUoyypMRNb
         1eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373472; x=1702978272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT1JrNd7Xh9affKUYGufSKLnRgO9NCJPK/+u/p2YNSU=;
        b=DQ5FxhdxUuuuEbOtSnbTr4Ev106qaUB/XwQSfT3vqhwIbGtmGnjc4ijZZzfNVgO4Zv
         QHzWVKXicfQdr9V5lh/+9xaxkgec2jp6cMsAjYTRE7D2t44+TE1ntp/2zJeQmutRXUs+
         JYM8xlNOTPRx0qNLI4NGi1WpHjm0ZnPPjpkN3y2kZclrDxFT0syV8VGTFHFpxORyhc3N
         vLjK0Yl9ua6ZObzN9T9/8q9Sl77ENH/hkMMTois06ogNIRAmQm9+ZHcPPOA2NwHNRYB5
         t+glk6GJmgQ2KiLWCGDa0kcT+v7IgxTaiLLe7HBAT0DDm8dN8T/eZjC+DByU29wzoZf4
         7PGw==
X-Gm-Message-State: AOJu0YxzbriAByklfnV/YHqnSQeCenncK+mICz03kSQeBUeYzY7kZwAe
	/xWj1fdxyUyg4kBvkU+evWG8iQ==
X-Google-Smtp-Source: AGHT+IE+ZwU5DBKg6w3fcvGqVzKaj0LTIv+2OhyE+F2zWYVgLYYHgVdm+n1fqLqXnuQ5cuFqTfN99g==
X-Received: by 2002:a05:600c:2d52:b0:40c:2ba7:ee30 with SMTP id a18-20020a05600c2d5200b0040c2ba7ee30mr3122570wmg.165.1702373471932;
        Tue, 12 Dec 2023 01:31:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b0040b4c59f133sm15799711wmo.1.2023.12.12.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:31:11 -0800 (PST)
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
Subject: [GIT PULL 2/2] ARM: dts: samsung: Samsung for v6.8
Date: Tue, 12 Dec 2023 10:31:05 +0100
Message-Id: <20231212093105.13938-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
References: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.8

for you to fetch changes up to 50c7cdc9a4d2d21373c1ab52c131109ab30c53f5:

  ARM: dts: samsung: exynos4210-i9100: Add accelerometer node (2023-12-08 20:42:17 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.8

1. Exynos4212 and Exynos4412: Final fixes for dtbs_check warnings.
   Replace duplicate PMU node in FIMC IS node with syscon phandle.  The
   old solution of duplicated PMU node was not a correct representation of
   the hardware and could have concurrent access issues.

   The DTS change depends on media FIMC IS drivers changes already
   merged in previous cycle, thus it is not fully
   backwards-compatible.  It is a necessary trade-off in fixing wrong
   description in DTS.

   With this fix, `make dtbs_check` status looks like:
   S3C6410: no warnings
   Exynos: no warnings, one undocumented compatible
   S5PV210: one warning, one undocumented compatible

2. Exynos4210, Exynos4212, Exynos4412, S5PV210:
   Correct FIMC IS camera ranges and IO addresses to silence dtc W=1
   warnings.  No functional impact expected.
   After this fix, there are no dtc W=1 warnings on all ARMv7 platforms.

3. Galaxy I9100: Fix 12-second hang during boot by enabling regulator
   (real cause not really known), add touch keys and accelerometer.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: samsung: exynos4x12: replace duplicate pmu node with phandle
      ARM: dts: samsung: exynos4: fix camera unit addresses/ranges
      ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges

Paul Cercueil (3):
      ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
      ARM: dts: samsung: exynos4210-i9100: Add node for touch keys
      ARM: dts: samsung: exynos4210-i9100: Add accelerometer node

 arch/arm/boot/dts/samsung/exynos4.dtsi         | 26 +++++++-------
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 48 +++++++++++++++++++++++++-
 arch/arm/boot/dts/samsung/exynos4x12.dtsi      | 22 ++++++------
 arch/arm/boot/dts/samsung/s5pv210.dtsi         | 18 +++++-----
 4 files changed, 79 insertions(+), 35 deletions(-)
