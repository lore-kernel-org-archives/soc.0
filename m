Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C9C54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36DFFC433D2; Mon, 30 Jan 2023 02:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89695C433EF;
	Mon, 30 Jan 2023 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046433;
	bh=gxpgfwgvc1n8YSucAeyyHdDK+E/Xh04yIFZUjxj/03Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uFatrkmiN08vPZCUZfr75NCOwGDkYeVQkgf4EBSMf5VxI7uQJFwomVlr1nVzDiaxj
	 0MOxFqAb5tSjl3UyURGK/88R/7fZ3v1G1yY6hEtSJ6ddEvtJhyclIfKZnsFiCqH8JX
	 55LMuPYL74OnrNMRIJoQWQI4c7R11NSLrmfSgaG8KTIrOpzgTxO3FOGWDf3uSin2EC
	 Owe3SLFl4FqJUyer8k91cJSU9+Z9o3NC61rYTjGFwttBps1GOMMs3zWvBm1Z74Uvu/
	 IUmBYw/G+putnd9Drl9wePAEEjOInpNBZM/jRckjot94yoXMy68J0gT5I0zm8OyU6I
	 NGKiJxkvJVfoQ==
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
Subject: [GIT PULL 6/6] i.MX defconfig change for 6.3
Date: Mon, 30 Jan 2023 10:39:47 +0800
Message-Id: <20230130023947.11780-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
References: <20230130023947.11780-1-shawnguo@kernel.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.3

for you to fetch changes up to 06f985d227d079d77426e484c091330209859518:

  ARM: imx_v6_v7_defconfig: Don't enable PROVE_LOCKING (2023-01-26 08:01:14 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.3:

- Drop PROVE_LOCKING option from imx_v6_v7_defconfig.
- Enable i.MX ICC and DEVFREQ driver as they are required by i.MX8MP
  boot.

----------------------------------------------------------------
Mark Brown (1):
      ARM: imx_v6_v7_defconfig: Don't enable PROVE_LOCKING

Peng Fan (1):
      arm64: defconfig: select i.MX ICC and DEVFREQ

 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 arch/arm64/configs/defconfig         | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)
