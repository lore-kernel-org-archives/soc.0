Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D51FC433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18CBFC36AEC; Thu, 23 Dec 2021 21:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0345DC36AEA
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295224;
	bh=nr8ymcmDXwnQ14xr291hiU7FRH69xi66P05JkUOcwN4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Kv73+t3wY3bp4DlGakxYkvUx3fwuiBgpx5CzB1OI12j0LVonE/3e7suC1w3wauiLw
	 feTGbzDZ88M2j1do4pyFsaJXhTCVKdTcIqN1syhqRGbn0VikU8LJasr7wL0yyTzSRZ
	 6wiC0h3GSMsPDUdtzZ4Ri4ihPQd3yNdihlCBwEm2qoCe47tAxr1AXHMrvTe8BXVPjY
	 rFOFiRvIX0NkS2ZOs+qSgXev8bl0CBJd0uARRKh+QY0TynG8hTpaEo5vD32CdREq8J
	 euEcEB5Fd+z/tt0V1cWHGOX6HYbWMyKs3voDqtkEgUjm4gxrH0unYjCg5FQuh51XTP
	 /+LkUdfrjhv/A==
Received: by mail-wr1-f44.google.com with SMTP id w20so4885035wra.9
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:33:43 -0800 (PST)
X-Gm-Message-State: AOAM531mCIylUB8R8SLcgNRfCUnh4C9op747ipb8y+8soElMJoXn29dm
	nrJzuFY4Ml3C7df5jOigQlUk+fOqt2xVOCw6X+I=
X-Google-Smtp-Source: ABdhPJyy6FVK1KTp3lKbtAQcZwii8N9mp/7kScAajaqJcTiFjuxftGiZAW/Od8Fvq4AoFEWEUDL8g0PuIRYad2a/p78=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr2818372wru.12.1640295222250;
 Thu, 23 Dec 2021 13:33:42 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:33:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3cvBGO9e=34S9o0ConOTHJ_rLsRcGa0J0k0-PGChmJwA@mail.gmail.com>
Message-ID: <CAK8P3a3cvBGO9e=34S9o0ConOTHJ_rLsRcGa0J0k0-PGChmJwA@mail.gmail.com>
Subject: [GIT PULL 2/5] ARM: defconfig updates for 5.17
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.17

for you to fetch changes up to 0d2589aa5ca99821486be8b7ff9c747665b9c2c9:

  arm64: defconfig: Enable Samsung I2C driver (2021-12-21 12:18:44 +0100)

----------------------------------------------------------------
ARM: defconfig updates for 5.17

These are the usual changes to enable newly added driver
by default, and to do some housekeeping around changing
Kconfig symbols.

----------------------------------------------------------------
Adam Ford (2):
      arm64: defconfig: Enable VIDEO_IMX_MEDIA
      arm64: defconfig: Enable OV5640

Alexander Stein (1):
      arm64: defconfig: enable drivers for TQ TQMa8MxML-MBa8Mx

Arnd Bergmann (4):
      Merge tag 'renesas-arm-defconfig-for-v5.17-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'tegra-for-5.17-arm-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'at91-defconfig-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig

Dmitry Osipenko (5):
      ARM: tegra_defconfig: Enable drivers wanted by Acer Chromebooks
and ASUS tablets
      ARM: config: multi v7: Enable display drivers used by Tegra devices
      ARM: tegra_defconfig: Enable S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 S/PDIF driver
      ARM: config: multi v7: Enable NVIDIA Tegra20 APB DMA driver

Johann Neuhauser (1):
      ARM: imx_v6_v7_defconfig: Enable for DHCOM devices required
RTC_DRV_RV3029C2

Linus Walleij (1):
      ARM: configs: gemini: Activate crypto driver

Peng Fan (1):
      arm64: defconfig: enable drivers for booting i.MX8ULP

Sam Protsenko (1):
      arm64: defconfig: Enable Samsung I2C driver

Tudor Ambarus (2):
      ARM: configs: at91: sama7: Enable SPI NOR and QSPI controller
      ARM: configs: at91: Enable crypto software implementations

Yoshihiro Shimoda (1):
      arm64: defconfig: Enable R-Car S4-8

 arch/arm/configs/at91_dt_defconfig   |  9 ++++++++-
 arch/arm/configs/gemini_defconfig    |  3 +--
 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm/configs/multi_v7_defconfig  |  7 +++++++
 arch/arm/configs/sama5_defconfig     |  8 ++++++++
 arch/arm/configs/sama7_defconfig     |  5 +++--
 arch/arm/configs/tegra_defconfig     | 13 +++++++++++++
 arch/arm64/configs/defconfig         | 13 +++++++++++++
 8 files changed, 54 insertions(+), 5 deletions(-)
