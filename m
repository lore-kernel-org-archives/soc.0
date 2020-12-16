Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D76C4361B
	for <soc@archiver.kernel.org>; Wed, 16 Dec 2020 23:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C2AEA238E5; Wed, 16 Dec 2020 23:22:46 +0000 (UTC)
X-Gm-Message-State: AOAM5329Q+FCbwMxKjI80IQcdoPdIBxf3vLiCzKWOn8XEQU05NXQxhor
	zmP5Pkmdc+sfSqb5d2P5e+iG/FW6jC/Eem53bA8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608160966;
	bh=+lNMaYbXYGXWkDwMu9IjPGWOqpbhn96RJGM+3XQRUZc=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=rFkmZPX9xGkO5EV2lidU89SPZaPE/UFyLX/sTMaFas5itVvmtK4rdhDzYxDgUbtmU
	 PIdIrmbo2XbakjdQXc+kc+GiLM4jd8SovaKrfHrfE9jbs5HibusQPkHAimVUT3/w86
	 fY4MQNG/s81MCSgH3BLKJiQF+GL0EccLpDBXgn4Fq23Q96s+SziNHGsdCV15+GMUpz
	 5RKlXYZ7bYne+9na7I9LPqwerBTKxDyq0yX9ALbGUkvKbgB3Ehgi+ozgHqP0m58m8f
	 Ie+G+K2gmFMJuJ4XAUo5evLI38Ta6ejNXC0dBbXldMIs9TvrYiu5Gw/lTEg+y0vV2F
	 JVPViI3S00oNg==
X-Google-Smtp-Source: ABdhPJxsnAxWpiQMDFsndwKqYAZko45gP1sG6W9DZCEyCqNl45+SQLYY7sk37t8yhYr9qgO2loPMTCKm01O12ZVCLSg=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr27724016oth.210.1608160965975;
 Wed, 16 Dec 2020 15:22:45 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Dec 2020 00:22:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
Message-ID: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
Subject: [GIT PULL 1/5] ARM: SoC updates for 5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18=
:

  Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.=
11

for you to fetch changes up to dcb11100cd5d3f5a191b7fba75422e3df792f3ff:

  arm64: Kconfig: meson: drop pinctrl (2020-12-09 17:36:46 +0100)

----------------------------------------------------------------
ARM: SoC updates for 5.11

These are update for SoC specific code, mostly in the
32-bit architecture:

 - A rework for handling MMIO accesses in Renesas SoCs
   in a more portable way

 - Updates to SoC version detection in NXP i.MX SoCs.

 - Smaller bug fixes for OMAP, Samsung, Marvell, Amlogic,

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Anson Huang (1):
      ARM: imx: Add revision support for i.MX7ULP revision 2.2

Arnd Bergmann (6):
      Merge tag 'omap-for-v5.11/soc-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/soc
      Merge tag 'renesas-arm-soc-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/soc
      Merge tag 'samsung-soc-5.11' of
git://git.kernel.org/.../krzk/linux into arm/soc
      Merge tag 'mvebu-arm-5.11-1' of
git://git.kernel.org/.../gclement/mvebu into arm/soc
      Merge tag 'amlogic-soc' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/soc
      Merge tag 'imx-soc-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/soc

Fabio Estevam (1):
      ARM: imx: imx7ulp: Add a comment explaining the B2 silicon version

Geert Uytterhoeven (8):
      ARM: shmobile: r8a7778: Introduce HPBREG_BASE
      ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
      ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
      ARM: shmobile: r8a7779: Remove obsolete static mappings
      ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
      ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
      ARM: shmobile: sh73a0: Remove obsolete static mapping
      ARM: shmobile: Stop using __raw_*() I/O accessors

Gregory CLEMENT (1):
      MAINTAINERS: switch mvebu tree to kernel.org

Guillaume Tucker (1):
      ARM: exynos: clear prefetch bits in default l2c_aux_val

Ivan Zaentsev (1):
      ARM: mxs: Add serial number support for i.MX23, i.MX28 SoCs

Jerome Brunet (1):
      arm64: meson: ship only the necessary clock controllers

Jing Xiangfeng (1):
      ARM: OMAP2+: Remove redundant assignment to variable ret

Kevin Hilman (1):
      arm64: Kconfig: meson: drop pinctrl

Luka Kovacic (1):
      MAINTAINERS: Add an entry for MikroTik CRS3xx 98DX3236 boards

Marek Szyprowski (1):
      ARM: exynos: Simplify code in Exynos3250 CPU core restart path

Martin J=C3=BCcker (1):
      ARM: exynos: extend cpuidle support to P4 Note boards

Sven Van Asbroeck (1):
      ARM: imx: mach-imx6q: correctly identify i.MX6QP SoCs

Tang Bin (1):
      ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code

Xu Wang (1):
      ARM: OMAP2+: Remove redundant null check before
clk_prepare_enable/clk_disable_unprepare

Youling Tang (2):
      ARM: OMAP2+: Fix memleak in omap2xxx_clkt_vps_init
      ARM: OMAP2+: Fix kfree NULL pointer in omap2xxx_clkt_vps_init

 MAINTAINERS                                  | 15 +++++++-
 arch/arm/mach-exynos/exynos.c                |  7 ++--
 arch/arm/mach-exynos/platsmp.c               |  2 +-
 arch/arm/mach-imx/mach-imx6q.c               |  9 ++++-
 arch/arm/mach-imx/mach-imx7ulp.c             |  4 ++
 arch/arm/mach-mxs/mach-mxs.c                 | 19 ++++++++++
 arch/arm/mach-omap1/clock.c                  | 14 +++----
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 11 ++++--
 arch/arm/mach-omap2/display.c                |  6 +--
 arch/arm/mach-omap2/omap_device.c            |  5 +--
 arch/arm/mach-shmobile/platsmp-scu.c         |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c       | 12 +++---
 arch/arm/mach-shmobile/setup-r8a7779.c       | 56 ++++++++++--------------=
----
 arch/arm/mach-shmobile/setup-sh73a0.c        | 21 +----------
 arch/arm/mach-shmobile/smp-r8a7779.c         | 12 ++++--
 arch/arm/mach-shmobile/smp-sh73a0.c          | 33 ++++++++++------
 arch/arm64/Kconfig.platforms                 |  5 ---
 17 files changed, 125 insertions(+), 108 deletions(-)
