Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47BFC433F5
	for <soc@archiver.kernel.org>; Fri,  1 Apr 2022 09:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D228C34113; Fri,  1 Apr 2022 09:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76613C3410F;
	Fri,  1 Apr 2022 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648806565;
	bh=8D86TvVCJVX/NlFrgC8aeVvQTyyECbJNXzBVVviEMPk=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=BCdlu4c8TiNfFUcgvsLzhCxNyEetJQlCLETWxA+pTkcpLDBYzcO6g5d14mVyG9QUw
	 Xz8NGLhkJ7N9DsRHGk99Rz67mVqHyBwlXDxdsAI56nVhXneibE8HLX7ahJSqgkQXJL
	 1TcZS6QiWNuqQzddreWNMhojyPQy5jKET03zrKFxMf4BWPul6hTQEhBwT3ZqBmU4gf
	 mLTYfP7vy7yIWE2CJfuDGK3GHvsOcbH9j24AS9FajLrq4BRJQvbQxdQqKAKizOiGN3
	 IROGy4kLdBaounvceRV2fuuTG6V2jSfvGSKws7DZZRSCaf4V4doG1Dxo9S/3vVpfJ4
	 714e8oee2Z4uA==
Received: by mail-wm1-f46.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso3146323wme.5;
        Fri, 01 Apr 2022 02:49:25 -0700 (PDT)
X-Gm-Message-State: AOAM533j2Q5lf7aI4CydcJzN9b5yeyovOMYIwRa1p3Bl5duHg4LYkjWs
	Iuh4qwFXIhQAoMJk0tfh8RY6tRzn8iD1cKUPKPM=
X-Google-Smtp-Source: ABdhPJy79L+AFMVBaHq9SUv6/4tXiAwOsIYAvmMECp4E1F/6irmCXZvYxgpXQ6wZrk4tBhpwPlpI+CUI9XaMh9ZGV40=
X-Received: by 2002:a05:600c:4ecc:b0:38e:354d:909 with SMTP id
 g12-20020a05600c4ecc00b0038e354d0909mr8243085wmq.33.1648806563745; Fri, 01
 Apr 2022 02:49:23 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 1 Apr 2022 11:49:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
Message-ID: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
Subject: [GIT PULL] SoC: fixes for 5.18, part 1
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kuldeep Singh <singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit f443e374ae131c168a065ea1748feac6b2e76613:

  Linux 5.17 (2022-03-20 13:14:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.18-1

for you to fetch changes up to eeeb4f1075d71d67083c75f69247206e9b3d9f4a:

  arm64: dts: ls1046a: Update i2c node dma properties (2022-04-01
00:01:24 +0200)

----------------------------------------------------------------
SoC: fixes for 5.18, part 1

The introduction of vmap-stack on 32-bit arm caused a regression
on a few omap3/omap4 machines that pass a stack variable into
a firmware interface.

The early pre-ACPI AMD Seattle machines have been broken for
a while, Ard Biesheuvel has a series to bring them back for now.

A few machines with multiple DMA channels used on a device have
the channels in the wrong order according to the binding, which
causes a harmless warning. Reversing the order is easier than
fixing the tools to suppress the warning.

----------------------------------------------------------------
Ard Biesheuvel (8):
      dt: amd-seattle: remove Husky platform
      dt: amd-seattle: remove Overdrive revision A0 support
      dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
      dt: amd-seattle: fix PCIe legacy interrupt routing
      dt: amd-seattle: add a description of the PCIe SMMU
      dt: amd-seattle: add description of the SATA/CCP SMMUs
      dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0
      dt: amd-seattle: add a description of the CPUs and caches

Kuldeep Singh (4):
      ARM: dts: spear13xx: Update SPI dma properties
      ARM: dts: spear1340: Update serial node properties
      arm64: dts: ls1043a: Update i2c dma properties
      arm64: dts: ls1046a: Update i2c node dma properties

Tony Lindgren (1):
      ARM: OMAP2+: Fix regression for smc calls for vmap stack

 arch/arm/boot/dts/spear1340.dtsi                 |   6 +-
 arch/arm/boot/dts/spear13xx.dtsi                 |   6 +-
 arch/arm/mach-omap2/omap-secure.c                |  13 +-
 arch/arm64/boot/dts/amd/Makefile                 |   4 +-
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |  13 +-
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |   1 +
 arch/arm64/boot/dts/amd/amd-overdrive.dts        |  66 -------
 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi    | 224 +++++++++++++++++++++++
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     |  70 +++++--
 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi  |  22 +--
 arch/arm64/boot/dts/amd/husky.dts                |  84 ---------
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi   |   6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi   |   6 +-
 13 files changed, 309 insertions(+), 212 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
 create mode 100644 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
 delete mode 100644 arch/arm64/boot/dts/amd/husky.dts
