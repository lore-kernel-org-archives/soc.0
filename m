Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADA23CEE5
	for <soc@lists.linux.dev>; Wed,  9 Jul 2025 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088535; cv=none; b=lU4Ew2fbt56KE/VrHSpiwSqsY/7DSavVkoOWBEcZ4IhGsNusTVae9p/9DDmTDdx/Y3CmQ3TTxBgwViXfGmH/DNGuqDkCJsjByInfwPIdU7Gk+/M1CIp4I9VnDk0t2Tu9zBL+XusQsR4PnquwdHM/odS4vBC5Lq7uzSonSD+XrzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088535; c=relaxed/simple;
	bh=OIoxzz9nTa1KEMKLgwavRzStSsKZ+ayPWesJQHTnF6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdrJMh/9bte3OMWevve9UDGs07sRioAqpotSRnBAYeGL4tAKIg3YoGDtnjzWSzkl+p783WuN4SRSKySI+4eVONrlRtZAD6Igoo/yB/QhFGD2X7fz+MdrqLuECR9zfFwyfXm8B0Vw2oIv9yUvAqlwkZuB4Hhzxqo2yFIfKyWJl84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGsgnUQJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGsgnUQJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45368313a7bso222355e9.3
        for <soc@lists.linux.dev>; Wed, 09 Jul 2025 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088532; x=1752693332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=jGsgnUQJMfieprvfNC+LIwDAbmIvtOEjjIGKm1uaoYiLuWf2vDlRxniYA5FR5rWPTx
         dBuS8Ng+SX6M09puhVIaesjnuZSZf53L3fwKaKUISuWQnk+ZGkupDrGpbbDmKJ89AZiU
         jXLmUmd30BjWb4t+HpJU39SSxtVTJwT3YqdayRf00sV/jlnQbxKBz9/nGUdDOlUqhW/Y
         SGCzu5mCBRjwsloFl6vggY9vCi1JsjJHy++wDdLGCrVWIwScXZVWL/dQj+jfDb4lHbxX
         S7agKmNzdHTI1pn+ntPNo0497AffFskr6Kfy7dfI4i26na3BX5CuCt682FX+Gj80hX9a
         6Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088532; x=1752693332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNbl8U+xncbpp1a9NMqWFqisIKUYudEbkTWWSf/ClaQ=;
        b=rtgXk4Sh/XvadyZZBohyGZbYKHW0ZTqqYtIrM5zTy5WybDs1OBbEu0BrhCXnZZ6bWK
         D58lKKqeGvTf0fVAsikjdGOJdUlYEaWVs/4jPoXid0RvzNnugUSojYqg+ELO1B0I/vXW
         dZqeNyCP/6jfyEg7aLeZWLDrcfpNKq4CP37Qx7KX23tcCbsdBcde4dBm5HKeEiFVHsLi
         kiWep8ScrwzDH3yInKfHqO3OWLQhgrDG/ar8SmVOFJvnXP6hw2HRDnrIe4hEK4hjjLCH
         CjPLqoyrZUTqrGpqihQErRiuvNB2B6gGrEt2vNuDGBoAx6fOnC6U29MSk07tIOe3h8j3
         /cCw==
X-Forwarded-Encrypted: i=1; AJvYcCURaxMbYBdk5lVGkNtyh40emsIVpPKNCUuLG4C+VUhqf6SNKS8OrQ2Gn09+dMxkhORfvxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGzc6p7iGHsRgFCavI81rrhPQYnRQABq+YpiveZ6HCb0uTZPMc
	0WFSkvTMFREe+FxO6lodrz65H3TwgS99DJt8u6+eQSc5zhLjxCec6whs/rpDtJCGveg=
X-Gm-Gg: ASbGncu2OnCGxzm5x6ebgiVAufqjds13wtHb/oEilv6k6F+XfSYlnkbrwbxEC2dpaMR
	GWFOjUF6psbcOrHsz2TWiUMREcovUc9fMx0MwjZKSoiPfJLkCUe4xW4t0jKqmLYJGPkbOQEH3Sb
	yvaFoWHLSCuteGf3mshZarF2AVK0Am9wndZHoG5dDMXQ/tig59it1G9N0CqJM1pwfcr+D6cpLlf
	usgFHp9nTKefBs1S1medHVBHbsdbE0ZuXMxVQi52ipZVHTAGeVCJRC997R1w7EdkI8RdQ0uWY/L
	EosZZ/OwUxI5fxja2rXTktYXUgFtCaWFQRM5tDZZPV0sdOiWkubc7KbQgqxrqtCUz2T2l/7Pwvs
	=
X-Google-Smtp-Source: AGHT+IGhNA++7xZg6xgr84ItwYyhelF2UwYcUcnBnnifNfCSp2rTw7/vvTd7m7A27LjCuZliDTQLRQ==
X-Received: by 2002:a05:6000:1ace:b0:3a6:d256:c5db with SMTP id ffacd0b85a97d-3b5e4543f00mr1268338f8f.13.1752088532254;
        Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
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
Subject: [GIT PULL 3/3] arm64: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:22 +0200
Message-ID: <20250709191523.171359-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4153; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OIoxzz9nTa1KEMKLgwavRzStSsKZ+ayPWesJQHTnF6s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/NKL27EF4KQkesT2MoJWrhmPLTsMsLxQTV9
 Ys2GZMKRgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zQAKCRDBN2bmhouD
 15fBEACHFwozinLrM6K5N5e/2mYfNzEFTl+V7ougAttEa+lWvR7tcmGlIPgGwtJ7KvaEmJZRgQi
 JWz9dMlXIRsxSVVQFeJpZfYs4gSA2OD/3Bxx4Jl97R+SD3owvFjs257RvrUivPKozjHKw66nOmf
 Y+qxXHUWEecUo47WKYlPvO49sYYa9oJVrNehrN/XyKoVvrsG7LnKQZLH6bxA+0LS672gz+CSBsS
 ZNFwPTKMs6AzgODHnsbjNmprq88Zn3UVCn6o30ovvFtPQ6VqHraX8eDpzhqtX4sM/Ohm3U2iXib
 W4hgDwkVNWwKSjDlW880VqRJmlPasLUISOcOVN7M04vuBNDDwoIa8qYb6ohBRdJq04DMVXwXuZ/
 8esRKXWR2lwag8K+8dutaP4KELdh/LZYZZU6rfIK/jwxkIIp1XnlPkpHMSH+thYcPSh5Os3L+mM
 aCw/qK1SXGohHc3jXPKwQ3ZVXE7Wgs25906EepQnfFxZx/fClmnaQmvkwWnEDvlsRUxqB64hmlO
 Horjnau8jTBMt+ftOp8ht88yQdEXvZxOkYSaW5F55kuH2zqCRwvaF5v7xksl4d1mIIsp8KPBQrK
 IMB6wjl5kYn1h2CL23F/TDg+uCV1M9PO0vWORqdxLV5sxjxKEwvq9AC0gIga5TOpvtAyJoXLWm5 IIYTqo/9PlzLIEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17

for you to fetch changes up to 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17

1. New SoC - Exynos2200 SoC - with basic nodes, pin controllers,
   clock controllers and initial USB support.  Add board using it:
   Samsung Galaxy S22+ (SM-S906B), called G0S.

2. ExynosAutov920: Add CMU_HSI2 clock controller, remaining SPI nodes

3. Google GS101:
   - Prepare to switching to architected timer, instead of Exynos MCT as
     the primary one.
   - Add secondary Maxim MAX77759 PMIC to Pixel boards, managing USB Type-C and
     charger.
   - Add incomplete description of the primary Samsung S2MPG10 PMIC.
     Several bits, like regulators, are still missing, though.
   - Add also secondary reboot-mode, via MAX77759 NVMEM.
   - Switch the primary (SoC) reboot handler to Google specific
     google,gs101-reboot which gives additional GS101 features (cold and
     warm reboots).
     This change will affect other users of this DTS, but to our
     knowledge there is only Android, from which this change originates.

4. Exynos7870:
   - Fix speed problems in USB gadget mode.
   - Correct memory map to avoid crashes due to secure world.

----------------------------------------------------------------
André Draszik (5):
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode
      arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      arm64: dts: exynos: gs101: switch to gs101 specific reboot

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DT node for all SPI ports

Ivaylo Ivanov (4):
      dt-bindings: arm: samsung: document g0s board binding
      arm64: dts: exynos: add initial support for exynos2200 SoC
      arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      MAINTAINERS: add entry for Samsung Exynos2200 SoC

Kaustabh Chakraborty (3):
      arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
      arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
      arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount

Krzysztof Kozlowski (1):
      arm64: dts: exynos5433: Align i2c-gpio node names with dtschema

Peter Griffin (1):
      arm64: dts: exynos: gs101: ufs: add dma-coherent property

Raghav Sharma (1):
      arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |  169 ++
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 1765 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  561 +++++++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |    2 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |    1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  378 +++++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   96 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   10 +-
 13 files changed, 2996 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
