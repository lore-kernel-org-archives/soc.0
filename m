Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A9C433EF
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D222C341CA; Sat,  9 Jul 2022 08:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C6AC341C7;
	Sat,  9 Jul 2022 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355425;
	bh=LymLj6WIv9ORl2RXVnRj+9x+8ynV6NwyG4gYu7OAVhU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IiuTD5TFG4qObLn26ate9jhpTMiWgDpo6DxVfW7frQvWa1uF68t+5gOxAYOcwrcFF
	 pxCfQZ0hTQsn67NUY45bFVArHJg7N3NwWYzqFf97Gdr3OPovHxIYVrPxThnUFADnay
	 e+vYs75lrywd44fHjNrGndSvYc2pJT+PwwEwA/Tk5j7hftfnxOH5xlJsivn+7naxyW
	 B1oHnK8UW6ynApr6WDeQlbVTz91nukvGOPxc+qF+almuJOfBqnPlJi+X8cnhR7H0iT
	 OPxs2v56eQUTZIybhv7caoaNZpvvbiUQhuAdWTg4Azwo3fpmlplx0Yqkqe/9yrcCFs
	 cwmmCqyWrK+Xw==
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
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.20
Date: Sat,  9 Jul 2022 16:29:51 +0800
Message-Id: <20220709082951.15123-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
References: <20220709082951.15123-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.20

for you to fetch changes up to afff3d3aef14c9775a154584a8becce1d33f9446:

  arm64: defconfig: Enable gpio-fan support (2022-06-27 15:38:19 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.20:

- Enable i.MX93 clock and pinctrl driver in arm64 defconfig.
- Enable gpio-fan driver in arm64 defconfig, as it's needed by
  phyBOARD-Polis-i.MX8M Mini board.

----------------------------------------------------------------
Peng Fan (1):
      arm64: defconfig: enable i.MX93 clk & pinctrl

Teresa Remmet (1):
      arm64: defconfig: Enable gpio-fan support

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
