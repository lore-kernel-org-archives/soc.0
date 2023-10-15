Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B8BCDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 09:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6754EC433C8; Sun, 15 Oct 2023 09:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52D1C433C7;
	Sun, 15 Oct 2023 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697360534;
	bh=iunIHqaRPUsavc8QFp9OUUmXqvt+3yHTBaegKLlr+fI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=pkX41C9r81yl8tYBzcDmZaETs1ap9IH8Tgt3J5oL3BulhGbfLJffEFUoYY2sGC6hn
	 9Q2LSBWVJIN+PxJYhcrnWNDvy/b5Uqlz/ySmzVVa8ohqrKnJa3s8NX2LrqbYO66Ljm
	 VNbQ+ZWPaBCB+J/BjLrdraBDsl5nOB3/LG+YHLpkM2/OunraKpQHfYnDa3hxxUKQ+8
	 MVdFSAfmYekmcB++VzJqlGONF1Q2KemSb7PyV9zDoRrwpSGq6hRhOma1URA00aBtcK
	 pd6BvufEzy7z9L5AYShBmopmYZ/fhbWEZpPHtKo3KSaPASU/eC+KcqV83m3AEEy5tl
	 MHz+Ur2Kii2nw==
Date: Sun, 15 Oct 2023 17:02:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.6, round 2
Message-ID: <20231015090202.GW819755@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f09752eaf0e8f8befc26b44c4d3e15633e56d16a:

  arm64: dts: imx: Add imx8mm-prt8mm.dtb to build (2023-09-25 10:19:52 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.6-2

for you to fetch changes up to 1558b1a8dd388f5fcc3abc1e24de854a295044c3:

  firmware/imx-dsp: Fix use_after_free in imx_dsp_setup_channels() (2023-10-10 10:30:29 +0800)

----------------------------------------------------------------
i.MX fixes for 6.6, round 2:

- Fix an use_after_free bug in imx_dsp_setup_channels() that is
  introduced by commit e527adfb9b7d ("firmware: imx-dsp: Fix an error
  handling path in imx_dsp_setup_channels()")

----------------------------------------------------------------
Hao Ge (1):
      firmware/imx-dsp: Fix use_after_free in imx_dsp_setup_channels()

 drivers/firmware/imx/imx-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
