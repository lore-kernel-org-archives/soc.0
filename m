Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56728C4167B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 21:14:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10AD723C91; Wed,  9 Dec 2020 21:14:53 +0000 (UTC)
X-Gm-Message-State: AOAM532P1BvbuPoSHJqYnAT+c4YOtkchGCb4tGCIDKfJjjSEqA6XG4Jj
	eve14CHs7KRuU8dZfrknB7a8O8cr9uj7eGnm/sw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607548493;
	bh=nK49LQSyPmLc4NNqKy4a2bxFojevJ0HeB1P9xY5nsH8=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=fmJ/CnujlBiM/yiMIyR8DS7CmaLaX4yLYONGV5lsNarTAtfyM9vZ9XCLLm3zpzapW
	 O6sBPB+D7c7r5npBUGIQrezDG/lLnizmu6EknOsa+HuzdYLb2CE8Y9yGEynH7YMxxZ
	 VHluY+Q+6vkusGLyoE01WAVxHxQ+4zXjvLp7vPpcj0fVAW71e2MMT0qK0bGK8ycLzZ
	 w0wZCMx9YhoaV9loOL/Q2+f/sEz+s3FSZJDCwoaEKoABwUKXRyY4cFXGScYrb7gjGx
	 /LfDE0lDq7gZG/E1lqewzucOtWm7rLZEIJBgK7EDRRXqLtpl4aHCZ4hFcCxnk41a9i
	 Kj2fPV/kzsaZA==
X-Google-Smtp-Source: ABdhPJwFZvDeNeklcG1rc3mj6GPDrQ0V5wvuKc5Uv4i4DAGt0oWdPas3ShsATYc0GmagY9Gwce7iAUDHgBraU7079TA=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr3472609otm.305.1607548492131;
 Wed, 09 Dec 2020 13:14:52 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 22:14:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
Message-ID: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.10, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.10-4

for you to fetch changes up to a0cab089baf3048020de7bee53bccd598747126a:

  ARM: dts: mmp2-olpc-xo-1-75: clear the warnings when make dtbs
(2020-12-09 20:43:13 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.10, part 4

There are a few more PHY mode changes for allwinner SoC based boards with
a Realtek PHY after the driver changed its behavior, I assume there will
be more of these in the future.  Also on for Allwinner, the Banana Pi
M2 board had a regression that led to some devices not working because
of a slightly incorrect voltage being applied.

By popular demand, I picked up a change from Krzysztof Kozlowski to
actually list the SoC tree in the MAINTAINERS file. We don't want to
get Cc'd on normal patches that are picked up by platform maintainers,
but the lack of an entry has led to confusion in the past.

All the other changes are fairly benign, fixing boot-time or compile-time
warning messages in various places:

 - A dtc warning on the OLPC XO-1.75

 - A boot-time warning on i.MX6 wandboard

 - A harmless compile-time warning

 - A regression causing one of the i.MX6 SoCs to be
   identified as another

 - Missing SoC identification of Allwinner V3 and S3

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Sampson (1):
      ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY

Arnd Bergmann (4):
      Merge tag 'sunxi-fixes-for-5.10-2' of
git://git.kernel.org/.../sunxi/linux into arm/fixes
      Merge tag 'imx-fixes-5.10-5' of
git://git.kernel.org/.../shawnguo/linux into arm/fixes
      ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
      Merge tag 'sunxi-fixes-for-5.10-3' of
git://git.kernel.org/.../sunxi/linux into arm/fixes

Bernd Bauer (1):
      ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin

Fabio Estevam (1):
      ARM: dts: imx6qdl-wandboard-revd1: Remove PAD_GPIO_6 from enetgrp

Heinrich Schuchardt (2):
      arm64: dts: allwinner: A64 Sopine: phy-mode rgmii-id
      arm64: dts: allwinner: H5: NanoPi Neo Plus2: phy-mode rgmii-id

Icenowy Zheng (1):
      ARM: dts: sun8i: v3s: fix GIC node memory range

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: orangepi-one-plus: Fix ethernet

Krzysztof Kozlowski (2):
      MAINTAINERS: correct SoC Git address (formerly: arm-soc)
      MAINTAINERS: add a limited ARM and ARM64 SoC entry

Matteo Scordino (1):
      ARM: dts: s3: pinecube: align compatible property to other S3 boards

Pablo Greco (3):
      ARM: dts: sun7i: bananapi: Enable RGMII RX/TX delay on Ethernet PHY
      ARM: dts: sun8i: r40: bananapi-m2-berry: Fix dcdc1 regulator
      ARM: dts: sun8i: v40: bananapi-m2-berry: Fix ethernet node

Paul Kocialkowski (1):
      ARM: sunxi: Add machine match for the Allwinner V3 SoC

Robert Karszniewicz (1):
      ARM: imx: Use correct SRC base address

Zhen Lei (1):
      ARM: dts: mmp2-olpc-xo-1-75: clear the warnings when make dtbs

Zou Wei (1):
      firmware: xilinx: Mark pm_api_features_map with static keyword

 MAINTAINERS                                                  | 12 +++++++++++-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi                |  2 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revd1.dtsi               |  1 -
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts                      |  3 +--
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                     |  2 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts                |  4 ++--
 arch/arm/boot/dts/sun8i-s3-pinecube.dts                      |  2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                             |  2 +-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts            | 12 ++++++------
 arch/arm/mach-imx/anatop.c                                   |  2 +-
 arch/arm/mach-keystone/memory.h                              |  3 ---
 arch/arm/mach-sunxi/sunxi.c                                  |  1 +
 .../arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts |  2 +-
 .../arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts |  2 +-
 drivers/firmware/xilinx/zynqmp.c                             |  2 +-
 16 files changed, 30 insertions(+), 24 deletions(-)
