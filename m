Return-Path: <SRS0=YtWc=P7=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC56ACD342A
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 13:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92747C4CEC8; Sun,  1 Sep 2024 13:31:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00075C4CEC7
	for <soc@kernel.org>; Sun,  1 Sep 2024 13:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00075C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so27745915e9.2
        for <soc@kernel.org>; Sun, 01 Sep 2024 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725197474; x=1725802274; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPsEqAI3o0fmyapoDrnZnad4iW7shPFITZk6e4lekvM=;
        b=m7/HJhDXo84G68T9lpzyxoe5KesOVv+uuOfzK3kXZrbY5R8T8wrgtL56AggqEON4qD
         +LGYZJlvHeCFHQUWTB2pkbDtxxM3x8QYkR9LfFdFiz87owsdo691AARlV7MAjGRokhry
         Nzs9oH3JeejOpaL/HT9ZijL1RuHx7TFz/nkMec9hxXQp02J417RZayT06pnK/HGKtBZU
         itco8vMEKcsN0VYbqrpEr4GBMfYy1HJUwEC3n2gCRRQLDSAheKzNB6ECSK3pFN1/fMuo
         rMSfYdQVA7XNO/JS0kuIFu/9BTBhX3+vZynUJssqfPMnkmG1ctH/QdkDcHHNNZTUuSEb
         kHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725197474; x=1725802274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPsEqAI3o0fmyapoDrnZnad4iW7shPFITZk6e4lekvM=;
        b=Z4EiiNwO/7FZcgDuygvIWYBnKkU92Nm3B20tfmRDRthD7vWy2MGHaYxBqhL/ntJvQQ
         bDp83jOapyeOyX3mfhlNU6h7yK7EqHez9LaOaCvOSd5cR76XFNStKTgS2fMiGXFaTvP+
         66C8R3eDlAYvNhNAtkb/khIXmCfZv0c9jIy2TbzKk9oIIgbJPHF8H2VBFt2VE7efsHDx
         +RQCwg4MA0T2+GFCU3qQDO9Eh0niIBuPPsuNJQ2P+HhCAPMNLWN6mZtxseVhFIbSI3OF
         gZ/sjI/iPGd4WCIt7F/bymRhGydQ1qWn3o3h3dMDP5ADMctgmhsj/BTEM3Wu50Tb3R+n
         00Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVsH8+7iw51o2Zxf1F4MDLyM1cQUip93o7t2R6WPhDj4+S0H0sZ0ruBAlcTkr7Y1igID5U=@kernel.org
X-Gm-Message-State: AOJu0Yy7HvO+FA7Rhx4D+lVwXl+g/bJztV5Ne7rbo5/csE3pG5/O1UAD
	T3J5eqp090ONAtc2J66JRCSFO3cmQD0SqrOLEGoxd/BxUMk4NAxSTPYSfjTqYOc=
X-Google-Smtp-Source: AGHT+IEnaawFotne0khBM38c/NQw8w2PdOG+5dv7JocFbK+BI0oMWVSxSKJjv445/R8r4/kwmoXcxg==
X-Received: by 2002:a05:600c:4f4f:b0:426:6000:565a with SMTP id 5b1f17b1804b1-42c7b5a8ee2mr20508345e9.16.1725197474246;
        Sun, 01 Sep 2024 06:31:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbef54b23sm69120515e9.44.2024.09.01.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:31:13 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v6.12
Date: Sun,  1 Sep 2024 16:31:09 +0300
Message-Id: <20240901133110.2038675-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
References: <20240901133110.2038675-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.12

for you to fetch changes up to 867bf1923200e6ad82bad0289f43bf20b4ac7ff9:

  ARM: dts: microchip: sama7g5: Fix RTT clock (2024-08-31 15:17:04 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.12

It contains:
- SAMA7G5-EK DTS was updated with EEPROM nodes containing Ethernet
  addresses (needed, at least, when U-Boot is removed from the booting
  chain)
- 5V supplies were added to to MCP16502 PMIC nodes for better hardware
  description
- cleanups around pinctrl nodes which removed many dtbs_check warnings;
  along with it the pinctrl documentation was converted to json schema
- fixes for the RTC and RTT supply clocks on SAMA7G5 and SAM9X60
- other cleanups to fix dtbs_check warnings

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: microchip: sam9x60: Move i2c address/size to dtsi
      ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks

Andrei Simion (5):
      ARM: dts: microchip: at91-sama7g5ek: Add reg_5v to supply PMIC nodes
      ARM: dts: microchip: at91-sama7g54_curiosity: Add reg_5v to supply PMIC nodes
      ARM: dts: microchip: at91-sama5d2_icp: Add reg_5v to supply PMIC nodes
      ARM: dts: microchip: at91-sama5d27_wlsom1: Add reg_5v to supply PMIC nodes
      ARM: dts: microchip: sama5d29_curiosity: Add reg_5v to supply PMIC nodes

Claudiu Beznea (2):
      ARM: dts: microchip: at91-sama7g5ek: add EEPROMs
      ARM: dts: microchip: sama7g5: Fix RTT clock

Krzysztof Kozlowski (1):
      ARM: dts: microchip: at91: align LED node name with bindings

Manikandan Muralidharan (4):
      ARM: dts: microchip: change to simple-mfd from simple-bus for PIO3 pinumux controller
      ARM: dts: microchip: Remove additional compatible string from PIO3 pinctrl nodes
      ARM: dts: microchip: sam9x60: Remove additional compatible string from GPIO node
      dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl to json-schema

 .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 178 --------------------
 .../bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml | 184 +++++++++++++++++++++
 .../boot/dts/microchip/at91-sam9x60_curiosity.dts  |   2 -
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   4 -
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |  13 ++
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |  13 ++
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |  13 ++
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |  13 ++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |  53 ++++++
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        |   2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       |   2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |   2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi       |   2 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts |   4 +-
 .../at91sam9g25-gardena-smart-gateway.dts          |  24 +--
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |   2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi       |   2 +-
 arch/arm/boot/dts/microchip/at91sam9n12ek.dts      |   6 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi        |   2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |   2 +-
 arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi      |   4 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  40 ++++-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |   2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |   2 +-
 arch/arm/boot/dts/microchip/sama7g5.dtsi           |   2 +-
 25 files changed, 352 insertions(+), 221 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
