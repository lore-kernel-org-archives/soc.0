Return-Path: <SRS0=6XZ/=6N=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE820C636D6
	for <soc@archiver.kernel.org>; Fri, 17 Feb 2023 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 709C3C4339E; Fri, 17 Feb 2023 17:25:56 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E04CBC433D2
	for <soc@kernel.org>; Fri, 17 Feb 2023 17:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E04CBC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0FCE05C00B2;
	Fri, 17 Feb 2023 12:25:54 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 17 Feb 2023 12:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676654754; x=1676741154; bh=k9CC30xtRn
	IkcEmXE5iMZDNdapxCIxF6/qSMuorr+2c=; b=OYr7zGW4CyJ9/tqAqNshEkrbsb
	xfHwwqGBFGPZ0a+OQC8J6zLdB6gpWllbAPDA3Nwz6G0DJ8/IUKriyTdp3GDjC1qj
	t3YnpHa/RyhWJVjHhHbYxSIqNkZ4EXuS0l6XtX1CFpkZ1UO140/C5XHLmvIxZcRL
	wjtWHfqEapY8tOQ3RzLCFseGk46rxMdjrt+9mTMiWj/IwiY3AXnQpzUDvyI9JIDm
	3FdUwwEm0VWjJ3Kz9zapIX7RJPZ86VVEGDUOamwNOJWNuEkb+GLEeG0yXQxmqh4A
	1IY3d0L943T7mxNN0oUZdVynnoyD2CYC7OfGvUoRT1thXtVo9H5sxc4TQAJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676654754; x=1676741154; bh=k9CC30xtRnIkcEmXE5iMZDNdapxC
	IxF6/qSMuorr+2c=; b=DCdsEXKMEJdOv34F5a/Zc2RY+TtYoDbp4t3JSZfg5OeU
	N2OigLsP7Cp48PKKI0FWKdaMbfLe/O2k9xEE+OqWIBzp2bp/jEUeqJ4HBeyIikGZ
	qIT6c8MeeklnrJVwK4CfRdcgj3oPp3lYyc53I9k6otlLFol2lGCG4vIi5RN0Ihn+
	LwRLOzdUKSxcksaiEqMoqx/Oq1GeTfRDYU5DoWm9za3vygDr83FoxwaaTvEaaNkx
	UwCED+nNhEdZ95bAQ/CebZ/tG4jHO12t92IGXbv0oLL7zC4eX1tmA5oLItcZMNDL
	1kNnUYqtzQVvjpY3okgZ8edWFL/qytJt+XIk0kTZzQ==
X-ME-Sender: <xms:objvY5kYpsyNqAmn26HtLA2mkzx7oCwGloLbLP45bhHSYRCczJbxHw>
    <xme:objvY00L1P-mVLurb7zBAPBw30C5N0h4n3IJBkajd5HedYPD5beF1GwmJzZOGsXTT
    mzkESQI4X3l1AzI2_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepieeguedvkeehveduieetgedugfejheeugffhtedtvdetueetkefhheduhfet
    gfdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvg
X-ME-Proxy: <xmx:objvY_pVzJcUg-PSYzrM4Dta-7jtFInvOqyl_MEWAFu7DA_fvb_spA>
    <xmx:objvY5mjmoolNsxgZoPJPvU6etftctWY-R7f3x-M6UL7uFNuD9nVxw>
    <xmx:objvY33iIq5MO6YiJLFtzs8Dh3R8HpB1pDQwocIBVtpIx3O8XqwfJg>
    <xmx:orjvYw8p_7CV3lgs62b7X87Oe2JZ1z7sSieMLX2dLFHFu8HgtDDVXQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D1EC4B60086; Fri, 17 Feb 2023 12:25:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <5298daba-9487-4c3c-8920-d8be6918b3e2@app.fastmail.com>
In-Reply-To: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com>
References: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com>
Date: Fri, 17 Feb 2023 18:25:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] ARM: SoC updates for 6.3
Content-Type: text/plain

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-6.3

for you to fetch changes up to 27aaad0e7c7259101568ac8763a34810e81336cd:

  Merge tag 'zynq-soc-for-v6.3' of https://github.com/Xilinx/linux-xlnx into arm/soc (2023-02-01 17:13:27 +0100)

----------------------------------------------------------------
ARM: SoC updates for 6.3

The majority of the changes are for the OMAP2 platform, mostly
removing some dead code that got left behind from previous cleanups.

Aside from that, there are very minor updates and correctness fixes for
Zynq, i.MX, Samsung, Broadcom, AT91, ep93xx, and OMAP1.

----------------------------------------------------------------
Angus Chen (1):
      ARM: imx: Call ida_simple_remove() for ida_simple_get

Arnd Bergmann (20):
      ARM: remove CONFIG_UNUSED_BOARD_FILES
      ARM: omap2: remove unused USB code
      ARM: omap2: remove unused headers
      ARM: omap2: remove unused omap_hwmod_reset.c
      ARM: omap2: simplify clock2xxx header
      ARM: omap2: remove APLL control
      ARM: omap2: smartreflex: remove on_init control
      ARM: omap2: remove unused functions
      ARM: omap2: remove unused declarations
      ARM: omap2: remove unused omap2_pm_init
      ARM: omap2: make functions static
      Merge branch 'omap/omap2-cleanup' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc into arm/soc
      ARM: s3c: fix s3c64xx_set_timer_source prototype
      Merge tag 'omap-for-v6.3/cleanup-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/soc
      Merge tag 'omap-for-v6.3/omap1-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/soc
      Merge tag 'at91-soc-6.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'arm-soc/for-6.3/soc' of https://github.com/Broadcom/stblinux into arm/soc
      Merge tag 'samsung-soc-6.3' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'imx-soc-6.3' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/soc
      Merge tag 'zynq-soc-for-v6.3' of https://github.com/Xilinx/linux-xlnx into arm/soc

Chen Hui (1):
      ARM: OMAP2+: Fix memory leak in realtime_counter_init()

Dario Binacchi (1):
      ARM: BCM63xx: remove useless goto statement

Geert Uytterhoeven (2):
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/pinmux.h>
      ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/machine.h>

Krzysztof Kozlowski (2):
      arm64: drop redundant "ARMv8" from Kconfig option title
      dt-bindings: soc: samsung: exynos-pmu: allow phys as child

Liang He (1):
      ARM: OMAP2+: omap4-common: Fix refcount leak bug

Linus Walleij (1):
      ARM: ep93xx: Convert to use descriptors for GPIO LEDs

Mihai Sain (1):
      ARM: at91: add support in soc driver for new SAMA7G54 SiPs

Nir Levy (1):
      ARM: OMAP2+: Fix spelling typos in comment

Pierluigi Passaro (1):
      ARM: imx: mach-imx6ul: add imx6ulz support

Qiheng Lin (1):
      ARM: zynq: Fix refcount leak in zynq_early_slcr_init

Yang Yingliang (1):
      ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()

 .../bindings/soc/samsung/exynos-pmu.yaml           |  71 ++++-
 arch/arm/Kconfig                                   |  13 -
 arch/arm/mach-bcm/bcm63xx_smp.c                    |   3 +-
 arch/arm/mach-ep93xx/core.c                        |  13 +-
 arch/arm/mach-imx/mach-imx6ul.c                    |   1 +
 arch/arm/mach-imx/mmdc.c                           |  24 +-
 arch/arm/mach-omap1/timer.c                        |   2 +-
 arch/arm/mach-omap2/Makefile                       |   3 +-
 arch/arm/mach-omap2/board-n8x0.c                   |   2 +-
 arch/arm/mach-omap2/clkt2xxx_dpllcore.c            |   1 +
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c       |  14 +-
 arch/arm/mach-omap2/clock.c                        |   2 -
 arch/arm/mach-omap2/clock.h                        |   7 -
 arch/arm/mach-omap2/clock2xxx.h                    |  29 --
 arch/arm/mach-omap2/clock3xxx.h                    |  21 --
 arch/arm/mach-omap2/clockdomain.c                  |  44 +--
 arch/arm/mach-omap2/clockdomain.h                  |   4 -
 arch/arm/mach-omap2/cm2xxx.c                       | 101 +------
 arch/arm/mach-omap2/cm2xxx.h                       |   7 -
 arch/arm/mach-omap2/cm2xxx_3xxx.h                  |   5 -
 arch/arm/mach-omap2/common.h                       |  28 --
 arch/arm/mach-omap2/control.c                      |  73 -----
 arch/arm/mach-omap2/control.h                      |   5 -
 arch/arm/mach-omap2/devices.c                      |   1 -
 arch/arm/mach-omap2/id.c                           |   2 +-
 arch/arm/mach-omap2/id.h                           |   2 -
 arch/arm/mach-omap2/io.c                           |  21 +-
 arch/arm/mach-omap2/omap-secure.c                  |   7 +-
 arch/arm/mach-omap2/omap-secure.h                  |   3 -
 arch/arm/mach-omap2/omap4-common.c                 |   1 +
 arch/arm/mach-omap2/omap_device.c                  |  74 +----
 arch/arm/mach-omap2/omap_device.h                  |  14 -
 arch/arm/mach-omap2/omap_hwmod.c                   |  94 +------
 arch/arm/mach-omap2/omap_hwmod.h                   |  21 --
 arch/arm/mach-omap2/omap_hwmod_2420_data.c         |   1 -
 .../mach-omap2/omap_hwmod_2xxx_3xxx_ipblock_data.c |   2 +-
 .../mach-omap2/omap_hwmod_2xxx_interconnect_data.c |   1 -
 arch/arm/mach-omap2/omap_hwmod_2xxx_ipblock_data.c |  12 +-
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c         |   1 -
 arch/arm/mach-omap2/omap_hwmod_common_data.h       |   6 -
 arch/arm/mach-omap2/omap_hwmod_reset.c             |  98 -------
 arch/arm/mach-omap2/omap_opp_data.h                |   5 -
 arch/arm/mach-omap2/omap_phy_internal.c            |  87 ------
 arch/arm/mach-omap2/pm.c                           |   8 +-
 arch/arm/mach-omap2/pm.h                           |  25 --
 arch/arm/mach-omap2/pm24xx.c                       | 312 ---------------------
 arch/arm/mach-omap2/pm33xx-core.c                  |   1 -
 arch/arm/mach-omap2/powerdomain.c                  | 108 +------
 arch/arm/mach-omap2/powerdomain.h                  |   8 -
 arch/arm/mach-omap2/prcm-common.h                  |   1 -
 arch/arm/mach-omap2/prcm_mpu44xx.c                 |  12 -
 arch/arm/mach-omap2/prcm_mpu_44xx_54xx.h           |   2 -
 arch/arm/mach-omap2/prm.h                          |   4 -
 arch/arm/mach-omap2/prm2xxx_3xxx.h                 |   3 -
 arch/arm/mach-omap2/prm3xxx.c                      |   5 +-
 arch/arm/mach-omap2/prm3xxx.h                      |   2 -
 arch/arm/mach-omap2/prm_common.c                   |  55 +---
 arch/arm/mach-omap2/sdrc.c                         |  51 +---
 arch/arm/mach-omap2/sdrc.h                         |   5 -
 arch/arm/mach-omap2/serial.h                       |  66 -----
 arch/arm/mach-omap2/sleep34xx.S                    |   2 +-
 arch/arm/mach-omap2/sr_device.c                    |  13 -
 arch/arm/mach-omap2/sram.h                         |   4 -
 arch/arm/mach-omap2/timer.c                        |   1 +
 arch/arm/mach-omap2/usb-tusb6010.c                 |   6 +-
 arch/arm/mach-omap2/usb.h                          |  71 -----
 arch/arm/mach-omap2/vc.c                           |  15 -
 arch/arm/mach-omap2/voltage.c                      |   2 +-
 arch/arm/mach-omap2/voltage.h                      |   2 -
 arch/arm/mach-s3c/s3c64xx.c                        |   3 +-
 arch/arm/mach-zynq/slcr.c                          |   1 +
 arch/arm64/Kconfig.platforms                       |  10 +-
 drivers/soc/atmel/soc.c                            |   9 +
 drivers/soc/atmel/soc.h                            |   3 +
 drivers/soc/ti/smartreflex.c                       |   4 -
 include/linux/platform_data/voltage-omap.h         |   1 -
 include/linux/power/smartreflex.h                  |   3 -
 include/linux/usb/musb.h                           |   2 -
 78 files changed, 155 insertions(+), 1591 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/clock3xxx.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_reset.c
 delete mode 100644 arch/arm/mach-omap2/pm24xx.c
 delete mode 100644 arch/arm/mach-omap2/serial.h
 delete mode 100644 arch/arm/mach-omap2/usb.h
