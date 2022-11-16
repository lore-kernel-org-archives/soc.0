Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E26CC4332F
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49FD4C43141; Wed, 16 Nov 2022 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F85C43470;
	Wed, 16 Nov 2022 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668589457;
	bh=EMXzPlpQgLLEiUyX+tKzQhN61+m4VaoI4BKG2+qxn+s=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=WN5e1KLe9GjWCuMKWuTDsyw0eLC2aXIJtYvT/fWuS8SH8GNWZD7D8803QMLfyye5n
	 MXeflyi+L90Sz609tIZ9+f8YUkpQ/CM8iN8H0tl/lQq2nDlcMPfcUVp3NbXiTlASTx
	 En1hY4d2EPH99UrI00NvmWeCyvWjcSeIq/7JertiKb/C4TqzFje8igtZ7c+qlnXtjZ
	 ccATjh0UB7PVxazMibbLazwWj/0oyR7wK8gaW6Wyq7cgDXoJAjMbH++O2unbJ9BvzM
	 UZpHdY81/syJP05L0KV5Qlxa3xGDumgczSZYE8e0AwlicHU8+DdiCtfPNo6ZfVGZ+7
	 rnf18b2gji7qA==
Date: Wed, 16 Nov 2022 17:04:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.1, 2nd round
Message-ID: <20221116090402.GA1274@T480>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit d5c921a53c80dfa942f6dff36253db5a50775a5f:

  arm64: dts: ls208xa: specify clock frequencies for the MDIO controllers (2022-10-29 20:31:24 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1-2

for you to fetch changes up to 836fb30949d9edf91d7de696a884ceeae7e426d2:

  soc: imx8m: Enable OCOTP clock before reading the register (2022-11-14 15:52:53 +0800)

----------------------------------------------------------------
i.MX fixes for 6.1, 2nd round:

- Switch to usb-role-switch for fixing USB device mode on
  tqma8mqml-mba8mx board, so that Dual Role is fully functional.
- A series from Marek Vasut to fix dt-schema warning caused by NAND
  controller size-cells.
- Fix file permission of imx93-pinfunc header.
- Enable OCOTP clock in soc-imx8m driver to fix a kexec kernel hang
  issue.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx8mm-tqma8mqml-mba8mx: Fix USB DR

Marek Vasut (3):
      ARM: dts: imx7: Fix NAND controller size-cells
      arm64: dts: imx8mm: Fix NAND controller size-cells
      arm64: dts: imx8mn: Fix NAND controller size-cells

Peng Fan (1):
      arm64: dts: imx93-pinfunc: drop execution permission

Xiaolei Wang (1):
      soc: imx8m: Enable OCOTP clock before reading the register

 arch/arm/boot/dts/imx7s.dtsi                       |  4 +--
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 32 ++++++++++++++++++----
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  4 +--
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx93-pinfunc.h      |  0
 drivers/soc/imx/soc-imx8m.c                        | 11 ++++++++
 6 files changed, 42 insertions(+), 11 deletions(-)
 mode change 100755 => 100644 arch/arm64/boot/dts/freescale/imx93-pinfunc.h
