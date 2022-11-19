Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F51AC4332F
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35B21C43470; Sat, 19 Nov 2022 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADFFC433D6;
	Sat, 19 Nov 2022 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862688;
	bh=yPYkPXLNeNGj8u0l5PhIa1TCDYxE4MsJv8jk5gd8fe0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebU6ED0iqdjn4/e/9HzORhdDlcJVTnK4neFYQsK66s0VwohQ7nsaHsY7KOkmuU8a/
	 aJufbsVJiluvFg6YLLBkmiY5FdhX5a2Rh9pGSY+2gs3edXcxiw1VKvbdSyL8CAHLKh
	 eOzUFaTcq2bblDTV6gWNPjUrF+LhSJuMVdaph5mYfIu6pZqL4C2lWubqoi+OtwZir7
	 jSe7E6NzoQqXBHGkGwR1lVwNne2Mcm4+4zI5piM7meH7EMfqy5xDEvCKlk6tbeS8Bk
	 y3+LP5VxBQf9VVY9q6aJt+aYpenECYs8A6VlQJvRfHOY1+pyGH5o209BVEgxI9PCnF
	 0KLs1jNrjc+CQ==
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
Subject: [GIT PULL 2/6] i.MX SoC change for 6.2
Date: Sat, 19 Nov 2022 20:57:29 +0800
Message-Id: <20221119125733.32719-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
References: <20221119125733.32719-1-shawnguo@kernel.org>

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.2

for you to fetch changes up to 72684faf703cbb12ec944df91f45949973f2d6f7:

  ARM: imx3: Remove unneeded #include <linux/pinctrl/machine.h> (2022-11-11 15:04:15 +0800)

----------------------------------------------------------------
i.MX SoC change for 6.2:

- A couple of cleanups from Geert Uytterhoeven to drop unneeded include
  of pinctrl machine header from i.MX3 and MXS code.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: mxs: Remove unneeded #include <linux/pinctrl/consumer.h>
      ARM: imx3: Remove unneeded #include <linux/pinctrl/machine.h>

 arch/arm/mach-imx/mm-imx3.c  | 1 -
 arch/arm/mach-mxs/mach-mxs.c | 1 -
 2 files changed, 2 deletions(-)
