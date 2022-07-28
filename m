Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEFCC04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 22:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44E69C4347C; Thu, 28 Jul 2022 22:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A778C433B5
	for <soc@kernel.org>; Thu, 28 Jul 2022 22:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659047830;
	bh=DdypzVJGFC0oe3bdLZvss/YQ5DT5jG+t/El6uxfL1l4=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=gbpxA10RaZADkqI9v1b5ywl8F/O/AmVwnzeAdAnJntRulatZIEMz+ZBuGzDltEbmI
	 SOZWUxMxl9dydAUmpD4y9i/RGd40prwI58oL8XdP1feX/OOMs7mc7B/YGsDTQVGKmI
	 PK+19CaMT40zv9mBhwo+1AV+9mlQKOgxe/SqmRgwKIObEVW2HXJNZqMzFcaWi38DwG
	 n44DovnM588Kmk+RjEn3obddnLJbRncsvsp9bYkg6G85O6helM9EbBg0A8uT0nVHX/
	 DsMlMks0cmoKlHt+HkB8zFky552huNUjEi3R5ZDQr7rABM0qQs0VBys/IRrQ3RnSRG
	 sXt8Sv3isZN5A==
Received: by mail-ej1-f54.google.com with SMTP id oy13so5511008ejb.1
        for <soc@kernel.org>; Thu, 28 Jul 2022 15:37:10 -0700 (PDT)
X-Gm-Message-State: AJIora/EzGHEJaF0bo4VMa+FDMnT1ZzzLrxtmKmzL50PL1cM+RXd/kHy
	68o45Lw9B5yXBIwWxZMPwcsfpAWrw7fydo39ZVc=
X-Google-Smtp-Source: AGRyM1vXRauShaBfOT3cTCzEz2WLSnnSECC07YXaLj3r+QJ8JUo56uHmm3uZ03sEs4mj4gptVI8M2Pnt+IzZisrGHcU=
X-Received: by 2002:a17:906:98c7:b0:72b:20fe:807d with SMTP id
 zd7-20020a17090698c700b0072b20fe807dmr750161ejb.75.1659047828403; Thu, 28 Jul
 2022 15:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
In-Reply-To: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 29 Jul 2022 00:36:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ht1tG2nVzh1Shm0v8orQTa0VWOVkhvX9daF4yu6u8Sg@mail.gmail.com>
Message-ID: <CAK8P3a0ht1tG2nVzh1Shm0v8orQTa0VWOVkhvX9daF4yu6u8Sg@mail.gmail.com>
Subject: [GIT PULL 6/6] ARM: boardfile deprecation for 5.20
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 77f349b7700f86c51895e36b19dbc5e7323a7dfb:

  ARM: defconfig: kill remnants of CONFIG_LEDS (2022-07-22 12:34:13 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-boardfiles-5.20

for you to fetch changes up to 1785ab769824b800d7dea83aecc88c90377a6a5d:

  ARM: cns3xxx: add CONFIG_UNUSED_BOARD_FILES dependency (2022-07-22
14:18:52 +0200)

----------------------------------------------------------------
ARM: boardfile deprecation for 5.20

Over the past ten years, new machine support was based on device tree,
and an initial set of about 400 boards using ATAGS with boardfile
for booting were grandfathered in, with about half of them either
removed or converted to DT over time.

Based on the recent mailing list discussion I started, I have now
turned the findings into a set of patches that marks most board files as
'depends on UNUSED_BOARD_FILES', leaving only 38 of the 196 boards.

For the boards that are marked as unused, there are two final chances
for potential users: The removal is scheduled to take place after the
longterm stable kernel at the end of 2022, so users can stay on that
version for another few years, and if anyone still has one of these
machines and is planning to keep updating kernels beyond that version,
they can speak up now to have their boards taken off the list again.

Waiting for the LTS release also makes sure that there will be at
least one longterm kernel that contains the recent multiplatform
conversion along while still supporting all legacy boards.

The short summary of the current status is:

 - The s3c24xx, cns3xxx, iop32x and mv78xx0 platforms have no known
   users and will be removed entirely.

 - The mmp and davinci platforms have DT support for the important
   machines and will become DT-only after this.

 - s3c64xx, dove, orion5x, and pxa keep some board files to allow
   those to be migrated over to DT more easily, but most board files
   are getting removed now. DT support on these platforms is partially
   working but requires changes to additional drivers for the other
   boards.

 - omap1, ep93xx, sa1100, footbridge and rpc have no DT support at
   the moment but have some boards with known users. Removing the board
   files that nobody uses should make it easier to try a DT conversion
   if anyone cares.

There is no explicit timeline what happens with the boards that remain
after this removal, but I expect to revisit this in the future, and
with most boards gone, there will be a good time to do a treewide
review of platform drivers that never gained DT support and have no
remaining in-tree board files.

Link: https://lore.kernel.org/linux-arm-kernel/CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com/

----------------------------------------------------------------

[note: this branch is based on top of the arm-defconfig-5.20 tag]

Arnd Bergmann (13):
      ARM: add ATAGS dependencies to non-DT platforms
      ARM: add CONFIG_UNUSED_BOARD_FILES
      ARM: pxa: add Kconfig dependencies for ATAGS based boards
      ARM: orion: add ATAGS dependencies
      ARM: davinci: mark all ATAGS board files as unused
      ARM: ep93xx: mark most board files as unused
      ARM: mmp: mark all board files for removal
      ARM: footbridge: mark cats board for removal
      ARM: sa1100: mark most boards as unused
      ARM: omap1: add Kconfig dependencies for unused boards
      ARM: s3c: mark most board files as unused
      ARM: iop32x: mark as unused
      ARM: cns3xxx: add CONFIG_UNUSED_BOARD_FILES dependency

 arch/arm/Kconfig                          | 21 +++++++--
 arch/arm/configs/badge4_defconfig         |  1 +
 arch/arm/configs/cerfcube_defconfig       |  1 +
 arch/arm/configs/cm_x300_defconfig        |  1 +
 arch/arm/configs/cns3420vb_defconfig      |  1 +
 arch/arm/configs/colibri_pxa270_defconfig |  1 +
 arch/arm/configs/colibri_pxa300_defconfig |  1 +
 arch/arm/configs/corgi_defconfig          |  1 +
 arch/arm/configs/davinci_all_defconfig    | 11 -----
 arch/arm/configs/ep93xx_defconfig         |  8 ----
 arch/arm/configs/eseries_pxa_defconfig    |  1 +
 arch/arm/configs/ezx_defconfig            |  1 +
 arch/arm/configs/footbridge_defconfig     |  1 -
 arch/arm/configs/h5000_defconfig          |  1 +
 arch/arm/configs/hackkit_defconfig        |  1 +
 arch/arm/configs/iop32x_defconfig         |  1 +
 arch/arm/configs/jornada720_defconfig     |  1 +
 arch/arm/configs/lart_defconfig           |  1 +
 arch/arm/configs/lpd270_defconfig         |  1 +
 arch/arm/configs/lubbock_defconfig        |  1 +
 arch/arm/configs/magician_defconfig       |  1 +
 arch/arm/configs/mainstone_defconfig      |  1 +
 arch/arm/configs/mini2440_defconfig       |  1 +
 arch/arm/configs/mmp2_defconfig           |  5 +-
 arch/arm/configs/multi_v5_defconfig       | 17 -------
 arch/arm/configs/mv78xx0_defconfig        |  1 +
 arch/arm/configs/mvebu_v5_defconfig       |  8 ----
 arch/arm/configs/omap1_defconfig          |  9 ----
 arch/arm/configs/orion5x_defconfig        | 13 ------
 arch/arm/configs/palmz72_defconfig        |  1 +
 arch/arm/configs/pcm027_defconfig         |  1 +
 arch/arm/configs/pleb_defconfig           |  1 +
 arch/arm/configs/pxa255-idp_defconfig     |  1 +
 arch/arm/configs/pxa3xx_defconfig         |  7 +--
 arch/arm/configs/pxa_defconfig            | 77 +++++--------------------------
 arch/arm/configs/s3c2410_defconfig        |  1 +
 arch/arm/configs/s3c6400_defconfig        |  9 ----
 arch/arm/configs/shannon_defconfig        |  1 +
 arch/arm/configs/simpad_defconfig         |  1 +
 arch/arm/configs/tct_hammer_defconfig     |  1 +
 arch/arm/configs/trizeps4_defconfig       |  1 +
 arch/arm/configs/viper_defconfig          |  1 +
 arch/arm/configs/xcep_defconfig           |  1 +
 arch/arm/configs/zeus_defconfig           |  1 +
 arch/arm/mach-cns3xxx/Kconfig             |  1 +
 arch/arm/mach-davinci/Kconfig             |  8 ++++
 arch/arm/mach-dove/Kconfig                |  1 +
 arch/arm/mach-ep93xx/Kconfig              |  9 ++++
 arch/arm/mach-footbridge/Kconfig          |  1 +
 arch/arm/mach-iop32x/Kconfig              |  1 +
 arch/arm/mach-mmp/Kconfig                 |  9 ++++
 arch/arm/mach-mv78xx0/Kconfig             |  1 +
 arch/arm/mach-omap1/Kconfig               | 11 +++++
 arch/arm/mach-orion5x/Kconfig             | 17 +++++++
 arch/arm/mach-pxa/Kconfig                 | 53 +++++++++++++++++++++
 arch/arm/mach-s3c/Kconfig.s3c24xx         |  2 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx         | 20 ++++----
 arch/arm/mach-sa1100/Kconfig              | 11 +++++
 58 files changed, 198 insertions(+), 165 deletions(-)
