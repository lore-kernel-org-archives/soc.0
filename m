Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82004C4361B
	for <soc@archiver.kernel.org>; Wed, 16 Dec 2020 23:28:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 58464238E8; Wed, 16 Dec 2020 23:28:36 +0000 (UTC)
X-Gm-Message-State: AOAM533c91iC4KQJ3ZGP1ggYrK33h1ipdBtR7ItM0I4ogDa4CWuUVBk2
	zjvjGc1ly1AOWs4fUh+av0f8rSYT0/njxet0RCk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608161316;
	bh=d+dC7kFKOZlxV9Ds4LMkkQGM2M1EvD1NoddIGNXjUJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hP52Kt3XxvJZ9LwlkJn0vdKcKrlXI3zYwr4NqCa96h+GhSEw4/wBJi4m0gdET2Xq8
	 09Ps2P9ebXcQhogzBDh8iyNhlyONMw+8BwdZtRNlmYsIzv+AAaaZ14h0Dd3nINTSNh
	 ZeWL8kPbyve58hmDspo93Pv+Xv1voLAtZwIgc9wBrmA+bEBZy9qwQkvp0aJx2NlUmB
	 +GkB23vhPqjM3/D/04C+wYWk3atg6YXL1gYO/f362Pf/thjxPMXmRNgfJ3Wdx1EdJM
	 22EHv70JAXv0TJTF3RhpjdjGQ1mOQ9KDkwkjOJdYcqNratIpNnaFVKjPDBPXBHmzmc
	 /Tjwekr0Tm0NA==
X-Google-Smtp-Source: ABdhPJwv0AJsligWe9DE+lOuIx5ZjFqtq203m5UKTAh2M9vE0RlkKPX++vOt6izdHOzK2+KnQj2i7wVq8LYoHAKYIkg=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr1771033oii.67.1608161315482;
 Wed, 16 Dec 2020 15:28:35 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Dec 2020 00:28:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
Message-ID: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
Subject: [GIT PULL 4/5] ARM: SoC updates for OMAP GenPD
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-omap-genpd-5.11

for you to fetch changes up to 7fbee7e3386cb51e5ebc60c4d7cea13ffeab31d6:

  Merge tag 'omap-for-v5.11/genpd-rest-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/omap-genpd (2020-12-09 21:15:50 +0100)

----------------------------------------------------------------
ARM: SoC updates for OMAP GenPD

These are additional updates for the power domain support on OMAP,
moving to an implementation based on device tree information instead of
SoC specific code. This is the latest step in the ongoing process for
moving code out of arch/arm/mach-omap2.

I kept this separate from the other driver changes since it touches
code in multiple areas.

There is one conflict in the dra7.dts file, which adds another node
in a different branch. Watch out for adding the trailing '};'
both times.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'omap-for-v5.11/genpd-drivers-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/omap-genpd
      Merge tag 'omap-for-v5.11/genpd-am335x-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/omap-genpd
      Merge tag 'omap-for-v5.11/genpd-am437x-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/omap-genpd
      Merge tag 'omap-for-v5.11/genpd-rest-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/omap-genpd

Tero Kristo (10):
      soc: ti: omap-prm: am3: add genpd support for remaining PRM instances
      ARM: dts: am33xx: add remaining PRM instances
      soc: ti: omap-prm: am4: add genpd support for remaining PRM instances
      ARM: dts: am43xx: add remaining PRM instances
      soc: ti: omap-prm: omap4: add genpd support for remaining PRM instances
      ARM: dts: omap4: add remaining PRM instances
      soc: ti: omap-prm: dra7: add genpd support for remaining PRM instances
      ARM: dts: dra7: add remaining PRM instances
      soc: ti: omap-prm: omap5: add genpd support for remaining PRM instances
      ARM: dts: omap5: add remaining PRM instances

Tony Lindgren (56):
      ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
      ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
      bus: ti-sysc: Fix reset status check for modules with quirks
      bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
      soc: ti: omap-prm: Do not check rstst bit on deassert if already
deasserted
      bus: ti-sysc: Assert reset only after disabling clocks
      ARM: OMAP2+: Check for inited flag
      ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
      bus: ti-sysc: Support modules without control registers
      bus: ti-sysc: Implement GPMC debug quirk to drop platform data
      clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
      soc: ti: omap-prm: Add pm_clk for genpd
      soc: ti: pm33xx: Enable basic PM runtime support for genpd
      remoteproc/wkup_m3: Use reset control driver if available
      ARM: dts: Configure also interconnect clocks for am4 system timer
      ARM: OMAP2+: Drop legacy platform data for am3 control module
      ARM: dts: Configure RTC powerdomain for am3
      ARM: dts: Configure interconnect target module for am3 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am3 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpmc
      ARM: OMAP2+: Drop legacy platform data for am3 debugss
      ARM: OMAP2+: Drop legacy platform data for am3 emif
      ARM: OMAP2+: Drop legacy platform data for am3 ocmcram
      ARM: OMAP2+: Drop legacy platform data for am3 instr
      ARM: OMAP2+: Drop legacy platform data for am3 mpuss
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_fast
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_per
      ARM: dts: Use simple-pm-bus for genpd for am3 l3
      ARM: OMAP2+: Drop legacy remaining legacy platform data for am3
      ARM: OMAP2+: Build hwmod related code as needed
      clk: ti: am437x: Keep am4 l3 main clock always on for genpd
      ARM: dts: Configure also interconnect clocks for am4 system timer
      ARM: OMAP2+: Drop legacy platform data for am4 control module
      ARM: dts: Configure RTC powerdomain for am4
      ARM: dts: Configure interconnect target module for am4 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am4 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am4 emif
      ARM: OMAP2+: Drop legacy platform data for am4 ocmcram
      ARM: OMAP2+: Drop legacy platform data for am4 mpuss
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_wkup
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_fast
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_per
      ARM: dts: Move am4 l3 noc to a separate node
      ARM: dts: Use simple-pm-bus for genpd for am4 l3
      ARM: OMAP2+: Drop legacy remaining legacy platform data for am4
      clk: ti: omap4: Drop idlest polling from IVA clkctrl clocks
      ARM: dts: Configure power domain for omap4 dss
      ARM: dts: Configure power domain for omap4 dsp
      ARM: OMAP2+: Drop legacy platform data for omap4 iva
      ARM: OMAP2+: Drop legacy platform data for omap4 gpmc
      clk: ti: dra7: Drop idlest polling from IVA clkctrl clocks
      ARM: dts: Configure interconnect target module for dra7 iva
      ARM: OMAP2+: Drop legacy platform data for dra7 gpmc
      ARM: dts: Configure power domain for omap5 dss
      ARM: OMAP2+: Fix am4 only build after genpd changes

 arch/arm/boot/dts/am335x-nano.dts                  |   1 -
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  75 +++--
 arch/arm/boot/dts/am33xx.dtsi                      | 185 +++++++----
 arch/arm/boot/dts/am4372.dtsi                      | 175 ++++++----
 arch/arm/boot/dts/am437x-l4.dtsi                   |  79 +++--
 arch/arm/boot/dts/dra7.dtsi                        | 151 ++++++++-
 arch/arm/boot/dts/dra7xx-clocks.dtsi               |  14 +
 arch/arm/boot/dts/omap4-l4.dtsi                    |   1 +
 arch/arm/boot/dts/omap4.dtsi                       | 150 +++++++--
 arch/arm/boot/dts/omap5.dtsi                       |  58 ++++
 arch/arm/mach-omap2/Kconfig                        |  11 +-
 arch/arm/mach-omap2/Makefile                       |  19 +-
 arch/arm/mach-omap2/io.c                           |   4 -
 arch/arm/mach-omap2/omap_hwmod.c                   |   6 +
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |  57 ----
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  90 ------
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 290 -----------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         | 294 -----------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         | 167 ----------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c         | 114 -------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          |  49 ---
 arch/arm/mach-omap2/pdata-quirks.c                 |  33 +-
 drivers/bus/ti-sysc.c                              |  68 ++--
 drivers/clk/ti/clk-33xx.c                          |   2 +
 drivers/clk/ti/clk-43xx.c                          |   8 +
 drivers/clk/ti/clk-44xx.c                          |   2 +-
 drivers/clk/ti/clk-7xx.c                           |   7 +
 drivers/remoteproc/wkup_m3_rproc.c                 |  41 ++-
 drivers/soc/ti/omap_prm.c                          | 358 +++++++++++++++++++--
 drivers/soc/ti/pm33xx.c                            |  17 +-
 include/dt-bindings/clock/dra7.h                   |   4 +
 include/linux/platform_data/ti-sysc.h              |   2 +
 32 files changed, 1185 insertions(+), 1347 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_43xx_data.c
