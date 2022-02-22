Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A73C433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9FB7C340EB; Tue, 22 Feb 2022 07:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E34C340F4;
	Tue, 22 Feb 2022 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516370;
	bh=Dd7Il5d/DNf7h0A2IDWNKmkk3GULoV8sDo6NfbLvU0g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNWf20QdQxkloOc3AVeKNrUtzKA3EQ09EAQECxfDChp+Bfs4eCXvx/ylL5uU8jXJK
	 xbwPW1W4Da0AYXIpDRBnPISHO8oUN3LxOPErwXu034sFl9wuOB4/mo3zAcc8fwzOvX
	 zQAbCKhwPol6UvENt+NhEBDvhWBfe+kOvvPBoWKwPT1y+htjbTI5FMgnoBiPe8xwqs
	 5NrymYNA4vcCOu9n4KsvU3sYl5yda+LI6v8IjzjoGuM81j7uqZccoi4ml+SAEI5Xjr
	 UY48DWK1ip5k/zAd9pQqZxL6iCaJKVf8Ri2Ta2CgjZuATnp4Png9hZ/5IdwQCPqXgl
	 HhFmqYzH5jsmg==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 5.18
Date: Tue, 22 Feb 2022 15:52:22 +0800
Message-Id: <20220222075226.160187-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
References: <20220222075226.160187-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.18

for you to fetch changes up to ed2e8e0ad593dc5235aa41fe61bfe0e8c3548ae4:

  ARM: imx: Add initial support for i.MXRT10xx family (2022-01-28 17:46:42 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.18:

- Add initial support for i.MXRT10xx family which features NXP's
  implementation of the Arm Cortex-M7 core and in some case the
  Arm Cortex-M4 core too.

----------------------------------------------------------------
Giulio Benetti (1):
      ARM: imx: Add initial support for i.MXRT10xx family

 arch/arm/mach-imx/Kconfig      |  7 +++++++
 arch/arm/mach-imx/Makefile     |  2 ++
 arch/arm/mach-imx/mach-imxrt.c | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
