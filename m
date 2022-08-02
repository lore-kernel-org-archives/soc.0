Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B20C25B0D
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2C50C4314A; Tue,  2 Aug 2022 14:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C014BC43141;
	Tue,  2 Aug 2022 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448934;
	bh=AZv7MwN+acbv1xHR0kJDbyQ8WLzJQJXUne52Kqpttqk=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=XDHcYyJsx6KRly7cGht8zJXHTlHomDQAzn0Ysph0ZljgY8QEOKbvc4S+UzZ9xOqdP
	 DRRNkH9k4QyUHBap/kuf9gM9zQwRE66MGDcdwdmH9Qjyh+SaAOCBSXg9adGh+BP65O
	 8uSlkkoLiM2ntD2NgDyaCRB5uION01UONyHM4ZWLTcrgOlxKZThoGSObjbAFlPqrFh
	 m4awF1agbz5lYHoaqVIT6jZGdgo4dSFjyEyzutIMlql35kGGWXOfyo+3FLYszkNQlM
	 Yui61uk4fA2WcuOqK1wWcmOpqvDGbd1TyB5JSyo7wccxWApFd1YLzMk1fmQx67pST4
	 3gFgqgs1o2log==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] ARM: boardfile deprecation for 6.0
Date: Tue,  2 Aug 2022 16:02:00 +0200
Message-Id: <20220802140200.3987874-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220802140200.3987874-1-arnd@kernel.org>
References: <20220802140200.3987874-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 77f349b7700f86c51895e36b19dbc5e7323a7dfb:

  ARM: defconfig: kill remnants of CONFIG_LEDS (2022-07-22 12:34:13 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-boardfiles-6.0

for you to fetch changes up to 1785ab769824b800d7dea83aecc88c90377a6a5d:

  ARM: cns3xxx: add CONFIG_UNUSED_BOARD_FILES dependency (2022-07-22 14:18:52 +0200)

----------------------------------------------------------------
ARM: boardfile deprecation for 6.0

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
This is based on top of the arm/defconfig branch to avoid merge
conflicts against the new defconfig changes.

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
