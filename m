Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915DBC433C1
	for <soc@archiver.kernel.org>; Fri, 26 Mar 2021 16:03:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6668361A32; Fri, 26 Mar 2021 16:03:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC9A61A28
	for <soc@kernel.org>; Fri, 26 Mar 2021 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616774593;
	bh=gDRpe+xf82CeSuSzG9G6Q9nKEkx1xSc/XTzQDmGAVrg=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=BzcTB4lvPy1SJ/WcvBkq7Kw2+8ozgNlBbpOKXVaddFimP2pJH71iXiY6GhJPpIjnw
	 dejbUlX/8A2vFy72lnPff4vJ1wG++94DmzuQgObAwJielBKifeW/2uY4zBv1IGSdRp
	 navxuh2zEtbgL5wuv5CMltpxQCadRc7jG812CcVDqexQIELF+d8p9Nj0Y5eQgaZ+6p
	 phZ4UujC4d4UxK47hZ6AUMK9QvK9PukLLoo32wvax+94KqOzwksRvoox9+8X62bdvz
	 SJS2E5sfDhrc4W5rYAGjj0rktICzJkQKn6TQIJsKH2RgaUxiF4/RVoynoWSoWWQThR
	 X30wdg30xGTNQ==
Received: by mail-ot1-f49.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so5668987oto.2
        for <soc@kernel.org>; Fri, 26 Mar 2021 09:03:13 -0700 (PDT)
X-Gm-Message-State: AOAM532Os6mVJQ7Ww9pFFARmGGjUyrgPoited5h9OeQA/+DjlaQ+j0w3
	wcm5bETSiLsRVBjIam9pKnA4wssey7iyWYep+8s=
X-Google-Smtp-Source: ABdhPJxKQUsQUL9Ou63VS2IXalng02yPSjWBMUCEeJRBxLRUNlYbPuwHdH+PrWqkYrwj6qHltZ3v6AynmHRMx4D3OEo=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr12624294otq.251.1616774592506;
 Fri, 26 Mar 2021 09:03:12 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Mar 2021 17:02:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
Message-ID: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.12
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15=
:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-=
5.12

for you to fetch changes up to 67335b8d28cd2ee279d6ab3c72856b76411ba48a:

  Merge tag 'imx-fixes-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes (2021-03-18 23:53:47 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.12

Too many fixes have accumulated in the soc tree, so this is a fairly
large set. As usual, most of the fixes are for devicetree files, but
there are also notable code changes for imx and omap regressions as
well as some maintainer file updates.

imx:
 - Fix an Ethernet issue on imx6ul-14x14-evk board that is caused by
   independent PHY reset.

 - Add missing `dma-coherent` property for LayerScape device trees to fix a
   kernel BUG report.

 - Use IRQCHIP_DECLARE for AVIC driver to fix a boot issue on i.MX25 with
   fw_devlink=3Don.

 - Add missing I2C pinctrl entry for imx8mp-phyboard-pollux-rdk board to
   fix the broken I2C GPIO recovery support.

 - Add `fsl,use-minimum-ecc` property for imx6ull-myir-mys-6ulx-eval
   device tree to fix UBI filesystem mount failure.

at91:
 - wrong phy address that blocks Ethernet use on boards with sama5d27 SoM1

 - restrictive pin possibilities for sam9x60

omap:
 - Fix ocp interconnect bus access error reporting for omap_l3_noc by
   setting IRQF_NO_THREAD

 - Fix changed mmc slot order regression by adding mmc aliases for am335x

 - Fix dra7 reboot regression caused by invalid pcie reset map

 - Fix smartreflex init regression caused by dropped legacy data

 - Fix ti-sysc driver warning on unbind if reset is not deasserted

 - Fix flakey reset deassert for dra7 iva

stm32:
 - MAINTAINER file updates

broadcom:
 - brcmstb SoC ID build fix

 - MAINTAINER file updates

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'arm-soc/for-5.12/drivers-part2' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'omap-for-v5.12/fixes-rc1-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge tag 'at91-fixes-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/fixes
      Merge tag 'imx-fixes-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes

Claudiu Beznea (1):
      ARM: dts: at91-sama5d27_som1: fix phy address to 7

Fabio Estevam (1):
      ARM: imx6ul-14x14-evk: Do not reset the Ethernet PHYs independently

Federico Pellegrin (1):
      ARM: dts: at91: sam9x60: fix mux-mask for PA7 so it can be set
to A, B and C

Grygorii Strashko (1):
      bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD

Horia Geant=C4=83 (3):
      arm64: dts: ls1046a: mark crypto engine dma coherent
      arm64: dts: ls1043a: mark crypto engine dma coherent
      arm64: dts: ls1012a: mark crypto engine dma coherent

Lukas Bulwahn (1):
      MAINTAINERS: rectify BROADCOM PMB (POWER MANAGEMENT BUS) DRIVER

Mans Rullgard (1):
      ARM: dts: am33xx: add aliases for mmc interfaces

Nicolas Ferre (1):
      ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet

Patrice Chotard (3):
      MAINTAINERS: Update some st.com email addresses to foss.st.com
      MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
      MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer

Saravana Kannan (1):
      ARM: imx: avic: Convert to using IRQCHIP_DECLARE

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: Add missing pinctrl entry

Tony Lindgren (5):
      soc: ti: omap-prm: Fix reboot issue with invalid pcie reset map for d=
ra7
      ARM: OMAP2+: Fix smartreflex init regression after dropping legacy da=
ta
      Merge branch 'fixes-v5.11' into fixes
      bus: ti-sysc: Fix warning on unbind if reset is not deasserted
      soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iv=
a

dillon min (1):
      ARM: dts: imx6ull: fix ubi filesystem mount failed

 MAINTAINERS                                        | 33 +++++-----
 arch/arm/boot/dts/am33xx.dtsi                      |  3 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  8 ---
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |  4 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            | 22 +++++--
 arch/arm/boot/dts/imx6ull-myir-mys-6ulx-eval.dts   |  1 +
 arch/arm/boot/dts/sam9x60.dtsi                     |  9 +++
 arch/arm/mach-imx/avic.c                           | 16 ++++-
 arch/arm/mach-imx/common.h                         |  1 -
 arch/arm/mach-imx/mach-imx1.c                      | 11 ----
 arch/arm/mach-imx/mach-imx25.c                     | 12 ----
 arch/arm/mach-imx/mach-imx27.c                     | 12 ----
 arch/arm/mach-imx/mach-imx31.c                     |  1 -
 arch/arm/mach-imx/mach-imx35.c                     |  1 -
 arch/arm/mach-imx/mm-imx3.c                        | 24 -------
 arch/arm/mach-omap2/sr_device.c                    | 75 +++++++++++++++++-=
----
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  1 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  2 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |  2 +-
 drivers/bus/omap_l3_noc.c                          |  4 +-
 drivers/bus/ti-sysc.c                              |  4 +-
 drivers/soc/ti/omap_prm.c                          |  8 ++-
 24 files changed, 136 insertions(+), 120 deletions(-)
