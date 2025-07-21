Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90E28DB45
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753092551; cv=none; b=KbEOK47L+KJz8NPHdhPlRwB/DRZv6oMXWWa0z4L6Qkl+H1YSkBVxkHfThuCIHXMgsG4EKBJ/DUvvbHFvnbAiBfpLoMcb9oW5ee5t7iURFOnGNaYFO2gmEu+Qlud8vLbcvEhpl3ffl0QeS4c/VPYiKTE7jSWbG+XklO3+55TKBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753092551; c=relaxed/simple;
	bh=bIAPqEZhrV40kZAdZWtcnmooYJI45uzdmMq5yp9OOpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SY1teZnqvmujEbbaJfaORHMFvzlFJg4ipzWbFAbT8ZEurMOT7WuqeJDb9Hby6j5fNSRhqkah0l55f80Wq62eR1myVIxPdygDvyZ0afRqUa0yTkMyUSisZSW3+P3keaGWTDDRhm3Byq4L5ioqvAOmgK48Au518zS3IpTPUf7EGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z5R6zbDH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z5R6zbDH"
Received: by smtp.kernel.org (Postfix)
	id AC936C4CEF1; Mon, 21 Jul 2025 10:09:10 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1E88C4CEF5
	for <soc@kernel.org>; Mon, 21 Jul 2025 10:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1E88C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso7194043a12.0
        for <soc@kernel.org>; Mon, 21 Jul 2025 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753092547; x=1753697347; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcFckvzN7xNx2cFpkfKVkI9GXO+rMAPN2eeDe+pzM/0=;
        b=Z5R6zbDHK8QZPPma0nc61RzaIZWouz9dMxys//pyV2hWHqclnLCktY8OPQYbows5OZ
         4hPurYpM+yk3ivx3HJmUf3BEbxafAwA1yI31Pfytb9p60TZ081G0XV5eRzvy+ia9SWdr
         sx2ksqg9FxCQrkgVIL3rRx73SL4QAnc3LNkrgvy+IOAl7D+jitJWSzld16n0SxLdxFwI
         61wORTB5tZEBQItD8DacqP/GiaV/u7JhWW94PhTwlbXuS2KEkxIDSWmxGAfrv70BEcDN
         iq4I4n6slmbWKOtCLhcn04JuxxtOfELY8viXlhHAy9b4Befb5knhCq6V3oF5N2Ad19BF
         z1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092547; x=1753697347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcFckvzN7xNx2cFpkfKVkI9GXO+rMAPN2eeDe+pzM/0=;
        b=fppv5NHcAsgDv1xkT6rL+iBqlMj9u0VCuyAaqalT4i+5W0xMYrBE+u/LJk30YSjJGH
         IONXchxaka9hFYw9msHMDkwrDVaEsszR8GHtM7gLaamc64xRVeLGOmYAilGZeOZppZRg
         zvqAKLGVZDtgXA2kfYyku75UTTy+yFlJmXT4VWuZKRdoxE5z05Fr5qkTBsJH5hvrM8T/
         8/jsGdz5teSqWeRcA6ntJOkdc+gTQW8MfTRuyQhWFOHeehEC4T0UeSbNvu4Su3rvubPf
         AY+0LZ5o+7VrWTmlGiOelUjPSb4D6YTt6ACg3vjPsJMInsI0jb097YS8+DYUlvSQ1n1p
         t25w==
X-Forwarded-Encrypted: i=1; AJvYcCVrAu7NzcuEz4Kiu813PQawu+Ka2YXBTNvzxB3zZtLnwAvz2/zSaqdZQX5CD9UfoQrEs6E=@kernel.org
X-Gm-Message-State: AOJu0YzfAbZzJ2N/cBhPfdBZ0gwmfKXJMf7nOn/rXUAnkqYxaMUYRfc0
	bwPYa5o5KnFOqYyTQdn42W0FlrSx4RzEBEZp1c+m4hn+T+h1i4MzY0LFUFybH58aIBs=
X-Gm-Gg: ASbGnctQACVnP7cNLJTKANGxeEB/4j8CPfYvKfr0XwYtrnx8HxHjsdS1fA8OSubScO7
	0LHv+zZha4LaXlF84x3S97DjqDlUZHum9e5bsLqW3jtAgxe/UThdEDaX8ppXeUHmvKii/Y4xYo6
	gysamOLqGbUpr/5uZPYQMpxlaamzkdQYmguWwywHnUR/Sy0gkOoPXWULCXk9BvCKWOSC1usbDQo
	Azf1BF4tyfFhhXhORrlfcdHFQ6/4Gpw4C/egvjf/UFdMxRKWl2BJxnQDxPRoTFwBTdiCFjhhMMx
	SFCG7ooVphIBjwH6btDmRC/1Cl7GOWhY15vIxqkMRHfAzCKfjzrhvsI5Vn7AcXOI2wfnw8sUVZz
	Ygjqx8yi3n/KyM/U3l00FAJGaZB194RLpuNlTkTYk
X-Google-Smtp-Source: AGHT+IED4lOeP8lkzQuySSoVCpa3i6O3/wuUDVMHTM4Hv/8XoOUOgJ3qHR/ltSfjecD9vA8E53VDcg==
X-Received: by 2002:a17:907:1c1e:b0:ae2:60ba:da91 with SMTP id a640c23a62f3a-ae9c99872f5mr2078243266b.15.1753092547094;
        Mon, 21 Jul 2025 03:09:07 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d68a1sm647649766b.46.2025.07.21.03.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:06 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.17
Date: Mon, 21 Jul 2025 13:09:04 +0300
Message-ID: <20250721100904.568575-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
References: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.17

for you to fetch changes up to 314862edb13d52c481ecc330c9d3fec0507cd9bb:

  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node (2025-07-05 10:43:31 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.17

This update includes:
- controllers enabled for SAMA7D65 SoC (crypto controllers, PWM, CAN)
- controllers enabled for SAM9X7 SoC (LCD, LVDS)
- cache configuration updates for SAMA5D2, SAMA5D3, SAMA5D4, SAMA7G5,
  SAMA7D65
- cleanups

----------------------------------------------------------------
Dharma Balasubiramani (2):
      ARM: dts: microchip: sam9x7: Add HLCD controller
      ARM: dts: microchip: sam9x7: Add LVDS controller

Ezra Buehler (1):
      ARM: dts: microchip: gardena-smart-gateway: Fix power LED

Fabio Estevam (1):
      ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi compatible

Manikandan Muralidharan (4):
      ARM: dts: microchip: sam9x60ek: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d27_som1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d27_wlsom1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d2_icp: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns

Mihai Sain (5):
      ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
      ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
      ARM: dts: microchip: sama5d4: Update the cache configuration for CPU
      ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
      ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

Ryan Wanner (8):
      ARM: dts: microchip: sama7d65: Add crypto support
      ARM: dts: microchip: sama7d65: Add PWM support
      ARM: dts: microchip: sama7d65: Add CAN bus support
      ARM: dts: microchip: sama7d65: Clean up extra space
      ARM: dts: microchip: sama7d65: Enable CAN bus
      ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
      ARM: dts: microchip: sama7d65: Add clock name property
      ARM: dts: microchip: sam9x7: Add clock name property

Wolfram Sang (1):
      ARM: dts: microchip: use recent scl/sda gpio bindings

 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   2 +-
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |   2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |   4 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   2 +-
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |  35 ++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |  18 ++-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        |   5 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |   4 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi       |   5 +-
 .../at91sam9g25-gardena-smart-gateway.dts          |   2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi        |   8 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |  15 +--
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |  37 ++++++
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |   3 +
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |   2 +
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |   3 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 140 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi           |  19 ++-
 21 files changed, 272 insertions(+), 49 deletions(-)
