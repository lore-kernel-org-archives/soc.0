Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B2C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A907C3411C; Thu, 26 May 2022 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AFBC3411B
	for <soc@kernel.org>; Thu, 26 May 2022 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576340;
	bh=iRDGchJFBvhvLQHi4LPtoWUASflZyt2L2a4JZiuaYmk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UHY3U1NJ6/oEOPzm+KOe9UWaWtId+b5INl9JnoSqqhhywoEt2bC0auE/GKyodh3U+
	 an+RSiG7VYNZ/Z71lgP0QmxO+pCW8Ud21/epwUc6EaphvgGT7rlE/PFkXMOJ0mbCvD
	 A2k9ztRoE995lewBVWSeD9ar7RhZNXiBLBYT8PS2h2lPqXIWirXfz8s0g54BzO3x+h
	 ufgZnJettneHmxVq5NOSML9egoBdlbVtEg2BG1n5Yx8kpoNiGbbFqwDrb1XMCnljCp
	 dIxEUmNWS5gdOgDeSeJTeU07ubfjuy6SvO+03gT6GtGBXEjM0zC4LeenIHuBE2AxvY
	 Au/sdhY+hbA8g==
Received: by mail-yb1-f176.google.com with SMTP id i187so3241716ybg.6
        for <soc@kernel.org>; Thu, 26 May 2022 07:45:39 -0700 (PDT)
X-Gm-Message-State: AOAM530xK8oS6hURu7uy3H0kns+RPxg9qzZyrDWoSSnwL28ytXhY0BHq
	UyIeVc1TLl4QoM4pKmsN3CGEi/z5wmhRXCdsB0A=
X-Google-Smtp-Source: ABdhPJwjr79zE7aB9vX0//CfQGQ2Zij6iWbJQ0PGTfw6vTP+YVm2bVz+YtckKubC2XL8bNA43Sgfww5CnGVob79G7IY=
X-Received: by 2002:a25:add6:0:b0:655:9053:c659 with SMTP id
 d22-20020a25add6000000b006559053c659mr8364108ybe.394.1653576339042; Thu, 26
 May 2022 07:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:45:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2s3mAOqp40PZ2W7V5R=R5yare6Eq3fNbZq5kLEYYAmzQ@mail.gmail.com>
Message-ID: <CAK8P3a2s3mAOqp40PZ2W7V5R=R5yare6Eq3fNbZq5kLEYYAmzQ@mail.gmail.com>
Subject: [GIT PULL 1/5] ARM: updates for 32-bit SoCs
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845=
:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.=
19

for you to fetch changes up to 426ecc5851021519374542b0a954b2a9a3942d04:

  Merge tag 'mvebu-arm-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/soc (2022-05-13 16:33:02 +0200)

----------------------------------------------------------------
ARM: updates for 32-bit SoCs

These updates are for platform specific code in arch/arm/, mostly fixing
minor issues. The at91 platform gains support for better power
management on the lan966 platform and new firmware on the sama5
platform. The mediatek soc drivers in turn are enabled for the new
mt8195 SoC.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mmsys: Add sw0_rst_offset for MT8192

Arnd Bergmann (11):
      Merge tag 'omap-for-v5.19/soc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'arm-soc/for-5.19/soc' of
https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'arm-soc/for-5.19/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'samsung-soc-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'renesas-arm-soc-for-v5.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/soc
      Merge tag 'tegra-for-5.19-arm-core' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/soc
      Merge tag 'hisi-armv7soc-for-5.19' of
https://github.com/hisilicon/linux-hisi into arm/soc
      Merge tag 'v5.19-rockchip-soc32-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip
into arm/soc
      Merge tag 'v5.18-next-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/soc
      Merge tag 'at91-soc-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'mvebu-arm-5.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/soc

Chun-Kuang Hu (1):
      soc: mediatek: cmdq: Use mailbox rx_callback instead of cmdq_task_cb

Claudiu Beznea (5):
      ARM: at91: pm: keep documentation inline with structure members
      ARM: at91: pm: introduce macros for pm mode replacement
      ARM: at91: pm: use kernel documentation style
      ARM: at91: pm: add quirks for pm
      ARM: at91: Kconfig: implement PIT64B selection

Cl=C3=A9ment L=C3=A9ger (2):
      ARM: at91: add code to handle secure calls
      ARM: at91: pm: add support for sama5d2 secure suspend

Geert Uytterhoeven (2):
      ARM: shmobile: Drop commas after dt_compat sentinels
      ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel

Jason-JH.Lin (1):
      soc: mediatek: mutex: remove mt8195 MOD0 and SOF0 definition

Joe Perches (1):
      MAINTAINERS: Broadcom internal lists aren't maintainers

Johan Hovold (2):
      ARM: OMAP2+: drop omap_device_register() helper
      ARM: OMAP2+: drop hwmod-clock helper comment

Julia Lawall (6):
      ARM: rockchip: fix typos in comments
      ARM: s3c: fix typos in comments
      ARM: mm: fix typos in comments
      ARM: brcmstb: fix typos in comments
      ARM: tegra: Fix typos in comments
      orion5x: fix typos in comments

Kavyasree Kotagiri (1):
      ARM: at91: debug: add lan966 support

Matthias Brugger (1):
      Merge tag 'v5.18-next-vdso0-stable-tag' into v5.18-next/soc

Peng Wu (1):
      ARM: hisi: Add missing of_node_put after of_find_compatible_node

Stefan Wahren (1):
      MAINTAINERS: add raspberrypi to BCM2835 architecture

Uwe Kleine-K=C3=B6nig (1):
      ARM: s3c: Drop config symbol S3C24XX_PWM

Wang Qing (1):
      ARM: OMAP2+: add missing of_node_put before break and return

William Zhang (2):
      arm: bcmbca: add arch bcmbca machine entry
      MAINTAINERS: Add Broadcom BCMBCA entry

Zhiyong.Tao (1):
      dt-bindings: pwrap: mediatek: Update pwrap document for mt8195

jason-jh.lin (5):
      dt-bindings: arm: mediatek: mmsys: add power and gce properties
      dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
      soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
      soc: mediatek: add mtk-mutex support for mt8195 vdosys0
      soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0

 .../bindings/arm/mediatek/mediatek,mmsys.yaml      |  32 ++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  10 +-
 MAINTAINERS                                        |  79 ++--
 arch/arm/Kconfig.debug                             |  22 ++
 arch/arm/configs/mini2440_defconfig                |   3 +-
 arch/arm/configs/s3c2410_defconfig                 |   2 +
 arch/arm/mach-at91/Kconfig                         |  20 +-
 arch/arm/mach-at91/Makefile                        |   2 +-
 arch/arm/mach-at91/pm.c                            | 431 +++++++++++++++++=
++--
 arch/arm/mach-at91/sam_secure.c                    |  46 +++
 arch/arm/mach-at91/sam_secure.h                    |  18 +
 arch/arm/mach-at91/sama5.c                         |   2 +
 arch/arm/mach-bcm/Kconfig                          |  12 +
 arch/arm/mach-bcm/platsmp-brcmstb.c                |   2 +-
 arch/arm/mach-hisi/platsmp.c                       |   4 +
 arch/arm/mach-omap2/cm_common.c                    |   8 +-
 arch/arm/mach-omap2/control.c                      |  19 +-
 arch/arm/mach-omap2/omap_device.c                  |  20 -
 arch/arm/mach-omap2/omap_device.h                  |   1 -
 arch/arm/mach-omap2/prm_common.c                   |   8 +-
 arch/arm/mach-orion5x/dns323-setup.c               |   4 +-
 arch/arm/mach-rockchip/platsmp.c                   |   2 +-
 arch/arm/mach-s3c/Kconfig                          |   8 -
 arch/arm/mach-s3c/Kconfig.s3c24xx                  |   2 -
 arch/arm/mach-s3c/iotiming-s3c2410.c               |   2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                     |   2 +-
 arch/arm/mach-s3c/s3c24xx.c                        |   2 +-
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c |   2 +-
 arch/arm/mach-shmobile/setup-emev2.c               |   2 +-
 arch/arm/mach-shmobile/setup-r7s72100.c            |   2 +-
 arch/arm/mach-shmobile/setup-r7s9210.c             |   2 +-
 arch/arm/mach-shmobile/setup-r8a73a4.c             |   2 +-
 arch/arm/mach-shmobile/setup-r8a7740.c             |   2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c             |   2 +-
 arch/arm/mach-shmobile/setup-r8a7779.c             |   2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |   4 +-
 arch/arm/mach-shmobile/setup-sh73a0.c              |   2 +-
 arch/arm/mach-tegra/platsmp.c                      |   2 +-
 arch/arm/mm/cache-b15-rac.c                        |   2 +-
 drivers/soc/mediatek/mt8167-mmsys.h                |   2 +-
 drivers/soc/mediatek/mt8183-mmsys.h                |   2 +-
 drivers/soc/mediatek/mt8186-mmsys.h                |   4 +-
 drivers/soc/mediatek/mt8192-mmsys.h                |   4 +-
 drivers/soc/mediatek/mt8195-mmsys.h                | 370 +++++++++++++++++=
+
 drivers/soc/mediatek/mt8365-mmsys.h                |   4 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c             |  25 +-
 drivers/soc/mediatek/mtk-mmsys.c                   | 153 +++++++-
 drivers/soc/mediatek/mtk-mmsys.h                   |   6 +
 drivers/soc/mediatek/mtk-mutex.c                   |  92 ++++-
 include/linux/soc/mediatek/mtk-cmdq.h              |   5 +-
 include/linux/soc/mediatek/mtk-mmsys.h             |  12 +
 51 files changed, 1281 insertions(+), 187 deletions(-)
 create mode 100644 arch/arm/mach-at91/sam_secure.c
 create mode 100644 arch/arm/mach-at91/sam_secure.h
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
