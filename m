Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45775C433DB
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 13:12:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02D2C2311E; Tue, 12 Jan 2021 13:12:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43AEE23104;
	Tue, 12 Jan 2021 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610457150;
	bh=JKQ4LQEsDxZgCXNYQifwAHKLlxIN++/SKJ6lh19Xi60=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=H+wpJbxdHoIHMegONJ/JiJ+mx7CWn4TYX0DPO4PXBjFZ/wNo0/VvdexpHiGvJi4Wz
	 KDXR+i/KhVsHUrluhAkE3D230wj0f7tZpHf+Ogx3B8sRVQNQ3SWysf+7aNwvDcla/f
	 tR9bieMtIm4HBBi+Re+SV49NdQu4fRX7n6w+La7OPBL1CzkcIg3DEUT+Y7rWPo8ZE9
	 zN4HA1tPMvNIu2l8837J4XlqTouTia73WP941XKamroP5obssQs7y8f4J4of6Z5OS+
	 SFBuwJwBR4sx7TUsEGjZ1N3h6qqIltZMrA3knZ0B3zHhHebSaoFPXUnVIU1RxqHf4+
	 fPwczaGYhYA1A==
Date: Tue, 12 Jan 2021 21:12:25 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.11
Message-ID: <20210112131224.GI28365@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11

for you to fetch changes up to 5a22747b76ca2384057d8e783265404439d31d7f:

  ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11:

- Fix backlight pwm on imx6qdl-kontron-samx6i which is lost from
  #pwm-cells conversion.
- Fix duplicated bus node name for i.MX8MN SoC.
- Fix reset register offset on LS1028A SoC.
- Rename MMC node aliases for imx6q-tbs2910 to keep the MMC device
  index consistent with previous kernel version.
- Selecting ARM_GIC_V3 on non-CP15 processors to fix one build failure
  with i.MX8M SoC driver.
- Fix typos with status property on imx6qdl-kontron-samx6i board.
- Fix duplicated regulator-name on imx6qdl-gw52xx board.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: imx: fix imx8m dependencies

Koen Vandeputte (1):
      ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming

Marco Felsch (2):
      ARM: dts: imx6qdl-kontron-samx6i: fix pwms for lcd-backlight
      ARM: dts: imx6qdl-kontron-samx6i: fix i2c_lcd/cam default status

Michael Walle (1):
      arm64: dts: ls1028a: fix the offset of the reset register

Shengjiu Wang (1):
      arm64: dts: imx8mn: Fix duplicate node name

Soeren Moch (1):
      ARM: dts: tbs2910: rename MMC node aliases

 arch/arm/boot/dts/imx6q-tbs2910.dts            | 7 +++++++
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi          | 2 +-
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi  | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi      | 2 +-
 drivers/soc/imx/Kconfig                        | 2 +-
 6 files changed, 14 insertions(+), 7 deletions(-)
