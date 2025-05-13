Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295C9244679
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131042; cv=none; b=RB9Cs8YObuZK6EdvIOBpD6LuTfpV1npD5r4xmQGgbVXbpcwK5WE0STpeeCYx55y1YFUSd5XFtPCTBSTzMq/wYZLgYI7APMHRLkL8sV2DZQTVIY7LtWFjGiN0tSnk029hr508f5jAhzJxjiAQm1WgYPEGcsADNVcTju3sNBlrw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131042; c=relaxed/simple;
	bh=Mw1tyq5QfND79Wb5z/DsSwOKjJVKpecFlRbtqfJOXOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdJq+yEzpspXwTac/9m3e0xGuSIoEhyl9D8uDGldj9ghWdH0BlhnR8qm0Xzwf+ukcanIn+xGMYacSMmEcnP65CA/EQv0Ir1oiPl8z4IlFqnDrCHBMBIqe137BvyHyiCnGIRELNA2DRI8n3/vvNczHXoqVjYe4MnJwnTMoovUa1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCZCDV09; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCZCDV09"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442eb7edc80so350385e9.1
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131037; x=1747735837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=bCZCDV09B/OAQtfJpMcj+N638gmvdKgIokh2B1w8vwd6goiY94BkG6YdJ8WaOu2qEi
         9RVbwMwKYaF76Gaa2tRnU58nI9S3sHLrwPTAcdBtrsqgGpRyf90y1UqYjJqOcUPlGksO
         VCB0qqsx3ChpliWkfeAnweo3oqmpIoXECymKF/pIWuyKp4S0MuSCtEEVVwIEIosn9kex
         SFe4gXVxG0wyPfi2O5GUgzgm1XQ5pFRCP2omf7/l7benaYR0jyAbchaDJSwGpxhTT9Sk
         r5H4XoLDnH2RAwDrpIFRZSHZmpfr4NgPsurNPrZaFvuPwW7DH8fHsATj1zfxkdTQhJx/
         yWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131037; x=1747735837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=SoWOryTyGkCCymAbOwLVHQRGIsbmqUZnbEi1/gAJ4idaSkWhhBjNY4IVUTu8TEAjGZ
         pi2DsAymMgv/Nx+UJviSI1wltTd0og2OLOVs7Iw2mAOZxHg+pUQzN8UfSIfMbnDJyLt1
         3SQVQipv0JNbspdERQdgo4bSHD75eAPGPOxcYWVvf7SWq7GH/hrKhbVlW5tukwFogBMK
         RBBTw4TuHG0iFQXuEk8Yt4w4O7H+2r9ouyB4X3W6zBcEaoq2YM/MO9SEPppzR12+kBPM
         GXgNwjb0SB5FiJwOWhTxkVEnTwMBKPnVnpRdvJdCKIE4EGtEpTFoly03HY4BBaSl3mht
         JTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV07GEvJ/xN33VovGQXE2UdtlwHTh6h8G1TQPK8tRT9Dwy+qcvHTdkyoMcjitdwSjoE6BM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhq8pRtbhQ+xHALU3cAb+RYDB1iBOPuvQC8wY/cmAM66aETO/0
	YuNOj4y+0up3Nh9orloMh5f4ckopZmdUl0aRwgLh/uh+yY06Yz4BhTgVTsbDANo=
X-Gm-Gg: ASbGncv4NSiQap/KYblW5vm+mv7WntOsf440kqSYhmyBlKhPXKbjrSTN+U5GKh/1h0d
	xesK98aMpRYQuoh9bn7jnDGcVOAr3025xHe7t2J5Fq0cHFBZ2AxLdY46lZ0zUv5V4WN+IbXd2eC
	bY09/tUn+fbSGy89ytscMoA1Nt/5yTlLr7fZfqmdiT2RUg4SDhh3qXVU5C5SK7u+eApfeJLhU5R
	Qj0+YAaUgGiEQ05TY9vmk0f6wRmMPrFbBdrq6YmAuMVIT9/Ax5NrxnHMRUFD4YdRVyyrwskpq3t
	38XDNH0ixIAQNmdfBxNgllquqVcOqD1SAAqouStEbf7HNJx8ld1T817s/jk9kU4Cg57QA8bBkFc
	5IwXdmpudBQr4w3NlqOZ3tqXEJoOSgtgrknA/R/8=
X-Google-Smtp-Source: AGHT+IG/cZVqXuc+pBf7UL6B8hCIaPUE80iB2obzNalJ0Q7d8K7s5vC7GfG5dhzBEFWg6B/3BfGcWQ==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr55413605e9.4.1747131037326;
        Tue, 13 May 2025 03:10:37 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] arm64: dts: samsung: DTS for v6.16
Date: Tue, 13 May 2025 12:10:23 +0200
Message-ID: <20250513101023.21552-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Mw1tyq5QfND79Wb5z/DsSwOKjJVKpecFlRbtqfJOXOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqQiLF8lqPQxiZfFjJOOgAXgivq851DtvWOY
 wVxZ/pDpeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakAAKCRDBN2bmhouD
 10UlEACKFX9blnyKE3zoty0mjF32nefBZs9EruwNIxVFRMKIsmm2hKzldWArgXhgb6aoVoGIduW
 LQQOvhJn6O+OkpD6yBQIP2oe2XldQYWlTbRoAgSrAUsfRmwHrZnBwdCRnKY6ajkLKzrvOK/KqWs
 oXFFAqVioL5RTPrB7oWsmxOGeybClBjZ6rZmGEegEDoJPUK6ei8ndY1DfUtvsFGqGt8ZdQn5Z20
 Hr5yqbWHhcqhl5PdIMOFWpPq3wR6T3V1PvpS31j42tnnFzedqAKI7dvW4o+vF/qvfP65IowxBiE
 sQzmN4zBdX/4kCZDIIuaeYgIu8vwahq8I5HcMPvwUOfwQZ9UsUDlrZxSUKuvaedmxfKL2wrrCU0
 Xy2LMgTTRml+IaW1VqRnwkBU+VS9xADEQSQsKES1nRAQQZCCQ2rRGvP7oRTEBlXTn+QqBw6zq61
 3PsOUr7ZFy6LC8oRvH+/EE/gj5OVqXCjH8enrQSTZhXdOChXSyTiVnP6fOwFP6gO3bexky6UTFD
 GeKM7Q9KbtLKjzqpbfQF4AUm3Ki4679C8cygq9wTsF4x8avxsifvXzFgmsMxnB25TJnG5vqaYFh
 tdcWVxQ21s7ry/qZahuxUJ7Blz9+l9lpvHWHbAFtwDRRbyoLa0THuU1SdCl3uSr/qZtLpHr/g8f 8SWqs7R+GK6l9UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.16

for you to fetch changes up to aaf02428fdd50b818c77644bc0b8a0b282ce8ea4:

  arm64: dts: exynos: gs101: add pmu-intr-gen syscon node (2025-05-13 10:02:17 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.16

1. Tesla FSD: Add Ethernet.
2. ExynosAutov920: Add more serial nodes, clock controllers for CPU
   cluster CL0, CL1 and CL2.
3. New Exynos7870 SoC with pretty decent coverage: pin controllers,
   clock controllers, I2C, MMC, serial and USB.  New boards using
   Exynos7870: Samsung Galaxy J7 Prime, Samsung Galaxy A2 Core and
   Samsung Galaxy J6.
4. Google GS101: Add pmu-intr-gen syscon node for proper CPU hotplug.
5. Switch USI (serial engines) nodes to new samsung,mode constant coming
   with DT bindings v6.15-rc1.

----------------------------------------------------------------
Faraz Ata (1):
      arm64: dts: exynos: Add DT node for all UART ports

Ivaylo Ivanov (1):
      arm64: dts: exynos: update all samsung,mode constants

Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

Peter Griffin (1):
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node

Shin Son (2):
      arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

Swathi K S (2):
      arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  613 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  662 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1021 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  712 ++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   14 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   48 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  536 +++++++++-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |    4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    8 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   20 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  112 +++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   50 +
 15 files changed, 4406 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870.dtsi
