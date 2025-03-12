Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7A156C62
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741801081; cv=none; b=U/18C+Dx2lfmIw7PhAaOrfxE+4UBak/sseKzMPww4gn/ZiDf+oVplnPokMkwc111OTZubwJmA6fyDA8RrxSW7d2UqTUags9pVscbapdbO36TTL7Mz8DNTIsilbAl7V5R9PSy1IeTjOoCdvwjoKhl3Js2Hrt5p1n8bCcjSXCfe0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741801081; c=relaxed/simple;
	bh=KXWUgB7iJZ+25Z8Fa3tBBv5y9NRheQkr2bpg2yMJwcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTACUxSIOYn4nKckWU47eCgtygIQIEh2OQRZeKZR9cVP3Tl+KPvBtpghxr0kmYtyux94b5b8bpgGPug7muZfxDIcR9Tr3oiXZsWSwIDCd4tFIphQ5zBt5VHyCFgrk80FvwZLZU+uN5+rVgKNDquhty3QZM0yAv6XYCZOXoO0NeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oimgX2lF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oimgX2lF"
Received: by smtp.kernel.org (Postfix)
	id 6DB4FC4CEDD; Wed, 12 Mar 2025 17:38:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFBD2C4CEEA
	for <soc@kernel.org>; Wed, 12 Mar 2025 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFBD2C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29af3382dso20244566b.2
        for <soc@kernel.org>; Wed, 12 Mar 2025 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741801078; x=1742405878; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZo/Vf2nfNDcmG+nIAIhHl9y6tDEIrgynlevHozqoJM=;
        b=oimgX2lF2FdJU4soTJrJeWf9G9cVZCY/QZq4djjboDLprcWhzKtUBuaLLZzWNi+t+k
         3clilsTxChMogNS08GGiqISLRF1f9eQB+dyFMAC6qX9wPDq/7YjhtSxTw8Fk8N56Sgit
         eShqIDO2xuSTjl8s+lHomJuiSOSCh83p4yiwFUN9xaqpSm9DUWnP6oGrA28QMKztFRcX
         BHBd1uqWYvP7o9DKwefQwcipA+Z5mtRGL4/Ycj1y7gB+yVtOKidhg056fXGEL8ql7VBl
         gazpgkeLLjrNusN48tGUw/1MVvU7R31KWVTZd+T8/QPSKFeBNl/hu+55ntlrRz+efbdB
         wYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801078; x=1742405878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZo/Vf2nfNDcmG+nIAIhHl9y6tDEIrgynlevHozqoJM=;
        b=QPkD7nLD4X40cb9gUpSMeyM8sXXmnMgrnHVItlgm+X4TJpj+RC5FXp1/BgOZFLmiRL
         rpYD63Mc5Cju/veZKpZbKwc1hIa1bJ2NJc8W1QjZeHHlG8VwJbg7/LhtZmxtvZ6ZKE7w
         lDpYRiMWXuXtm7gQ/kRhUeV7BiujD57g5YY30WmoqGbvhmPrI4HCQVrNzNiSMoUv3e1w
         1Wdl3pJLRAanoEp32OmWig5eHGmQezJFvUevPiNprHCkQ8H3yT2EDxRtM90HfNzVsMdb
         TFx2OMspheOq1JmtxMYuAKwINFA/JE6jsMrJkcn86J6lRp4sEVGq7f0bSnqYiim888mz
         SIwg==
X-Forwarded-Encrypted: i=1; AJvYcCVDlInIWyR6eD+ykQ9/Sov8fKd26rWoMMDavRWA0hfmRr/CqDUnGTtdEQuq+YLlLwXeC+k=@kernel.org
X-Gm-Message-State: AOJu0YzQWu/7dJy87WxoBZCwpwEGcqEggRyf7AVfzpRUByqHX+B9kWNh
	fJ0OKaHlN8tigjpk9FA+PhOcqEc+d8f/Ru8A4NnmqAnncZ3SiRI/UyAvmWChoyM=
X-Gm-Gg: ASbGncuNT5B6OuVVWrOdbpTokRnc7rsJPlbXiZk6BlwYYrAs73UIOV1apmTZcSLHPQI
	fFGQTHMExXOg83S5iZ1tynkaQMcSoSANmJpqQaceLg+6JO3fZDhfQia9YYp5Xvm6Eynwhvc3qwS
	vGXXpR7zR6XuTuxBFWblNmdWfzCMkaJCa5pFbAmRv+4IwiHQT1f7ml3F/FyU8Am+0/sgry0ZnSs
	3V6QFXoEtWIveETSE82v6IFx5cAGmab3D/gezjF0RHiGFw2IDXUQjP3F28Y+z/BrBy4EVTcJ9yN
	oY7Z+PFDRjnfYdSUCmvnObz6IN91KwJO6vjTz/So5xSXl3ZiVI1rdO18d8xGIaVf
X-Google-Smtp-Source: AGHT+IGHW6rlhJd7UC+xU0sUPHcpDtU+1R/5lMJkXMDs9qwKf5djMrhnun5gLlA5mSNp9l8ykGaf0g==
X-Received: by 2002:a17:906:dac2:b0:ac2:c26:5608 with SMTP id a640c23a62f3a-ac252747d18mr2588907966b.8.1741801077846;
        Wed, 12 Mar 2025 10:37:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2ede516d6sm92760866b.49.2025.03.12.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:37:57 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.15
Date: Wed, 12 Mar 2025 19:37:54 +0200
Message-ID: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.15

for you to fetch changes up to 6aafec3d215f59e8c4b00d0c2a97988ed5edbb2a:

  ARM: dts: microchip: sama7g5: add ADC hw trigger edge type (2025-03-04 20:39:29 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.15

This update includes:
- more controllers enabled for SAMA7D65 SoC (DMA, reset controller,
  shutdown controller, RTC, watchdog)
- power monitor device enabled for SAMA7D65 Curiosity board
- device tree cleanups

----------------------------------------------------------------
Mihai Sain (2):
      ARM: dts: microchip: sama7d65: Add flexcom 10 node
      ARM: dts: microchip: sama7d65_curiosity: Add power monitor support

Nayab Sayed (1):
      ARM: dts: microchip: sama7g5: add ADC hw trigger edge type

Ryan Wanner (9):
      ARM: dts: microchip: sama7d65: Add chipID for sama7d65
      ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Enable DMAs
      ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add Shutdown controller support
      ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
      ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
      ARM: dts: microchip: sama7d65: Enable shutdown controller
      ARM: dts: microchip: sama7d65: Add watchdog for sama7d65

Wolfram Sang (7):
      ARM: dts: at91: calao_usb: fix wrong polarity for LED
      ARM: dts: at91: calao_usb: remove heartbeat for User LEDs
      ARM: dts: at91: use correct vendor name for Calao boards
      ARM: dts: at91: calao_usb: fix button nodes
      ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name
      ARM: dts: microchip: usb_a9263: fix wrong vendor
      ARM: dts: microchip: fix faulty ohci/ehci node names

 arch/arm/boot/dts/microchip/aks-cdu.dts            |  2 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts          |  2 +-
 arch/arm/boot/dts/microchip/at91-foxg20.dts        |  2 +-
 arch/arm/boot/dts/microchip/at91-qil_a9260.dts     |  2 +-
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts    |  2 +-
 .../boot/dts/microchip/at91-sama5d27_som1_ek.dts   |  4 +-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |  4 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d4_ma5d4evk.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d4_xplained.dts   |  4 +-
 arch/arm/boot/dts/microchip/at91-sama5d4ek.dts     |  4 +-
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 73 +++++++++++++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |  1 +
 arch/arm/boot/dts/microchip/at91-vinco.dts         |  4 +-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        |  2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |  2 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |  4 +-
 arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts   |  4 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9n12ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |  4 +-
 arch/arm/boot/dts/microchip/ethernut5.dts          |  2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts           |  2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts            |  2 +-
 arch/arm/boot/dts/microchip/pm9g45.dts             |  4 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d3xmb.dtsi        |  4 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 95 ++++++++++++++++++++++
 arch/arm/boot/dts/microchip/tny_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9260_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  | 11 +--
 arch/arm/boot/dts/microchip/usb_a9263.dts          | 11 +--
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 +--
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  4 +-
 50 files changed, 243 insertions(+), 82 deletions(-)
