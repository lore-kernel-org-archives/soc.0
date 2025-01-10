Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC332B661
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736481967; cv=none; b=EDEquigeHTlq8OLGMvxb/ycG9RO8VuF99I431WdXj08bWu20qIcIoD05nH9TlWZAg6Drl2DNPUYKcB+ziFpQ0it5f2l4bx1nDefxhLG8huFBecZqjVNuCU9EpEus7KK8s3P3SJUB423U81GHj19mEGFkYzHMvYIWR+PB9xcvi4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736481967; c=relaxed/simple;
	bh=jPK9A5zkV0qlQUYAmADF+SVsetpkaQYUn4coc/FNqgk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ivF9ZAwQ56ATRE/2IcJR79LS8M4ahZIave5x1AxOxe0Moyx+od92ZI3J8QBaKf7L+SR8UBvOyN7WpmZ/CxWEkidA3kNUfAICnycFi4/eAA3QcfYxZCAihe/As8u5/csq50SsJBfeB/hj1kqfiQo8XBNYTV4lekQMo5AmjX9H7/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=mZ8uM5TB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="mZ8uM5TB"
Received: by smtp.kernel.org (Postfix)
	id 7E6C8C4CEDD; Fri, 10 Jan 2025 04:06:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1D0CC4CED6
	for <soc@kernel.org>; Fri, 10 Jan 2025 04:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1D0CC4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so336226666b.3
        for <soc@kernel.org>; Thu, 09 Jan 2025 20:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1736481962; x=1737086762; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/24BpOBFggVP4Qf5Sk+TOwiRXODhNI6Ut5pVQz3vwE=;
        b=mZ8uM5TB3woVWv/38tG2mv3T/V4ecsxy/Y8Ms2Oci6CE2BiDrypcp7Gi/0h7Yn25m8
         vJ1Nk8OmfQUo9OXokKs38BG0YGGrfc6PaKYRw/OoWZcrAAx+eGZfJq5X6bEnA/Ur50Z9
         1l7kb8YsNq6LjOR7amk/ZcWHNZxboO3GnCP3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736481962; x=1737086762;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/24BpOBFggVP4Qf5Sk+TOwiRXODhNI6Ut5pVQz3vwE=;
        b=rS7ulLlJFIlMFZzUDTwn81uziLcL+hSdV0rMl9nOiwTMYHTYIfXgBxaMK2ravUPepK
         ZxssaZ9SpYo8jmxm2VRWPXuoGFP+spXrPZrpzDd9qNsVjcCbWVLVlg5MzSz7xFsFpnaQ
         T/SnJAT30GPc3J5MyQxK6fVWfQKnon9DRhuHktOrdCv2ZTiFvHGDJ4tebHmvsYrjz2Br
         BDRjcBbT54oOOU7P5quIFZ4aXoIJu8cHIe1Xlnr60S87FdJcOacfx0VUnqQWEkFQj3Vl
         WV2j/puuOqwDNcjz7FA37sMyOoACrISFXZSzoU6j6zJo6KlAIC83AOuhyS5SfwQ/zSLb
         lmKw==
X-Gm-Message-State: AOJu0YwRl37m1iSGfMBv/QSU5fN65uOXiqVtuz5XYxufzK/L6xEDQRST
	DDS1l59deBv3FNweZnrJfr25LqJ0pFrF2OoTypgXloTukLSDCJV+Gc5pelNLkBz/Om6CU3087qe
	uR+c+DB0iywZWZ0jCXJRoqBdxqh70mFcy
X-Gm-Gg: ASbGncsEdchtskQWZ1glnucnK0UTmrBUtCIdHYjTT3Q2WwEO1tZYakqKCidlaXiEn4d
	OBqNpvsoIi5Sphrlm+fFSVF441yDmzByDXbmQ3W4=
X-Google-Smtp-Source: AGHT+IGqymY4AvkBSU1XQNYWlZtUCEzdAxywQjDfebNLm1G7SLuFYvEUjUET31E/9WQZk30AzUm2yPHyCp7zotDgCes=
X-Received: by 2002:a17:907:781:b0:aa6:995d:9ef1 with SMTP id
 a640c23a62f3a-ab2ab6a84d3mr845449566b.12.1736481962317; Thu, 09 Jan 2025
 20:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jan 2025 14:35:50 +1030
X-Gm-Features: AbW1kvZ_i72IdjrqMlOp7-vfRZRdXCzz7gff0Z42evFFJX0klOqybwJks_f63EA
Message-ID: <CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Arnd,

Here are the aspeed changes for v6.14. Andrew has done most (all) of
the work applying. We will get him set up to send the pull request in
the future so we can share the load, and so he's not blocked by me if
I'm not around to do it.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.14-devicetree

for you to fetch changes up to 3540adcccc7179d243216bf488532a62c37d9007:

  ARM: dts: aspeed: yosemite4: adjust secondary flash name (2025-01-08
10:57:53 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.14

- New machines

  * IBM SPB1 AST2600 BMC machine, a Sapphire Rapids x86 server
  * Ampre Mt Jefferson AST2600 BMC

 - Updates to mtmitchell, rainier, blueridge, everest, fuji, system1,
   harma, catalina and minerva

 - A big rework of yosemite4

----------------------------------------------------------------
Chanh Nguyen (4):
      ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
      ARM: dts: aspeed: mtmitchell: Add gpio line names for io expanders
      dt-bindings: arm: aspeed: add Mt. Jefferson board
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC

Eddie James (4):
      ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
      arm: dts: aspeed: Everest and Fuji: Add VRM presence gpio expander
      ARM: dts: aspeed: Blueridge and Fuji: Fix LED node names
      arm: dts: aspeed: Blueridge and Rainer: Add VRM presence GPIOs

Manojkiran Eda (1):
      ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1

Naresh Solanki (1):
      dt-bindings: arm: aspeed: add IBM SBP1 board

Ninad Palsule (4):
      ARM: dts: aspeed: system1: Bump up i2c busses freq
      ARM: dts: aspeed: system1: Enable serial gpio0
      ARM: dts: aspeed: system1: Add GPIO line names
      ARM: dts: aspeed: system1: Use crps PSU driver

Patrick Rudolph (1):
      ARM: dts: aspeed: sbp1: IBM sbp1 BMC board

Patrick Williams (1):
      ARM: dts: aspeed: yosemite4: adjust secondary flash name

Peter Yin (2):
      ARM: dts: aspeed: Harma: add rtc device
      ARM: dts: aspeed: Harma: revise sgpio line name

Potin Lai (6):
      ARM: dts: aspeed: catalina: add i2c-mux-idle-disconnect to all mux
      ARM: dts: aspeed: catalina: move hdd board i2c mux bus to i2c5
      ARM: dts: aspeed: catalina: enable mac2
      ARM: dts: aspeed: catalina: update NIC1 fru address
      ARM: dts: aspeed: catalina: revise ltc4287 shunt-resistor value
      ARM: dts: aspeed: catalina: remove interrupt of GPIOB4 form all IOEXP

Ricky CX Wu (23):
      ARM: dts: aspeed: yosemite4: Remove temperature sensors on Medusa Board
      ARM: dts: aspeed: yosemite4: Change eeprom for Medusa Board
      ARM: dts: aspeed: yosemite4: Enable watchdog2
      ARM: dts: aspeed: yosemite4: Enable adc15
      ARM: dts: aspeed: yosemite4: Enable interrupt setting for pca9555
      ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
      ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Spider Board
      ARM: dts: aspeed: yosemite4: Enable spi-gpio setting for TPM
      ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
      ARM: dts: aspeed: yosemite4: revise flash layout to 128MB
      ARM: dts: aspeed: yosemite4: Add i2c-mux for Management Board
      ARM: dts: aspeed: yosemite4: correct the compatible string of adm1272
      ARM: dts: aspeed: yosemite4: Remove IO expanders on I2C bus 13
      ARM: dts: aspeed: yosemite4: add i2c-mux for all Server Board slots
      ARM: dts: aspeed: yosemite4: Add i2c-mux for four NICs
      ARM: dts: aspeed: yosemite4: Add i2c-mux for CPLD IOE on Spider Board
      ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
      ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
      ARM: dts: aspeed: yosemite4: Revise address of i2c-mux for two fan boards
      ARM: dts: aspeed: yosemite4: Change the address of Fan IC on fan boards
      ARM: dts: aspeed: yosemite4: Revise adc128d818 adc mode on Fan Boards
      ARM: dts: aspeed: yosemite4: Add i2c-mux for ADC monitor on Spider Board

Rob Herring (Arm) (1):
      ARM: dts: aspeed: Fix at24 EEPROM node names

Yang Chen (7):
      ARM: dts: aspeed: minerva: Revise the SGPIO line name
      ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
      ARM: dts: aspeed: minerva: add fru device for other blades
      ARM: dts: aspeed: minerva: add i/o expanders on bus 0
      ARM: dts: aspeed: minerva: add i/o expanders on each FCB
      ARM: dts: aspeed: minerva: add bmc ready led setting
      ARM: dts: aspeed: minerva: add second source RTC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts   |  622 ++
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |   18 +-
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    |  191 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts  |   45 +-
 .../dts/aspeed/aspeed-bmc-facebook-minerva.dts     |  998 +++-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 1011 +++-
 .../boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts   |   46 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |   27 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dts   |  111 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |   17 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 6086 ++++++++++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |   31 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |    8 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dts |    6 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman.dtsi    |    2 +-
 17 files changed, 8802 insertions(+), 421 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
