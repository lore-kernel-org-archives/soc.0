Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23750C19F2B
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07C58C43142; Thu, 28 Jul 2022 22:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B76C43470
	for <soc@kernel.org>; Thu, 28 Jul 2022 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047404;
	bh=mNVKySkoBmg9XUbQw2IJ22+3X7uuSJsNRPzE0JJUO+8=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=tzDf4pMPAdxVhi2z4/RRb7xCRdS05r9J882SzBL5vgjVRlU6R2PuoL9cNbeEI3yVM
	 lUicSB/KZK87K/tLnbTE6k1oGMci+z1i11d5ktB+Lx8lycubwWA/e5LEkLy1TonwGB
	 YjwfFcG1G7qFuUVhd10Tt6gz4RxuManOQXI5q8mcMkTOG4fOVbe3nnEuAfDXnCpzmu
	 RfHzT1v9r6TxipL4qbAUXvlOxZptvkXbHwh/opKxiud+Odnneb/RnuM0xfyZI4vUIJ
	 CdmFZo9y5trmYx7cVT+tHWbrjYCh+MoL0utIcg/mjs8LT04JLCVxuB7t8FYvA6DcZH
	 3Qh1P65PUeatA==
Received: by mail-ed1-f41.google.com with SMTP id m8so3844970edd.9
        for <soc@kernel.org>; Thu, 28 Jul 2022 15:30:04 -0700 (PDT)
X-Gm-Message-State: AJIora8qKfx9QZYUVRuYCjQ+2NSO5QpxR3VjxQKfCTcTsOmz0ulWbJcY
	r67rp1714fxY3xoGB7Qz3/VbOqX4aOZPURTJaH8=
X-Google-Smtp-Source: AGRyM1u9Vv6DktmA03eRZCJ/1VFk9MFJ3Dy2nMkK+H966LsHvlh9TnnXHfD5IwfrPOHR+41pJv8LE5aXZPTycq84X/s=
X-Received: by 2002:a05:6402:331d:b0:43b:ee33:8a5e with SMTP id
 e29-20020a056402331d00b0043bee338a5emr978606eda.49.1659047403148; Thu, 28 Jul
 2022 15:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 00:29:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
Message-ID: <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
Subject: [GIT PULL 1/6] ARM: SoC updates for 5.20
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a=
:

  Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-soc-5.20

for you to fetch changes up to 755d0ebc03f872c33b108534f23d82d2778c2793:

  Merge tag 'at91-soc-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
(2022-07-21 14:59:24 +0200)

----------------------------------------------------------------
ARM: SoC updates for 5.20

The updates for arch/arm/mach-* platform code this time are mainly
minor cleanups.

Most notably, the DaVinci DM644x/DM646x SoC support gets removed. This was
also scheduled for later removal early next year, but Linus Walleij asked
for having them removed earlier to avoid problems for the GPIO subsystem.

----------------------------------------------------------------
Anand Gore (3):
      MAINTAINERS: Add BCM63178 to bcmbca arch entry
      MAINTAINERS: Add BCM6858 to bcmbca arch entry
      MAINTAINERS: Add BCM6878 to bcmbca arch entry

Arnd Bergmann (12):
      Merge tag 'samsung-soc-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'omap-for-v5.20/soc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'zynqmp-soc-for-v5.20' of
https://github.com/Xilinx/linux-xlnx into arm/soc
      Merge tag 'zynq-soc-for-v5.20' of
https://github.com/Xilinx/linux-xlnx into arm/soc
      Merge tag 'renesas-arm-soc-for-v5.20-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/soc
      Merge tag 'arm-soc/for-5.20/soc' of
https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'arm-soc/for-5.20/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'imx-soc-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/soc
      Merge tag 'davinci-boards-delete-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio into
arm/soc
      Merge tag 'arm-soc/for-5.20/soc-part2' of
https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'mvebu-arm-5.20-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/soc
      Merge tag 'at91-soc-5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc

Cl=C3=A9ment L=C3=A9ger (2):
      ARM: at91: add sam_linux_is_optee_available() function
      ARM: at91: setup outer cache .write_sec() callback if needed

Florian Fainelli (1):
      ARM: bcm: NSP: Removed forced thermal selection

Juerg Haefliger (5):
      ARM: s3c: Kconfig: Fix indentation
      ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
      ARM: s3c: Kconfig.s3c64xx: Fix indentation
      ARM: imx: Kconfig: Fix indentation
      ARM: OMAP2+: Kconfig: Fix indentation

Liang He (3):
      ARM: OMAP2+: display: Fix refcount leak bug
      ARM: OMAP2+: pdata-quirks: Fix refcount leak bug
      ARM: shmobile: rcar-gen2: Increase refcount for new reference

Linus Walleij (2):
      ARM: davinci: Delete DM644x board files
      ARM: davinci: Delete DM646x board files

Martin Kaiser (1):
      ARM: imx25: support silicon revision 1.2

Miaoqian Lin (4):
      ARM: bcm: Fix refcount leak in bcm_kona_smc_init
      ARM: OMAP2+: Fix refcount leak in omapdss_init_of
      ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
      cpufreq: zynq: Fix refcount leak in zynq_get_revision

Pali Roh=C3=A1r (1):
      ARM: Marvell: Update PCIe fixup

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: bcmbca: Include full family name in Kconfig

Tanmay Shah (1):
      firmware: xilinx: Add TF_A_PM_REGISTER_SGI SMC call

William Zhang (13):
      MAINTAINERS: Add BCM63158 to bcmbca arch entry
      MAINTAINERS: Add BCM4912 to bcmbca arch entry
      MAINTAINERS: Add BCM6846 to bcmbca arch entry
      MAINTAINERS: Add BCM6855 to bcmbca arch entry
      MAINTAINERS: Add BCM6756 to bcmbca arch entry
      MAINTAINERS: Add BCM63146 to bcmbca arch entry
      MAINTAINERS: Add BCM6856 to bcmbca arch entry
      MAINTAINERS: Add BCM63148 to bcmbca arch entry
      MAINTAINERS: Add BCM6813 to bcmbca arch entry
      MAINTAINERS: Move BCM63138 to bcmbca arch entry
      arm: bcmbca: Move BCM63138 ARCH_BCM_63XX to ARCH_BCMBCA
      arm: bcmbca: Add BCMBCA sub platforms
      ARM: debug: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA

XueBing Chen (1):
      ARM: s3c: Use strscpy to replace strlcpy

 MAINTAINERS                                        |  25 +-
 arch/arm/Kconfig.debug                             |   2 +-
 arch/arm/mach-at91/sam_secure.c                    |   6 +
 arch/arm/mach-at91/sam_secure.h                    |   1 +
 arch/arm/mach-at91/sama5.c                         |  16 +-
 arch/arm/mach-bcm/Kconfig                          |  65 +-
 arch/arm/mach-bcm/Makefile                         |  11 +-
 arch/arm/mach-bcm/bcm63xx.c                        |  27 -
 arch/arm/mach-bcm/bcm_kona_smc.c                   |   1 +
 arch/arm/mach-davinci/Kconfig                      |  44 -
 arch/arm/mach-davinci/Makefile                     |   6 -
 arch/arm/mach-davinci/board-dm644x-evm.c           | 928 -----------------=
----
 arch/arm/mach-davinci/board-dm646x-evm.c           | 873 -----------------=
--
 arch/arm/mach-davinci/board-neuros-osd2.c          | 238 ------
 arch/arm/mach-davinci/board-sffsdr.c               | 151 ----
 arch/arm/mach-davinci/dm644x.c                     | 765 -----------------
 arch/arm/mach-davinci/dm646x.c                     | 726 ----------------
 arch/arm/mach-dove/Kconfig                         |   1 +
 arch/arm/mach-dove/pcie.c                          |  11 +-
 arch/arm/mach-imx/Kconfig                          |   6 +-
 arch/arm/mach-imx/cpu-imx25.c                      |   2 +
 arch/arm/mach-mv78xx0/pcie.c                       |  11 +-
 arch/arm/mach-omap2/Kconfig                        |   6 +-
 arch/arm/mach-omap2/display.c                      |   3 +
 arch/arm/mach-omap2/pdata-quirks.c                 |   2 +
 arch/arm/mach-omap2/prm3xxx.c                      |   1 +
 arch/arm/mach-orion5x/Kconfig                      |   1 +
 arch/arm/mach-orion5x/pci.c                        |  12 +-
 arch/arm/mach-s3c/Kconfig                          |  14 +-
 arch/arm/mach-s3c/Kconfig.s3c24xx                  |  26 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |  16 +-
 arch/arm/mach-s3c/mach-mini2440.c                  |   2 +-
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c |   5 +-
 arch/arm/mach-zynq/common.c                        |   1 +
 drivers/firmware/xilinx/zynqmp.c                   |  16 +-
 drivers/soc/xilinx/xlnx_event_manager.c            |   5 +-
 include/linux/firmware/xlnx-zynqmp.h               |   7 +
 37 files changed, 186 insertions(+), 3847 deletions(-)
 delete mode 100644 arch/arm/mach-bcm/bcm63xx.c
 delete mode 100644 arch/arm/mach-davinci/board-dm644x-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-dm646x-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-neuros-osd2.c
 delete mode 100644 arch/arm/mach-davinci/board-sffsdr.c
 delete mode 100644 arch/arm/mach-davinci/dm644x.c
 delete mode 100644 arch/arm/mach-davinci/dm646x.c
