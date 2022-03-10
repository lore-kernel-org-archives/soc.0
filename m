Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C22DC433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 14:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 651DAC340FB; Thu, 10 Mar 2022 14:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF07C36AE7
	for <soc@kernel.org>; Thu, 10 Mar 2022 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646924047;
	bh=nthk0lKtr5Fy8HbsoYOwG/xYSBtT0OtSTMicmYUvYEw=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=Qe4WLdl6/VNZQNYtZzSZ2zVvdRvgN9q6VXxdKBoQy1LRNGwyufAMGkMlryqwkDGZ2
	 J8+VNQiUJ8833g7sRMxpGgUUig5sO0beR7jMrQdJNyrzLHVwyJ7RL7ScaC1AIfxzo3
	 3y1Zi97OCFiN1kMGwOt3P9RdP7vNMMGnZG+I/zz8QV3lh0dEJiMce2MjpVZ9wzWX9Q
	 gKPFUIHVp5FqwGaTPr7RiF8Q+hT3I+E/sSmhH+damg2ugmxjUy6OYjsYw5da7VmvV7
	 tyV5bF3sbZQrrewd8uQ6/2waXEdDxAh2yiO//Yik8xAnfNfACnGlF4bTU6P0hQyIB8
	 DJfoslNpCoUUQ==
Received: by mail-wr1-f45.google.com with SMTP id i8so8368386wrr.8
        for <soc@kernel.org>; Thu, 10 Mar 2022 06:54:07 -0800 (PST)
X-Gm-Message-State: AOAM533sYiu7Od5flpnrbDxd9pV0i50WBy7eFA39g2gN6b0GHpgu2WkO
	duxIJBytYyOoKUNopmQmi28g2/zPMqsilcUkP2M=
X-Google-Smtp-Source: ABdhPJxKfpT0EA1cmINpAk7jdsQ/sjXPCXWskcowZG7RUfXV5Li4x/eNlxD8g7AAGGWW4NK+AuASPPt0VEfHY51Dols=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr1051817wrq.192.1646924045435; Thu, 10
 Mar 2022 06:54:05 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 10 Mar 2022 15:53:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2pdq=68wt9ttMa67qU+YkBaUshdVSaNN8XJ3TPXJN7iQ@mail.gmail.com>
Message-ID: <CAK8P3a2pdq=68wt9ttMa67qU+YkBaUshdVSaNN8XJ3TPXJN7iQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.17, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Robert Foss <robert.foss@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3=
:

  Linux 5.17-rc6 (2022-02-27 14:36:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-=
3

for you to fetch changes up to 7e606edaa0a2e443fba9ae324efc1ba7834a0e7d:

  Merge tag 'mvebu-fixes-5.17-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/fixes (2022-03-10 15:25:46 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 5.17, part 3

Here is a third set of fixes for the soc tree, well
within the expected set of changes.

Maintainer list changes:
 - Krzysztof Kozlowski and Jisheng Zhang both have
   new email addresses
 - Broadcom iProc has a new git tree

Regressions:
 - Robert Foss sends a revert for a Mediatek DPI bridge
   patch that caused an inadvertent break in the DT binding
 - mstar timers need to be included in Kconfig

Devicetree fixes for:
 - Aspeed ast2600 spi pinmux
 - Tegra eDP panels on Nyan FHD
 - Tegra display IOMMU
 - Qualcomm sm8350 UFS clocks
 - minor DT changes for Marvell Armada, Qualcomm sdx65,
   Qualcomm sm8450, and Broadcom BCM2711

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's input sel

Arnd Bergmann (8):
      Merge tag 'arm-soc/for-5.17/devicetree-fixes' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'qcom-dts-fixes-for-5.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'v5.17-fixes-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/fixes
      Merge tag 'tegra-for-5.17-arm64-dt-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Merge tag 'tegra-for-5.17-arm-dt-fixes-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/fixes
      Merge tag 'arm-soc/for-5.18/maintainers' of
https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'mvebu-fixes-5.17-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/fixes

Bjorn Andersson (1):
      arm64: dts: qcom: sm8350: Correct UFS symbol clocks

Daniel Palmer (1):
      ARM: mstar: Select HAVE_ARM_ARCH_TIMER

Jisheng Zhang (1):
      MAINTAINERS: Update Jisheng's email address

Joel Stanley (1):
      ARM: dts: aspeed: Fix AST2600 quad spi group

Jon Hunter (1):
      arm64: tegra: Disable ISO SMMU for Tegra194

Jonathan Marek (2):
      arm64: dts: qcom: sm8450: enable GCC_USB3_0_CLKREF_EN for usb
      arm64: dts: qcom: sm8450: fix apps_smmu interrupts

Krzysztof Kozlowski (1):
      MAINTAINERS: update Krzysztof Kozlowski's email

Kuldeep Singh (1):
      MAINTAINERS: Update git tree for Broadcom iProc SoCs

Maxime Ripard (1):
      ARM: boot: dts: bcm2711: Fix HVS register range

N=C3=ADcolas F. R. A. Prado (1):
      arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI endpoint

Pali Roh=C3=A1r (2):
      arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias
      arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0

Robert Foss (2):
      dt-bindings: drm/bridge: anx7625: Revert DPI support
      Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's
DSI endpoint"

Stanislav Jakubek (1):
      Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards"

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: disable crypto due to serror

Thierry Reding (1):
      ARM: tegra: Move Nyan FHD panels to AUX bus

 .mailmap                                           |  3 ++
 Documentation/devicetree/bindings/arm/qcom.yaml    |  6 ----
 .../bindings/display/bridge/analogix,anx7625.yaml  | 19 +-----------
 MAINTAINERS                                        | 36 +++++++++++-------=
----
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |  2 +-
 arch/arm/boot/dts/bcm2711.dtsi                     |  1 +
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts        | 10 ++++--
 arch/arm/boot/dts/tegra124-nyan-big.dts            | 15 +++++----
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          | 15 +++++----
 arch/arm/boot/dts/tegra124-venice2.dts             | 14 ++++-----
 arch/arm/mach-mstar/Kconfig                        |  1 +
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  8 ++++-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  5 +++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 28 ++++++++++++++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  8 +++--
 drivers/soc/mediatek/mt8192-mmsys.h                |  3 +-
 drivers/soc/samsung/exynos-chipid.c                |  2 +-
 19 files changed, 103 insertions(+), 77 deletions(-)
