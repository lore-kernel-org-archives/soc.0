Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0B4C433EF
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBF93C36AE9; Sat, 18 Dec 2021 07:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313E5C36AE1;
	Sat, 18 Dec 2021 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811711;
	bh=+EajKdnKq4JLkmXaB8FfXO3d/xc/paB4/9VJWFiaNzY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pd82+gZGcEYkZi6xDUne4ithWrg0HvDCsqSQQ1uoIk1p1Khwsn1ScH/m2u5aNXyKL
	 cPrN8AnjyVQ+CFixxc6oJ6zOfmnRhcBqKuuYQH0mW43y6XPq3dqtRSw2zM52jf7xxm
	 AxZstz5VTNR3TTMW3YMS4WVdRwGKIA9U/Kr2j7IwAsikKviehZAcvNp6dRfGmvFh7t
	 fTzQYU9U/nqugU7Og9ml429N4k2wtsti1rb2POr1UJCFFFC3ltm89uyg2Ko/aCL2MY
	 2N9j3SrNYSfRkd+G8HO6WbEjo4vvp64pmD1vgHMlJUoi0LbmN1rViW6PK42fLYVKP1
	 NvJHv2bTOlLpQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.17
Date: Sat, 18 Dec 2021 15:14:27 +0800
Message-Id: <20211218071427.26745-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
References: <20211218071427.26745-1-shawnguo@kernel.org>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.17

for you to fetch changes up to c720e38f4c2dd1e0b5cf4f7dcf8bb6951cd3856d:

  ARM: imx_v6_v7_defconfig: Enable for DHCOM devices required RTC_DRV_RV3029C2 (2021-12-16 14:50:25 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.17:

- Enable pinctrl and clock drivers for i.MX8 ULP SoC.
- A couple of patches from Adam Ford to enable Camera driver support
  for Beacon EmbeddedWorks i.MX8MM development kit.
- Enable drivers for devices found on TQMa8MxML-MBa8Mx board.
- Enable RTC_DRV_RV3029C2 driver support for DHCOM devices.

----------------------------------------------------------------
Adam Ford (2):
      arm64: defconfig: Enable VIDEO_IMX_MEDIA
      arm64: defconfig: Enable OV5640

Alexander Stein (1):
      arm64: defconfig: enable drivers for TQ TQMa8MxML-MBa8Mx

Johann Neuhauser (1):
      ARM: imx_v6_v7_defconfig: Enable for DHCOM devices required RTC_DRV_RV3029C2

Peng Fan (1):
      arm64: defconfig: enable drivers for booting i.MX8ULP

 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm64/configs/defconfig         | 11 +++++++++++
 2 files changed, 12 insertions(+)
