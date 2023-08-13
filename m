Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C225EB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E33B4C433CA; Sun, 13 Aug 2023 13:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3C0C433C8;
	Sun, 13 Aug 2023 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933678;
	bh=tA1z1RTC+VaturzrJNTvQEgd7qbUbPptwVXEek4u26Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFX8+vFdcclMA882qMQe4gjpCN0GC7fMGWkHthqV+YOLrGtx4lmxwAseneDUnSdvG
	 hdIVKMlMXTRNOW6vNdfFt2YGM/4aG081qyF+DG4+9fsSzAsZpPMoQ1PdVhFxOq6vCf
	 mpoh3ctnCMOYDkhRtEaGrSqmx2jk8y9LhFktuQ+P5vdPhDwutBS/ePLsowhkpG5SjS
	 b5zgAoZVcTzuS8ADVrZmAtRzkEKLNd/OKO57akEDizDbP7vcNznNjRdU74IptUlBqE
	 XAxG/JuwjQ0x8zlPNWK9tJ5jOd3GG2oNuJSwoMXn8YB/QekDumqAoPegZINEtA0Mt8
	 ZBMNUL4gJNevg==
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
Subject: [GIT PULL 6/6] i.MX defconfig change for 6.6
Date: Sun, 13 Aug 2023 21:33:54 +0800
Message-Id: <20230813133354.847010-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
References: <20230813133354.847010-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.6

for you to fetch changes up to 95afa02c9e42cdbc2f91dc0f64e59ea10d710a4f:

  arm64: defconfig: Enable Redpine 91X wlan driver (2023-08-12 10:00:25 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.6:

- Enable i.MX93 device drivers in arm64 defconfig.
- Enable Redpine 91X WLAN and NXP UART Bluetooth driver.
- Enable DRM_IMX_LCDIF, IMX_REMOTEPROC and RPMSG_VIRTIO drivers.
- Enable SL28VPD NVMEM layout support.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable i.MX93 devices

Fabio Estevam (1):
      arm64: defconfig: Enable CONFIG_DRM_IMX_LCDIF

Guido Günther (1):
      arm64: defconfig: Enable Redpine 91X wlan driver

Marcel Ziswiler (1):
      arm64: defconfig: enable driver for bluetooth nxp uart

Michael Walle (1):
      arm64: defconfig: enable SL28VPD NVMEM layout

Peng Fan (1):
      arm64: defconfig: select IMX_REMOTEPROC and RPMSG_VIRTIO

 arch/arm64/configs/defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
