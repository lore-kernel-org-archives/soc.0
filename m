Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8417DC433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C4D4C36AE1; Sat, 18 Dec 2021 07:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82795C36AE9;
	Sat, 18 Dec 2021 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811703;
	bh=6N78ZtztZy2kuwi6cn3yd73yImKWCePSoI0jWLQaSbA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eOWjqsyaNyB7adM4WR0ZNY7LUK9nMRUnEVJB0kh77iMq22MFhZVz4asDhO4etNsGc
	 WNuAjnVXdg1OcmvZJ/4k3IPEiln8NmcuYgIYfDKJTL5zcAWDd0qtyPbgwT4A05yClG
	 zfqBvSujC0gJSJFNn8BnXlycDKamWtz8bvo5+2IpyK7va9BGOLXftRwNLhfr0P0Uhc
	 BBsABacf7YyOc8VpXkXXnmyEusIfvOCiVNFxyLt4p/kMDBRKXs8+RZ6lrZZqZMajqK
	 ySCHDEc5QlFl8D5WEG9DrBCcnF69/TnrKiurUVVNUq2mCwNKyW9i9uwT68YBdK0/KW
	 sGKu2IzwVDqTQ==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 5.17
Date: Sat, 18 Dec 2021 15:14:23 +0800
Message-Id: <20211218071427.26745-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
References: <20211218071427.26745-1-shawnguo@kernel.org>

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.17

for you to fetch changes up to b0100bce4ff82ec1ccd3c1f3d339fd2df6a81784:

  ARM: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART (2021-11-21 16:45:16 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.17:

- A couple of cleanups from Lukas Bulwahn to remove left-over from
  i.MX{27,31,35} board file removal, and rename DEBUG_IMX21_IMX27_UART
  to DEBUG_IMX27_UART.

----------------------------------------------------------------
Lukas Bulwahn (2):
      ARM: imx: remove dead left-over from i.MX{27,31,35} removal
      ARM: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART

 arch/arm/Kconfig.debug            | 14 +++++++-------
 arch/arm/include/debug/imx-uart.h | 18 +++++++++---------
 arch/arm/mach-imx/Kconfig         | 12 ------------
 arch/arm/mach-imx/Makefile        |  2 --
 4 files changed, 16 insertions(+), 30 deletions(-)
