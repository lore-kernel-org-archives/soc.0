Return-Path: <SRS0=hr1I=MH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BDDC4345F
	for <soc@archiver.kernel.org>; Sat,  4 May 2024 12:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E04C3C4AF14; Sat,  4 May 2024 12:12:40 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44A05C2BBFC
	for <soc@kernel.org>; Sat,  4 May 2024 12:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44A05C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2df83058d48so5772441fa.1
        for <soc@kernel.org>; Sat, 04 May 2024 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714824757; x=1715429557; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICI5eXiJ0vUJcoCOr2N1c06yFJQ7Qp0yrnmnXTdidMc=;
        b=rvMxktCetDygSsSyNh/fVFDqkLH2gGkXrP1B7bdiDX190O+BI92zqEuUNy/Qea3NcP
         0vtK5iQM2kjVgxfuntWfdltbOKDKXLVF+RDnIUkRMkITIhgbBCncJE8NWThuE6B+s5kX
         ohzHVOnVCWDtpbjpTkgFr70DnY8drk8hrdAokXUNRDHtHR9GOAHvHeaGK/Hq7DcG1a2e
         23AYRgoEGcHgaqxCzKdwuqzxiX9aK63INsmqvwx2SlIiTYgtl7ILgaZ/kceEcF6VCMII
         D2JyyQH1XfDIxkWDxN63A/HTXoJfn1OGlLAy5ukiyeXDM3F43y+xPLh64jhtPILIDfDs
         UbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714824757; x=1715429557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICI5eXiJ0vUJcoCOr2N1c06yFJQ7Qp0yrnmnXTdidMc=;
        b=d9JvhOJmOPwAqE6LKErM6OM9iCsBjKoBivlKw2HW813Ohnh4ZJqKl4Dzw/iFCxSNk2
         OW3i3y03O9lXUeThtn9Yc2btiUyq+aza+I9c8Ia4FThFz3/IsQY+FkHisRWxGhlS8qrV
         v6vs0Sk2cUa3fBu3qhS1K9y5JP6te95XuXvmO04Uu8KZj8PdxPka7QpvLAGYdz5YoZ6T
         ceEIIugFyxe7GdEE2ycqTzVbLkDPy0578mMSv5Z9HVWkGO+JSHcYdKLV3FynZLNhrZdw
         gRlMJ20pl6bGj9sEYx+tIph1+Sosvcz71UK1V2OfqrBOmfrDYa6LVq9Z51rD2ya8WQPu
         zC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcDF4AY4m5nLnDYCr4Lk5bs4cjm1GXgulW3/HJQeWxn8VuxO60Rtao1SFXDTAvgF6MqI/WR4eQEg3NT7vFRQ==
X-Gm-Message-State: AOJu0YzHM3B6kzlEzaN0ayLur/88iAjX1XrNGrao0oTusBZclagrU9lg
	M7Ro7Xrx6umr9PzjH2Zys2woEl0iBQftd1K1RsvN1LuDnGM1pkBcNHJ1mrJL5M0=
X-Google-Smtp-Source: AGHT+IFj+qJ3fbIHVe57Z8zbN5Rs15TtFjm6vsXzOPnENrewemL6r+rTHyYA8LfnEUOPnluH4G2KLw==
X-Received: by 2002:a2e:94d6:0:b0:2e0:37be:b70f with SMTP id r22-20020a2e94d6000000b002e037beb70fmr3228987ljh.26.1714824757350;
        Sat, 04 May 2024 05:12:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id hn26-20020a05600ca39a00b0041a68d4fe76sm10802937wmb.0.2024.05.04.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:12:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: dts for v6.10, part two
Date: Sat,  4 May 2024 14:12:32 +0200
Message-ID: <20240504121233.7589-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On top of previous DTS64 pull request.

Best regards,
Krzysztof


The following changes since commit a45c3a9b1ef9571741d40bf10f22ce3c60bc5111:

  arm64: dts: exynos: gs101: define all PERIC USI nodes (2024-03-28 10:51:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.10-2

for you to fetch changes up to 4db286b0a29aa3576a401b637ac5910dac22117f:

  arm64: dts: exynos: gs101: specify empty clocks for remaining pinctrl (2024-05-03 10:36:56 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.10, part two

Few changes exclusively for Google GS101:
1. Add HSI0 and HSI2 clock controllers (CMUs).
2. Add USB 3.1 Dual Role Device (DRD) support.
3. Add UFS (Universal Flash Storage) support.
4. Document bus clocks in pin controllers necessary for accessing
   registers.

----------------------------------------------------------------
André Draszik (8):
      dt-bindings: clock: google,gs101-clock: add HSI0 clock management unit
      arm64: dts: exynos: gs101: enable cmu-hsi0 clock controller
      arm64: dts: exynos: gs101: add USB & USB-phy nodes
      arm64: dts: exynos: gs101-oriole: enable USB on this board
      arm64: dts: exynos: gs101: specify bus clock for pinctrl (far) alive
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_peric[01]
      arm64: dts: exynos: gs101: specify bus clock for pinctrl_hsi2
      arm64: dts: exynos: gs101: specify empty clocks for remaining pinctrl

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.10/clk-gs101-bindings' into next/dt64

Peter Griffin (6):
      dt-bindings: clock: google,gs101-clock: add HSI2 clock management unit
      arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
      dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
      arm64: dts: exynos: gs101: Add the hsi2 sysreg node
      arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
      arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs regulator

 .../bindings/clock/google,gs101-clock.yaml         |  55 ++++++++-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  42 +++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 128 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 116 +++++++++++++++++++
 5 files changed, 341 insertions(+), 2 deletions(-)
