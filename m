Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923FC05027
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 00:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3299C4339B; Mon, 30 Jan 2023 00:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06462C433D2;
	Mon, 30 Jan 2023 00:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675038984;
	bh=mKW/JoGJUYJbiB/Dvka3BVcC/fE2LCazaURZFiBu2oE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=nH4dn0lisOkXt61ObzpK16wdLqTNxlq4MvOse46Szqs86dRQW10T0IBkG2QZIDzYn
	 HMxgcYmYBnHCIhzkMLqUpmdUXW7iEqUjsBZ2GZe8YCnAVYpBfNHWJYvKL7RclbU7NR
	 y44poaQa3jr/ju8w9myeo22wqRB6tQxfsU9TDWB3kU9upUI/AZn/gAEYAPv8Ktklz1
	 jnPBvlwpU/OCl8/4Ygfp/YOHikvMtKNc3ftDesNtLS5h8JxA4TAomGlQq98GYOVy7h
	 usD3DjRG7kXtZoGhC1i3eXo0rmCDDjE1q2swbvHC/LZ9lRUepK6aLL43mGpY/ZUdI6
	 KZKIZMdb/H6cQ==
Date: Mon, 30 Jan 2023 08:36:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.2, round 2
Message-ID: <20230130003614.GP20713@T480>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 490748874ebf1875420fc29b335bba2075dd1b5e:

  soc: imx8m: Fix incorrect check for of_clk_get_by_name() (2023-01-02 21:16:05 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.2-2

for you to fetch changes up to 1febf88ef907b142fdde34f7c64ed3535d9339e4:

  ARM: dts: imx7d-smegw01: Fix USB host over-current polarity (2023-01-26 15:38:05 +0800)

----------------------------------------------------------------
i.MX fixes for 6.2, round 2:

- Update MAINTAINERS i.MX entry to match arm64 freescale DTS.
- Drop misused 'uart-has-rtscts' from imx8m-venice boards.
- Fix USB host over-current polarity for imx7d-smegw01 board.
- Fix a typo in i.MX8DXL sc_pwrkey property name.
- Fix GPIO watchdog property for i.MX8MM eDM SBC board.
- Keep Ethernet PHY powered on imx8mm-verdin to avoid kernel crash.
- Fix configuration of i.MX8MM pad UART1_DTE_RX.

----------------------------------------------------------------
Ahmad Fatoum (1):
      MAINTAINERS: match freescale ARM64 DT directory in i.MX entry

Fabio Estevam (2):
      arm64: dts: imx8m-venice: Remove incorrect 'uart-has-rtscts'
      ARM: dts: imx7d-smegw01: Fix USB host over-current polarity

Frank Li (1):
      arm64: dts: freescale: imx8dxl: fix sc_pwrkey's property name linux,keycode

Marek Vasut (1):
      arm64: dts: imx8mm: Reinstate GPIO watchdog always-running property on eDM SBC

Philippe Schenker (1):
      arm64: dts: imx8mm-verdin: Do not power down eth-phy

Pierluigi Passaro (1):
      arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX

 MAINTAINERS                                                          | 3 +++
 arch/arm/boot/dts/imx7d-smegw01.dts                                  | 3 ++-
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi                           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts          | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h                       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtso | 1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtso | 1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi              | 1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts               | 3 ---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts               | 3 ---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts               | 1 -
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi                     | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts               | 1 -
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts               | 1 -
 14 files changed, 9 insertions(+), 15 deletions(-)
