Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDCDC433EF
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 23:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95B94C340F5; Wed, 23 Mar 2022 23:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80166C340F2
	for <soc@kernel.org>; Wed, 23 Mar 2022 23:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648076914;
	bh=PRKnupBT2/5IsR6uehhBAD4EHuoZTBiSDyzGJKS/ELQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CDcZt7OW1SsojJLT0bPr8mmdxxT6fczr0rZcess5BsvVIS3Dvo/vUx2dMxSyfmRQM
	 5H4xjo1n6ridkrL+413OWDsWGeWfC8VkPMvv5Gp0XW47sYWvu5yO1Ae80clibxOaAd
	 OmyQMtxVyhfQc7evv2w1VoepkWZ/IeMTFwHaVD9rFSJKhxDDNNgTxME6zXguQGtzL4
	 JV0krcCkYCevKiUyudwcC0/NfvWuAXVCb+N+uIQHoZbFOmAmxITdD1eilTv+17bL9z
	 F0JD4m0K04T4KKoQ1XlV1gOPL/LCwmmAhOdn0okoGKj4qe5jPFPrQUde1kHJWikSHj
	 enI8ys4/t786g==
Received: by mail-wr1-f54.google.com with SMTP id a1so4217062wrh.10
        for <soc@kernel.org>; Wed, 23 Mar 2022 16:08:34 -0700 (PDT)
X-Gm-Message-State: AOAM531dhpjBWpwe+7fjm2C0fTwOuX+AwFAuVpssA15TQodlSwC6frSR
	Mb4POWwm1SPorg5InMEEDEWaqGLqwBen6K238qk=
X-Google-Smtp-Source: ABdhPJzheCri/3PKMz4+GkCjxx2c21oxG1hIEQyjp5IN203b45Ucjx7+hCBW4WtzUX0L0pXd9Q+69nMVWyiWOEK8Raw=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr2038006wrg.219.1648076912683; Wed, 23
 Mar 2022 16:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
In-Reply-To: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Mar 2022 00:08:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
Message-ID: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
Subject: [GIT PULL 1/4] ARM: defconfig updates for 5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566=
:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-defconfig-5.18

for you to fetch changes up to cf38326010aebf39855977475a901c4c7a3e0b63:

  ARM: configs: multi_v5: Enable Allwinner F1C100 (2022-03-23 11:16:59 +010=
0)

----------------------------------------------------------------
ARM: defconfig updates for 5.18

Various updates for the 32-bit and 64-bit defconfig files, mostly to
enable additional hardware drivers for more machines, specifically for
the Allwinner F1C100, Altera SoCFPGA, Broadcom, Microchip, Qualcomm,
Airoha, Tegra, Renesas, and i.NX.

The multi_v5_defconfig for older ARMv5 configs gets a rework for Andre
Przywara to cleans up the multi_v5_defconfig for some cruft that has
accumulated and drivers that got disabled unintentionally, while Anders
Roxell makes it more useful for running under Qemu.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: tegra: Enable GPCDMA

Anders Roxell (1):
      arm: multi_v5: enable configs for versatile

Andre Przywara (5):
      ARM: configs: multi_v5_defconfig: remove deleted platforms
      ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVE=
RS
      ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
      ARM: configs: clean up multi_v5_defconfig
      ARM: configs: multi_v5: Enable Allwinner F1C100

Arnd Bergmann (11):
      Merge tag 'ti-k3-config-for-v5.17-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig
      Merge tag 'at91-defconfig-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'renesas-arm-defconfig-for-v5.18-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'tegra-for-5.18-arm64-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'qcom-defconfig-for-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'v5.17-next-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'at91-defconfig-5.18-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'arm-soc/for-5.18/defconfig-arm64' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'arm64_defconfig_for_v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/defconfig

Claudiu Beznea (3):
      ARM: configs: at91: sama7: enable cpu idle
      ARM: configs: at91: sama7: add config for cpufreq
      ARM: configs: at91: add eic

Dinh Nguyen (1):
      arm64: defconfig: enable the CVP driver

Florian Fainelli (3):
      arm64: defconfig: Enable additional Broadcom STB drivers
      ARM: multi_v7_defconfig: Enable Broadcom STB USB drivers
      ARM: multi_v7_defconfig: Enable BCM23550 and BCM53573

Geert Uytterhoeven (2):
      ARM: shmobile: defconfig: Disable unneeded 8250 serial options
      arm64: defconfig: Enable additional support for Renesas platforms

Giulio Benetti (1):
      ARM: imxrt_defconfig: Add i.MXRT family defconfig

John Crispin (1):
      ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC

Kuninori Morimoto (1):
      arm64: defconfig: Enable Audio Graph Card2 driver

Marcel Ziswiler (9):
      arm64: defconfig: enable taskstats configuration
      arm64: defconfig: enable pcieaer configuration
      arm64: defconfig: re-order default configuration
      arm64: defconfig: rebuild default configuration
      arm64: defconfig: enable bpf/cgroup firewalling
      arm64: defconfig: enable imx8m pcie phy driver
      arm64: defconfig: build imx-sdma as a module
      arm64: defconfig: build r8169 as a module
      arm64: defconfig: enable verdin-imx8mm relevant drivers as modules

Martin J=C3=BCcker (1):
      ARM: defconfig: add SMB347 charger driver for p4note

Michael Walle (1):
      arm64: defconfig: enable Layerscape SFP driver

N=C3=ADcolas F. R. A. Prado (2):
      arm64: defconfig: Enable MT6397 RTC
      arm64: defconfig: Enable cpufreq for MediaTek

Stephan Gerhold (1):
      ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c

Tudor Ambarus (4):
      ARM: configs: at91: sama7: Enable NAND / SMC
      ARM: configs: at91: sama7: Enable UBIFS_FS
      ARM: configs: at91: sama7: Enable crypto IPs and software algs
      ARM: configs: at91: sama7: Unselect CONFIG_DMATEST

Vignesh Raghavendra (1):
      arm64: defconfig: Enable USB controller drivers for TI K3 SoC

Vinod Koul (3):
      arm64: defconfig: Add SM8450 GCC config
      arm64: defconfig: Add SM8450 pinctrl config
      arm64: defconfig: Add SM8450 icc configs

 arch/arm/configs/exynos_defconfig   |   1 +
 arch/arm/configs/imxrt_defconfig    |  35 ++++++++
 arch/arm/configs/multi_v5_defconfig |  26 +++---
 arch/arm/configs/multi_v7_defconfig |  63 ++++++++++++++-
 arch/arm/configs/sama7_defconfig    |  31 ++++++--
 arch/arm/configs/shmobile_defconfig |   4 +
 arch/arm64/configs/defconfig        | 155 +++++++++++++++++++++-----------=
----
 7 files changed, 232 insertions(+), 83 deletions(-)
 create mode 100644 arch/arm/configs/imxrt_defconfig
