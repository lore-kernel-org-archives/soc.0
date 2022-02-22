Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E6EC433EF
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F972C340EB; Tue, 22 Feb 2022 07:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C972EC340F0;
	Tue, 22 Feb 2022 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516379;
	bh=/Po3f2ivvqIkjaHNaXy/rc+Z5xaxrIXH4r/Pk+OXQ+U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nt+IZ9fu49wJD62ZSsji/YM1GKBAT8XZ9RLP3v61Egwf+omCBpKfVra1SneqDN80x
	 2NcQyMPCEckw4+5em6Cc5k2tt7pgUyLV7OYZSLJ6wFhi4SLCEjMZKM3/XoEByxPSMb
	 ZPO5/RDhkYId3052M1C3iBVNVIWynr5xM5h/5uAVKJvr/rChPJsrFhc0F8qqYsLJQe
	 UIDN79NcdnPokJQ0x5IhReTq40omlYrn8CQi0VbW1gP4QGzj90ybJbspMfD8kpJDOP
	 Ojv2HyVkkylAycIJ9y+cLyuvEjohJ0RjkWvqjH6wuGrE3Xlfb9uueYK6va7kOKxfgu
	 nYgdX6KCR+lcg==
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
Subject: [GIT PULL 6/6] i.MX defconfig change for 5.18
Date: Tue, 22 Feb 2022 15:52:26 +0800
Message-Id: <20220222075226.160187-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
References: <20220222075226.160187-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.18

for you to fetch changes up to cf3f722be6cababe812dbdf963ae825415bba7e5:

  arm64: defconfig: enable verdin-imx8mm relevant drivers as modules (2022-02-11 16:47:25 +0800)

----------------------------------------------------------------
i.MX defconfig change for 5.18:

- Add a new defconfig for Cortex-M based i.MXRT family.
- A series from Marcel Ziswiler to rebuild arm64 defconfig with
  'savedefconfig', and then enable various relevant options needed by
  Toradex verdin-imx8mm device.

----------------------------------------------------------------
Giulio Benetti (1):
      ARM: imxrt_defconfig: Add i.MXRT family defconfig

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

 arch/arm/configs/imxrt_defconfig |  35 +++++++++++
 arch/arm64/configs/defconfig     | 126 +++++++++++++++++++--------------------
 2 files changed, 96 insertions(+), 65 deletions(-)
 create mode 100644 arch/arm/configs/imxrt_defconfig
