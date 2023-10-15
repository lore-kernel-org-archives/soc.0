Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF827CDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3847C433CA; Sun, 15 Oct 2023 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2218FC433C7;
	Sun, 15 Oct 2023 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697376225;
	bh=PzYIh5x4stgxeOhHQOki/wbHVz41qHzFHJHGdIOAtsU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JQwR453FEfsrTi+mjFxPluWuMRUNMxJrMTZNDL+DZZUaT04NbTIrFT0NjjqRM+mcr
	 hk30GrlUGV6j42z/r+FAbtNS0IKbspAEzX0gM8vGr9KoxHUscBwAIODwyw2YTtNuDc
	 RPz+usxkAfVAoF8oGD8HkSNqd0/WBz8SS7fG+rM2csSBQUKVFIpQE/Ndab3aMSqRNL
	 e9IlPOMQEMlDvPT9JIfoSn/qBeKbii3DMvhFK7x5aMCJ8TLai2Otno08eZ5UeLXov7
	 qPLxlTUxRWMFrWZ6R8AG7BB+enYRFzZHBkg6GYLvTkiWwmCzVRJLf2e4I/T4vrgAa2
	 0nkVwHypq638g==
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
Subject: [GIT PULL 4/4] i.MX defconfig changes for 6.7
Date: Sun, 15 Oct 2023 21:23:00 +0800
Message-Id: <20231015132300.2268016-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231015132300.2268016-1-shawnguo@kernel.org>
References: <20231015132300.2268016-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.7

for you to fetch changes up to f5f1783784193feee847071ce1443545b53da3d4:

  arm64: defconfig: Enable Samsung DSIM driver (2023-09-25 08:19:51 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.7:

- Enable Samsung DSIM DRM bridge driver and USB mass storage support
  in arm64 defconfig

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable Samsung DSIM driver

Fabio Estevam (1):
      arm64: defconfig: Enable CONFIG_USB_MASS_STORAGE

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
