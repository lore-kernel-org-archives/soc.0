Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDA1C433DB
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:44:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8576564E52; Sun, 14 Feb 2021 22:44:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B71964E27
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342673;
	bh=Ni46dVPQ7gmxTo49gEBjDmdwPqNKQzEgV41e6qBUgJE=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=rFmw66SOCrGjYwRYH7d2uTkp7yk4Zs/HC78qwFr52D8e6HICS0KGiFXv73gpx8msi
	 Zm3FLR4qMva4W+6dkGLSXdqodIuhpOywi3WFafwWi54Lq79+5vEtWM2X2gC8qMD40p
	 mfwlZFZ5OZzfwPnxaDDQfB6GoG1Uqe2Zt3PGryfaJGN4vGu116Ldsg+psj3z7fMysC
	 HTpSzIDwaDTFHZXcCPpLeIsR0EQItgUTv/66N5O4zWx09ftUnVnS+0Q7HD3twv1DNi
	 H+O1DfwXUz5UOyLixyB3MBlqPsmMkc1RNPdWo9fZFcrP1ekczRGWApNxuYxJxvdpec
	 ve+Q6/jECnwxA==
Received: by mail-oi1-f174.google.com with SMTP id g84so6062785oib.0
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:44:33 -0800 (PST)
X-Gm-Message-State: AOAM530NfXyTGx4b/VwXlH4dAJd49AHg5Ec+lr8XRe+FzfTo+DZMDuOA
	WAqK0ozh0K0IDMAxpxQSaGB20t8G/k8fhB0SYLg=
X-Google-Smtp-Source: ABdhPJyORQMZp2HtToThmOc2hWMs9Aa359nm3m1JiJAG/4cz0CbHd/epBLYes8nqxssF8Crf68UZB8sNAbvRILc76Ls=
X-Received: by 2002:aca:d908:: with SMTP id q8mr6407683oig.67.1613342672757;
 Sun, 14 Feb 2021 14:44:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:44:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
Message-ID: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
Subject: [GIT PULL 4/6] ARM SoC defconfigs for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837=
:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-defconfig-v5.12

for you to fetch changes up to 21e4675d9305f6ccd20b95d943882d607c8ae288:

  Merge tag 'zynqmp-soc-for-v5.12' of
https://github.com/Xilinx/linux-xlnx into arm/defconfig (2021-02-10
00:08:06 +0100)

----------------------------------------------------------------
ARM: SoC defconfigs for v5.12

As usual, a number of additional device drivers that were added
to the kernel are now enabled in the respective configuration
files. A few of the files get updated to match the current
Kconfig files for removed or renamed options.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable WM8962

Adrien Grassein (1):
      arm64: defconfig: Enable PF8x00 as builtin

Alexandre Belloni (2):
      ARM: configs: at91: remove ATMEL_TCLIB
      ARM: configs: multi_{v5,v7}: remove ATMEL_TCLIB

Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: enable power driver of RN5T618 PMIC family

Argus Lin (1):
      arm64: configs: Support pwrap on Mediatek MT6779 platform

Arnd Bergmann (14):
      Merge tag 'at91-defconfig-5.12' of
git://git.kernel.org/.../at91/linux into arm/defconfig
      Merge tag 'tegra-for-5.12-arm-defconfig' of
git://git.kernel.org/.../tegra/linux into arm/defconfig
      Merge tag 'tegra-for-5.12-arm64-defconfig' of
git://git.kernel.org/.../tegra/linux into arm/defconfig
      Merge tag 'arm-soc/for-5.12/defconfig' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'arm-soc/for-5.12/defconfig-arm64' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'v5.11-next-defconfig' of
git://git.kernel.org/.../matthias.bgg/linux into arm/defconfig
      Merge tag 'amlogic-soc' of
git://git.kernel.org/.../khilman/linux-amlogic into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.12' of
git://git.kernel.org/.../qcom/linux into arm/defconfig
      Merge tag 'qcom-defconfig-for-5.12' of
git://git.kernel.org/.../qcom/linux into arm/defconfig
      Merge tag 'imx-defconfig-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/defconfig
      Merge tag 'at91-defconfig-5.11-2' of
git://git.kernel.org/.../at91/linux into arm/defconfig
      Merge tag 'v5.12-rockchip-defconfig64-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/defconfig
      Merge tag 'omap-for-v5.12/defconfig-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/defconfig
      Merge tag 'zynqmp-soc-for-v5.12' of
https://github.com/Xilinx/linux-xlnx into arm/defconfig

Bjorn Andersson (2):
      arm64: defconfig: Enable HID multitouch
      arm64: defconfig: Enable TMPFS Posix ACL

Claudiu Beznea (1):
      ARM: configs: at91: enable drivers for sam9x60

Dmitry Baryshkov (3):
      arm64: defconfig: enable display clock controller on sm8250
      arm64: defconfig: enable Lontium LT9611UXC bridge driver
      arm64: defconfig: Enable Qualcomm SM8250 audio config

Florian Fainelli (2):
      Merge tag 'tags/bcm2835-defconfig-next-2021-01-25' into defconfig/nex=
t
      Merge tag 'tags/bcm2835-defconfig-arm64-next-2021-01-25' into
defconfig-arm64/next

Guido G=C3=BCnther (2):
      arm64: defconfig: Enable Librem 5 devkit components
      arm64: defconfig: Enable vibra-pwm

Jagan Teki (1):
      arm64: defconfig: Enable REGULATOR_MP8859

Jon Hunter (2):
      ARM: config: Enable Tegra SoC Thermal driver
      arm64: defconfig: Enable Tegra SoC Thermal driver

Manivannan Sadhasivam (14):
      ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers
      ARM: qcom_defconfig: Enable RPMh drivers
      ARM: qcom_defconfig: Enable SDX55 pinctrl driver
      ARM: qcom_defconfig: Enable SDX55 GCC driver
      ARM: qcom_defconfig: Enable SMEM partition parser
      ARM: qcom_defconfig: Enable MTD UBI driver
      ARM: qcom_defconfig: Enable UBI file system
      ARM: qcom_defconfig: Enable DWC3 controller and PHYs
      ARM: qcom_defconfig: Enable ARM SMMU
      ARM: qcom_defconfig: Enable RPMh regulator
      ARM: qcom_defconfig: Enable watchdog driver
      ARM: qcom_defconfig: Enable ARM PSCI support
      ARM: qcom_defconfig: Enable RPMh power domain driver
      ARM: qcom_defconfig: Enable Command DB driver

Martin Blumenstingl (1):
      ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor

Martin Kepplinger (1):
      arm64: defconfig: Enable interconnect for imx8mq

Michael Walle (1):
      arm64: defconfig: Enable Broadcom BCM54140 PHY

Neal Liu (1):
      arm64: configs: Support DEVAPC on MediaTek platforms

Nicolas Ferre (5):
      ARM: configs: sama5_defconfig: update and remove unneeded options
      ARM: configs: at91: DT/ATAG defconfig modifications
      ARM: configs: at91_dt_defconfig: add useful helper options
      ARM: configs: at91_dt_defconfig: add ov7740 module
      ARM: configs: sama5_defconfig: add QSPI driver

Nicolas Saenz Julienne (2):
      arm64: defconfig: Enable nvmem's rmem driver
      ARM: multi_v7_defconfig: Enable nvmem's rmem driver

Quanyang Wang (1):
      arm64: defconfig: enable clock driver for ZynqMP platforms

Sameer Pujar (2):
      arm64: defconfig: Enable Tegra audio graph card driver
      arm64: defconfig: Enable RT5659

Teresa Remmet (2):
      arm64: defconfig: Enable rv3028 i2c rtc driver
      arm64: defconfig: Enable PCA9532 support

Tony Lindgren (2):
      ARM: omap2plus_defconfig: Update for moved options
      ARM: omap2plus_defconfig: Update for dropped options

Yannick Fertre (1):
      ARM: multi_v7_defconfig: add STM32 CEC support

 arch/arm/configs/at91_dt_defconfig   | 18 ++++++++++++------
 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm/configs/multi_v5_defconfig  |  1 -
 arch/arm/configs/multi_v7_defconfig  | 15 ++++++++++++++-
 arch/arm/configs/omap2plus_defconfig | 22 +++++-----------------
 arch/arm/configs/qcom_defconfig      | 18 ++++++++++++++++++
 arch/arm/configs/sama5_defconfig     | 15 ++-------------
 arch/arm/configs/tegra_defconfig     |  1 +
 arch/arm64/configs/defconfig         | 35 ++++++++++++++++++++++++++++++++=
+++
 9 files changed, 88 insertions(+), 38 deletions(-)
