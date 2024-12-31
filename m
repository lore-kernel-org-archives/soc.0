Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8D1A2398
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651082; cv=none; b=jfIJ30+pD3L6snIksOYNN8eg5P1ZPOQ49tKGu6HyvSshXauedYjbhLORgtizX8WETZideBp0WupBRsotNOrtDSsGcMSnfL4/3dvWpyj2erSGPSKE91v/iQHCbo941lkqces0Me0Cn4dVv7bWHZ8X6UnIv5+xgt4FCT/8bXe4fsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651082; c=relaxed/simple;
	bh=8Abt9DLwlSN/DVenDy9L+RiKF/fAYC1R2EoRkGYChRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxDBQBDYRuyHFz/mEqEQR1ty2w5fxlg5xkWQz2kFdX+hvRe7uYwoV9igLP2f/S7ABZAHPs/A0hrWRCuGfv0BdVWEuI5OPQgowz5sXQxDHFXjQllbQY8WLbGgdHUOywrhT1D7xJcG9pNAl03FUhDg47PlxilZbrOt6Y7+TF+IJM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsXpoQxw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsXpoQxw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43637977fa4so9624635e9.3
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651078; x=1736255878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=bsXpoQxwe4ER5eW8Eq9HgqmD5yZXKsI/1aEcdmj+sDNayH9XiLZkwrve/JaST9DQtR
         3Cs3SRHnh22UXVGRZC6KTNbm8vb5XKYHD9U0jSWRMuduMtjnMpEKNe74HzJFs+v/Diss
         QNMIXXlphwxLSKZVfZ1mMzprIjdoUOUEZ1lQ3wFnTwRFJFwZq0zVcWL55vLZapr5y9zS
         76Mauolskkzz6A0pnfgc5YauNwIo8BvgqCCDFKIqot60OUURjEMvxFI6qTcM+k+yI9f6
         2QbnkI4VAQEWIgM/jWuX8HDGtS7elcxi94gvdLqAldNiFPxsWPci/s3VoXksndbrhCqO
         ywMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651078; x=1736255878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiIndNH9dEzlzGL7CyrOUWiq2FGP174uSAo7Crt9eYw=;
        b=ktCO/ANxJy4W1i6MGrIKerqGoQDteUoYJ8Jnppr6/VUmD1I23fGW2FxrhXRn5U0QoD
         bya82n+35xDuqngYzD7ZhIU8hZGWi8Ogsi25G29/2b0iDnqxor8oZiotE5nfH0Yq6jTa
         spNn8UOREwZ3z1wcuoF+X+FDkBjznciKLHQXrexzoS5mohCr87NxNX8FHtKB8V1jGCV9
         g++z8G75PLHIKOdmwS+r5DM4huFC8tRnSHwqyp+fxzK0zuCbydjt3+kikWU76Pq6Pqm+
         F5WsQp+csO2bbnsX6TkgCTP0bqdlf+zX68XSdk57cB//2gv0ESVuCx0mL/4Cn/cr/azc
         mkpw==
X-Forwarded-Encrypted: i=1; AJvYcCUxZbq0rGWDpwox8Lr/SlFEeEfLzm7yVHXAMZOIcyyp9/krDrxSHTqaC/gnGltwQuEodCo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUIyoHk9k60Dr2GQYE5/ZflUSjN6LrltjdbG7kl//5r1Fj/cEw
	X9KS2YhnlrUQNQ3hnT+d91pN68/X9nSSPdwlqKcqsNpi2f7nNurLw321PQ1zkPk=
X-Gm-Gg: ASbGnctnjyl2S/UyoRLA7aeKnRwOPyqJVEeEJrMZqYi+kHLSrpwaDL33Eqbj199t115
	yAtgpDP17fSeOYpp2hW1AqAlANXLe40T2ZmCBOGuUQJXm8V//cd53yfJgAOfMD2l7joiSLxY69A
	kD3mefSEQaxLwyo2E1QRjGYDrFc1JQs5JQ5yFFUxB+lt+AIJFpScQYOXvydGsk++DH4Bx+JXtvs
	hGfKT8MN7V/h3byFw26TxgYQxYanNA6OJegIvRyF82eW+gcfCTefc8vgoeXplrWYFjVRMQ=
X-Google-Smtp-Source: AGHT+IFVEtvYE67HJ7VdU/l5KrgWkC3CkvWsWK1hbjrDA7cq4LCs/IzDCew94Z0tCX56MEGV7xGI9w==
X-Received: by 2002:a05:600c:45c6:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-43668b5e06bmr127243005e9.5.1735651078219;
        Tue, 31 Dec 2024 05:17:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] arm64: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:41 +0100
Message-ID: <20241231131742.134329-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.14

for you to fetch changes up to f424523b1b516b3f0984feeb1d8218e904d17a97:

  arm64: dts: exynos8895: Add camera hsi2c nodes (2024-12-30 08:30:36 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.14

1. Exynos8895: Add UART nodes, PMU (performance) for the M2 cluster and
   I2C controllers in the camera block (HSI2C in CAM0-3).
2. Exynos990: Add Power Management Unit (Samsung block), PMU
   (performance) for M5 cluster and two clock controllers.
3. ExynosAutov920: Add watchdog and DMA controllers.
4. Google GS101: Minor fixes for phy and USB. Add USB Type-C.
5. Exynos850-e850-96 board: Drop gap in memory layout.
6. New SoC: Exynos9810.
7. New boards, all mobile phones:
    - Exynos9810:
      Samsung Galaxy S9 (SM-G960F)
    - Exynos990:
      Samsung Galaxy S20 FE (SM-G780F)
      Samsung Galaxy S20 5G  (SM-G980F)

----------------------------------------------------------------
André Draszik (5):
      MAINTAINERS: add myself and Tudor as reviewers for Google Tensor SoC
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

Byoungtae Cho (1):
      arm64: dts: exynosautov920: add watchdog DT node

Denzeel Oliva (2):
      dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 FE (r8s)

Faraz Ata (1):
      arm64: dts: exynosautov920: Add DMA nodes

Igor Belwon (3):
      arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      arm64: dts: exynos990: Add clock management unit nodes

Ivaylo Ivanov (3):
      arm64: dts: exynos8895: Add serial_0/1 nodes
      arm64: dts: exynos8895: Add a PMU node for the second cluster
      arm64: dts: exynos8895: Add camera hsi2c nodes

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.14/dt-bindings-clk-samsung' into next/dt64

Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

Sam Protsenko (1):
      arm64: dts: exynos850-e850-96: Specify reserved secure memory explicitly

Umer Uddin (5):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
      arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
      arm64: dts: exynos990: Add a PMU node for the third cluster

 .../bindings/arm/samsung/samsung-boards.yaml       |   3 +
 .../bindings/clock/samsung,exynos990-clock.yaml    | 121 +++++
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/exynos/Makefile                |   4 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  15 +-
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  82 +++-
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 115 +++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |  98 ++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts       |  28 ++
 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts    |  28 ++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  50 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  83 ++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   5 +-
 include/dt-bindings/clock/samsung,exynos990.h      | 236 ++++++++++
 18 files changed, 1858 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos9810.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h
