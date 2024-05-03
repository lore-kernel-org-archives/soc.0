Return-Path: <SRS0=1r/H=MG=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334AAC4345F
	for <soc@archiver.kernel.org>; Fri,  3 May 2024 11:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFCC2C4AF14; Fri,  3 May 2024 11:23:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7180EC116B1
	for <soc@kernel.org>; Fri,  3 May 2024 11:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7180EC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a599c55055dso33731266b.0
        for <soc@kernel.org>; Fri, 03 May 2024 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1714735404; x=1715340204; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+1IKXv/OZSXxG3m940o49kC0CNjH3iNdy76Z/a3dsM=;
        b=ePBb2EKFzjKfOjAUwmot9/lT0hwrAvN/Z9wz0Vrnz394iIxmXLQZlXC8b2uetO3eg+
         oUemF/gCpPimeVaJzptWv4UheSvl1RJ0JlZ/XwbLa5eGCIwRJeoXEsm8lctrbpnlzaUX
         N7pvfjB+IQG9npA7Ph1PlLUyYFOspIiZ82cOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714735404; x=1715340204;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+1IKXv/OZSXxG3m940o49kC0CNjH3iNdy76Z/a3dsM=;
        b=ifAOAn5fZAivd5dDRE/LpZmie/hPetcQ0GUcpZA3UOZLtu5C3hmsYqDv4iH+wbhMzi
         ZoHijRMokXrvXWrEgakN0U0p02GEE09sC2B2hlHIq3ovAU1GM2O/jUHxKUg02cl/d1PA
         knK/odUoJXmnbjLg78JNOZRR8+6dVPVdFvi144+nVrGDciahqqCYuCHOK/rY2fqJf7BX
         7HSJfNZve9Ef0fTXET6exDbuuPvzQgdSmOEAGm5tuIMsDD+u9k+qknhp20S6jQ1Zu6Po
         S8a/pm6JPx2jWx4SrYw7ZPOosRuVoZs9gN5y6FvOzCxilmx/tSckKinMQIdOQfQioQFP
         NRVA==
X-Gm-Message-State: AOJu0YwRAvtkkbmez0yEB+v/d1XfL/Qji9XzXMkcslpF/fG5joRkC+Sd
	ByoySTx12tczbj3pAmB0HIt1hGjVv2cD7M+XrzoUqwkCdLww3rBtfMfdC+babSZBFdFg8DyjnEg
	m1qsBWAIGtr4EWQ0QJ+BGxRyrR4TElAwx
X-Google-Smtp-Source: AGHT+IF2HiAsSB7nvhSgmkq3UxH39sAbU3Gg3QDWl9FZyADcdhsRlEGNq8GtPY3FVHPtpRfyPmydswOZnsRyZW7iZ3M=
X-Received: by 2002:a17:906:ae8b:b0:a52:30d3:41dd with SMTP id
 md11-20020a170906ae8b00b00a5230d341ddmr1617971ejb.41.1714735403495; Fri, 03
 May 2024 04:23:23 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 May 2024 20:53:11 +0930
Message-ID: <CACPK8Xd2Qc9MQUJ-8GuRjmyU50oMHpmmHPHLqAh9W_1Gyqi2ug@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.10
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are the ASPEED device tree changes for 6.10. I've missed a few
releases as I was
on leave. Andrew Jeffery has stepped up and helped this cycle, some of the
patches were committed by him this time around.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.10-devicetree

for you to fetch changes up to c44211af1aa9c6b93178a3993e18a7ebffab7488:

  ARM: dts: aspeed: Add ASRock E3C256D4I BMC (2024-05-02 17:57:16 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.10

 - New and removed machines:

  * IBM System1 AST2600 BMC, a x86 server
  * ASUS X4TF AST2600 BMC, a x86 server
  * ASRock SPC621D8HM3 AST2500 BMC, a Intel Xeon system
  * ASRock E3C256D4I AST2500 BMC, a Intel Xeon system
  * Add ASRock X570D4U's AST2500 BMC, an AMD Ryzen 5000 system
  * Facebook Harma's AST2600 BMC
  * Facebook Cloudripper is removed

 - Updates to machines merged this cycle, as well as bonnell,
   yosemite4, minerva and others

----------------------------------------------------------------
Andrew Geissler (1):
      ARM: dts: aspeed: system1: IBM System1 BMC board

Delphine CC Chiu (2):
      ARM: dts: aspeed: yosemite4: Enable ipmb device for OCP debug card
      ARM: dts: aspeed: yosemite4: set bus13 frequency to 100k

Eddie James (2):
      ARM: dts: aspeed: FSI interrupt support
      ARM: dts: Aspeed: Bonnell: Fix NVMe LED labels

Kelly Hung (2):
      dt-bindings: arm: aspeed: add ASUS X4TF board
      ARM: dts: aspeed: x4tf: Add dts for asus x4tf project

Krzysztof Kozlowski (5):
      ARM: dts: aspeed: greatlakes: correct Mellanox multi-host property
      ARM: dts: aspeed: yosemite4: correct Mellanox multi-host property
      ARM: dts: aspeed: yosemitev2: correct Mellanox multi-host property
      ARM: dts: aspeed: harma: correct Mellanox multi-host property
      ARM: dts: aspeed: drop unused ref_voltage ADC property

Ninad Palsule (1):
      dt-bindings: arm: aspeed: add IBM system1-bmc

Peter Yin (14):
      dt-bindings: arm: aspeed: add Meta Harma board
      ARM: dts: aspeed: Harma: Add Meta Harma (AST2600) BMC
      ARM: dts: aspeed: Harma: Revise SGPIO line name.
      ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
      ARM: dts: aspeed: Harma: Remove Vuart
      ARM: dts: aspeed: Harma: Add cpu power good line name
      ARM: dts: aspeed: Harma: Add spi-gpio
      ARM: dts: aspeed: Harma: Add PDB temperature
      ARM: dts: aspeed: Harma: Revise max31790 address
      ARM: dts: aspeed: Harma: Add NIC Fru device
      ARM: dts: aspeed: Harma: Add ltc4286 device
      ARM: dts: aspeed: Harma: Revise node name
      ARM: dts: aspeed: Harma: Add retimer device
      ARM: dts: aspeed: Harma: Modify GPIO line name

Renze Nicolai (5):
      dt-bindings: arm: aspeed: add Asrock X570D4U board
      ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
      ARM: dts: aspeed: Modify GPIO table for Asrock X570D4U BMC
      ARM: dts: aspeed: Disable unused ADC channels for Asrock X570D4U BMC
      ARM: dts: aspeed: Modify I2C bus configuration

Tao Ren (1):
      ARM: dts: aspeed: Remove Facebook Cloudripper dts

Yang Chen (11):
      ARM: dts: aspeed: minerva: Revise the name of DTS
      ARM: dts: aspeed: minerva: Modify mac3 setting
      ARM: dts: aspeed: minerva: Change sgpio use
      ARM: dts: aspeed: minerva: Enable power monitor device
      ARM: dts: aspeed: minerva: Add temperature sensor
      ARM: dts: aspeed: minerva: correct the address of eeprom
      ARM: dts: aspeed: minerva: add bus labels and aliases
      ARM: dts: aspeed: minerva: add fan rpm controller
      ARM: dts: aspeed: minerva: Add led-fan-fault gpio
      ARM: dts: aspeed: minerva: add gpio line name
      ARM: dts: aspeed: minerva: add sgpio line name

Zev Weiss (8):
      dt-bindings: arm: aspeed: document ASRock SPC621D8HM3
      ARM: dts: aspeed: Add ASRock SPC621D8HM3 BMC
      ARM: dts: aspeed: asrock: Use MAC address from FRU EEPROM
      ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings
      ARM: dts: aspeed: ahe50dc: Update lm25066 regulator name
      dt-bindings: trivial-devices: add isil,isl69269
      dt-bindings: arm: aspeed: document ASRock E3C256D4I
      ARM: dts: aspeed: Add ASRock E3C256D4I BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    6 +
 .../devicetree/bindings/trivial-devices.yaml       |    2 +
 arch/arm/boot/dts/aspeed/Makefile                  |    9 +-
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |    1 -
 .../dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts     |    9 +
 .../dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts     |  322 ++++
 .../dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts     |   13 +-
 .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts   |  324 ++++
 .../boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  |  360 +++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  |  581 +++++++
 .../boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts   |    4 +-
 .../dts/aspeed/aspeed-bmc-facebook-cloudripper.dts |  544 -------
 .../dts/aspeed/aspeed-bmc-facebook-greatlakes.dts  |    4 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |  648 ++++++++
 .../dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts |  265 ----
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  543 +++++++
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   |   15 +-
 .../dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts  |    2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |    8 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 1623 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |    4 +
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     |    2 +
 22 files changed, 4460 insertions(+), 829 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
