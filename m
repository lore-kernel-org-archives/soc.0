Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308CDC6FA82
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 02:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFF44C433B5; Tue, 13 Sep 2022 02:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB33C433C1;
	Tue, 13 Sep 2022 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663037449;
	bh=RJHbf7m+tWQCZdZc3wcMOKoxG2SHCOCSucxTm9erIQ8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=g4uUI60MBPjf0Je0BaQ1S+Z1eqa5avJjrsnaxhFU6+qf1AeqwKk+HHuzgXqbOnf40
	 W96/nla0CGYYP6C66vO3DV7YyY8Yv3kkTPmjd88n6NwNxsl5PToMcwIoxUqYr4n7y8
	 LvH6Gw/BYM9uAVcbpPyXxHfSXskPm9FTvwT8lpQZ3HUMdeWpTPSIkMsMRPQQScpVXK
	 hWdfWE4G5Jm+OjXxibRULXVGteqQ4dRpFHa3MzVs2Wx5vIoL88fY0UgFJhcgwAf9RN
	 TsmK9pk7Geth6BdS9Wlcx9jz3naLyJr8vGW8jpqM5M8d5YGscWe49p52K/ezj8Ankg
	 4d36iQWJynNTA==
Date: Tue, 13 Sep 2022 10:50:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.0, 2nd round
Message-ID: <20220913025043.GH1728671@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f143b9f3849828870bb2a7f28288095ad9a329d:

  arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity (2022-08-22 10:07:46 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0-2

for you to fetch changes up to c1f84a75babecd9fa11f128f2da8991e2f8fb179:

  arm64: dts: imx8mp-venice-gw74xx: fix port/phy validation (2022-09-13 10:23:48 +0800)

----------------------------------------------------------------
i.MX fixes for 6.0, 2nd round:

- A couple of TQMa8MPQL device tree fixes from Alexander Stein on button
  GPIOs and PCF85063 RTC alarm pinctrl.
- Include phy-imx8-pcie.h header in tqma8mqml-mba8mx device tree to fix
  build errors when this SoM dtsi is included on customer carrier boards.
- Remove GPU power domain reset from i.MX8MN device tree to fix
  a sporadical hang seen with GPUMIX powering up.
- Correct CPLD_Dn GPIO label mapping for Toradex Verdin based Menlo
  board.
- Add ARCH_NXP back to defconfig, which was dropped accidentally by
  commit 566e373fe047 ("arm64: Kconfig.platforms: Group NXP platforms
  together").
- Add missing #reset-cells for i.MX8ULP PCC clock controllers.
- Update PMIC voltages for imx8mm-verdin board to fix an issue with one
  Toradex SKU that uses a consumer-grade chip that is capable of going up
  to 1.8GHz at 1.00V.
- A series of imx8mp-venice-gw74xx device tree changes from Tim Harvey
  to fix things on CAN STBY polarity, KSZ9477 CPU uplink port and
  phy-mode.

----------------------------------------------------------------
Alexander Stein (2):
      arm64: dts: tqma8mpxl-ba8mpxl: Fix button GPIOs
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl: add missing pinctrl for RTC alarm

Fabio Estevam (1):
      arm64: dts: tqma8mqml: Include phy-imx8-pcie.h header

Marco Felsch (1):
      arm64: dts: imx8mn: remove GPU power domain reset

Marek Vasut (1):
      arm64: dts: imx8mm: Reverse CPLD_Dn GPIO label mapping on MX8Menlo

Michael Walle (1):
      arm64: defconfig: enable ARCH_NXP

Peng Fan (1):
      arm64: dts: imx8ulp: add #reset-cells for pcc

Philippe Schenker (1):
      arm64: dts: imx8mm-verdin: extend pmic voltages

Tim Harvey (3):
      arm64: dts: imx8mp-venice-gw74xx: fix CAN STBY polarity
      arm64: dts: imx8mp-venice-gw74xx: fix ksz9477 cpu port
      arm64: dts: imx8mp-venice-gw74xx: fix port/phy validation

 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts           | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts   |  1 -
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi            | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi                   |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 10 ++++++++--
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts      | 12 ++++++++----
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi                  |  3 +++
 arch/arm64/configs/defconfig                                |  1 +
 9 files changed, 31 insertions(+), 18 deletions(-)
