Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD371A2C0E
	for <soc@lists.linux.dev>; Sun,  9 Mar 2025 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546570; cv=none; b=c9GuW1lSHXZkLFina6nMbFQmwg8ikt1wGXcYWP4zCQDSYpodS2dVKgu5VX3JtpW/UoVMVgPWa+T3HB18IaU1S6JpxH+VRV9+ew5B29GIQrnVHOsJlZrsCoo9hz+0J9zk2CFAOHbwb1nXG1mI9Zxtn4jjxznekTBva4OFFf+Q2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546570; c=relaxed/simple;
	bh=Wa7r3qkuu7xnz/VOd3o4Ss+BQayKG/5FMUt/lzJsU2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHMa4tQrFXpkU3jJMSCNWR+NaNcEQhsx71Sgf1VjI4fZDVGFm4uYjt6FMC2NiRtL8/SEwJbrtUIrlv7It+HplwWp9HV2YgkM80xlBFGz3E8dwkvDce/VwCl7ESUPiKDl675PrWStnoQ2CJPex0jdNV1JssfLWERNPKfP/mvfQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+IjTn6W; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+IjTn6W"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so239504f8f.0
        for <soc@lists.linux.dev>; Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546567; x=1742151367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpRuX79H42AyJwMpeb72MjPa6wN8mVoMbygXkMxqYc=;
        b=G+IjTn6Wbii2jSCCF2P5DfLNUu8EFrcprnw0ljPPYyfQaitRsIAJ84yGVkMYFum+du
         qt1m6tDIUv4Ttxe5hF1oToqE78Fd1Aw4+ljP+kY3vVF24aAa1V+Ni10fbohzehwjcRGD
         du17Rj8I1h3PtoLTWsyv3XYvnnEypOX5MTl8GD3qWTiStRpz7HJPzvv8qOGX7usVwV2N
         ZEIYoDv4ojgHExdwA3DZgBu6negalVYPRxecamisK2zlYzdaFa3yRlHzSgauCqG1rhj9
         sxS6Jp6ZPjjzgKIkGkPGbRbB2xpf7J90/3xpBdoNM0bd9buxLQ0m/L+LCpAkhBJ4Qscu
         4bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546567; x=1742151367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYpRuX79H42AyJwMpeb72MjPa6wN8mVoMbygXkMxqYc=;
        b=OTqYT5WUMFj+tTT+pt8Xmu2XY44ipfUJqHNNyDO+mtxoD+HUnbBPtWrQMReAAV4NqL
         ZOpVjleINjokArWx7k+Oq53gUV71iy6tVpAOt51HucFqDsdgkb52380mI0vxtW9J6T2s
         +SryvCJFdBN68I9gDaVcqKnSWn9DElkT0CxgZniSwXF8dGcZ1QfMyanKYZYnCOccwEAU
         B8Guw6+Csv1KZjp1MyL0I/0tzA3g7yjfDm1RK1HFdkDFr32vy2VDtJ6a3K0J6znUQ0jl
         ntv4i0hj5JHQQxSwXs1YFVbtl3zUGTkxH+ZmmbFoGL3a1l9JqbSdvqf5Ymo7ZYLsBTEu
         ++Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXNPQ3eBi/pCdXVuB7GDVZpNJ4DcGGYrj4oG2/8uYcOodwwj+Si2nQVtenzIxJFLp80tLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwOoZkOMhNwOwhibWRtqOZq+sEllvtpGPpWTqq3u2MMTRtTAw2
	3nKdRTmYxmBiVReKG1EwxiI7wzWhu/8ewhasQ1yLS3/9FWUpajS50mMXTisaOmo=
X-Gm-Gg: ASbGncvePaNsqXxCYjQasQXlWDdamaGxNzVlOd1EvpoYZIzAHRiwK27VuZJV2HCKiBQ
	VYF4Fc4RzMinsbLMPZzum1e8hwUfMPQMPlcMSWagV67rIZaz8m19kC8ewahNSJ/Nydy3uonBIlU
	UO7dY8+qG2PkLy6qGftLAV1hmswknosAREsxl9tnV5zHb65IXF6nycORNNb0J3poM9zruGsgtBk
	YDocitjD9o/vviDs7lO92T0rbTuzWTjnEl7movwPMqEqp1oiLieoTVc2XLjuc8jw5PNOROZSTYe
	MzhOUnCW8D7YNVmWvA6b7RnEgUWrIvQ2LBkG3GqG8VGznD1NU+fX8BxvwsM=
X-Google-Smtp-Source: AGHT+IGtaEQwIFc/6TYT3DLRhe8XehJ9zBv7aECl0lbGZTSP5NvnoXEhZ0PSYiVFLI7kcHS+u3EmMQ==
X-Received: by 2002:a5d:6d8e:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-3913ba438famr1345644f8f.0.1741546567145;
        Sun, 09 Mar 2025 11:56:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:06 -0700 (PDT)
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
Subject: [GIT PULL 1/4] samsung: drivers for v6.15
Date: Sun,  9 Mar 2025 19:55:55 +0100
Message-ID: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.15

for you to fetch changes up to 8f299df1b75ad0939f1340182c265de019eab438:

  dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example (2025-03-09 18:53:34 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.15

1. Add support for Exynos USI v1 serial engines.  Drivers already
   supported newer IP blocks - USI v2 - present in Exynos850 and newer.
   A bit older ARM64 designs, like Exynos8895 use older USI v1 block.

2. Add Exynos ACPM (Alive Clock and Power Manager) protocol driver
   for Google GS101 SoC.  ACPM protocol allows communication between the
   power management firmware and other embedded processors.

3. Exynos2200: Add PMU, ChipID and SYSREG Devicetree bindings.

4. Exynos7870: Add PMU and ChipID Devicetree bindings.

5. Various cleanups.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: samsung: include linux/array_size.h where needed

Colin Ian King (1):
      firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"

Ivaylo Ivanov (7):
      dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
      soc: samsung: usi: add a routine for unconfiguring the ip
      soc: samsung: usi: implement support for USIv1 and exynos8895
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
      dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
      soc: samsung: exynos-chipid: add exynos2200 SoC support

Kaustabh Chakraborty (3):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      soc: samsung: exynos-chipid: add support for exynos7870

Krzysztof Kozlowski (3):
      soc: samsung: Use syscon_regmap_lookup_by_phandle_args
      Merge branch 'for-v6.15/samsung-soc-dt-bindings' into next/drivers
      dt-bindings: soc: samsung: exynos-usi: Drop unnecessary status from example

Tudor Ambarus (3):
      dt-bindings: firmware: add google,gs101-acpm-ipc
      firmware: add Exynos ACPM protocol driver
      MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  50 ++
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../bindings/soc/samsung/exynos-usi.yaml           | 100 ++-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   5 +
 MAINTAINERS                                        |  10 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 224 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 769 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 drivers/soc/samsung/exynos-asv.c                   |   1 +
 drivers/soc/samsung/exynos-chipid.c                |   3 +
 drivers/soc/samsung/exynos-pmu.c                   |   1 +
 drivers/soc/samsung/exynos-usi.c                   | 108 ++-
 drivers/soc/samsung/exynos3250-pmu.c               |   1 +
 drivers/soc/samsung/exynos5250-pmu.c               |   1 +
 drivers/soc/samsung/exynos5420-pmu.c               |   1 +
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 23 files changed, 1359 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm.h
 create mode 100644 include/linux/firmware/samsung/exynos-acpm-protocol.h
