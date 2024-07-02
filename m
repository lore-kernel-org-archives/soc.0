Return-Path: <SRS0=GM+A=OC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A4C3064D
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 06:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6B9BC4AF0C; Tue,  2 Jul 2024 06:35:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4F1EC4AF0A
	for <soc@kernel.org>; Tue,  2 Jul 2024 06:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4F1EC4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367895d9991so93386f8f.3
        for <soc@kernel.org>; Mon, 01 Jul 2024 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719902119; x=1720506919; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SV0H+HrdakbKUIjbj++z7USHMNXGnmA0/oVEohe2xCM=;
        b=T2uwGb2nZ+JX1s9ImiM+nGPXrPwqvQ+A0GNTS7Q70uD3n1GjGBAHIgGepWduRgBAg9
         YAh+TUN5JTrN8sq2LP5oDt0rWITiRU+miCUpgkesZazmJn4U3GR4TiWNtFIVPekFOtbJ
         btkRibh1Xo2qO9sRSgxfqbwIz5BIO7glYWkxlt7y9EGNiD4XPsN448SlXlqcq/CC5nm4
         47ZA3Er8EdXTtHekVrCcjkxNEhTzDWIfTq1iwfxAz37a2W+XCyAMpB9Bdr3IHaszLV5E
         heI0jeChx5XH1L3I8Rj478RUwcfpHXD/wAkvunRnq6hWDjytEuTUfAUzPo/FC+9/GLPd
         z1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902119; x=1720506919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV0H+HrdakbKUIjbj++z7USHMNXGnmA0/oVEohe2xCM=;
        b=FUGAAqwAfjsNplXlL8ZwPVSUr2k6nqMK96gKHf5OWYJdLc5RKmLr3thGGn8KL1hhxn
         oREyYYDHwJC0qJCmXL0m5sLz/ctAyTdNV94u/gw89OqH5eY3M88dZvXlkRD3x1ohaJOw
         1cCbjmQs+hgKF6FptSvxdfz0TbyaMvug1Gfjpqyz6fOuwG74AfLRPBN3zW6k6LZig3KE
         VD47SrwQqolTRWgHXOZ39uoDDqmDKftGoIE7owe2lwZDpJr8T72vsROMUCVaHR29xkS3
         dI5pAy986OgJe1dsW7c56l6gf6x16iEe3ZqIPliWkq6OX55nY/UoZHcob04tOk5GqsW3
         Ox7g==
X-Forwarded-Encrypted: i=1; AJvYcCU8RttUQFzw7ok6GYMejD9CVMGJTujrbdbEM+yx3o3C26GN+eWcByrbn7zGCZ73EllgIYlv9hUo/4eNQFrCrA==
X-Gm-Message-State: AOJu0YxOIaz36I4BDsuYm1TvJL3PyzUVJy5FzKhyGpo4RmSK6dim+1Jj
	DXuE3G+pUOo+foEu/XLE6PwJaJsiP21TiIKOzvKeXPo2Hvh+NGiHupJGt2F9+T8=
X-Google-Smtp-Source: AGHT+IFH/eplWFpYILo81fRi4xi2+zKqmr3R4DDdSufqSBrawRvNhoY/XYehOOZrKLpBgWKRXXEmKw==
X-Received: by 2002:a05:6000:1fab:b0:360:7971:7e2c with SMTP id ffacd0b85a97d-3677571c877mr5980936f8f.54.1719902118840;
        Mon, 01 Jul 2024 23:35:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030dfsm12150875f8f.100.2024.07.01.23.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:35:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.11
Date: Tue,  2 Jul 2024 08:35:08 +0200
Message-ID: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.11

for you to fetch changes up to 64c7ea42fcc2b972fc8d108642f4b8fabf0999c3:

  arm64: dts: exynos850: Enable TRNG (2024-07-01 14:27:09 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.10

1. Google GS101: Minor cleanup and add fake regulators to USB phy, to
   satisfy dtbs_check.  The PMIC providing these regulators is not yet
   implemented.

2. Exynos850: Add True Random Number Generator.

----------------------------------------------------------------
André Draszik (2):
      arm64: dts: exynos: gs101: reorder properties as per guidelines
      arm64: dts: exynos: gs101-oriole: add placeholder regulators for USB phy

Sam Protsenko (1):
      arm64: dts: exynos850: Enable TRNG

 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  8 ++++++++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  9 ++++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 22 +++++++++++-----------
 3 files changed, 27 insertions(+), 12 deletions(-)
