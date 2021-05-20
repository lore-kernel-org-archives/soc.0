Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39128C433ED
	for <soc@archiver.kernel.org>; Thu, 20 May 2021 21:05:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15643613AF; Thu, 20 May 2021 21:05:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2C086135B
	for <soc@kernel.org>; Thu, 20 May 2021 21:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621544729;
	bh=UTDKHiT9mxi/k5ajBmutcPFW3PB9zuAxnDBhiqNMNo4=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=AmOCIGxskkivvlze+Hm5gQ0XauimD8o78kCrqW8MGXgwyjUxd+U+sD2+uOmYEt9EB
	 Qm0tQts0EHoPRF+HI/IinLRjNgSpCLLn2t0OjMOBM9qaE6WyPGbxezYV1UxZ8PIkbv
	 8RQAUi5ESK07z1ikmEmh2zFOJQbv04I1ePGd0mZvkdVO+FgbqYo7T29D3Fwn6/XXL6
	 4iPZaUlAIxFhOxm2x+VC3dqmpahUHWd9gSTH/eSbAYnA26J4jEO1uirSPAZXanJkNq
	 8BmdrQT1bExHIUIWcKIxizLzz5K7fFXYTxtxnNAinK42KuHmCAKZYU75xsOeUQs7oH
	 yUrafaoTDLWHA==
Received: by mail-wr1-f45.google.com with SMTP id i17so18973428wrq.11
        for <soc@kernel.org>; Thu, 20 May 2021 14:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM530dj5MMlAIZ91LdIDPmnvEFejLs9/q2V2Nmkvt9Sd3BLquCpflF
	eEXX0pGtIU8E4T9pxYp1Lj26as7ZmU6sGj3QKf4=
X-Google-Smtp-Source: ABdhPJzb00tPeY0iI0+x13tVJzMvgXKuWxutYWrQGoq2U36CUtRRZx/hQPAGNhtAzxXIz5eaXJz2vot40CG9QxMCslU=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr6276565wrz.105.1621544727665;
 Thu, 20 May 2021 14:05:27 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 20 May 2021 23:04:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
Message-ID: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 0c855563182001c829065faa17f8e29e9ceffe13=
:

  Merge tag 'arm-apple-m1-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2021-04-26
12:30:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-5.13-1

for you to fetch changes up to d37316b72e8bf95a52d1c3e93c823d128c09b521:

  ARM: npcm: wpcm450: select interrupt controller driver (2021-05-18
15:27:27 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.13

Only a small number of fixes so far, including some that I had applied
during the merge window, so this is based on the original merge of the
other branches.

 - The largest change is a fix for a reference counting bug in
   the AMD TEE driver.

 - Neil Armstrong now co-maintains Amlogic SoC support

 - Two build warning fixes for renesas device tree files

 - A sign expansion bug for optee

 - A DT binding fix for a mismerge

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (4):
      dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
      Merge tag 'scmi-fixes-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'renesas-arm-dt-for-v5.13-tag3' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/fixes
      Merge tag 'amdtee-fixes-for-v5.13' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes

Dan Carpenter (1):
      firmware: arm_scpi: Prevent the ternary sign expansion bug

Jonathan Neusch=C3=A4fer (1):
      ARM: npcm: wpcm450: select interrupt controller driver

Kevin Hilman (1):
      MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer

Niklas S=C3=B6derlund (2):
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Fix CSI40 ports
      arm64: dts: renesas: Add port@0 node for all CSI-2 nodes to dtsi

Rijo Thomas (1):
      tee: amdtee: unload TA only when its refcount becomes 0

Wan Jiabing (1):
      firmware: arm_scmi: Remove duplicate declaration of struct
scmi_protocol_handle

 .../devicetree/bindings/nvmem/mtk-efuse.txt        |  1 -
 MAINTAINERS                                        |  2 +-
 arch/arm/mach-npcm/Kconfig                         |  1 +
 ...hope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi |  2 -
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  8 ++
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |  2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  4 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          |  4 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          | 12 +++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  4 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  8 ++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  2 -
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  4 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  3 -
 drivers/firmware/arm_scmi/notify.h                 |  2 -
 drivers/firmware/arm_scpi.c                        |  4 +-
 drivers/tee/amdtee/amdtee_private.h                | 13 +++
 drivers/tee/amdtee/call.c                          | 94 ++++++++++++++++++=
+---
 drivers/tee/amdtee/core.c                          | 15 ++--
 24 files changed, 196 insertions(+), 29 deletions(-)
