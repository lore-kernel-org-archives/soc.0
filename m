Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D196C433EF
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 14:02:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4695461248; Sat, 16 Oct 2021 14:02:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2903D611C1;
	Sat, 16 Oct 2021 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634392942;
	bh=GLjOqLPq74/dCR3aSoHbOHdoq1BeHO1rkjwoae3yUf4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pje/+N64mbKVnsJ/coITvXhCBMaz0/MvmRl843rJrn986Zvt9J7RijZL8JWMGKCTm
	 PEGN4IzzXJkmPR85eUCLT1lzL4mPWGNJPGWv73AOoF+VsqrP3E052ifqR1tcPeoLQQ
	 4pMbCR6UmF/cXZYHcEwbsvklOshzJr1ySumXVhGGW07Bd8U8NyUPO39ktNF0D5Zq5F
	 LfWhh5bJjHUS8CsuACkRUoSpQxVzuxAkL0jdv8pzw5sK6/H6E2Ztc5YhBehrz7UOH2
	 iT0ULEGe1l8nA17dCnmg11sKEvRB9zd8/4mVYN17UnJZtQTpbzwnyaHu4zywyBeFdd
	 XEXjKlSY0TiBQ==
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
Subject: [GIT PULL 5/6] i.MX defconfig update for 5.16
Date: Sat, 16 Oct 2021 22:01:37 +0800
Message-Id: <20211016140138.1603-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.16

for you to fetch changes up to e99a1fa731b4d3005ddee6751bc13ceeb136eb0e:

  ARM: imx_v6_v7_defconfig: Enable HID I2C (2021-10-15 10:49:53 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.16:

- A series from Marcel Ziswiler to update imx_v6_v7_defconfig for the
  new Colibri iMX6ULL eMMC variant support.
- Enable HID I2C in the imx_v6_v7_defconfig as it is used for a HID
  compliant wacom device on the reMarkable2 tablet.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: imx_v6_v7_defconfig: Enable HID I2C

Marcel Ziswiler (5):
      ARM: imx_v6_v7_defconfig: enable mtd physmap
      ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
      ARM: imx_v6_v7_defconfig: rebuild default configuration
      ARM: imx_v6_v7_defconfig: build imx sdma driver as module
      ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf

 arch/arm/configs/imx_v6_v7_defconfig | 47 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)
