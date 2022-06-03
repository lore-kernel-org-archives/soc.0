Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E46FC43334
	for <soc@archiver.kernel.org>; Fri,  3 Jun 2022 18:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45337C3411F; Fri,  3 Jun 2022 18:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282C7C36AE3
	for <soc@kernel.org>; Fri,  3 Jun 2022 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654282641;
	bh=6/gFciY7ZZpNgDZvjP+oAhAVcWhb2YN2G1yVV6HPowY=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=SJ/rQnxtF6ZF6mXdfBs7eOAgRDpoPu8fa/HBvEivdK27w8ZemlM2R6Alun4f9q07p
	 xxIq+tb8nNeMfe1h1paIngbywNbPFlhzoT1YtKsrdnC7z4NkIVxOOGSwWpxXgWXF3G
	 JQXns4cy2+OhmRIxIoYVEFm3Gti81ly7BV9Ywk8T1PCIQOliPpr4i3M5+tW10GTsN4
	 iKvYlZ/+yMMuiDfFFlnUTKWFUs9CJSUpiAUaXrozLzbyMVcbmOoFz8Qus02XOHom8l
	 kFMKo+XUZfOD1730zT/1Iy3Uhs1V8vZzG+mAUGgVaDuPrLwZHFzGuLv/YVe8LMY59/
	 uh0/1Ta3Za55A==
Received: by mail-yb1-f179.google.com with SMTP id w2so15290817ybi.7
        for <soc@kernel.org>; Fri, 03 Jun 2022 11:57:21 -0700 (PDT)
X-Gm-Message-State: AOAM532qO+475uc/UcJuJP/CkKyCxnztBaM2nMaM8xgN50l69hdZB6KV
	PNWIhGwhpH/Lh5IPC8JofV00TIouR/o/jIzJ+/E=
X-Google-Smtp-Source: ABdhPJyxi7gJv4KMR8FsO2v+k+o+WLF2p6ry+f8fU8EcnodNDOpwNLu3UsW/Gxunq/x00y3iML+Wy2kaZgvhZJbNw2Q=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr12462634ybx.472.1654282640168; Fri, 03
 Jun 2022 11:57:20 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 3 Jun 2022 20:57:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Q2DbCrSUuu8Fui_W7ZydQZeza=s-2cgKFS8AL1geFZQ@mail.gmail.com>
Message-ID: <CAK8P3a1Q2DbCrSUuu8Fui_W7ZydQZeza=s-2cgKFS8AL1geFZQ@mail.gmail.com>
Subject: [GIT PULL, PATCH 0/2] ARM: multiplatform changes, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 6f9b5ed8caddfbc94af8307c557ed57a8ec5c65c:

  Merge tag 'char-misc-5.19-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
(2022-06-03 11:36:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-multiplatform-5.19-3

for you to fetch changes up to 7036440eab3e2d47a775d4616909f8235488d714:

  ARM: omap1: enable multiplatform (2022-06-03 20:48:53 +0200)

[ The branch is just rebased on top of the usb driver merge, which is
not great for the
 git history but required for bisection. Sending the individual
patches as well if you
 prefer to just apply them. ]

----------------------------------------------------------------
ARM: multiplatform changes, part 3

This is the third and final bit of the multiplatform conversion
for ARMv5, finishing off OMAP1. One patch enables the common-clk
interface, and the other ones does the Kconfig change.

These were waiting on a few dependencies to trickle in for
common-clk, and the last one of those was in the USB tree.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: omap1: enable multiplatform

Janusz Krzysztofik (1):
      ARM: OMAP1: clock: Convert to CCF

 arch/arm/Kconfig                                |  13 -
 arch/arm/configs/omap1_defconfig                |   3 +
 arch/arm/mach-omap1/Kconfig                     |  16 +
 arch/arm/mach-omap1/clock.c                     | 693 ++++++++++--------------
 arch/arm/mach-omap1/clock.h                     | 139 ++---
 arch/arm/mach-omap1/clock_data.c                | 483 +++++++----------
 arch/arm/mach-omap1/hardware.h                  |   2 +-
 arch/arm/mach-omap1/include/mach/uncompress.h   | 117 ----
 arch/arm/mach-omap1/io.c                        |   7 -
 arch/arm/mach-omap1/serial.c                    |   3 +-
 arch/arm/mach-omap1/{include/mach => }/serial.h |   0
 arch/arm/mach-omap1/time.c                      |   5 +
 12 files changed, 584 insertions(+), 897 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/include/mach/uncompress.h
 rename arch/arm/mach-omap1/{include/mach => }/serial.h (100%)
