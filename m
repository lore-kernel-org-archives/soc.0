Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE881C433F5
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7E00C36AED; Thu, 23 Dec 2021 21:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10BAC36AEA
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295181;
	bh=jpb0t9SSc/RkHAZckdH//gJm6hdAnx+cV3nC/TFBg0E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VY4rW3hvI6tZt7zIbZ+7Mx/gYAdZFqpUm+o537isGu75dtmcfKYCr79nzSEbewd6p
	 wtr84QNQ8kfqQ6j9KVmqTJZrdz3/frZCohVpccFkEytNWJKHzj6kIXr5aCaQsVrw58
	 3isxFZDBYBWLvxa7AGNoKoJoy0mZQOZXc0uiVjnZh6KDHxrX48JxWn5H8X5qvqrRh8
	 yWqA1BtlCZOt6NaQZgpBvLfYBN/isB4EDvOXSqfHYeFp8ns42zulyB0DDEBii1kCjo
	 ARWk5WOMb6APzMdJOrQNDqXKpAx+LkO1o6xRQt9kG+mbmHsGjYEDagOc5FDAQxOQxP
	 GpidRkZj4bfxQ==
Received: by mail-wm1-f48.google.com with SMTP id c66so4476196wma.5
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:33:01 -0800 (PST)
X-Gm-Message-State: AOAM5300BH9RBTgDRwKsg3mzK3LSonykiwMg4QMLuNwpSBKkczR7MaNA
	y2/YmkdfinLLCONSkXH75A4fAhw+frWZ5WMSN9w=
X-Google-Smtp-Source: ABdhPJydN7cpCT4Vi2RiQfDJmAFTZ7RVz7/4PvK2dFk4I8aXwTwvZEf0gf/a3P5Rb6a64NP3C/bHmDVDZ0umj26cCjg=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr2900544wma.98.1640295179969;
 Thu, 23 Dec 2021 13:32:59 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:32:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2u88x0USAVHe6YeNCbLV6pvOPytHs4Bo4ma1avsq+ojA@mail.gmail.com>
Message-ID: <CAK8P3a2u88x0USAVHe6YeNCbLV6pvOPytHs4Bo4ma1avsq+ojA@mail.gmail.com>
Subject: [GIT PULL 1/5] ARM: SoC updates for v5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6=
:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.17

for you to fetch changes up to fe47ec5fa8ec223691f280bb8395fdc79548ecd4:

  Merge tag 'arm-soc/for-5.17/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc (2021-12-22 17:18:43
+0100)

----------------------------------------------------------------
ARM: SoC updates for v5.17

These are all minor bug fixes and cleanups to code in arch/arm and
arch/arm64 that is specific to one SoC, updating Kconfig symbols,
the MAINTAINERS file, and removing some dead code.

----------------------------------------------------------------
Arnd Bergmann (6):
      ARM: s3c: add one more "fallthrough" statement in Jive
      Merge tag 'renesas-arm-soc-for-v5.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/soc
      Merge tag 'ixp4xx-arm-soc-v5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik
into arm/soc
      Merge tag 'imx-soc-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/soc
      Merge tag 'samsung-soc-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/soc
      Merge tag 'arm-soc/for-5.17/maintainers' of
https://github.com/Broadcom/stblinux into arm/soc

Jonathan Corbet (1):
      ARM: ixp4xx: remove unused header file pata_ixp4xx_cf.h

Krzysztof Kozlowski (1):
      ARM: s3c: include header for prototype of s3c2410_modify_misccr

Lukas Bulwahn (3):
      ARM: imx: remove dead left-over from i.MX{27,31,35} removal
      ARM: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART
      ARM: ixp4xx: remove dead configs CPU_IXP43X and CPU_IXP46X

Marek Szyprowski (1):
      arm64: exynos: Enable Exynos Multi-Core Timer driver

Rafa=C5=82 Mi=C5=82ecki (1):
      MAINTAINERS: Add Florian as BCM5301X and BCM53573 maintainer

Sam Protsenko (1):
      ARM: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies

Wan Jiabing (1):
      ARM: shmobile: rcar-gen2: Add missing of_node_put()

 MAINTAINERS                                        |  2 ++
 arch/arm/Kconfig                                   |  1 -
 arch/arm/Kconfig.debug                             | 14 +++++++-------
 arch/arm/include/debug/imx-uart.h                  | 18 +++++++++---------
 arch/arm/mach-exynos/Kconfig                       |  1 -
 arch/arm/mach-imx/Kconfig                          | 12 ------------
 arch/arm/mach-imx/Makefile                         |  2 --
 arch/arm/mach-ixp4xx/Kconfig                       | 13 -------------
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |  1 -
 arch/arm/mach-s3c/gpio-samsung.c                   |  1 +
 arch/arm/mach-s3c/mach-jive.c                      |  1 +
 arch/arm/mach-s5pv210/Kconfig                      |  1 -
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c |  5 ++++-
 arch/arm64/Kconfig.platforms                       |  1 +
 drivers/i2c/busses/Kconfig                         | 10 ++--------
 include/linux/platform_data/pata_ixp4xx_cf.h       | 21 ------------------=
---
 16 files changed, 27 insertions(+), 77 deletions(-)
 delete mode 100644 include/linux/platform_data/pata_ixp4xx_cf.h
