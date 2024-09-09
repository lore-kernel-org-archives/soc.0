Return-Path: <SRS0=ceKz=QH=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD7CECE57A
	for <soc@archiver.kernel.org>; Mon,  9 Sep 2024 11:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1097BC4CEC6; Mon,  9 Sep 2024 11:11:37 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECED1C4CEC5
	for <soc@kernel.org>; Mon,  9 Sep 2024 11:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECED1C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365c512b00so3452752e87.3
        for <soc@kernel.org>; Mon, 09 Sep 2024 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1725880291; x=1726485091; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEi6zUwnbDjys825gM3YK1GcVffLVfXi3GfkImwNjuY=;
        b=PgfyOfGtTtThhprqouVkmeQpDQIRdSBjLuOC4Vb6vkRureIDO+pZFAmFAgMOWiGpVS
         afXVtK1A9OsgEI36L7XzpDtG5xGX5yugp8Nowno+AnmUJF2q2xNXOxshJdewTrcVIy+/
         BBUvJJDwzInWSoyfe9AbmG6E6qJmj128OqDhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880291; x=1726485091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEi6zUwnbDjys825gM3YK1GcVffLVfXi3GfkImwNjuY=;
        b=h6G3cCdHb4dvOY0F7YnHSJtrC2BJRnqF7z9DkMAa3vW7cj5nAxLHnkTnIQEdV7ANRC
         dTCCx1Xw8Nc0QNU7eBibbwYrf/LvyPJvPltSC03uA+qK79VyU4yZkOoM3LCuA7QmNxEX
         DZpglA8uoedzRMPwPhIlwxZxWwnRsB4lkoX4F1UrNHDC0TWafAT+nLSdgq6/AOuiEwqq
         B5T/SDDJsVFUcre3/8XWnW/uAFFZmkCZUrThhPEF/fvYAX0OMNNtxiN26XBkO2W5pbHk
         aUrfilnU6CzHzLP4CJs90/TOlWiMfTuJA5sdQ68XZ43pKD78mSJQg72+bxWYCzdLoBU2
         bIUw==
X-Gm-Message-State: AOJu0YzP5lpYiFymi4LdO/++zYcMx41HcVYKAkB+ZQ0vx/phROah8VJR
	gAF1AuTO9+uI60f2SFwyXZ0Qwe/xdk+qxK9Ns69F78rBgYt65MCL2A6rZ5sr2o2C7TFJyW7F7+j
	44A0i32pBK73GUYuawU9boc8I24HJq3xw
X-Google-Smtp-Source: AGHT+IHUs7T5VaWD0jgLB/pWAwf9yx1RNXhU/EPxRRDinoFHGdasJSOiQ6hplnfyx1StBfuDjhWndZoFKtBV9lnBXFU=
X-Received: by 2002:a05:6512:2215:b0:530:e228:7799 with SMTP id
 2adb3069b0e04-53658813717mr8325341e87.58.1725880290973; Mon, 09 Sep 2024
 04:11:30 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Sep 2024 20:41:17 +0930
Message-ID: <CACPK8XeGDUrbJ-OaxqQBR=aVVYyrKGnvT1ZKXO0vPHpsjQ_i9g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Here are some aspeed changes for v6.12. They are late because I forgot the =
pin
for my yubikey, so I couldn't sign a tag. All sorted now. I've missed
a few merge
windows so I sent this along just in case you had time to put it in this wi=
ndow.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b=
:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.12-devicetree

for you to fetch changes up to b4c322c2783aedd652183bcec6d545ad45eba6d9:

  ARM: dts: aspeed: catalina: Update io expander line names
(2024-08-27 13:00:49 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.12

 - New machines

  * IBM P11 AST2600 BMC machines, named Blueridge and Fuji
  * Meta's Catalina AST2600 BMC

 - Updates to harma, minerva, mtmitchell, mtjade, system1, SPC621D8HM3

 - Various changes to the dtsi to keep the YAML checker happy

----------------------------------------------------------------
Andrew Jeffery (7):
      ARM: dts: aspeed: Fix coprocessor interrupt controller node name
      ARM: dts: aspeed: Specify correct generic compatible for CVIC
      ARM: dts: aspeed: Specify required properties for sram node
      ARM: dts: aspeed: Remove undocumented XDMA nodes
      ARM: dts: aspeed: Clean up AST2500 pinctrl properties
      ARM: dts: aspeed-g6: Use generic 'ethernet' for ftgmac100 nodes
      ARM: dts: aspeed-g6: Drop cells properties from ethernet nodes

Chanh Nguyen (5):
      ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
      ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
      ARM: dts: aspeed: mtmitchell: Add Riser cards
      ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
      ARM: dts: aspeed: mtmitchell: Add LEDs

Eddie James (5):
      dt-bindings: arm: aspeed: add IBM P11 BMC boards
      ARM: dts: aspeed: Add IBM P11 FSI devices
      ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
      ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
      ARM: dts: aspeed: Add IBM P11 Fuji BMC system

Ninad Palsule (1):
      ARM: dts: aspeed: System1: Updates to BMC board

Peter Yin (11):
      ARM: dts: aspeed: harma: Revise hsc chip
      ARM: dts: aspeed: harma: Add VR devices
      ARM: dts: aspeed: harma: Add sgpio name
      ARM: dts: aspeed: harma: Add ina238
      ARM: dts: aspeed: harma: Add power monitor xdp710
      ARM: dts: aspeed: harma: Remove multi-host property
      ARM: dts: aspeed: harma: Add fru device
      ARM: dts: aspeed: harma: Add temperature device
      ARM: dts: aspeed: harma: Enable mctp controller
      ARM: dts: aspeed: harma: Fix spi-gpio dtb_check warnings
      ARM: dts: aspeed: harma: Remove pca9546

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC
      ARM: dts: aspeed: catalina: Add pdb cpld io expander
      ARM: dts: aspeed: catalina: Update io expander line names

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: aspeed: convert ASRock SPC621D8HM3 NVMEM content to
layout syntax

Yang Chen (18):
      ARM: dts: aspeed: minerva: change the address of tmp75
      ARM: dts: aspeed: minerva: change aliases for uart
      ARM: dts: aspeed: minerva: add eeprom on i2c bus
      ARM: dts: aspeed: minerva: change RTC reference
      ARM: dts: aspeed: minerva: enable mdio3
      ARM: dts: aspeed: minerva: remove unused bus and device
      ARM: dts: aspeed: minerva: Define the LEDs node name
      ARM: dts: aspeed: minerva: Add adc sensors for fan board
      ARM: dts: aspeed: minerva: add linename of two pins
      ARM: dts: aspeed: minerva: enable ehci0 for USB
      ARM: dts: aspeed: minerva: add tmp75 sensor
      ARM: dts: aspeed: minerva: add power monitor xdp710
      ARM: dts: aspeed: minerva: revise sgpio line name
      ARM: dts: aspeed: minerva: Switch the i2c bus number
      ARM: dts: aspeed: minerva: remove unused power device
      ARM: dts: aspeed: minerva: add ltc4287 device
      ARM: dts: aspeed: minerva: Add spi-gpio
      ARM: dts: aspeed: minerva: add host0-ready pin

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 arch/arm/boot/dts/aspeed/Makefile                  |    3 +
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |   20 +-
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |  154 +
 .../aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts  |    4 -
 .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts   |   12 +-
 .../boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  |    4 -
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1110 ++++++
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |  177 +-
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  518 ++-
 .../dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts     |   21 +
 .../boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts   | 1686 +++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |    5 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |    5 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   | 3876 ++++++++++++++++=
++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |    5 -
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |    6 +-
 .../boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts |    4 -
 .../boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts |    4 -
 .../boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dts   |    4 -
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |    4 -
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts  |    4 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |    5 -
 .../boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |    9 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |    2 -
 .../dts/aspeed/aspeed-bmc-supermicro-x11spi.dts    |    4 -
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |    7 +-
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   18 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   29 +-
 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi     | 1539 ++++++++
 32 files changed, 8939 insertions(+), 311 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.d=
ts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dt=
s
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
