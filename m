Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACEBC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:16:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B6E23B77
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B6E23B77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zalX25NwbaBBs9cJ1ukeMYXTeELIY8hkv0TIKsN57To=; b=CNSTzwnSqmo3h0SRGaOYa4LW7d
	xkzFiwzf1yxQSHFN8gDyTUqJEVqkoQbdkXCNFBt9ZtSOi93xS8W5xeowDSfNwDbzsTyPfP5TJp23s
	paTCo/yxE+wBSdgxryuSzktVrJbAVunHi8uTkzGrV9qB1hWV0MH3tT/7XAs2i0i57WmvZlMvzVaq4
	8D4OYe75EHswSjFdjThiNlVjwKUGemJj5vZrxsddZfwcs3NMaSnw7rVEIrqu5MSj3nctBOzl70Rff
	LpdaALbgVlQFnSJZNtwh837QFR2T06CvEA0Qzhi2lCmYVN/cI53deMTf1b82Hqgf+e7v47Q0f7DTt
	qEq7jM7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn6nY-0003n3-2W; Wed, 09 Dec 2020 21:14:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn6nV-0003mj-SM
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 21:14:54 +0000
X-Gm-Message-State: AOAM531Vni3O+dOPMjOqMOGXe/J52fKMRizGC2JZ/UAZFVeIA/mo0huI
 NRaB47LF+o+T+EwPERIYI1DUh7jgS65Qj/x+i6g=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_161454_076292_4794B3A5 
X-CRM114-Status: GOOD (  15.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209211436.hOuyGv8StsbRmhdywwaaQEyvxN_duaFkZaqc2pgBd1c@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
