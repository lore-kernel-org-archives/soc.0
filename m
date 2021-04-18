Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23F7C433ED
	for <soc@archiver.kernel.org>; Sun, 18 Apr 2021 19:23:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 48D16610E7; Sun, 18 Apr 2021 19:23:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D33E60698
	for <soc@kernel.org>; Sun, 18 Apr 2021 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618773808;
	bh=iB9FjRppP4uPT4mx09Rjt69lVT8mFvl7Tz7PFiF60P8=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=uFpyLfh3FkDQDFV0qW4xd/qVVi3sSe0FvtRvhW6tBQVrIsumFnW44LpoNv/H/aU0W
	 krv5i6gbWP6mhFrQp7cL2Ana+8m5hTEBxb2q18xFGwFDpKO7VPwkSlLm7BG1JU/NFs
	 vmuaWMVx7oVtmEVpHqEIkJuTPfzmc18jqUid7SOYkTe3aJmmBZgh6LkQxvAPH2SWzB
	 KdGVjQq+L5ulU7aqNp/AIKikBB6DIb47lb3dPmj+yCk0NHdqp7gl2K7o1mjtOG1NK9
	 bkcxjlRiCAdTYbb1GC4eJ5nCqLC3aVjvsJnFFzPE3UcDFq+JzTVm9+dtf2aqtc6fVl
	 0nKpbkypFCYCQ==
Received: by mail-wm1-f49.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so6937541wmf.3
        for <soc@kernel.org>; Sun, 18 Apr 2021 12:23:28 -0700 (PDT)
X-Gm-Message-State: AOAM530yge0IBaV8KvV8Tlb+6Af7fCpvWVDP2HMqbLaPBFTj1wzg9o8I
	1cep11F9uwFMQoeI//ozyhb8oPQ6co5Vha+4LHo=
X-Google-Smtp-Source: ABdhPJyep2PToWXfhdBPzkd1wKVu3Qxp/XkPWTmabl4hRd99S2xazTQ77LZjLurtd7N8uEdQMwNXXOFH2hVTyD6hkE0=
X-Received: by 2002:a05:600c:2282:: with SMTP id 2mr18324883wmf.84.1618773806698;
 Sun, 18 Apr 2021 12:23:26 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 18 Apr 2021 21:23:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
Message-ID: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
Subject: ARM SoC fixes for v5.12, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.12-3

for you to fetch changes up to b9a9786a13ea158ee3b23614217f2e3158178421:

  Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-04-08 17:56:09 +0200)

----------------------------------------------------------------
ARM SoC fixes for v5.12, part 2

Another smaller set of fixes for three of the Arm platforms:

TI OMAP:

    Fix swapped mmc device order also for omap3 that got changed with the
    recent PROBE_PREFER_ASYNCHRONOUS changes. While eventually the aliases
    should be board specific, all the mmc device instances are all there in
    the SoC, and we do probe them by default so that PM runtime can idle the
    devices if left enabled from the bootloader.

Qualcomm Snapdragon:

    This bypasses the, recently introduced, interconnect handling in the
    GENI (serial engine) driver when running off ACPI, as this causes the
    GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard
    and touchpad.

Allwinner:

    One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine,
    some MAINTAINERS maintainance, and a clk / reset switch to our headers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems

Arnd Bergmann (3):
      Merge tag 'sunxi-fixes-for-5.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'qcom-drivers-fixes-for-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes

Chen-Yu Tsai (1):
      arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference

Maxime Ripard (2):
      MAINTAINERS: Add our new mailing-list
      MAINTAINERS: Match on allwinner keyword

Shawn Guo (1):
      soc: qcom: geni: shield geni_icc_get() for ACPI boot

Tony Lindgren (3):
      ARM: OMAP2+: Fix warning for omap_init_time_of()
      ARM: dts: Fix swapped mmc order for omap3
      ARM: OMAP2+: Fix uninitialized sr_inst

 MAINTAINERS                                             | 2 ++
 arch/arm/boot/dts/omap3.dtsi                            | 3 +++
 arch/arm/mach-omap2/board-generic.c                     | 2 +-
 arch/arm/mach-omap2/sr_device.c                         | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi            | 4 ++--
 drivers/soc/qcom/qcom-geni-se.c                         | 3 +++
 9 files changed, 17 insertions(+), 9 deletions(-)
