Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87410C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 19:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBC560FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 19:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FBC560FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHKVw1c/db8trBcP/r0q/cBp6jNb1MGBs+xQfTRD7Ac=; b=45UKxpE9x5GDQS
	Xw5pU7yZaZXIA67GxM7E4mRxxXobfagfVXIyRvrKfiYh/wbfISOQMNsS7j3SJBziGcjhxddGYZyGM
	1y3xUjJGKJsWQd/xjKfeLqR801X3XF+OsDI11LwKSHRzC2kwtvOeRErR7HbLzuzSjrFG1000CLZr+
	JtoVHwO8r2ZlxZlg1ETdLhY0w17UfbRLXv8IhBWpOyKwjpaQuMh6z6BBn41Wxu+V/i5fmfayat262
	6iZHF1KRCN/pfTMOUlnonWjfG5uc0BlKxnwFuAzoXMwvGzo0kiBO+DB6J8I9Vpcl1rOMW8PwE44lv
	sbbQTaJUh9wRdK3DPnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLWLy-00798K-Fv; Wed, 01 Sep 2021 19:56:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLWLu-007958-22
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 19:56:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABFCA600CD
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  1 Sep 2021 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630526213;
 bh=8z5XPUKUMpypjOX4YlsLPtt2dPR6CbSwJwAtxuIov0U=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=SswZW4+ZjyI4+RMl/eUqL+yNeZNAZXPKFuQR+SfiO5/n5EG3X66MeauqexVaTkzAC
 21iMl5/f6sTwVO3o7LgA9fWAp5pTFoZb6p0HafEe4lD3CXGZBaNIiXBCHVSBUMg6IG
 zKMH9K45/jt82R17H81wc0isUiR+pPQ/wU6GsfcP6CjupePx+3UeGarwQJvYwGTT0T
 aYZ7jAttU0MqLi8subk2KDIe9kqyCEeztxAxz4Wu4eQnciZ+rgr4IhKKZWr28lWZjG
 3CnAFRRllr/rLAleYIFvsvPhjO+asLoHFBqIGspawxEF7gaHa5GcOjzRy7f9z4aelZ
 lBJwqEAuHgKpA==
Received: by mail-wm1-f52.google.com with SMTP id u15so609100wmj.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 01 Sep 2021 12:56:53 -0700 (PDT)
X-Gm-Message-State: AOAM530mINdIyFQTYPCu2hu8QwZ2p2mkyJ0nR7H9kScXrF473Jv9saAO
 XaaPDseywsyPdNTDkpwaoMdAaw3MTKZWXxKStcU=
X-Google-Smtp-Source: ABdhPJyKDIW+KFyZ+U8x1VIdr/bKjm0SHeLxW1LBSmuIaCPCbSEUmPknKNB7SD/+Y3DipX+zP3Qw0j7o+VyC+HSTvlg=
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr1165197wmf.84.1630526212278; 
 Wed, 01 Sep 2021 12:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
In-Reply-To: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 19:56:35 +0000
X-Gmail-Original-Message-ID: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
Message-ID: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
Subject: [GIT PULL 1/4] ARM: SoC updates for 5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_125654_197728_6E473DDF 
X-CRM114-Status: GOOD (  22.91  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210901195635.Tc5JWdjaVcWeb_7pKkKeocDVyROrs9CrSPetQ1rQxzo@z>

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.15

for you to fetch changes up to 51e321fed0ff8d64eff809a4ee0547254cdcc4a1:

  soc: aspeed-lpc-ctrl: Fix clock cleanup in error path (2021-08-26
11:31:22 +0200)

----------------------------------------------------------------
ARM: SoC updates for 5.15

There are three noteworthy updates for 32-bit arm platforms this time:

 - The Microchip SAMA7 family based on Cortex-A7 gets introduced, a new
   cousin to the older SAM9 (ARM9xx based) and SAMA5 (Cortex-A5 based)
   SoCs.

 - The ixp4xx platform (based on Intel XScale) is finally converted to
   device tree, and all the old board files are getting removed now.

 - The Cirrus Logic EP93xx platform loses support for the old
   MaverickCrunch FPU. Support for compiling user space applications
   was already removed in gcc-4.9, and the kernel support for old
   applications could not be built with clang ias. After confirming
   that there are no remaining users, removing this from the kernel
   seemed better than adding support for unused features to clang.

There are minor updates to the aspeed, omap and samsung platforms

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (6):
      ARM: ep93xx: remove MaverickCrunch support
      Merge tag 'at91-soc-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/soc
      Merge tag 'omap-for-v5.15/soc-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'omap-for-v5.15/soc-late-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/soc
      Merge tag 'ixp4xx-del-boardfiles-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/soc
      Merge tag 'aspeed-5.15-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/soc

Claudiu Beznea (23):
      clk: at91: add register definition for sama7g5's master clock
      ARM: at91: pm: move pm_bu to soc_pm data structure
      ARM: at91: pm: move the setup of soc_pm.bu->suspended
      ARM: at91: pm: document at91_soc_pm structure
      ARM: at91: pm: check for different controllers in at91_pm_modes_init()
      ARM: at91: pm: do not initialize pdev
      ARM: at91: pm: use r7 instead of tmp1
      ARM: at91: pm: avoid push and pop on stack while memory is in self-refersh
      ARM: at91: pm: s/CONFIG_SOC_SAM9X60/CONFIG_HAVE_AT91_SAM9X60_PLL/g
      ARM: at91: pm: add support for waiting MCK1..4
      ARM: at91: sfrbu: add sfrbu registers definitions for sama7g5
      ARM: at91: ddr: add registers definitions for sama7g5's ddr
      ARM: at91: pm: add self-refresh support for sama7g5
      ARM: at91: pm: add support for MCK1..4 save/restore for ulp modes
      ARM: at91: pm: add support for 2.5V LDO regulator control
      ARM: at91: pm: wait for ddr power mode off
      ARM: at91: pm: add sama7g5 ddr controller
      ARM: at91: pm: add sama7g5 ddr phy controller
      ARM: at91: pm: save ddr phy calibration data to securam
      ARM: at91: pm: add backup mode support for SAMA7G5
      ARM: at91: pm: add sama7g5's pmc
      ARM: at91: pm: add pm support for SAMA7G5
      ARM: at91: pm: add sama7g5 shdwc

Eugen Hristev (3):
      ARM: at91: add new SoC sama7g5
      ARM: at91: debug: add sama7g5 low level debug uart
      ARM: at91: sama7: introduce sama7 SoC family

Iwona Winiarska (2):
      soc: aspeed: lpc-ctrl: Fix boundary check for mmap
      soc: aspeed: p2a-ctrl: Fix boundary check for mmap

Jason Wang (1):
      ARM: s3c: delete unneed local variable "delay"

Joel Stanley (2):
      soc: aspeed: socinfo: Add AST2625 variant
      soc: aspeed: Re-enable FWH2AHB on AST2600

Linus Walleij (11):
      ARM: ixp4xx: Delete NSLU2 boardfiles
      ARM: ixp4xx: Delete NAS100D boardfiles
      ARM: ixp4xx: Delete the D-Link DSM-G600 boardfiles
      ARM: ixp4xx: Delete Omicron boardfiles
      ARM: ixp4xx: Delete Gateway WG302v2 boardfiles
      ARM: ixp4xx: Delete the Arcom Vulcan boardfiles
      ARM: ixp4xx: Delete Avila boardfiles
      ARM: ixp4xx: Delete Intel reference design boardfiles
      ARM: ixp4xx: Delete Coyote and IXDPG425 boardfiles
      ARM: ixp4xx: Delete GTWX5715 board files
      ARM: ixp4xx: Delete the Freecom FSG-3 boardfiles

Paul Barker (1):
      MAINTAINERS: Adopt SanCloud dts files as supported

Peter Robinson (3):
      arm: omap2: Drop MACH_OMAP3517EVM entry
      arm: omap2: Drop obsolete MACH_OMAP3_PANDORA entry
      arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries

Yang Yingliang (1):
      soc: aspeed-lpc-ctrl: Fix clock cleanup in error path

 MAINTAINERS                           |   6 +
 arch/arm/Kconfig.debug                |  10 +
 arch/arm/configs/ep93xx_defconfig     |   1 -
 arch/arm/include/asm/fpstate.h        |   8 -
 arch/arm/include/asm/thread_info.h    |   8 -
 arch/arm/include/asm/ucontext.h       |  14 -
 arch/arm/include/uapi/asm/hwcap.h     |   2 +-
 arch/arm/include/uapi/asm/ptrace.h    |   4 +-
 arch/arm/kernel/asm-offsets.c         |   3 -
 arch/arm/kernel/entry-armv.S          |   6 -
 arch/arm/kernel/ptrace.c              |  36 --
 arch/arm/kernel/signal.c              |  42 --
 arch/arm/mach-at91/Kconfig            |  18 +
 arch/arm/mach-at91/Makefile           |   1 +
 arch/arm/mach-at91/generic.h          |   2 +
 arch/arm/mach-at91/pm.c               | 343 ++++++++++----
 arch/arm/mach-at91/pm.h               |   3 +
 arch/arm/mach-at91/pm_data-offsets.c  |   2 +
 arch/arm/mach-at91/pm_suspend.S       | 827 +++++++++++++++++++++++++---------
 arch/arm/mach-at91/sama7.c            |  33 ++
 arch/arm/mach-ep93xx/Kconfig          |   5 -
 arch/arm/mach-ep93xx/Makefile         |   3 -
 arch/arm/mach-ep93xx/adssphere.c      |   1 -
 arch/arm/mach-ep93xx/core.c           |   5 -
 arch/arm/mach-ep93xx/crunch-bits.S    | 310 -------------
 arch/arm/mach-ep93xx/crunch.c         |  86 ----
 arch/arm/mach-ep93xx/edb93xx.c        |   8 -
 arch/arm/mach-ep93xx/gesbc9312.c      |   1 -
 arch/arm/mach-ep93xx/micro9.c         |   4 -
 arch/arm/mach-ep93xx/platform.h       |   7 -
 arch/arm/mach-ep93xx/simone.c         |   1 -
 arch/arm/mach-ep93xx/snappercl15.c    |   1 -
 arch/arm/mach-ep93xx/ts72xx.c         |   2 -
 arch/arm/mach-ep93xx/vision_ep9307.c  |   1 -
 arch/arm/mach-ixp4xx/Kconfig          | 158 -------
 arch/arm/mach-ixp4xx/Makefile         |  26 --
 arch/arm/mach-ixp4xx/avila-pci.c      |  79 ----
 arch/arm/mach-ixp4xx/avila-setup.c    | 210 ---------
 arch/arm/mach-ixp4xx/coyote-pci.c     |  62 ---
 arch/arm/mach-ixp4xx/coyote-setup.c   | 144 ------
 arch/arm/mach-ixp4xx/dsmg600-pci.c    |  77 ----
 arch/arm/mach-ixp4xx/dsmg600-setup.c  | 304 -------------
 arch/arm/mach-ixp4xx/fsg-pci.c        |  73 ---
 arch/arm/mach-ixp4xx/fsg-setup.c      | 311 -------------
 arch/arm/mach-ixp4xx/gtwx5715-pci.c   |  72 ---
 arch/arm/mach-ixp4xx/gtwx5715-setup.c | 167 -------
 arch/arm/mach-ixp4xx/ixdp425-pci.c    |  75 ---
 arch/arm/mach-ixp4xx/ixdp425-setup.c  | 339 --------------
 arch/arm/mach-ixp4xx/ixdpg425-pci.c   |  56 ---
 arch/arm/mach-ixp4xx/miccpt-pci.c     |  75 ---
 arch/arm/mach-ixp4xx/nas100d-pci.c    |  73 ---
 arch/arm/mach-ixp4xx/nas100d-setup.c  | 353 ---------------
 arch/arm/mach-ixp4xx/nslu2-pci.c      |  69 ---
 arch/arm/mach-ixp4xx/nslu2-setup.c    | 341 --------------
 arch/arm/mach-ixp4xx/omixp-setup.c    | 298 ------------
 arch/arm/mach-ixp4xx/vulcan-pci.c     |  70 ---
 arch/arm/mach-ixp4xx/vulcan-setup.c   | 282 ------------
 arch/arm/mach-ixp4xx/wg302v2-pci.c    |  60 ---
 arch/arm/mach-ixp4xx/wg302v2-setup.c  | 114 -----
 arch/arm/mach-omap2/Kconfig           |  23 -
 arch/arm/mach-s3c/mach-gta02.c        |   3 +-
 arch/arm64/include/asm/hwcap.h        |   2 +-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  |  35 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c  |   2 +-
 drivers/soc/aspeed/aspeed-socinfo.c   |   1 +
 include/linux/clk/at91_pmc.h          |  26 ++
 include/soc/at91/sama7-ddr.h          |  80 ++++
 include/soc/at91/sama7-sfrbu.h        |  34 ++
 68 files changed, 1129 insertions(+), 4769 deletions(-)
 create mode 100644 arch/arm/mach-at91/sama7.c
 delete mode 100644 arch/arm/mach-ep93xx/crunch-bits.S
 delete mode 100644 arch/arm/mach-ep93xx/crunch.c
 delete mode 100644 arch/arm/mach-ixp4xx/avila-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/avila-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/coyote-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/coyote-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/dsmg600-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/dsmg600-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/fsg-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/fsg-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/gtwx5715-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/gtwx5715-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdp425-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdp425-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/ixdpg425-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/miccpt-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nas100d-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nas100d-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/nslu2-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/nslu2-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/omixp-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/vulcan-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/vulcan-setup.c
 delete mode 100644 arch/arm/mach-ixp4xx/wg302v2-pci.c
 delete mode 100644 arch/arm/mach-ixp4xx/wg302v2-setup.c
 create mode 100644 include/soc/at91/sama7-ddr.h
 create mode 100644 include/soc/at91/sama7-sfrbu.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
