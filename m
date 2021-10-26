Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374C7C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 20:51:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1089360F92; Tue, 26 Oct 2021 20:51:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE54360F24
	for <soc@kernel.org>; Tue, 26 Oct 2021 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635281503;
	bh=X0s+TPT9qDOVyR+RmgrWax7b3R4tccWt2MJGyvfXTHw=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=f3WwvbtXuPhT3kPhuy7U3G7/5RlnWqwALHI+2soL5eY+1loQyuMuKd/kH8Bq73pTl
	 omyCw2JtdYru8oYqmKeG43nBFjAZbLa9UH91AajLQmW38pLiSTejziJxabJKX0bsNn
	 G96eAA2tdKclXQbxgTERbYbiynS1OpGkXPYq+5yaZMsEy/l0QI/8R7W0JdVvebKiNa
	 8JnwVoIiBpdEc2zwg17duU0KS3x/gdO67+8PlSSfU75a63l+5oDY1KRm6VcwKCupEg
	 jaXXjcWWBRFnSTQ20FGSE21H7LD/HE+DulOxFocU38ckKVQJZ1908wKyGwphXeUw1/
	 KjNFpX4yCcH2w==
Received: by mail-wm1-f44.google.com with SMTP id y205-20020a1c7dd6000000b0032cc8c2800fso3445867wmc.4
        for <soc@kernel.org>; Tue, 26 Oct 2021 13:51:42 -0700 (PDT)
X-Gm-Message-State: AOAM5327NCqqgv54594Nu8Dg2jFOZswcr1YvlV28vNX0GLXQxh80Fv4K
	aba3o1t0DejwTNpqv55XQp3ffAIcCDgDsxj1EB8=
X-Google-Smtp-Source: ABdhPJzYsVeNX77z4D8mHdqKcPkbA/a3rFsNHJBT+cgWffAPjYbG1CzllW4KV87bN/SidJu8nTq5cmOR6scKlGk9oRY=
X-Received: by 2002:a05:600c:1912:: with SMTP id j18mr1077882wmq.173.1635281501478;
 Tue, 26 Oct 2021 13:51:41 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 26 Oct 2021 22:51:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
Message-ID: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.15, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba=
:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-5.15-3

for you to fetch changes up to 05d5da3cb11c91c39e607066d3313a6ce621796a:

  MAINTAINERS: Add maintainers for DHCOM i.MX6 and DHCOM/DHCOR
STM32MP1 (2021-10-26 17:14:37 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.15, part 3

One last set of small fixes for the soc tree:

 - Incorrect ethernet phy settings found on i.mx and
   allwinner platforms

 - a revert for a Qualcomm DT change that caused a boot
   regression

 - four patches for incorrect settings in i.MX DT files

 - new MAINTAINER file entries for dhcom boards

 - a Kconfig fix for a reset driver that became unselectable

 - three more code changes for bugs in reset drivers

----------------------------------------------------------------
Amit Pundir (1):
      Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
node for sm8250 target"

Arnd Bergmann (4):
      Merge tag 'imx-fixes-5.15-4' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes
      Merge tag 'sunxi-fixes-for-5.15-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'reset-fixes-for-v5.15' of
git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.15-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes

Bastien Roucari=C3=A8s (1):
      ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode

Christoph Niedermaier (1):
      MAINTAINERS: Add maintainers for DHCOM i.MX6 and DHCOM/DHCOR STM32MP1

Cl=C3=A9ment B=C5=93sch (1):
      arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node

Frieder Schrempf (5):
      arm64: dts: imx8mm-kontron: Make sure SOC and DRAM supply
voltages are correct
      arm64: dts: imx8mm-kontron: Set lower limit of VDD_SNVS to 800 mV
      arm64: dts: imx8mm-kontron: Fix polarity of reg_rst_eth2
      arm64: dts: imx8mm-kontron: Fix CAN SPI clock frequency
      arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY

Geert Uytterhoeven (1):
      reset: pistachio: Re-enable driver selection

Jim Quinlan (1):
      reset: brcmstb-rescal: fix incorrect polarity of status bit

Mikko Perttunen (1):
      reset: tegra-bpmp: Handle errors in BPMP response

Pawe=C5=82 Anikiel (1):
      reset: socfpga: add empty driver allowing consumers to probe

 MAINTAINERS                                        | 13 +++++++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts    |  2 +-
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   |  2 +-
 .../boot/dts/freescale/imx8mm-kontron-n801x-s.dts  |  8 ++++---
 .../dts/freescale/imx8mm-kontron-n801x-som.dtsi    |  8 ++++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  3 ++-
 drivers/reset/Kconfig                              |  4 ++--
 drivers/reset/reset-brcmstb-rescal.c               |  2 +-
 drivers/reset/reset-socfpga.c                      | 26 ++++++++++++++++++=
++++
 drivers/reset/tegra/reset-bpmp.c                   |  9 +++++++-
 10 files changed, 64 insertions(+), 13 deletions(-)
