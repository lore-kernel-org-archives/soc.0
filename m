Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB0C54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 552B3C4339B; Mon, 30 Jan 2023 02:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC03C433D2;
	Mon, 30 Jan 2023 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046410;
	bh=DtL47TFC4GrouvciV0tg7x9E1DuxAhjooC+Q/exTScI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=pY2OWRVicli4qWANVvTojRohuMbbOGTRj+aL9Sz4l31N/1erWKqIz74ZXB16rqHVj
	 ulseTwVJxKSGIepKI0TjAV2xPN0Nvn7lhqqBhkmiP29q7kbwhPjRAAb4XbUsNn8Don
	 /ojrQ1eu/ygFhQ74wsHZbXbzCvO9LeBHIrBDjpZzRu0fsM4kL+TyEW3f7hAWQDhwmp
	 7AyXmBgq2vaNRYj9WBcc+s5Cex7B5JyQIl7M9GAF/o0ccGDEIZUosjnCsEAQK3kXfp
	 UOhua1r1ZzqnD8COulrmAGx4aslvgt08qpX62gwNcIthDNeO8RmDzS3Hr2EKLtaZr1
	 bZ9Wk/Av86bOQ==
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
Subject: [GIT PULL 1/6] i.MX drivers change for 6.3
Date: Mon, 30 Jan 2023 10:39:42 +0800
Message-Id: <20230130023947.11780-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.3

for you to fetch changes up to 9ec590a8a1bbf6610f72124ad79231f2c5875fc9:

  soc: imx: imx8mp-blk-ctrl: set HDMI LCDIF panic read hurry level (2023-01-30 08:48:19 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.3:

- A couple of cleanups to drop device_driver owner setting from i.MX93
  PD and SRC driver.
- A series from Lucas Stach to add high performance PLL clock support
  for imx8mp-blk-ctrl driver.
- A couple of changes to set LCDIF panic read hurry level for i.MX8M
  blk-ctrl drivers.
- Use devm_platform_get_and_ioremap_resource() for imx-weim bus driver.

----------------------------------------------------------------
Deepak R Varma (2):
      soc: imx: imx93-pd: No need to set device_driver owner
      soc: imx: imx93-src: No need to set device_driver owner

Lucas Stach (5):
      soc: imx: add Kconfig symbols for blk-ctrl drivers
      soc: imx: imx8mp-blk-ctrl: add instance specific probe function
      soc: imx: imx8mp-blk-ctrl: expose high performance PLL clock
      soc: imx: imx8m-blk-ctrl: set LCDIF panic read hurry level
      soc: imx: imx8mp-blk-ctrl: set HDMI LCDIF panic read hurry level

Minghao Chi (1):
      bus: imx-weim: use devm_platform_get_and_ioremap_resource()

 drivers/bus/imx-weim.c            |   4 +-
 drivers/soc/imx/Kconfig           |  11 ++++
 drivers/soc/imx/Makefile          |   6 +--
 drivers/soc/imx/imx8m-blk-ctrl.c  |  27 +++++++---
 drivers/soc/imx/imx8mp-blk-ctrl.c | 108 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/imx/imx93-pd.c        |   1 -
 drivers/soc/imx/imx93-src.c       |   1 -
 7 files changed, 144 insertions(+), 14 deletions(-)
