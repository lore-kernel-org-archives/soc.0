Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C1FC77B7A
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 07:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCEE0C433A1; Sat, 10 Jun 2023 07:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF335C433A0;
	Sat, 10 Jun 2023 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686381969;
	bh=p+nRhpc9zWY4pnnMgcHHAB8s4dNUWkJuIOvjwfbhiXg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IpbGgs4SIAwjIp9S7/u7yOxg5Hs4mr8B7X8MPrFWcilGYmTCYTaLNc+Dur1DKtPNz
	 IgCKES1MQmlsFZnyEi9+EgmY2QIKLdGYoeD1ooevDRIBIotDcNywOzXU/UrgcB+N7k
	 HdKDheMYYYBhGN7D8XZRBaSK3ewflnd7gFlZjvuTopA0iM1AHXL2D1LFkdPlVR3gen
	 YRBTMf3NfFppB5TkF+HSr2Du0uN7SGUte1bW9caFohqY48WYVXx1dNZkhYmf7QCdHi
	 YXvPVRuKp1qlXaJbdKIPYE5AC1Sw1a9y5YjxYYyWYrc4ZpiK+4SaUsJ3vQrRW25w3Y
	 iOvXwheFSFceg==
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
Subject: [GIT PULL 4/4] i.MX defconfig changes for 6.5
Date: Sat, 10 Jun 2023 15:25:30 +0800
Message-Id: <20230610072530.418847-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230610072530.418847-1-shawnguo@kernel.org>
References: <20230610072530.418847-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.5

for you to fetch changes up to 773887a41b9c26b0d1afccd51080635a976b867c:

  arm64: defconfig: Enable the TI SN65DSI83 driver (2023-06-04 21:11:14 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.5:

- Remove KERNEL_LZO and FW_LOADER_USER_HELPER from imx_v6_v7_defconfig.
- Enable i.MX8M video capture drivers and TI SN65DSI83 driver for arm64
  defconfig.

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable video capture drivers on imx8mm/imx8mn

Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Remove firmware loader helper
      arm64: defconfig: Enable the TI SN65DSI83 driver

Otavio Salvador (1):
      ARM: imx_v6_v7_defconfig: Remove KERNEL_LZO config

 arch/arm/configs/imx_v6_v7_defconfig | 3 ---
 arch/arm64/configs/defconfig         | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)
