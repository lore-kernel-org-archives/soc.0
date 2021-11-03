Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C656C433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 22:51:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E9B4610FC; Wed,  3 Nov 2021 22:51:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED506611C6
	for <soc@kernel.org>; Wed,  3 Nov 2021 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635979861;
	bh=svlEoDsB/vdjrz3NySgGlB1A7yxCGebi9R4HQERrUao=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=T3P+/0k8T/pPKlKX3UmVFgN46bbko6L2B9FL1xmyDVKwB6GFZJS1+vPTt0gRxsNaw
	 tEp37Mqb7doQ9HZ1a1fTw+ZEq4+XuQcIoNdE26xfM+ARCoWn5sGS3JebZ+sHRnuZPP
	 EEv02gCaH8lg/4flarqwLobln5PBgYCz85rWluBKpLi5+TwMM7JYPmBcyp8epIPLWy
	 zqWOJk3Q2SpQZSTtByeOoZe+rqOeBjLBY/tSFt8dHkOQITtRlByC/CqSMntxyq3Wwn
	 sfbSjE78Z0uUpd5JbVBHOkh6KsjHp5BqV9pSRa0AJwmXcqvyAmD0MFeJsKdvQD1Pfg
	 8MsQcUBhw1YsQ==
Received: by mail-wm1-f48.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2954602wme.4
        for <soc@kernel.org>; Wed, 03 Nov 2021 15:51:00 -0700 (PDT)
X-Gm-Message-State: AOAM533G3n0KB40T6qT3KVsxMlg0DcYUagg1jixWzfKq5qA/W/VzmWpI
	eSq4Xra8olAcZn6FlIcXSZ9HTQjBIZ0q63a4x3I=
X-Google-Smtp-Source: ABdhPJyz0Qp0lNGsJWU2/yF9gbTp6fGIoVAXFfCq6TWS9XN5gfWlFam8CK+L5LLTeajLu12HI4cIvFk6TSOGpPwicwk=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr7856978wmj.35.1635979859381;
 Wed, 03 Nov 2021 15:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:50:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
Message-ID: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
Subject: [GIT PULL 1/4] ARM: SoC updates for 5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.16

for you to fetch changes up to fc3d4aeb559f2f704b490f8c1dff82f3b5b142ca:

  MAINTAINERS: Update BCM7XXX entry with additional patterns
(2021-11-03 16:59:33 +0100)

----------------------------------------------------------------
ARM: SoC updates for v5.16

The SoC updates this time are mainly removing obsolete code from the
OMAP2 platform, another step in the eternal cleanup of that platform.

There are two new SoCs getting added: STMicroelectronics stm32mp13 and
Microchip lan966. Both fit into existing platforms and require minimal
changes here.

A couple of MAINTAINER file updates relate to those changes, and
update some file paths.

----------------------------------------------------------------
Alexandre Torgue (2):
      docs: arm: stm32: introduce STM32MP13 SoCs
      ARM: stm32: add initial support for STM32MP13 family

Alyssa Rosenzweig (1):
      MAINTAINERS: Add Alyssa Rosenzweig as M1 reviewer

Arnd Bergmann (7):
      Merge tag 'omap-for-v5.16/soc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'at91-soc-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'stm32-soc-for-v5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into
arm/soc
      Merge tag 'imx-maintainers-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/soc
      Merge tag 'sunxi-core-for-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/soc
      Merge tag 'samsung-soc-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'asahi-soc-maintainers-5.16-v2' of
https://github.com/AsahiLinux/linux into arm/soc

Chester Lin (1):
      MAINTAINERS: add an entry for NXP S32G boards

Florian Fainelli (1):
      MAINTAINERS: Update BCM7XXX entry with additional patterns

Jackie Liu (1):
      ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()

Jason Wang (5):
      ARM: sunxi: Add a missing SPDX license header
      ARM: sunxi: Add a missing SPDX license header
      ARM: s3c: Use strscpy to replace strlcpy
      ARM: OMAP2+: Fix typo in some comments
      ARM: OMAP2+: Fix comment typo

Joey Gouly (1):
      MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE

Kavyasree Kotagiri (3):
      ARM: at91: Documentation: add lan966 family
      dt-bindings: arm: at91: Document lan966 pcb8291 and pcb8290 boards
      ARM: at91: add basic support for new SoC family lan966

Nicolas Ferre (1):
      ARM: at91: Documentation: add sama7g5 family

Sven Peter (2):
      MAINTAINERS: Add Sven Peter as ARM/APPLE MACHINE maintainer
      MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE

Tony Lindgren (11):
      ARM: OMAP2+: Drop old unused omap5_uevm_legacy_init()
      ARM: OMAP2+: Drop unused old auxdata for dra7x_evm_mmc_quirk()
      ARM: OMAP2+: Drop unused PRM defines for dra7
      ARM: OMAP2+: Drop unused PRM defines for omap5
      ARM: OMAP2+: Drop unused PRM defines for omap4
      ARM: OMAP2+: Drop unused PRM defines for am4
      ARM: OMAP2+: Drop unused PRM defines for am3
      ARM: OMAP2+: Drop unused CM defines for dra7
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap5
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap4
      ARM: OMAP2+: Drop unused CM defines for am3

Viresh Kumar (1):
      ARM: SPEAr: Update MAINTAINERS entries

 Documentation/arm/index.rst                        |   1 +
 Documentation/arm/microchip.rst                    |  20 +
 Documentation/arm/stm32/stm32mp13-overview.rst     |  37 ++
 .../devicetree/bindings/arm/atmel-at91.yaml        |  12 +
 MAINTAINERS                                        |  36 +-
 arch/arm/mach-at91/Kconfig                         |   9 +
 arch/arm/mach-omap2/cm-regbits-44xx.h              | 101 ----
 arch/arm/mach-omap2/cm1_44xx.h                     | 174 ------
 arch/arm/mach-omap2/cm1_54xx.h                     | 168 ------
 arch/arm/mach-omap2/cm1_7xx.h                      | 263 ---------
 arch/arm/mach-omap2/cm2_44xx.h                     | 386 -------------
 arch/arm/mach-omap2/cm2_54xx.h                     | 325 -----------
 arch/arm/mach-omap2/cm2_7xx.h                      | 449 ---------------
 arch/arm/mach-omap2/cm33xx.h                       | 280 ---------
 arch/arm/mach-omap2/omap_hwmod.c                   |   6 +-
 arch/arm/mach-omap2/pdata-quirks.c                 |  36 --
 arch/arm/mach-omap2/powerdomain.c                  |   6 +-
 arch/arm/mach-omap2/prcm43xx.h                     |  94 ---
 arch/arm/mach-omap2/prm33xx.h                      |  40 --
 arch/arm/mach-omap2/prm44xx.h                      | 630 ---------------------
 arch/arm/mach-omap2/prm54xx.h                      | 358 ------------
 arch/arm/mach-omap2/prm7xx.h                       | 613 --------------------
 arch/arm/mach-omap2/scrm44xx.h                     | 141 -----
 arch/arm/mach-omap2/scrm54xx.h                     | 228 --------
 arch/arm/mach-s3c/irq-s3c24xx.c                    |  22 +-
 arch/arm/mach-s3c/mach-mini6410.c                  |   2 +-
 arch/arm/mach-stm32/Kconfig                        |   8 +
 arch/arm/mach-stm32/board-dt.c                     |   3 +
 arch/arm/mach-sunxi/platsmp.c                      |   4 +-
 arch/arm/mach-sunxi/sunxi.c                        |   4 +-
 30 files changed, 138 insertions(+), 4318 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32mp13-overview.rst
 delete mode 100644 arch/arm/mach-omap2/scrm54xx.h
