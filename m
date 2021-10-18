Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E66C433EF
	for <soc@archiver.kernel.org>; Mon, 18 Oct 2021 00:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 319216124B; Mon, 18 Oct 2021 00:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 086F060F9E;
	Mon, 18 Oct 2021 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634515809;
	bh=DWiEhkbm5/S9y24lWBiHqjrvXC61zA6uoExWq6A74Ug=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=cSFNGRDV6d4oIlVI0e5nOZdDCMay1M+HjKGpnUMKiWLu9rZCUiy7pQvWZzE0oxZZU
	 1fRCMlnYSJUwk9uZ7DEp/urY/wvqu6xhZ+ZLqCN6AD9JfzcFiaNfQuM1od8QLZLQM/
	 3yjsmFu5nOPazwRVA5wiVz5BHf5DvFkDE69xYKgrmOiF5FMlMb77gMtsHNrbHoowm8
	 Vt9O6GGArVipB6GFHvNeb5Cq3uAC9ORv2l499Oxvn053yQaQezCc3ZB7RKoFdnRZ75
	 hgxtgaYWR8GcSehrJDGpH0aSkoqJgm46w+M6t3jYZh0P0orLCLi96tczSXe1j//t/Y
	 BfJ5n3b2jDksA==
Date: Mon, 18 Oct 2021 08:10:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 4
Message-ID: <20211018000958.GC25810@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit a1467faa10414ab3d91be7ef6d2b11272ec00e95:

  ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-4

for you to fetch changes up to 0b28c41e3c951ea3d4f012cfa9da5ebd6512cf6e:

  arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY (2021-10-16 15:30:00 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 4:

- A series from Frieder Schrempf to fix i.MX8MM Kontron N801x board on
  various aspects, voltage settings, GPIO polarity, SPI clock frequency
  and Ethernet PHY type.

----------------------------------------------------------------
Frieder Schrempf (5):
      arm64: dts: imx8mm-kontron: Make sure SOC and DRAM supply voltages are correct
      arm64: dts: imx8mm-kontron: Set lower limit of VDD_SNVS to 800 mV
      arm64: dts: imx8mm-kontron: Fix polarity of reg_rst_eth2
      arm64: dts: imx8mm-kontron: Fix CAN SPI clock frequency
      arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY

 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dts    | 8 +++++---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-som.dtsi | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)
