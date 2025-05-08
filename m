Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971D221542
	for <soc@lists.linux.dev>; Thu,  8 May 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696912; cv=none; b=O2Ie99aHCdLxySF9QCanoCP+Pfb6iPdv6KcQ13ACtH6pxqxjN9QdkHsSfM1iA003bi/j0dYrBNA64hDR/7ovIO2Qh3/9nzg1UpzsYjWAg8xrPznaUyhMCr8yh0DsuR92ajTpSAb+lvRAHkcYbu40dBMk24RFRxNJD+xUHUNRJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696912; c=relaxed/simple;
	bh=w+eLW9auwjDVDQmdClgKq8DsjVn63PgGnWOaMjVULMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMDEKwauxVWscAPIos4aIschNaU5G9Xwt7iXxl4CyTqW8T6j/AwJ/6KcEThzCRW931jQOJzTa7JhNRz1fR8fgH5YmXH5Rln/vIrsARRVN7croki9EzXUpQdnnNyT93toP0k/2EhsK16DBjo65E0Xsyh4y1KkXgBLTsQpwkOK9X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jEcrilh2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jEcrilh2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b3f62d1aso108487f8f.1
        for <soc@lists.linux.dev>; Thu, 08 May 2025 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746696909; x=1747301709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66+08GOmfkIp+d63lAxnda85Ee3dq/w26jYeNGjKn28=;
        b=jEcrilh2B3vMQS67ewRHh4KslchxA0yRQnI8Tgwhn/NY2EA0BbMlJaqSWGmjsl26gR
         CgSDmU35OstibCTL2fa+HFQAuEWgZjuYFG8u2OZvsQ7IEoBwYP2TUkb6yW1ug7g7q2Rx
         C3tR2pJr/7WDe8eLXtVyv3G+Lj22L135fNpkfPLU0vmBIsB2p4ve7qSY5U2EbCwhhdzE
         nxJ7FRTldxzghWGZUJ++ySy1e0EwqxqHCHJduyaFeQ/lA91+qiNSLfmd+oFHvnMhvJUE
         obTMy4kORc5X9N93FP1yo07Ipgf4uiQLd3/9jXKBtU87nlCdmKUmCEeTWBnuGw+d/1f0
         ySMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746696909; x=1747301709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66+08GOmfkIp+d63lAxnda85Ee3dq/w26jYeNGjKn28=;
        b=Xg+VfhrOl7j4Vsk3/xRuh2FrP3eV+OFAaLIgu2iABfipyxSE+13ANN395KEr15PWfl
         V2tJPEIT+kiwPjAqdGKixQxM21cxftQ5pgfnweZG8THrHFmDWrW2MbFu712pFYD3vzUM
         k8Ou/W62bD9s7dRGoBBrOldHFh/dKJyLypf47jbEcxHcnXc/Ks7YUtNyq4Dhvrnoiv12
         SiRQQbC8z/31S4eECUTGdqQoIsT8mLyB4i7kdGTnSolI1RW66ZmDiDN7/jcDYQwwBf5J
         CJgDdy3PLUVJVdXphj1W//H7/z9I5cOQnubh4FtolAgOQjheNhQLlJcS3OH6AOd9+r3l
         zCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyMx1mU6hw285xGQkSiU5a93uCzAQpie804AHSWwJX1RLEMxuBvBaxnYpWq87CXxnEphA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG6cMqFj2OWNYDtiXQX+mRxJcCeJpcr3NCzNwUGSm2qKl83OWK
	s3CUJFfcd6sF+XSVdfYP0SdShTSvcB8FevzMAqTd8SLKPVMBgWrb1KdXv2Dna9l3m+p7bKs3Bjv
	c
X-Gm-Gg: ASbGncsBvl37IrUXnS9miYiiq37mUv5wSlDmzx1szeB+1bjw2LbL1QcXIsJFw4v3lW8
	FLO98nNnJ1PEgdv1vKBtTnatl4hwXVfM7c5PMf6AbCZ/xFYoE23Iv2uEq2BoVI7PWjplyhuUoaj
	f4ixRsxP8Fvu+tp597v3wDsSVVqRUcHx41kURGljwkC7ZcLo96sTXbRuozarS+ambSlJzyqn197
	D4DIx+l3rDOPk02R7aw3se1l7IorIdlKeteTU4JyPB2GI7KxN95FHRE/lkjx5SZumpiIJGEQcpL
	txtzHCYLCWhAZjKuZgK/dumCpPTkzNDTqk+0vLCFg3HpgXMWeiWSrTK2Hbhn
X-Google-Smtp-Source: AGHT+IFMs6OflZWzGX96ZOUuS4c7PORYbzX2TjndIa7eJTh7JJuY1McTllEyFdftg4Snan/Quvod/A==
X-Received: by 2002:a5d:5c84:0:b0:391:277e:c400 with SMTP id ffacd0b85a97d-3a0b4a3fc56mr1830914f8f.13.1746696909266;
        Thu, 08 May 2025 02:35:09 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm20006746f8f.92.2025.05.08.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:35:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.16
Date: Thu,  8 May 2025 11:34:51 +0200
Message-ID: <20250508093451.55755-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=w+eLW9auwjDVDQmdClgKq8DsjVn63PgGnWOaMjVULMk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHHq7dCWWAexsOGNo4ZJ6g5koZezIcO6BM+nXS
 N4wvCmGJF2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBx6uwAKCRDBN2bmhouD
 16z8D/9iBJLTaiL7RdNYe2/PCm9/oajdVyDOjDpsGkhvC1OGIO1OCi5weZ4en3nbnR8IhdNSv+7
 EUaxUSftoa0pTQG8fAS4UvtASzawNTAJqf+HvJaO72KZEZB2mU166It1xph9yIzGJnBXR7mugff
 6N33OmbgjewYhm0Rug+46X0FKBDJfSjM3KzsrkanBphVXGqdPNmnN521gvOn8vtBalMH2VytanW
 AGIf5sqPtRy/oeKNwkD5f1p/Z4b/ve3rqE4SuoE535puok3qzeMyh9dDdiFGUIt1retxe0pg0Xw
 9s02PZPmmvYYpUCpkNgfS4mTdalBHRrb9yWpSAHI1arzoCV8HxMp4Jsp6gv7yE5wSuwIJhHTTtn
 PsDzbvqx4pPycV1Ok73olZIad8wF93x41WUCFDu2d3ghhQP3Y0RA9zkpvR/c93GBCQ6oqaReip2
 uRgrKfkJZGXDSwZFrlpQbiNiKG5GYEl2yQzuKhc9KaW1XnpEaYJA9gpx5+dDtRSIItSEMqBcoEV
 KIZgVMkI7U8zvieu+slKXYLqJ221t+ugSatTFPKIhnwgdWJUTb9k+8JNHcGDz9X4mluBbuwX8t7
 G0yEXjcyN7au7QpK0WsoM0FK6ERZAx6XfWFIPwYvEktOFIsmFk6pkC8E4XaRNQ/fv38cl9xoOq7 uAO60K+I8khtsgA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd,

Rest of memory controller drivers.  Note: this pull *does not* contain previous
Renesas memctrl drivers, so please pull *both*.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.16

for you to fetch changes up to 02eaee70babd860d76dc23f9165f4496d0ffe77f:

  MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver (2025-05-07 11:27:03 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.16

1. Mediatek: Add support for MT6893 MTK SMI.
2. STM32: Add new driver for STM32 Octo Memory Manager (OMM), which
   manages muxing between two OSPI busses.
3. Several cleanups and minor improvements (OMAP GPMC, Kconfig entries,
   BT1 L2).

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      dt-bindings: memory: mtk-smi: Add support for MT6893
      memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI

Bartosz Golaszewski (2):
      memory: omap-gpmc: use the dedicated define for GPIO direction
      memory: omap-gpmc: remove GPIO set() and direction_output() callbacks

Krzysztof Kozlowski (3):
      memory: Simplify 'default' choice in Kconfig
      memory: tegra: Do not enable by default during compile testing
      bus: firewall: Fix missing static inline annotations for stubs

Patrice Chotard (3):
      dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      memory: Add STM32 Octo Memory Manager driver
      MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver

Salah Triki (1):
      memory: bt1-l2-ctl: replace scnprintf() with sysfs_emit()

 .../memory-controllers/mediatek,smi-common.yaml    |   1 +
 .../memory-controllers/mediatek,smi-larb.yaml      |   1 +
 .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
 MAINTAINERS                                        |   6 +
 drivers/memory/Kconfig                             |  23 +-
 drivers/memory/Makefile                            |   1 +
 drivers/memory/bt1-l2-ctl.c                        |   2 +-
 drivers/memory/mtk-smi.c                           |  52 +++
 drivers/memory/omap-gpmc.c                         |  15 +-
 drivers/memory/stm32_omm.c                         | 476 +++++++++++++++++++++
 drivers/memory/tegra/Kconfig                       |   8 +-
 include/linux/bus/stm32_firewall_device.h          |  15 +-
 12 files changed, 798 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32mp25-omm.yaml
 create mode 100644 drivers/memory/stm32_omm.c
