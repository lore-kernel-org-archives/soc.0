Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8FEC433B4
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 11:38:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C95A1613A7; Wed,  7 Apr 2021 11:38:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C0C061382;
	Wed,  7 Apr 2021 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617795490;
	bh=c8OwiPc/kFruh9DLNtPj9kOPBEyj/DeqjKnbFXFOgIY=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=UeRpJKJv17oVqw4OpKsrN6FERGAY2N9m6J2QXNernVrxxhxL2ZTRiJdkHqLYhb6Zh
	 wUT0WjC+IKgAkrCHPCldryKN9d4SQYp1D1CTuW2dppmmURgahy+C11wjRZBctPpv6g
	 1PDl0Vtlqa55KQvPviqN1lzi85CkgdhLUE0lfzZjL+ZXg3r5PE5VVgl+uRoZqgwUmS
	 mHNr5hD8ZPLuRSza9wyv8IsW/7h5SqCNm9fLiMjmQq2R3G9sXYMPSSo2/mTCc1DaII
	 cA4bq+OSnOt+n4loeG+SFq3kKJUMMgx+PBI0WWiUs3SZ6X/2dypBYAudIeH/CqG/eU
	 jgXBeBsksHYCw==
Received: by mail-oi1-f181.google.com with SMTP id z15so18381860oic.8;
        Wed, 07 Apr 2021 04:38:10 -0700 (PDT)
X-Gm-Message-State: AOAM533qyLYgzc0Y2UZ43fC4FDmgGpruYB+110lMQyDSNTNbkKUK62jn
	4RuAgzGak0VMIfC9ky929r9sTunnb7an/WiB8Dk=
X-Google-Smtp-Source: ABdhPJxPAkeJXdxxPNZKzjKRuu3JMNqYII+pCmZ1RB3pQN9X5cjrTXeTYGonbrUsEoZ6eswl/SlwP3oAJxP8s5uTgno=
X-Received: by 2002:a05:6808:313:: with SMTP id i19mr1880575oie.67.1617795489860;
 Wed, 07 Apr 2021 04:38:09 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 7 Apr 2021 13:37:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
Message-ID: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
Subject: [GIT PULL] ARM SoC fixes for v5.12, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Maxime Ripard <mripard@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit a5e13c6df0e41702d2b2c77c8ad41677ebb065b3=
:

  Linux 5.12-rc5 (2021-03-28 15:48:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.11-2

for you to fetch changes up to 1180042dc6030c6e26530d4cfe0338fe8e447ca4:

  Merge tag 'mvebu-fixes-5.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/fixes (2021-04-06 23:21:08 +0200)

----------------------------------------------------------------
ARM SoC fixes for v5.12, part 2

Most of the changes again are devicetree fixes, but there are also five
trivial build fixes for issues I found when test building with gcc-11 or
when running 'make W=3D1', and some OMAP platform specific code fixups.

Broadcom
  - One revert for a Raspberry pi interrupt controller change that
    caused a regression.

TI OMAP:
  - Remove unused duplicate sha2md5_fck clock node that can race with the
    OMAP4_SHA2MD5_CLKCTRL clock node for disable for unused clocks

  - Add aliases for omap4/5 mmc to put the slots back into the right
    order again

  - Fix typo for bionic voltage controllers that accidentally use mpu
    for all instances instead of mpu, core and iva

  - Fix random hangs for droid4 caused by missing fix from TI Android
    kernel tree to do a dummy smc call on cpuidle wakeup path

NXP i.MX:
  - Fix a system failure on imx6qdl-phytec-pfla02 board when booting from
    SD, by adding missing vmmc supply for SD interfaces.

  - Fix address typo in i.MX8MM/Q IOMUXC_SD1_DATA0_GPIO2_IO2 definition.

Marvell mvebu:
  - Fix storm interrupt on Turris Omnia

  - Enable hardware buffer management as it should be

Build fixes for PXA, Freescale, Marvell, OMAP1 an Keystone.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (9):
      Merge tag 'arm-soc/for-5.12/devicetree-part2' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'omap-for-v5.12/fixes-rc4-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes
      Merge tag 'imx-fixes-5.12-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      ARM: keystone: fix integer overflow warning
      soc/fsl: qbman: fix conflicting alignment attributes
      ARM: omap1: fix building with clang IAS
      ARM: pxa: mainstone: avoid -Woverride-init warning
      ARM: mvebu: avoid clang -Wtautological-constant warning
      Merge tag 'mvebu-fixes-5.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/fixes

Carlos Leija (1):
      ARM: OMAP4: PM: update ROM return address for OSWR and OFF

Florian Fainelli (1):
      Revert "ARM: dts: bcm2711: Add the BSC interrupt controller"

Gregory CLEMENT (1):
      Revert "arm64: dts: marvell: armada-cp110: Switch to per-port
SATA interrupts"

Marek Beh=C3=BAn (1):
      ARM: dts: turris-omnia: configure LED[2]/INTn pin as interrupt pin

Oliver St=C3=A4bler (1):
      arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0

Rui Salvaterra (1):
      ARM: dts: turris-omnia: fix hardware buffer management

Stefan Riedmueller (1):
      ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces

Tony Lindgren (4):
      ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
      ARM: dts: Fix moving mmc devices with aliases for omap4 & 5
      Merge branch 'fixes-rc2' into fixes
      ARM: OMAP4: Fix PMIC voltage domains for bionic

 arch/arm/boot/dts/armada-385-turris-omnia.dts  |  4 ++-
 arch/arm/boot/dts/bcm2711.dtsi                 | 12 --------
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi   |  2 ++
 arch/arm/boot/dts/omap4.dtsi                   |  5 ++++
 arch/arm/boot/dts/omap44xx-clocks.dtsi         |  8 ------
 arch/arm/boot/dts/omap5.dtsi                   |  5 ++++
 arch/arm/mach-keystone/keystone.c              |  4 +--
 arch/arm/mach-omap1/ams-delta-fiq-handler.S    |  1 +
 arch/arm/mach-omap2/omap-secure.c              | 39 ++++++++++++++++++++++=
++++
 arch/arm/mach-omap2/omap-secure.h              |  1 +
 arch/arm/mach-omap2/pmic-cpcap.c               |  4 +--
 arch/arm/mach-pxa/mainstone.c                  |  8 ++++--
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h |  2 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi  |  6 ++--
 drivers/bus/mvebu-mbus.c                       |  2 +-
 drivers/soc/fsl/qbman/qman.c                   |  2 +-
 17 files changed, 73 insertions(+), 34 deletions(-)
