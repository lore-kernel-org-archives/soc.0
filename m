Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37B5C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 09:18:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BB18920671; Tue,  1 Dec 2020 09:18:26 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 094282065C;
	Tue,  1 Dec 2020 09:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606814306;
	bh=x1qHkkWU4/p4llvmBK82TbCwZ2/LJIqHZiVAewVNGxM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=cLggvlMYgRnvSlhXQ529E7DmnNTvSZhsUZkZU+YTAiTyTo0GhtnwX7hLj4TcFaGwy
	 xzgmdTLqbmTkSbUrTjUDkuW+qgphH7lon0fgGPyXKBlv26Z6KGo4it/456r6H7lFow
	 xVgBihyGyJZnbFY8QXTjlqthngsTp4fdIplybBug=
Date: Tue, 1 Dec 2020 17:18:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.10, round 5
Message-ID: <20201201091820.GW4072@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 33d0d843872c5ddbe28457a92fc6f2487315fb9f:

  ARM: dts: imx50-evk: Fix the chip select 1 IOMUX (2020-11-10 10:36:10 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.10-5

for you to fetch changes up to 19ba8fb810c60b46869acc9f455613de454e0fca:

  ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin (2020-12-01 09:20:18 +0800)

----------------------------------------------------------------
i.MX fixes for 5.10, round 5:

- Fix a regression on SoC revision detection with ANATOP, that is
  introduced by commit  4a4fb66119eb ("ARM: imx: Add missing
  of_node_put()").
- Drop PAD_GPIO_6 from imx6qdl-wandboard ENET pin group, as the pin is
  used by camera sensor now.
- Fix I2C3_SCL pinmux on imx6qdl-kontron-samx6i board, so that SoM EEPROM
  can be accessed.

----------------------------------------------------------------
Bernd Bauer (1):
      ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin

Fabio Estevam (1):
      ARM: dts: imx6qdl-wandboard-revd1: Remove PAD_GPIO_6 from enetgrp

Robert Karszniewicz (1):
      ARM: imx: Use correct SRC base address

 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi  | 2 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revd1.dtsi | 1 -
 arch/arm/mach-imx/anatop.c                     | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)
