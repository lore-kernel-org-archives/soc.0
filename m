Return-Path: <SRS0=cO1G=KD=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9075DC5478C
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 18:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54FD0C433C7; Mon, 26 Feb 2024 18:36:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 068A3C433F1
	for <soc@kernel.org>; Mon, 26 Feb 2024 18:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 068A3C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so4963808a12.0
        for <soc@kernel.org>; Mon, 26 Feb 2024 10:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708972597; x=1709577397; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Opiv+L5YiQRyv7Ckf7JQ4Bub2VE6L9Wo1z4LZ7uSlj8=;
        b=XTOo718p+9Ia4J16GNTTl1MhVYUBHGUYGA7CkS3cHiK/3X0TLzFRwvSbiPK+7qjE+m
         H5mHlcZGNlblbpkjrhkkvIJdwJz/jeNK5GDl8uA+qU4v46QFs0r0Rrp3wVZq6aPeWtGu
         ox276wDEPzuUrAgoGBm6WXXQxd/YMMfVM4BXrTMeRPDw9d1SXwsZ4PU7kpAFBhGK+JlB
         cHSQWjI2AsLoWYzSEXBvdCTkLVdFk/RQXuP65xZS3/90BRZtBqJN9dEu7vKNnNxhHQox
         3sYwBAtcrv3fcmJV5WSUMT1lsGxS3lTGV+H9l2zwShMaiaGH4xfKCvW6W58YPENHfL9u
         xm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708972597; x=1709577397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opiv+L5YiQRyv7Ckf7JQ4Bub2VE6L9Wo1z4LZ7uSlj8=;
        b=HhdzevvYyGAAEFVrmKUdF+PNPiWDMqNpy0XFy+/vfLkTdon4i2e4wQbD+7Uau57u+d
         nFl6Z3DxQQAYD6hxrcCrH/SauibiMnLf3hQ/V6afoC1RymawaCjnzmdX1OSc8hJp4f/J
         AyAsuWNnnkU8WuIFhJK3UfSojaB3WZc3fY75cso8r7/jGE5WRwxA37YylS2yPDGMT6zH
         SAZurb7lsW83g88g9trUzXpNhaEkQ47h6EvvHq8y5qe59OHmnMbD5A8aCKetC3V3dM+b
         r8H3vWfhqcDn7tPUkRwRcILxgMXVA3UqCQLe+TXckTKRQ6rlJ22baF5z8xz8Y6u6YB9d
         R3rw==
X-Forwarded-Encrypted: i=1; AJvYcCXjsz5KngfRwCsW6nEm9uyJyhUJRlwnFpS0ZKZB3ivnzbFfnv2EzeEWBMTcjoy4/6n3GLgLtumcW92yn1TQrw==
X-Gm-Message-State: AOJu0Yzbq+5ozl47AXkhfwbuViGiD3yYF4jKVtS5UMAsLG474eBtpCU6
	6tzoNlpTdlBR/tlMnidyMamc3KImsE+sbwQKlktrzq9dE0VrndN9qcgUFaL4eUE=
X-Google-Smtp-Source: AGHT+IHPOEDABK2sjs2WLCGWFJps2pGkBBF42JuGcq0N197zyliY/grkC0m116LmZEiRigBP09u2HA==
X-Received: by 2002:a17:906:1ecc:b0:a3f:3c26:b250 with SMTP id m12-20020a1709061ecc00b00a3f3c26b250mr4032768ejj.40.1708972596957;
        Mon, 26 Feb 2024 10:36:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.16])
        by smtp.gmail.com with ESMTPSA id vh3-20020a170907d38300b00a433634ba03sm12183ejc.43.2024.02.26.10.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 10:36:36 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: Microchip AT91 DT updates for v6.9
Date: Mon, 26 Feb 2024 20:36:35 +0200
Message-Id: <20240226183635.1964704-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.9

for you to fetch changes up to 62afd6247a288233447beb0161315569a953e222:

  ARM: dts: microchip: sama7g5: add sama7g5 compatible (2024-02-23 22:03:38 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.9

It contains:
- use DMA for DBGU of at91sam9x5ek.dtsi and USART3 of
  at91sam9g25-gardena-smart-gateway.dts
- the new SAMA7G54 Curiosity board
- cleanups

----------------------------------------------------------------
Balakrishnan Sambath (1):
      ARM: dts: microchip: sama7g5: add sama7g5 compatible

Claudiu Beznea (2):
      ARM: dts: microchip: sama7g5: align dmas to the opening '<'
      ARM: dts: microchip: sam9x60: align dmas to the opening '<'

Ezra Buehler (2):
      ARM: dts: microchip: at91sam9x5ek: Use DMA for DBGU serial port
      ARM: dts: microchip: gardena-smart-gateway: Use DMA for USART3

Mihai Sain (3):
      dt-bindings: ARM: at91: Document Microchip SAMA7G54 Curiosity
      ARM: dts: microchip: sama7g5: Add flexcom 10 node
      ARM: dts: microchip: sama7g54_curiosity: Add initial device tree of the board

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
 arch/arm/boot/dts/microchip/Makefile               |   2 +
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts | 482 +++++++++++++++++++++
 .../at91sam9g25-gardena-smart-gateway.dts          |   2 +
 arch/arm/boot/dts/microchip/at91sam9x5ek.dtsi      |   2 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  64 +--
 arch/arm/boot/dts/microchip/sama7g5.dtsi           |  56 ++-
 7 files changed, 566 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts
