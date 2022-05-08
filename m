Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E89C433EF
	for <soc@archiver.kernel.org>; Sun,  8 May 2022 03:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E177C385B1; Sun,  8 May 2022 03:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A976BC385AC;
	Sun,  8 May 2022 03:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651981181;
	bh=nT4mCTC0D2uzd8zPaFE3YrcAVOwKig08D9PLrPnNUng=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FrBORiKODUDvdP3TANyONuZq9sqNeewguHvj4/8pMBxSBMor7eRgqQrfissmO3pr9
	 sZQYcEhqWu6kc7vL5T808fQ1v5xVIs4nAFneqf5+rXUAIxFJBFPEHLBWVoo4VMZDym
	 7sKDGNvyZ1weERkWRSEIRDPjW1apYpEAcdQrZBXKPQkcJCQwNOI3c7LnwaEvalvWID
	 rdgrx66Fn+O1f6eU/22XQ7A/cX3BYxsoa/7YNFzMUE+m+6M7ru4sVxw7sitzA/eUvE
	 mcFwhD4WES1KMLCHkJzDfQDFU45VmhhWLFlAT84XilnNSVUY6RsTxDJOspLwQEKGiQ
	 NaY/A3x5O+Zyg==
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
Subject: [GIT PULL 5/5] i.MX defconfig update for 5.19
Date: Sun,  8 May 2022 11:38:43 +0800
Message-Id: <20220508033843.2773685-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
References: <20220508033843.2773685-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.19

for you to fetch changes up to 080d681bf3c64481425c2f8c6ffdd068c5a806c9:

  arm64: defconfig: Enable the WM8524 codec driver (2022-05-05 10:18:47 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.19:

- Enable the WM8524 codec driver as module in arm64 defconfig for audio
  support on imx8mn-evk board.
- Enable the ADC part of the STMPE MFD in imx_v6_v7_defconfig, as the
  SoM Apalis/Colibri iMX6 use the ADC of a STMPE 811.

----------------------------------------------------------------
Fabio Estevam (1):
      arm64: defconfig: Enable the WM8524 codec driver

Max Krummenacher (1):
      ARM: imx_v6_v7_defconfig: Enable the ADC part of the STMPE MFD

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm64/configs/defconfig         | 1 +
 2 files changed, 2 insertions(+)
