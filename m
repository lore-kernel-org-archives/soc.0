Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB99253939
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685643; cv=none; b=fQ4VkFBMsdrCIQRyR0tygObkJgyEwzyF/ub0ulYX1gjLXZpsy8Rp+xYAWCEkzZomvOk5WdAxmAa34r0mE735t08b30iOoSYBrNEfjH4LU6o3YNWITLxFPYDPdqXM4DN6g/j0Jnymbv7UUhXN52wP4+QEl/aRdcpSUbfQMWi4juA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685643; c=relaxed/simple;
	bh=GsGVYveF6LPGpRIxaUGMCL0gNCUUve1qoJV1mW61tm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfNQKa0xajLwG8/4bRMdw1ynhfXoqmAd29o4AN4YG829R+0HXxxgnVDjj0QGQtab+h3tbMxHS9H0BiOdnHthdCfYQ7FsYks15iw2VziZwWY1Au1qI4M3IMgpsjburqwcZKJA9UH9HNUr4Gh7oJD99OOtaveH0ICNVZP2g7cLiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9CNW+ud; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9CNW+ud"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ce208c7505so287946f8f.2
        for <soc@lists.linux.dev>; Fri, 12 Sep 2025 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757685639; x=1758290439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLdSOVhorae1sJQKa+rEDUE+qmZFZt4ec4eMHpDkzvg=;
        b=R9CNW+uddPx2yeak7x/PsDNesp0oH7VY0uLhFAVFYxfCRifCWGQVjCtE8qAYpj6Hd6
         5jntcUhfpzKzlm7+4G2RDTjYTcZwVwm2QfSn+CCeAI4GFQqbpBlR4D3B0NpedKAuLoBM
         +NzrKU/wEb1YyN8EbczaSuvcLRQrrxFJZ9uTwB0WYlhnJtMR/IWBlfFsrwAbV3ZAJUi9
         eUszz37mFJeYaIH1PQUz2CY0IT2i+sH2Jo+8zHZrz1MTVawML0fFFhaUR4ctCb6ivt1t
         9S7af5OdwRVxpQo6EURH37O9oByV0GR96so4EESL59Is4Mljb5xnMBODMXPSfuicPXkm
         dcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685639; x=1758290439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLdSOVhorae1sJQKa+rEDUE+qmZFZt4ec4eMHpDkzvg=;
        b=dmt5CpVHEt7KaugSTypymlYb4XnbkJBWcD++iyhsqpeeelqCQ+FGwtxEZpGzVYn9TD
         mLTMb5lMYlJ1r+GT8MnZU/c0yrgiJyKBhsjSXgfMCnJ4c1v/rmgufVT64tr3FOY81TV/
         3fl+eMMu8Tt0nFPPSzltWNugtI3DnYXer0HIQfsznXWEMIP0iDJ0b9z94IWiDB9cmZXz
         NQMBsJpguJLJVJvnsSKZ14bMvKE84lfwyLS277NHY5vPbGKwBUAZgSaX7V1dQGF4/Mro
         w/ezstTlW+2+qZmErgnbf5k9qOLIKjr8ZjHBK5BIU84aKSzecV41ZwuKPBpoCjBbb7t8
         qW2w==
X-Forwarded-Encrypted: i=1; AJvYcCVXwF6Lh9+Gif6Jaui3SFYUhyPOJE1cPuMc5RLJXAXDwgrer1buwu3QPmmpw4LvrwkLjjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4Ydc22kyEtUHwdZhiJh0vvPbLdo98s++INAKl6mbARYycOCBZ
	lx8hR7+UOG8/iHwHLNh0hbaqZQ5v5mm6f6fARReb6TJb7Zpu7Q43s28gcMtSJsCF8LbfSXSwuJx
	x4EhR
X-Gm-Gg: ASbGncs+h7ewoMsfv1T9lJ/c8Df5qnajdrxblv+DduAH0j8UjZlKuQXxtSU9vVmKPHG
	BIxdopX6bDjOyRDz0/zYk1gXRKJynv9eowQUZCIP7xY8O1fTK8ZfhPP5uhZ0RQWiVSEGpJAAbKd
	9G0uQSzWvCu/HQ1m4p1BAVVahCmuJIxjHJJ3FafWaWdL6DUkzY90ShXGcLR1SaHAKRBO9DtRlOl
	C9Tg9VQCUsElD+92nBI6MbMc3lgqIHcgeju/2SKOVKQnCebBjldwNoeARyfOe78+HnZ7lVX5Oom
	EZ/AXVQP+eUPeIlLUdlYXDlGSwrjRrargsGEAwrHAGUUXHfNZq7riazbBZyqfPhrPkf3bTy6GOh
	II9OwmJRz92LX6gXmCgMObDiRMiJcGZNQUVQUqtn9Uj6r
X-Google-Smtp-Source: AGHT+IFAycuTssCo8AceTCLsclX+Nq0Z2MUF+Y17LO1+yDSCDwG3yDo6trmj7jip5dZZd6T7/JV4Kw==
X-Received: by 2002:a05:6000:186a:b0:3e7:52fe:80af with SMTP id ffacd0b85a97d-3e765a25841mr1345218f8f.11.1757685638834;
        Fri, 12 Sep 2025 07:00:38 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372bbd3sm62888045e9.10.2025.09.12.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:00:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.18
Date: Fri, 12 Sep 2025 16:00:31 +0200
Message-ID: <20250912140030.204650-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GsGVYveF6LPGpRIxaUGMCL0gNCUUve1qoJV1mW61tm0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoxCd+uVI7zoylp+k/nnK1KCwoYHYoa5H8PpYUe
 DenY1MHmA+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMQnfgAKCRDBN2bmhouD
 1ycQD/9IS1TJN68/pAUqCF91r8kwaZba8h99B/tU7FDZ/OXR7Hw2C5HME2PznnQkhlPBnRlWU+A
 fOzL3H3sjAsILpSsdkLIDVpJkSnAi9UK5oj3L7sG4vRLY0aW77g+KNxvquI25M4qVbPlEQdgQTa
 r6OL+zllkIOSSr+NPtXHitLhShElSvu1shU9UN0fqqH6HwbGtEHD2Q3qn5g6pHMsV0JhnfigjxN
 baW9NMWLjOIecYaVfVqn/BQ7hIlRFo2K21RnE295mQKMR8il4/6rON2Q/+SsF+sgQTmg4Bpz8mT
 RWbvVIJUWV1uT3lPyiFg82svh+uqOOmdfYPjERpjYYnid+Lr4F5ESxWQLJnkWiC4O5pssdksfzd
 4B6HRtG61X9caAeSbiuNLcGPA3BCvHv5NT9gANRfirPTXyErUDFdI0ZWh+P3BC5FmQX7AdJlf77
 3lK7jrH2k4caIn0P2KwnqbIdvWP7l6UptoBV4+r3cqG/m629HbRB3Yb+5QR3DVf5pICCaLzOUIq
 MI1xJgPcDH4QNngfNnFRmiIDreK+KA+AyAarBowpjbd2r1LGwXRb2dvFBd8vG07bO0UbkYbgJSs
 RKz+t/WHuw7xgC9DSJtH+bkpSIEKFDnlzOYFgYcgiCx8oO12cMis1dRcxE5YrLCQphrNmX1XYIQ 4qezOqZdenAfYPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.18

for you to fetch changes up to 3804cef4c59742cf695e7b41a9aabe8d5bb25ca2:

  memory: tegra210: Use bindings for client ids (2025-09-10 11:40:44 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.18

1. STM32 OMM: Fix ineffective/missing setting of the req2ack in the
   device based on DT property, if the value is different than 0.

2. Samsung Exynos SROM: Fix IO map resource leak if
   of_platform_populate() in probe() failed.

3. Broadcom brcmstb: Document existing, older devices in Devicetree
   bindings.

4. Tegra 210 EMC: Document OPP table for interconnects (driver usage
   will come later) and define memory client IDs as bindings, because
   these are shared between DTS and driver.

----------------------------------------------------------------
Aaron Kling (3):
      dt-bindings: memory: tegra210: emc: Document OPP table and interconnect
      dt-bindings: memory: tegra210: Add memory client IDs
      memory: tegra210: Use bindings for client ids

Florian Fainelli (1):
      dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips

Patrice Chotard (1):
      memory: stm32_omm: Fix req2ack update test

Zhen Ni (1):
      memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe

 .../memory-controllers/brcm,brcmstb-memc-ddr.yaml  |   4 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |  11 ++
 drivers/memory/samsung/exynos-srom.c               |  10 +-
 drivers/memory/stm32_omm.c                         |   2 +-
 drivers/memory/tegra/tegra210.c                    | 146 ++++++++++-----------
 include/dt-bindings/memory/tegra210-mc.h           |  74 +++++++++++
 6 files changed, 167 insertions(+), 80 deletions(-)
