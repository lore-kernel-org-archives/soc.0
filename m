Return-Path: <SRS0=BbVa=HQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AB2C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:44:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A49E64DF4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A49E64DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LMvVENXI4XksCACtOp1mm51ZBDyM0pvYP1utt5RopY=; b=gM2f2kPKfjJJBvBCuZn0S08X/Z
	Z2N4KJkB73UePpOIB0pNtPXbWh0ge+Q3ADyRyU1vok102O63VdM8Q8p7JpsfnXxJpQiF0F9RUqJ2S
	/Qr9gpMgX8BPwOxNvJd67/qdkrB772gXmc7qQM5GT6aQHG+U0NGr4WcDx63SWpiG0IUhfIvdeHwIo
	mSyvXuMgbt0AscK1psVHa39RN9z3wGrfMXENr4fdIluhYk5DX1lt3LQ/dP/ozIfjBDOHarlilXQYr
	SXhXNIXI36dlXt3CkEVo3nLxsJjnOcizzBrn0AOgM8dZO01EKTvlfaLNCP2UEZGS9cLBI3BLp0uya
	TqG5c78Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBQ7J-0007tQ-JY; Sun, 14 Feb 2021 22:43:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBQ7F-0007sn-KT
 for linux-arm-kernel@lists.infradead.org; Sun, 14 Feb 2021 22:43:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9D2464E29
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 22:43:44 +0000 (UTC)
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
Received: by mail-ot1-f42.google.com with SMTP id i20so4527413otl.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 14:43:44 -0800 (PST)
X-Gm-Message-State: AOAM5310PSsNexVEBHEWBHqKnP6JYz8wbyTAy+1xRIABDq53kM92ydHr
 WXrO43+tudKpWDnOIeXqLI7zJfqbk468eMGhkI4=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_174345_891341_FC9E25B4 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210214224328.xQL0Mhzk3_-xfcwCdlHTsiVH7mbnH0V0DQ7HdJlDdUc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
