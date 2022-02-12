Return-Path: <SRS0=ZBDT=S3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABA0C433EF
	for <soc@archiver.kernel.org>; Sat, 12 Feb 2022 17:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAE49C340F0; Sat, 12 Feb 2022 17:27:27 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CAD0C340EE
	for <soc@kernel.org>; Sat, 12 Feb 2022 17:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CAD0C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id p19so34110308ybc.6
        for <soc@kernel.org>; Sat, 12 Feb 2022 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+tsiIrCYmAr0wKNPAdkeKXURpFf0Li+fzBtDiSSSeio=;
        b=wHaSybrQlKz5m8ZrXt8RDG8yQorvwD69T5durxAR4rPUSRRuFY0AxtKKYKnjSrWdbL
         c4hNO2sqfFgLsJypTDmamO7p9fLyA1FyJ6Y/TLKcHv3dzFjd6Ax6FDnpNbcKEOKV05We
         893TjSC0o7YMsRr2Gotb/3Hv9GLwLjlGoE8sxIXN1gmSAK7QrSZj/k599r1J3xA5KhKn
         jhf+fHDu5Jnm9NOrljzvhLCE+Fbd0/1+PPZxNQi8cRWeaWLiFOv0F5cwv+I+jyyPIV28
         /qu3I/kF9PMbnHWgf2MbJYhJaR/sOX6tu7Yf7rGepUE6L4kENzWHKrxcp+a4q1LeUJkG
         e7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+tsiIrCYmAr0wKNPAdkeKXURpFf0Li+fzBtDiSSSeio=;
        b=QxkP260rj6gxZH/AN/GfMepEiu8XEQtdZIAbRGheYZwNLNLFWDQQ+6SNlZI99+w+wR
         6/VqIvIVpHt/TjPKUaXuk4lTgtYpaPSy3J0ui2qVG7O+V2MecjODMrQodvaBwhqOglgi
         UIGnSQvZtlsN/ZE1abT+EGYDkioWQGcUZoHPfvZU8UmZGAPhPug+jzuhEcsfow/J1KO0
         14D+goxNIyOh441cF9ox169xUjiYwtGNmLPoliL9BKi4ku5/E3BaiYvxhNYMFHizq5Y/
         2P2oGITTT0dzIdOc3igsKkP9/GnOtuVhx7urigNiQJIIwnbEpXhzuiNk6esvneM4cbuo
         EGLw==
X-Gm-Message-State: AOAM530O7QcDiRrQ8yjIfXDZyUPUSNZLseDIxOqGVdjaR1FnIptw8u+6
	XF2QK/H+/TCyuJqynYjOeXoqa0n+dofmDgpE6zVUPN77C9uPjmcy
X-Google-Smtp-Source: ABdhPJw7m8iM0xpQm2iEAVfWKFP9P1beW3pvHI53Vi3R7dLs7nUVX0I5eiZyBW3Yo5p408lqWOI7nzzvIRAYrVfmXN8=
X-Received: by 2002:a25:40b:: with SMTP id 11mr2902681ybe.110.1644686845794;
 Sat, 12 Feb 2022 09:27:25 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Feb 2022 18:27:14 +0100
Message-ID: <CACRpkdahK-jaHFqLCpSqiXwAtkSKbhWQZ9jaSo6rRzHfSiECkA@mail.gmail.com>
Subject: [GIT PULL] IXP4xx spring cleaning patches
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Corentin Labbe <clabbe@baylibre.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Krzysztof Halasa <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here is the spring cleaning of IXP4xx, after this we only do
device tree boots and we dropped a ton of legacy code in
favor of proper drivers, most notable the PCI driver.

The two network subsystem-touching patches have been
ACKed by Jakub.

I copied the cover letter from the series into the signed tag,
we can do multiplatform next but it requires some
bigendian troubleshooting.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-cleanup-for-v5.18

for you to fetch changes up to 06954b6a9e6a303b4782d543f5299b3b4020fd1f:

  ARM: ixp4xx: Convert to SPARSE_IRQ and P2V (2022-02-12 18:20:04 +0100)

----------------------------------------------------------------
This cleans out the remaining board files from IXP4xx and
makes it an exclusive device tree subarchitecture without any
special weirdness in arch/arm/mach-ixp4xx.

The biggest noticeable change is the removal of the old PCI
driver and along with that the removal of the special DMA
coherency code and defines and the DMA bouncing.

I tried to convert the IXP4xx to multiplatform on top of
this but it didn't work because IXP4xx wants to be big
endian and multiplatform config creates a problem like
this:

../arch/arm/kernel/head.S: Assembler messages:
../arch/arm/kernel/head.S:94: Error: selected processor does not
support `setend be' in ARM mode

I think this is because MULTI_V5 turns on CPUs that cannot
do big endian, and IXP4xx turn on big endian. (It crashes if
I try to boot in little endian mode, sorry. It really wants
to run big endian.)

But before fixing multiplatform we can fix all of this!

The networking patches are dependencies so I am requesting
ACKs from the network maintainers on these.

----------------------------------------------------------------
Linus Walleij (12):
      ARM: ixp4xx: Delete the Goramo MLR boardfile
      ARM: ixp4xx: Delete old PCI driver
      ARM: ixp4xx: Drop stale Kconfig entry
      ARM: ixp4xx: Drop UDC info setting function
      soc: ixp4xx: Add features from regmap helper
      soc: ixp4xx-npe: Access syscon regs using regmap
      net: ixp4xx_eth: Drop platform data support
      net: ixp4xx_hss: Check features using syscon
      ARM: ixp4xx: Remove feature bit accessors
      ARM: ixp4xx: Drop custom DMA coherency and bouncing
      ARM: ixp4xx: Drop all common code
      ARM: ixp4xx: Convert to SPARSE_IRQ and P2V

Zoltan HERPAI (1):
      ARM: ixp4xx: Delete Gateway 7001 boardfiles

 arch/arm/Kconfig                                |  11 +-
 arch/arm/mach-ixp4xx/Kconfig                    |  57 ---
 arch/arm/mach-ixp4xx/Makefile                   |  19 +-
 arch/arm/mach-ixp4xx/common-pci.c               | 451 --------------------
 arch/arm/mach-ixp4xx/common.c                   | 448 -------------------
 arch/arm/mach-ixp4xx/gateway7001-pci.c          |  61 ---
 arch/arm/mach-ixp4xx/gateway7001-setup.c        | 113 -----
 arch/arm/mach-ixp4xx/goramo_mlr.c               | 532 -----------------------
 arch/arm/mach-ixp4xx/include/mach/hardware.h    |  32 --
 arch/arm/mach-ixp4xx/include/mach/io.h          | 545 ------------------------
 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h | 303 -------------
 arch/arm/mach-ixp4xx/include/mach/platform.h    | 102 -----
 arch/arm/mach-ixp4xx/include/mach/udc.h         |   8 -
 arch/arm/mach-ixp4xx/include/mach/uncompress.h  |   4 +-
 arch/arm/mach-ixp4xx/irqs.h                     |  64 ---
 drivers/crypto/ixp4xx_crypto.c                  |   1 -
 drivers/net/ethernet/xscale/Kconfig             |   4 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c        |  85 +---
 drivers/net/ethernet/xscale/ptp_ixp46x.c        |   1 -
 drivers/net/wan/Kconfig                         |   3 +-
 drivers/net/wan/ixp4xx_hss.c                    |  39 +-
 drivers/soc/ixp4xx/Kconfig                      |   1 +
 drivers/soc/ixp4xx/ixp4xx-npe.c                 |  33 +-
 include/linux/platform_data/eth_ixp4xx.h        |  21 -
 include/linux/platform_data/wan_ixp4xx_hss.h    |  17 -
 include/linux/soc/ixp4xx/cpu.h                  |  26 +-
 include/linux/soc/ixp4xx/npe.h                  |   2 +
 kernel/dma/mapping.c                            |   2 -
 28 files changed, 99 insertions(+), 2886 deletions(-)
 delete mode 100644 arch/arm/mach-ixp4xx/common-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/common.c
 delete mode 100644 arch/arm/mach-ixp4xx/gateway7001-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/gateway7001-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/goramo_mlr.c
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/io.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/platform.h
 delete mode 100644 arch/arm/mach-ixp4xx/include/mach/udc.h
 delete mode 100644 arch/arm/mach-ixp4xx/irqs.h
 delete mode 100644 include/linux/platform_data/eth_ixp4xx.h
 delete mode 100644 include/linux/platform_data/wan_ixp4xx_hss.h
