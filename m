Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE10C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 17:11:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 77FFC23A01; Fri,  8 Jan 2021 17:11:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 515FE2368A
	for <soc@kernel.org>; Fri,  8 Jan 2021 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610125864;
	bh=Xc4j0qz7H2FXRAjtz1+jJpsThB7uINBxmDddnINUDgQ=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=H9mgeSuHAnONTu+HvY/y2k+dWJA+LknMnJTuKqQ5QZvXJnwl3Op9UVx+WbRuFxJvr
	 bIyTVu7dImUJZCs8cv87SGbJsyqanEV4kshqJKrduVOo5KQl/oryBRIhSdQOBJG6Tf
	 vWutANr+mJALKG3v66B1GKPovGtYfrhM20KU4v9ANujnj056EfwyVGiHmmQ9GzwqEs
	 22tUuuce5Em6EBNJJlPtw8Jz4cXTjiMm/7f/XT6mpRSaUViTC3nWJLY1ZsDeaVzka5
	 Z/DT/Ce/16OOS0EDxhnruT/50PlSwzDKI5BzC138hO1/5PO6U1cSpLYtBq6+B4WCRZ
	 7PGB/a+AGKnKA==
Received: by mail-ot1-f45.google.com with SMTP id i6so10320975otr.2
        for <soc@kernel.org>; Fri, 08 Jan 2021 09:11:04 -0800 (PST)
X-Gm-Message-State: AOAM5321N2M6Mz25Rx4OTpV9Uv4qzBNI1CsMe/uqIavw7rUccYmKuK+M
	ynrc9LO2WD9VMutMviMVlR+B/gqww36jbVk5cb8=
X-Google-Smtp-Source: ABdhPJz7qkGenCk7YSSFXPr9juATtboGHKXhOj6RkWr3T33mheh2GHCv/XF3NzC2n3RzgebVnoXyPQB8IW3/qS8iYZY=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr3297026otm.305.1610125863473;
 Fri, 08 Jan 2021 09:11:03 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 18:10:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
Message-ID: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 69fe24d1d80feac4289778582cf0a15256d59baf:

  firmware: xilinx: Mark pm_api_features_map with static keyword
(2020-12-09 23:00:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.11-1

for you to fetch changes up to bac717171971176b78c72d15a8b6961764ab197f:

  ARM: picoxcell: fix missing interrupt-parent properties (2021-01-08
16:23:37 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.11

These are a small number of bug fixes that all came in before or during
the merge window, most for the omap platform:

 - One boot regression fix for Nokia N9 (OMAP3).

 - Two small defconfig changes for omap2, to reflect changes in drivers

 - Warning fixes for DT issues on omap2, picoxcell and bitmap SoCs.
   The picoxcell platform will be removed in v5.12, but fixing it
   first makes it easier to backport to the fix to stable kernels
   and get a clean build with new dtc versions

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: dts: OMAP3: disable AES on N950/N9

Andreas Kemnade (2):
      ARM: OMAP2+: omap_device: fix idling of devices during probe
      ARM: omap2plus_defconfig: enable SPI GPIO

Andrey Zhizhikin (1):
      ARM: omap2plus_defconfig: drop unused POWER_AVS option

Arnd Bergmann (3):
      Merge tag 'omap-for-v5.10/fixes-rc6-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      Merge tag 'omap-for-v5.11/defconfig-late-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      ARM: picoxcell: fix missing interrupt-parent properties

Carl Philipp Klemm (1):
      ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent
with defaults on xt875

Jisheng Zhang (1):
      arm64: dts: bitmain: Use generic "ngpios" rather than "snps,nr-gpios"

Linus Walleij (1):
      ARM: dts: ux500/golden: Set display max brightness

 arch/arm/boot/dts/omap3-n950-n9.dtsi           | 8 ++++++++
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi         | 4 ++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 1 +
 arch/arm/configs/omap2plus_defconfig           | 7 ++++++-
 arch/arm/mach-omap2/omap_device.c              | 8 +++++---
 arch/arm/mach-omap2/pmic-cpcap.c               | 2 +-
 arch/arm64/boot/dts/bitmain/bm1880.dtsi        | 6 +++---
 7 files changed, 28 insertions(+), 8 deletions(-)
