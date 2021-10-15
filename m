Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B41C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 20:49:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A7AD611F0; Fri, 15 Oct 2021 20:49:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53A6A61056
	for <soc@kernel.org>; Fri, 15 Oct 2021 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634330952;
	bh=hTQqIJAXfkYzMtbecl+TIUILN847dPsJwJ/V2hEwDZA=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=OiLKv85r7WqrtZaDaNYu3w5cUtbpVirhQwR8jtTjHgYeRuP29VLKSmbNIv6SHf4fa
	 C6NWiAzUB6oo58qCOkpfM5JrOukCqe6U9YaqQtvSB+nPyjxQRjxv7JV1NkTQUAFUeY
	 KHf4kJvZz5BIqLyhkOHOu7vnD1jSkDMLm21w++59Yp7I65aG5SaZVdDqHHQ6xVUfBP
	 7vPcpLmtq2ZaQYnLCR63Liqz0ftiVDjltgsrKxFMlGEGrS2SRQAgDGHP2RML8dE1sK
	 JU/9/Bz19hVimEgBypWTGAyWU7t0E53r9qt56Twx46j4CSdr9Gow1NnTntHKswwDkv
	 LeBUddbVxJR7Q==
Received: by mail-wm1-f52.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso3229550wmb.3
        for <soc@kernel.org>; Fri, 15 Oct 2021 13:49:12 -0700 (PDT)
X-Gm-Message-State: AOAM532vSLyuWjFX2XO2Rlw7bDyKC4mHBxNU1zyJ12ZqI7iNr6ZkCBUc
	kYq6FZACDmF9OfdtUGGKg8fGERC2H7rbyicQ4tU=
X-Google-Smtp-Source: ABdhPJxwMhWUZIRW4VvePREhjnc5kLwPlo/zVPm9nUOHq2x9uI/YUHY52L+T1mUj74sv0sqjhTyRRzF1MB+hyAFP59s=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr14975652wmg.35.1634330950701;
 Fri, 15 Oct 2021 13:49:10 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Oct 2021 22:48:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
Message-ID: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.15, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-5.15-2

for you to fetch changes up to 011ace4a7fadcbe8670b615e0db1e8d7b813ee6c:

  Merge tag 'imx-fixes-5.15-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes (2021-10-15 20:48:08 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.15, part 2

A small number fixes this time, mostly touching actual code:

 - Add platform device for i.MX System Reset Controller (SRC) to fix
   a regression caused by fw_devlink change.

 - A fixup for a boot regression caused by my own rework for the
   Qualcomm SCM driver.

 - Multiple bugfixes for the Arm FFA and optee firmware drivers,
   addressing problems when they are built as a loadable module.

 - Four dts bugfixes for the Broadcom SoC used in Raspberry pi, addressing
   VEC (video encoder), MDIO bus controller #address-cells/#size-cells,
   SDIO voltage and PCIe host bridge dtc warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (5):
      Merge tag 'ffa-fixes-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'arm-soc/for-5.15/devicetree' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'optee-fix2-for-v5.15' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      iommu/arm: fix ARM_SMMU_QCOM compilation
      Merge tag 'imx-fixes-5.15-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes

Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes

Mateusz Kwiatkowski (1):
      ARM: dts: bcm283x: Fix VEC address for BCM2711

Nicolas Saenz Julienne (2):
      ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
      ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address

Philipp Zabel (1):
      ARM: imx: register reset controller from a platform driver

Stefan Wahren (2):
      ARM: dts: bcm2711: fix MDIO #address- and #size-cells
      ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states

Sudeep Holla (2):
      firmware: arm_ffa: Add missing remove callback to ffa_bus_type
      firmware: arm_ffa: Fix __ffa_devices_unregister

Sumit Garg (1):
      tee: optee: Fix missing devices unregister during optee_remove

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 11 +++++-----
 arch/arm/boot/dts/bcm2711.dtsi        | 12 +++++++++--
 arch/arm/boot/dts/bcm2835-common.dtsi |  8 +++++++
 arch/arm/boot/dts/bcm283x.dtsi        |  8 -------
 arch/arm/mach-imx/src.c               | 40 +++++++++++++++++++++++++++--------
 drivers/firmware/arm_ffa/bus.c        | 10 ++++++++-
 drivers/iommu/Kconfig                 |  8 +++++++
 drivers/tee/optee/core.c              |  3 +++
 drivers/tee/optee/device.c            | 22 +++++++++++++++++++
 drivers/tee/optee/optee_private.h     |  1 +
 10 files changed, 98 insertions(+), 25 deletions(-)
