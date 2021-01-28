Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17477C433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 15:32:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CEA7964DEF; Thu, 28 Jan 2021 15:32:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2CD964DF6;
	Thu, 28 Jan 2021 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611847945;
	bh=j8VYZaDkny/13GAvSgE0GZn6Jy3cZ1XnAChK90bIjFk=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=OZ0iFAIOqTxNPcS+6rDkvfUYd2mqwAWxvn8uwuJc92atezOi4HPLsvKptZlc0Vk69
	 +VkxKysEqUKlBL2PVzlFEkrHznw4DsthygD3+r4E2c5GuRB1ypTirwEAsUd+Avagae
	 ARKXeKq2sEFv4NWyjFJDx0GJKlZacrgheuP5xwUA5r3GbeIBwc1emdrNvFEH9gf1kV
	 Q13ZXQhq2q0kxWekRZMbg0E61aUURzTZOq+KsXHlpxzvFDvGu9laBWb8OGevTFIwCT
	 WqJ+0Xda2eu5mzepgutcD3K5V3vr7TKIwGhHuwPRKptCoB76U8EI5EEl++ftmzCZUt
	 /FwUnh/XCDvdA==
Received: by mail-oi1-f171.google.com with SMTP id k25so6375684oik.13;
        Thu, 28 Jan 2021 07:32:25 -0800 (PST)
X-Gm-Message-State: AOAM531EU1V6Bq2ldIK8zQssWK49lV38kKqUDQSt6bmWS0R+5dEOzRWC
	QlA3rFpsJ3A3KWG93cukifdy1S7fuLn3WQc7SQY=
X-Google-Smtp-Source: ABdhPJx9Lt/tNh84/I1y1o9IIYtZa3vJHCgCJYGV2vK82P4KLSxBooMmtPcUx3ctRqGMaCZVjgiEq9f6UQOEte8GSZU=
X-Received: by 2002:aca:d908:: with SMTP id q8mr301303oig.67.1611847944830;
 Thu, 28 Jan 2021 07:32:24 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 28 Jan 2021 16:32:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.11, #2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.11-2

for you to fetch changes up to e49c24c8cd00ea9d7471520fff562fb4e7e9f61a:

  Merge tag 'imx-fixes-5.11-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes (2021-01-22 23:52:42 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.11, part 2

These are the current arm-soc bug fixes for linux-5.11. I already merged
a larger set that just came in during the past three days but has not
had much exposure in linux-next, so these are the ones I merged last week.

Most of these are for the NXP i.MX platform (descriptions from their
pull request):

 - Fix pcf2127 reset for imx7d-flex-concentrator board.
 - Fix i.MX6 suspend with Thumb-2 kernel.
 - Fix ethernet-phy address issue on imx6qdl-sr-som board.
 - Fix GPIO3 `gpio-ranges` on i.MX8MP.
 - Select SOC_BUS for IMX_SCU driver to fix build issue.
 - Fix backlight pwm on imx6qdl-kontron-samx6i which is lost from
   #pwm-cells conversion.
 - Fix duplicated bus node name for i.MX8MN SoC.
 - Fix reset register offset on LS1028A SoC.
 - Rename MMC node aliases for imx6q-tbs2910 to keep the MMC device
   index consistent with previous kernel version.
 - Selecting ARM_GIC_V3 on non-CP15 processors to fix one build failure
   with i.MX8M SoC driver.
 - Fix typos with status property on imx6qdl-kontron-samx6i board.
 - Fix duplicated regulator-name on imx6qdl-gw52xx board.

Aside from i.MX, the bugfixes are all over the place:

 - Coccinelle found a refcount imbalance on integrator
 - defconfig fix for TI K3
 - A boot regression fix for ST ux500
 - A code preemption fix for the optee driver
 - USB DMA regression on Broadcom Stingray
 - A bogus boot time warning fix for at91 code

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (4):
      ARM: imx: fix imx8m dependencies
      Merge tag 'imx-fixes-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/fixes
      Merge tag 'optee-rcu-sched-trace-for-v5.11' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'imx-fixes-5.11-2' of
git://git.kernel.org/.../shawnguo/linux into arm/fixes

Bharat Gooty (1):
      arm64: dts: broadcom: Fix USB DMA address translation for Stingray

Bruno Thomsen (1):
      ARM: dts: imx7d-flex-concentrator: fix pcf2127 reset

Claudiu Beznea (1):
      drivers: soc: atmel: add null entry at the end of at91_soc_allowed_list[]

Jacky Bai (1):
      arm64: dts: imx8mp: Correct the gpio ranges of gpio3

Koen Vandeputte (1):
      ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming

Linus Walleij (1):
      ARM: dts: ux500: Reserve memory carveouts

Marco Felsch (2):
      ARM: dts: imx6qdl-kontron-samx6i: fix pwms for lcd-backlight
      ARM: dts: imx6qdl-kontron-samx6i: fix i2c_lcd/cam default status

Max Krummenacher (1):
      ARM: imx: build suspend-imx6.S with arm instruction set

Michael Walle (1):
      arm64: dts: ls1028a: fix the offset of the reset register

Nishanth Menon (1):
      arm64: defconfig: Drop unused K3 SoC specific options

Randy Dunlap (1):
      firmware: imx: select SOC_BUS to fix firmware build

Rouven Czerwinski (1):
      tee: optee: replace might_sleep with cond_resched

Russell King (1):
      ARM: dts: imx6qdl-sr-som: fix some cubox-i platforms

Shengjiu Wang (1):
      arm64: dts: imx8mn: Fix duplicate node name

Soeren Moch (1):
      ARM: dts: tbs2910: rename MMC node aliases

Stefan Wahren (1):
      MAINTAINERS: Include bcm2835 subsequents into search

Sudeep Holla (1):
      drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs

Sumera Priyadarsini (1):
      bus: arm-integrator-lm: Add of_node_put() before return statement

 MAINTAINERS                                        |  2 +-
 arch/arm/boot/dts/imx6q-tbs2910.dts                |  7 ++++
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |  2 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi      |  6 ++--
 arch/arm/boot/dts/imx6qdl-sr-som.dtsi              | 12 +++++--
 arch/arm/boot/dts/imx7d-flex-concentrator.dts      |  1 +
 arch/arm/boot/dts/ste-db8500.dtsi                  | 38 ++++++++++++++++++++++
 arch/arm/boot/dts/ste-db8520.dtsi                  | 38 ++++++++++++++++++++++
 arch/arm/boot/dts/ste-db9500.dtsi                  | 35 ++++++++++++++++++++
 arch/arm/boot/dts/ste-snowball.dts                 |  2 +-
 arch/arm/mach-imx/suspend-imx6.S                   |  1 +
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  7 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  2 +-
 arch/arm64/configs/defconfig                       |  2 --
 drivers/bus/arm-integrator-lm.c                    |  1 +
 drivers/firmware/imx/Kconfig                       |  1 +
 drivers/soc/atmel/soc.c                            | 13 ++++++++
 drivers/soc/imx/Kconfig                            |  2 +-
 drivers/tee/optee/call.c                           |  4 ++-
 21 files changed, 164 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-db9500.dtsi
