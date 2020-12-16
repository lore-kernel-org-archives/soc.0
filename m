Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFE2C4361B
	for <soc@archiver.kernel.org>; Wed, 16 Dec 2020 23:23:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FC3D238E5; Wed, 16 Dec 2020 23:23:40 +0000 (UTC)
X-Gm-Message-State: AOAM530/rF4ock+v/mdfbWkLH87TzDsQYCD6m4oT4AEc5ZoBzS+3lC9I
	FEnQSmICCUS97+bdvruSNiezPW7vloQSnZHNlew=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608161020;
	bh=ghhC8IltaF7MusxmPQXrDWcS5VXbbg2fQw3GaW9GsDs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KZQlPZBax1YvaQh1QPL8gnej/3+OjBFtsAh6yeZdLFP5cIq9LN6dJs9szXm7dwKCO
	 aAQWvuJBtOPXjsMW9FinbCOgbYMyKnvIa6/D4DO/ikQT4BadSlXcyFoEf991KuRVjc
	 pjdGAnBVm2rAoMsHf9fVmBxab5+zoyHP4GTx8VasN3pRvddT2EQoRXFix/YV14/yzd
	 3GDNCOXyBzqGiQ6ChwOGJQP8mMEBo0royH5cM3BCd5r4iPcafuX+YMucVEvHerPFfL
	 XsDHXwwbguAZxMH9nLRKCeHSkuppTaEoqyV0AVuXNOYfb1VzTYOvUmUvCTMzVIK4Dr
	 zac/uFeRoaD1Q==
X-Google-Smtp-Source: ABdhPJxVupd+sJRvhuknfWzZVmgESJ5+2TvfN9uNCfdz2Mn2hCHNqOHBISUB7CL5Kv9XLW3TzIVpWVJITWQhWnwtE6Y=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr1763389oii.67.1608161019639;
 Wed, 16 Dec 2020 15:23:39 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Dec 2020 00:23:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zh6RKR6rRm93hCb1VVpb86LxWeL9U4-3eGJm9+TPJVw@mail.gmail.com>
Message-ID: <CAK8P3a0zh6RKR6rRm93hCb1VVpb86LxWeL9U4-3eGJm9+TPJVw@mail.gmail.com>
Subject: [GIT PULL 2/5] ARM: SoC defconfigs for 5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091=
:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-defconfig-5.11

for you to fetch changes up to acf689134a66cc9c85e571d33b6bd5d72e4078cf:

  powerpc/configs: drop unused BACKLIGHT_GENERIC option (2020-12-08
22:03:37 +0100)

----------------------------------------------------------------
ARM: SoC defconfigs for 5.11

These are the usual defconfig updates, adding support for additional
modules and updating some files according to changes in Kconfig.

I also include the removal of CONFIG_BACKLIGHT_GENERIC across multiple
architectures, after the driver was removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (3):
      arm64: defconfig: Enable additional sound drivers on i.MX8M Mini
      arm64: defconfig: Enable ASRC and EASRC
      ARM: omap2plus_defconfig: Enable OMAP3_THERMAL

Amelie Delaunay (1):
      ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller supp=
ort

Andrey Zhizhikin (4):
      ARM: configs: drop unused BACKLIGHT_GENERIC option
      arm64: defconfig: drop unused BACKLIGHT_GENERIC option
      parisc: configs: drop unused BACKLIGHT_GENERIC option
      powerpc/configs: drop unused BACKLIGHT_GENERIC option

Arnd Bergmann (14):
      Merge tag 'renesas-arm-defconfig-for-v5.11-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/defconfig
      Merge tag 'omap-for-v5.11/defconfig-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/defconfig
      Merge tag 'stm32-config-for-v5.11-1' of
git://git.kernel.org/.../atorgue/stm32 into arm/defconfig
      Merge tag 'tegra-for-5.11-arm64-defconfig' of
git://git.kernel.org/.../tegra/linux into arm/defconfig
      Merge tag 'at91-defconfig-5.11' of
git://git.kernel.org/.../at91/linux into arm/defconfig
      Merge tag 'sunxi-config-for-5.11' of
git://git.kernel.org/.../sunxi/linux into arm/defconfig
      Merge tag 'sunxi-config64-for-5.11' of
git://git.kernel.org/.../sunxi/linux into arm/defconfig
      Merge tag 'arm-soc/for-5.11/defconfig' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'arm-soc/for-5.11/defconfig-arm64' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'ti-k3-config-for-v5.11' of
git://git.kernel.org/.../nmenon/linux into arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.11' of
git://git.kernel.org/.../qcom/linux into arm/defconfig
      Merge tag 'samsung-defconfig-5.11' of
git://git.kernel.org/.../krzk/linux into arm/defconfig
      Merge tag 'imx-defconfig-5.11' of
git://git.kernel.org/.../shawnguo/linux into arm/defconfig
      Merge tag 'v5.11-rockchip-defconfig64-1' of
git://git.kernel.org/.../mmind/linux-rockchip into arm/defconfig

Bjorn Andersson (4):
      arm64: defconfig: Enable Qualcomm Command DB driver
      arm64: defconfig: Enable Qualcomm OSM L3 driver
      arm64: defconfig: Enable QCOM_SCM as builtin
      arm64: defconfig: Enable Qualcomm PON driver

Carl Philipp Klemm (1):
      ARM: omap2plus_defconfig: add CONFIG_AK8975=3Dm and CONFIG_KXCJK1013=
=3Dm

Cl=C3=A9ment P=C3=A9ron (1):
      arm64: defconfig: Enable Allwinner i2s driver

Corentin Labbe (1):
      ARM: configs: sunxi: enable Realtek PHY

David Lechner (1):
      ARM: omap2plus_defconfig: Enable TI eQEP counter driver

Eugen Hristev (2):
      ARM: configs: at91: sama5: resync with media changes
      ARM: configs: at91_dt: resync with media changes

Fabrice Gasnier (1):
      ARM: multi_v7_defconfig: enable counter subsystem and stm32
counter drivers

Faiz Abbas (1):
      arm64: defconfig: Enable GPIO and I2C configs for TI's J721e platform

Florian Fainelli (2):
      ARM: multi_v7_defconfig: Enable ARM SCMI protocol and drivers
      arm64: defconfig: Enable ARM SCMI protocol and drivers

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Refresh for v5.10-rc1
      arm64: defconfig: Enable R8A779A0 SoC

Grygorii Strashko (1):
      ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot

Guido G=C3=BCnther (1):
      arm64: defconfig: Enable more Librem 5 hardware

Jagan Teki (4):
      arm64: defconfig: Enable ROCKCHIP_LVDS
      arm64: defconfig: Enable PHY_ROCKCHIP_INNO_DSIDPHY
      arm64: defconfig: Enable USB_SERIAL_CP210X
      arm64: defconfig: Enable RTC_DRV_HYM8563

Linus Walleij (1):
      ARM: config: ux500: Update U8500 defconfig

Lionel Debieve (1):
      ARM: multi_v7_defconfig: add STM32 crypto support

Marek Szyprowski (3):
      ARM: exynos_defconfig: enable sound driver for Midas platform
      ARM: multi_v7_defconfig: enable sound driver for Midas platform
      ARM: multi_v7_defconfig: make Samsung Exynos EHCI driver a module

Martin J=C3=BCcker (2):
      ARM: defconfig: add STMPE ADC driver for P4 Note
      ARM: exynos_defconfig: compile Atmel MXT touchscreeen as module

Olivier Moysan (2):
      ARM: multi_v7_defconfig: enable STM32 spdifrx support
      ARM: multi_v7_defconfig: enable STM32 dfsdm audio support

Thierry Reding (1):
      arm64: defconfig: Enable Tegra234 support

=C5=81ukasz Stelmach (1):
      ARM: defconfig: Enable ax88796c driver for Exynos boards

 arch/arm/configs/at91_dt_defconfig          |  6 ++++-
 arch/arm/configs/cm_x300_defconfig          |  1 -
 arch/arm/configs/colibri_pxa300_defconfig   |  1 -
 arch/arm/configs/exynos_defconfig           |  8 ++++++-
 arch/arm/configs/jornada720_defconfig       |  1 -
 arch/arm/configs/magician_defconfig         |  1 -
 arch/arm/configs/mini2440_defconfig         |  1 -
 arch/arm/configs/multi_v7_defconfig         | 26 ++++++++++++++++++++-
 arch/arm/configs/omap2plus_defconfig        |  6 ++++-
 arch/arm/configs/pxa3xx_defconfig           |  1 -
 arch/arm/configs/qcom_defconfig             |  1 -
 arch/arm/configs/sama5_defconfig            | 10 +++++++-
 arch/arm/configs/shmobile_defconfig         | 22 +++++++++---------
 arch/arm/configs/sunxi_defconfig            |  2 +-
 arch/arm/configs/tegra_defconfig            |  1 -
 arch/arm/configs/u8500_defconfig            | 10 ++++----
 arch/arm64/configs/defconfig                | 36 +++++++++++++++++++++++++=
+++-
 arch/parisc/configs/generic-64bit_defconfig |  1 -
 arch/powerpc/configs/powernv_defconfig      |  1 -
 19 files changed, 104 insertions(+), 32 deletions(-)
