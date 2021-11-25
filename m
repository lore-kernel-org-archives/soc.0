Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387E9C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 15:48:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED80861100; Thu, 25 Nov 2021 15:48:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5069610C8
	for <soc@kernel.org>; Thu, 25 Nov 2021 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637855297;
	bh=zAOxymeEe/BQvRIZ319iLnOfjCYCOmWUewE5TMkDntU=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=JIEkd/0ppMTQGhPKImL+DljkQcVpV8G1gpx4pt7+EdxgbxmgKL9e8+3j/gVSA/enf
	 yr3DxyADJ93wur9409F0WR1JsREwqk/yBtc50xeQXVU4zZzdglTOp/p7duDWLnxohs
	 gcbVyCoY57fmuLF670L9XAW+iKabRsn11Q1BEroAiNrMkSbvLTeF38hn9mYOuO4onz
	 HqFbQR+Mp9Vb2nZLclQgQsVlLGK+pGZt8i8kTDvDTrsNSw2L0VS1YOqlIAFB5rnrIx
	 zF0KyFiC1mkATefloDICW2gK/goNPNvk8pnbfKu3GS7gapR7rsH+sz1Q+gghMO3ojt
	 zqJAqK9Tb26CA==
Received: by mail-wr1-f51.google.com with SMTP id j3so12608029wrp.1
        for <soc@kernel.org>; Thu, 25 Nov 2021 07:48:17 -0800 (PST)
X-Gm-Message-State: AOAM530nPHdWRlRNmcVPXt9jdiNjMPYGorwEuy8ludHigUOgtBoah7p3
	m/r9E29D+DHqnpyD1K6KlRybjTyqr1YU9gfLLRQ=
X-Google-Smtp-Source: ABdhPJzRx2+nR3Uk+4w57+y/gTGMCMl1pd0d8q50waKUKS6WfO2EjXyPmj2LYSujtmCgSs6tK+fRbp8REQJksBOUx2g=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr7554582wrp.209.1637855296298;
 Thu, 25 Nov 2021 07:48:16 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Nov 2021 16:48:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1D1tX-hNX-drT4j8a1BBtjiLKhaqMrgueMdQ83CFXtpA@mail.gmail.com>
Message-ID: <CAK8P3a1D1tX-hNX-drT4j8a1BBtjiLKhaqMrgueMdQ83CFXtpA@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.16, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.16-2

for you to fetch changes up to 383a44aec91c327ef4a9d03cfa65d1eaf3746c06:

  memory: mtk-smi: Fix a null dereference for the ostd (2021-11-25
14:46:00 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.16, part 2

There are only a few devicetree fixes this time:

 - one outdated devicetree property that slipped into the
   newly added ExynosAutov9 support

 - three changes to Broadcom SoCs that had incorrect
   number values for interrupts or irqchips.

In the MAINTAINERS file, Nishanth Menon gets listed for TI K3 SoCs,
while Taichi Sugaya and Takao Orito take ownership of the Socionext
Milbeaut platform.

All other changes are for SoC specific drivers, fixing:

 - A missing NULL pointer check in the mediatek memory driver

 - An integer overflow issue in the Arm smccc firwmare interface

 - A false-positive fortify-source check

 - Error handling fixes for optee and smci

 - Incorrect message format in one SCMI call

----------------------------------------------------------------
Arnd Bergmann (4):
      Merge tag 'arm-soc/for-5.16/devicetree-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'optee-fix-for-v5.16' of
git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'scmi-fixes-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into
arm/fixes
      Merge tag 'socfpga_fix_for_v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/fixes

Chanho Park (1):
      arm64: dts: exynos: drop samsung,ufs-shareability-reg-offset in
ExynosAutov9

Cristian Marussi (3):
      firmware: arm_scmi: Fix null de-reference on error path
      firmware: arm_scmi: Fix type error in sensor protocol
      firmware: arm_scmi: Fix type error assignment in voltage protocol

Florian Fainelli (3):
      ARM: dts: BCM5301X: Fix I2C controller interrupt
      ARM: dts: BCM5301X: Add interrupt properties to GPIO node
      ARM: dts: bcm2711: Fix PCIe interrupts

Lv Ruyi (1):
      optee: fix kfree NULL pointer

Michael Kelley (1):
      firmware: smccc: Fix check for ARCH_SOC_ID not implemented

Nishanth Menon (1):
      MAINTAINERS: Update maintainer entry for keystone platforms

Peng Fan (1):
      firmware: arm_scmi: pm: Propagate return value to caller

Sugaya Taichi (1):
      MAINTAINERS: Add entry to MAINTAINERS for Milbeaut

Takashi Iwai (1):
      ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE

Vincent Guittot (1):
      firmware: arm_scmi: Fix base agent discover response

Yong Wu (1):
      memory: mtk-smi: Fix a null dereference for the ostd

 MAINTAINERS                                  | 15 +++++++++++++--
 arch/arm/boot/dts/bcm2711.dtsi               |  8 +++++++-
 arch/arm/boot/dts/bcm5301x.dtsi              |  4 +++-
 arch/arm/mach-socfpga/core.h                 |  2 +-
 arch/arm/mach-socfpga/platsmp.c              |  8 ++++----
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi |  3 +--
 drivers/firmware/arm_scmi/base.c             | 15 ++++++++++++---
 drivers/firmware/arm_scmi/scmi_pm_domain.c   |  4 +---
 drivers/firmware/arm_scmi/sensors.c          |  2 +-
 drivers/firmware/arm_scmi/virtio.c           | 10 +++++-----
 drivers/firmware/arm_scmi/voltage.c          |  2 +-
 drivers/firmware/smccc/soc_id.c              |  2 +-
 drivers/memory/mtk-smi.c                     |  2 +-
 drivers/tee/optee/ffa_abi.c                  |  7 +++----
 14 files changed, 54 insertions(+), 30 deletions(-)
