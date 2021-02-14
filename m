Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0762BC433DB
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:43:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CED0A64E52; Sun, 14 Feb 2021 22:43:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4A6764E27
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342624;
	bh=YK3rfycgtWeTFmUgEeeN3XJ0hvkNJ5DOH41Kd0XLFo0=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=DuQ9CMuTreaF92aIqNZZgalWceDSpV0F9xBQGiebYNHBiF35LIhoH198rmrqV1O6h
	 Phv3tsMdhv7xXK3nczJI72mwaJdKQYQ6CXTRMFe8jxf4UP69c0gEYV6QCkcC+kYuks
	 z/LND/pzkALfnOYuIq2KOXNqkplR3IGNqG7iNGS1/rXWhBGHvCIewvV6oZP4BGkfx1
	 2zVO5MK9XfzW7H8fkw+F/a6OZO9hMURLQCvC+NtM41Y0DxCBk2XZianZQyWH7Nwf8S
	 vAWdKyNkqJHg78LyQnMCAR5w78fAAxsM/y9vkM7kvtLQ5Rdjc0vPyRfKcS1F6tBIQq
	 xep+pQVW1vDeQ==
Received: by mail-ot1-f47.google.com with SMTP id b16so2107524otq.1
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:43:44 -0800 (PST)
X-Gm-Message-State: AOAM532yMIpjs98W5yIh+nZqwGc+FyGMgavPCCbUfeEMkDR+RoPMu1/3
	efZb67i6t2gosYNkguKA4d6Yh38cNAKzEsFEZdM=
X-Google-Smtp-Source: ABdhPJyAoMZkYA9sX7ithmaSGz5UdwO78xEEfOvKL5kXR+Kg/yKfWXxVb5Bsski9Wf7IfT8hKvcZ+FHtttj3FOb/hic=
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr9504339otq.210.1613342624036;
 Sun, 14 Feb 2021 14:43:44 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:43:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
Message-ID: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
Subject: [GIT PULL 3/6] ARM SoC changes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-v5.12

for you to fetch changes up to c2bd78de41fc3bdeb183bc24bbb2c4c0f3cfdb9a:

  Merge tag 'samsung-soc-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
(2021-02-11 12:48:40 +0100)

----------------------------------------------------------------
ARM: SoC changes for v5.12

This is mostly 32-bit code for SoC platforms, and looks smaller
than any such branch I remember from previous kernels, as most
of this is now handled in other subsystems for modern platforms:

- Minor bugfixes and Kconfig updates for Tegra, Broadcom, i.MX,
  Renesas, and Samsung

- Updates to the MAINTAINERS listing for Actions, OMAP, and Samsung

- Samsung SoC driver updates to make them loadable modules

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (8):
      Merge tag 'samsung-drivers-5.12' of
git://git.kernel.org/.../krzk/linux into arm/soc
      Merge tag 'renesas-drivers-for-v5.12-tag1' of
git://git.kernel.org/.../geert/renesas-devel into arm/soc
      Merge tag 'omap-for-v5.12/soc-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/soc
      Merge tag 'tegra-for-5.12-arm-core' of
git://git.kernel.org/.../tegra/linux into arm/soc
      Merge tag 'arm-soc/for-5.12/soc' of
https://github.com/Broadcom/stblinux into arm/soc
      ARM: s3c: fix fiq for clang IAS
      Merge tag 'imx-soc-5.12' of
git://git.kernel.org/.../shawnguo/linux into arm/soc
      Merge tag 'samsung-soc-5.12' of
git://git.kernel.org/.../krzk/linux into arm/soc

Cristian Ciocaltea (1):
      MAINTAINERS: Add linux-actions ML for Actions Semi Arch

Dmitry Osipenko (1):
      ARM: tegra: Don't enable unused PLLs on resume from suspend

Fabio Estevam (1):
      ARM: imx: Remove unused IMX_GPIO_NR() macro

Florian Fainelli (2):
      ARM: brcmstb: Add debug UART entry for 72116
      Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next

Geert Uytterhoeven (2):
      soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
      soc: renesas: rcar-sysc: Mark device node OF_POPULATED after init

Krzysztof Kozlowski (6):
      soc: samsung: exynos-asv: handle reading revision register error
      soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
      soc: samsung: exynos-chipid: correct helpers __init annotation
      ARM: s3c: irq-s3c24xx: include headers for missing declarations
      ARM: s3c: irq-s3c24xx: staticize local functions
      MAINTAINERS: arm: samsung: include S3C headers in platform entry

Marek Szyprowski (2):
      soc: samsung: exynos-asv: don't defer early on not-supported SoCs
      soc: samsung: pm_domains: Convert to regular platform driver

Maxime Ripard (1):
      ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835

Oleksij Rempel (1):
      ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup

Roger Quadros (1):
      MAINTAINERS: Update address for OMAP GPMC driver

Stefan Riedmueller (1):
      ARM: mach-imx: imx6ul: Print SOC revision on boot

Wang Qing (1):
      ARM: OMAP2+: fix spellint typo

 MAINTAINERS                         |  5 +-
 arch/arm/include/debug/brcmstb.S    | 30 ++++++------
 arch/arm/mach-bcm/Kconfig           |  1 +
 arch/arm/mach-exynos/Kconfig        |  1 -
 arch/arm/mach-imx/hardware.h        |  4 --
 arch/arm/mach-imx/mach-imx6ul.c     | 25 ++--------
 arch/arm/mach-omap2/clockdomain.c   |  4 +-
 arch/arm/mach-s3c/irq-s3c24xx-fiq.S |  9 ++--
 arch/arm/mach-s3c/irq-s3c24xx.c     |  8 +--
 arch/arm/mach-tegra/sleep-tegra20.S | 38 +++++++++++++--
 arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++++++--------
 arch/arm64/Kconfig.platforms        |  1 +
 drivers/soc/renesas/rcar-sysc.c     | 37 +++++++-------
 drivers/soc/samsung/Kconfig         | 12 ++---
 drivers/soc/samsung/Makefile        |  3 +-
 drivers/soc/samsung/exynos-asv.c    | 57 ++++++++--------------
 drivers/soc/samsung/exynos-asv.h    |  2 +
 drivers/soc/samsung/exynos-chipid.c | 71 ++++++++++++++++++---------
 drivers/soc/samsung/pm_domains.c    | 97 ++++++++++++++++++-------------------
 19 files changed, 286 insertions(+), 213 deletions(-)
