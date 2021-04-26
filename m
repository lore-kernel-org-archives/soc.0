Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53295C433B4
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 15:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15A5161107; Mon, 26 Apr 2021 15:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F42296105A
	for <soc@kernel.org>; Mon, 26 Apr 2021 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452502;
	bh=RdK5/oSwLJdZ7v0c+XZ13ofkaFmtxLjmm2Nz6cTOX0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UodNUKdeCte2dwK7cU7Y5STTlZPosp3RNycMYttq/eG5XVBSguh9KWyq5Nv5HM87U
	 AVoEAOjISx2lGeSCjRySPvN+JsyfmzOerJnpQ1e2DXEGWIWmQTYkgUdVz3u9NYZCeQ
	 BRgyx+EvjEANBqy98lBPWkkt/LfubZQdZc2jftggcKZ0HEIHVhw1iuaLjoE3lAIfC3
	 WAqk+4bemU452F1G4ePzedCbGEpGYNKgj3Q3O3+vjwt2HQaDWV0I+JqVzCNnLJuMHr
	 elNyUp5HYoD31zFgkZ7LssA0mGVgow2nH4PcSMiF6fZNFDf4/aQ/7TONBFaqx/IrnD
	 HTJfstD/oDGng==
Received: by mail-wr1-f49.google.com with SMTP id a4so56441282wrr.2
        for <soc@kernel.org>; Mon, 26 Apr 2021 08:55:01 -0700 (PDT)
X-Gm-Message-State: AOAM533iU9ceEU8evvN9XlPQVDnTXZ+lHwQK16ZNHNrJVr3V4Z8pQvb1
	iJeA5/uTdJ/a+C6LKeGBSpWz4XNdCK2fXP+bN+c=
X-Google-Smtp-Source: ABdhPJwk04f61ev0oozHs0ngBVUszZ8IPDTXWPPKsEBdtdkloTLMe6AQvFw92nqfnCFHa3cH0NPRJzK1FXg52ha/haQ=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr24417661wrg.165.1619452500486;
 Mon, 26 Apr 2021 08:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 17:54:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
Message-ID: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
Subject: [GIT PULL 2/6] ARM: defconfigs for v5.13
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15=
:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-defconfig-5.13

for you to fetch changes up to 028a1e968435383c9555fc9386d116688f31dfce:

  Merge tag 'qcom-defconfig-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig (2021-04-19 17:39:12 +0200)

----------------------------------------------------------------
ARM: defconfigs for v5.13

The usual set of defconfig updates, enabling newly added drivers.
There are platform updates for at91, omap, ux500 and qcom platforms,
and a number of changes to the arm64 defconfig.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Add AT25 EEPROM module

Adrien Grassein (1):
      arm64: defconfig: Enable wm8960 audio driver.

Arnd Bergmann (8):
      Merge tag 'renesas-arm-defconfig-for-v5.13-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'arm64_defconfig_for_v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig
      Merge tag 'v5.12-next-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/defconfig
      Merge tag 'at91-defconfig-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'omap-for-v5.13/defconfig-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/defconfig
      Merge tag 'qcom-defconfig-for-5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC

Codrin Ciubotariu (1):
      ARM: configs: at91: sama5: Add audio MIKROE PROTO board

Dong Aisheng (1):
      arm64: defconfig: add imx8qm pinctrl support

Emil Velikov (2):
      ARM: configs: at91: sama5: update with savedefconfig
      ARM: configs: at91: sama5: enable the Hantro G1 engine

Enric Balletbo i Serra (2):
      arm64: defconfig: Allow mt8173-based boards to boot from usb
      arm64: defconfig: Enable options to support panel display for
Mediatek Chromebooks

Fabio Estevam (2):
      arm64: defconfig: Enable the Hantro decoder
      arm64: configs: Select REALTEK_PHY as built-in

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.12-rc2

Guido G=C3=BCnther (2):
      arm64: defconfig: Enable devfreq support for i.MX8MQ
      arm64: defconfig: Enable asoc simple mux

Heiko Thiery (1):
      arm64: configs: Enable PCIe support for imx8mq boards

Ivan Jelincic (2):
      ARM: omap2plus_defconfig: Update for dropped simple-pm-bus
      ARM: omap2plus_defconfig: Enable Netfilter components as modules

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and Keem Bay SoC

Linus Walleij (1):
      ARM: configs: ux500: Update for new drivers

Manivannan Sadhasivam (7):
      ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
      ARM: configs: qcom_defconfig: Enable SDX55 A7 PLL and APCS clock driv=
er
      ARM: configs: qcom_defconfig: Enable CPUFreq support
      ARM: configs: qcom_defconfig: Enable Q6V5_PAS remoteproc driver
      ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
      ARM: configs: qcom_defconfig: Enable GLINK SMEM driver
      ARM: configs: qcom_defconfig: Reduce CMA size to 64MB

Mark Brown (1):
      ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER

Michael Walle (1):
      arm64: configs: enable FlexTimer alarm timer

Nicolas Ferre (4):
      ARM: configs: at91: sama5: MCP16502 regulator as built-in
      ARM: configs: at91: Add mtd tests as modules
      ARM: configs: at91: Add USB Video webcam class
      ARM: configs: at91: Modernize UBI defconfig part

Razvan Stefanescu (2):
      ARM: configs: at91: sama5: PIOBU as built-in
      ARM: configs: at91: sama5: Enable LAN78XX as module

 arch/arm/configs/at91_dt_defconfig   |   5 +-
 arch/arm/configs/ezx_defconfig       |   1 -
 arch/arm/configs/imote2_defconfig    |   1 -
 arch/arm/configs/omap2plus_defconfig | 151 +++++++++++++++++++++++++++++++=
+++-
 arch/arm/configs/pxa_defconfig       |   1 -
 arch/arm/configs/qcom_defconfig      |  10 ++-
 arch/arm/configs/sama5_defconfig     |  51 +++++++-----
 arch/arm/configs/shmobile_defconfig  |   1 -
 arch/arm/configs/u8500_defconfig     |  14 ++++
 arch/arm64/configs/defconfig         |  35 +++++++-
 10 files changed, 240 insertions(+), 30 deletions(-)
