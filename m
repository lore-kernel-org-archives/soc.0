Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28510325722
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889208; cv=none; b=Ji63T/kM/QEuAwWvTnlZY3oQMnni2kmN1yq2Rc9lD1aYSr2Zlru/XPRAtxgBU5s5iv/9aUwDJkVLShTqmDOcpX/af/PzrnO5RW+nHFfXqoNdYST8BxhWVJyBe+2SOwBDKkFEmZ6pUY3ktGQhD5ChtVm1StbXsYiTPK+dO3XEzfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889208; c=relaxed/simple;
	bh=fwml7KgkE1J3Ai4MZr/kpN1tNeDhuCSqy9eCyYXxwZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbNQFfuBMvc1O2UFF2ofbVlTfjcQazcTh2754EZljVq5e4IEz/vVxEYIzQnxWOX5FSW7SIWkJlKDzM0J21scNZQVDj4wTOAICwOTdD1+1M17leA7YDvcQ0FGeFy/H0pI/ILnbjqu94+UfNC5Ory4/4VkWd5+1Lg9lBYGI05HpaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eepCcKh3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eepCcKh3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bbbc58451a3so46748a12.0
        for <soc@lists.linux.dev>; Tue, 11 Nov 2025 11:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889205; x=1763494005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imIwJUQw0bI9H7QFTurPbNC+Bd5DwsLxwxGR/tUh3uE=;
        b=eepCcKh3ulyRkHsVhKsje0bIZAjQLAYbwe8+sxNFDFsxtAv4p7/H98VttNZ7M7ibRm
         JpIG4aRNgsjNfaj1ZkV3KlTtmsXsFgoSe+rLhyv6LYInFhYbjZwSrwvv73AU0LYAFIuG
         uwIhMtBjHrYtpevlQb2WrRFYO7r/RtvgH2SbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889205; x=1763494005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imIwJUQw0bI9H7QFTurPbNC+Bd5DwsLxwxGR/tUh3uE=;
        b=tqkmxOPFFesbM4Dk0UDs5qVQ19eu3+VZ2Lrp/sfSUQgp45VjgUzKY+RX4qt1jkFqjj
         YUR8dlh5boKtBYm8LLBp7D89YM3DNVroIkmXqc6jH8ifGcHzyll4gk4cpc1yjtdnENGz
         CwBixbn/SNHM7V90jWzJc3wAMWbdj2b641ezu2/RetEqBIgafbFMaa+JWy+ryMgK2qaL
         IgeBdJziVrsDvtlVxPkSNCGBbA0PuYXlSmnlAwAphWJqVGkwW5u0NCq+FqdLzuJaO6ZI
         o0DcQabzISfpIDzd/e21Wgidx9PpJHQsaY09+UIRtEPjLan+/Wdb8TDD1833AL4+pHTV
         rXIg==
X-Forwarded-Encrypted: i=1; AJvYcCXEtYnSwKBZ0RrL17tltdXS7QWHCFZoU8Vp8pECWa37iajZw9BVhE6virUV0xUzty40jUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMQBa/r5NAqP8iNm8UGBMfP7oJSI8GJst7x3YM10GuhpltDCtb
	TrCY/k9AqqiVlQ14SfrPoUYjqf1FQTZtCwB58r2dcavUrKpHC3YOM9u/Cx7nJUFijw==
X-Gm-Gg: ASbGncuHpz5xWC6oLKOdU8nkrwJ7m/nI6yjTWqhUM0YAsGhf41CvDw2cIxLCTczFqBi
	Bzf5v7QmWPb8QcNCS3z+oXj7WhxgLT13v7rVlvfUx6AUXOqAWXnFxXUtxPagzaT7xi+1jk4YM2V
	7ZcKnUvqlVrPyAc+E0wv2z2+92rBAabF1xaBcwNhQUNtwGU7CtvznWeFsDPdIpFzOaiOnvW43hN
	PgANYxHZQ0prNNQrs9b0aGyGQRhRZoXls0DsgZX8kvbWk82qgf87JgvPSgOeHS9jZUwjCPkpJO+
	OUTtTszOElA9y7BL9FzNTQ6qaRoJFvCo9PIkgSez0tsFJsUzrMys2oXTkem4ltZQjorhtYpTrw8
	JxghmCJym2Dejhb18puc2NkBK/6JrzjwBOeLSA7IeEJXWlQOOJl8i/r37uHNc3DFLygDUMvUdas
	U3tjmTlgNxgbvgBuLqmzWwzQxXe7qJPQOhXXPciIpkACcKKVB8AwjVsBX0mZNSEygs8zpejg==
X-Google-Smtp-Source: AGHT+IGjCOd+4ejNkIaM3IgSSrfNJ+dmBJ/8y2etg+UINkDzARyyHRj4mxQVKfiW2P/glN4METLcKw==
X-Received: by 2002:a17:902:e88c:b0:297:d697:41e with SMTP id d9443c01a7336-2984edaab98mr5869605ad.37.1762889205543;
        Tue, 11 Nov 2025 11:26:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:43 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 3/4] arm64: dts: google: Add dts directory for Google-designed silicon
Date: Tue, 11 Nov 2025 11:22:06 -0800
Message-ID: <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 6 ++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..f73a247ec61c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10606,6 +10606,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d..044af9a3b45f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -138,6 +138,12 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor chips starting at the
+	  Google Tensor G5.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index b0844404eda1..b4b5023d61d2 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -17,6 +17,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..a6b187e2d631
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-- 
2.51.2.1041.gc1ab5b90ca-goog

