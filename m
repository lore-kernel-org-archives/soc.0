Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C23CC433F5
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 11:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 236FDC36AED; Thu, 23 Dec 2021 11:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A8C36AE9;
	Thu, 23 Dec 2021 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640259072;
	bh=7OUkM7ukOpxWSNNrSVvs1w6idbP8QPt1sMs/tuBvHdU=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=FiLoWaLKJBovF2GQ8rZRbKI6ynb+OW/QupHnvEhsHUbBfeRFufBrknQm22w7vkmFf
	 8Jo4SsP39ZF+vj2YCfO/ymxS3RUdZcv3RBBn4ILXvIqVTNy4uX6a29WqDQDVb+Y7Nz
	 hPDPauR4L9ds7DkWU/HN6mS8X8JdKfJxdLzy7bdLfWlf8skasv371UWCdQhNsCp+Av
	 N8p/rOClypsYWIfSxCCEuE3kUbwVAJfjnONR6HcdoO8cpRT3b1MkvY7iLyVh8S02Gg
	 K+4+zqcY3T8UpLRqvTxTMKuPuBbFPLuTUYrYkGo1Y4VqYjrtljJkaUJg9sl/5Gfgkh
	 rjZr5FxxxQjpA==
Received: by mail-wm1-f49.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so3071787wmc.2;
        Thu, 23 Dec 2021 03:31:11 -0800 (PST)
X-Gm-Message-State: AOAM532wlqxKsADbigJWwi+33Y27OfHbkoY1FD21wAjY2opVyYcLvPhA
	dgcyszeYjXcPqOlM6n+SmjNAEetA0Lxuizrmljs=
X-Google-Smtp-Source: ABdhPJzfUErPIXWA0gpg7aqAMW2DHIodtZQeuZlszvfmOVsfkRYUvFkZ7JgULPa52TPueyhHrxp0i6yFTh3ZnvFr/2U=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr1386050wma.98.1640259070339;
 Thu, 23 Dec 2021 03:31:10 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 12:30:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
Message-ID: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.16, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c=
:

  Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.16-4

for you to fetch changes up to 7ad8b2fcb8509792a1714d937263aeb5bff4f654:

  Merge tag 'imx-fixes-5.16-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes (2021-12-20 12:37:22 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 5.16, part 4

This is my last set of fixes for 5.16, including

 - multiple code fixes for the op-tee firmware driver

 - Two patches for allwinner SoCs, one fixing the phy mode on
   a board, the other one fixing a driver bug in the "RSB"
   bus driver. This was originally targetted for 5.17, but
   seemed worth moving to 5.16.

 - Two small fixes for devicetree files on i.MX platforms,
   resolving problems with ethernet and i2c.

----------------------------------------------------------------
Handing over to Olof after this one, he can take any further fixes for
both 5.16 and 5.17 until the merge window.

I have tagged the 5.17 branches now, and will send the pull requests
out later today. I only expect a couple of regression fixes to come
in now, so Olof can collect those in a 'late' branch.

       Arnd

Arnd Bergmann (4):
      Merge tag 'fixes-for-v5.16' of
https://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'sunxi-fixes-for-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'sunxi-drivers-for-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'imx-fixes-5.16-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/fixes

Jens Wiklander (1):
      tee: handle lookup of shm with reference count 0

Jernej Skrabec (1):
      bus: sunxi-rsb: Fix shutdown

Martin Haa=C3=9F (1):
      ARM: dts: imx6qdl-wandboard: Fix Ethernet support

Robert Marko (1):
      arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode

Sumit Garg (1):
      tee: optee: Fix incorrect page free bug

Xiaolei Wang (1):
      optee: Suppress false positive kmemleak report in optee_handle_rpc()

Zhang Ying-22455 (1):
      arm64: dts: lx2160a: fix scl-gpios property name

 arch/arm/boot/dts/imx6qdl-wandboard.dtsi           |   1 +
 arch/arm/boot/dts/imx6qp-prtwd3.dts                |   2 +
 arch/arm/boot/dts/imx6ull-pinfunc.h                |   2 +-
 arch/arm/boot/dts/ls1021a-tsn.dts                  |   2 +
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |   2 -
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    |   4 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   2 -
 drivers/bus/sunxi-rsb.c                            |   8 +-
 drivers/soc/imx/imx8m-blk-ctrl.c                   |  19 +++
 drivers/soc/imx/soc-imx.c                          |   4 +
 drivers/tee/optee/core.c                           |   6 +-
 drivers/tee/optee/smc_abi.c                        |   2 +
 drivers/tee/tee_shm.c                              | 174 ++++++++---------=
----
 include/linux/tee_drv.h                            |   4 +-
 16 files changed, 112 insertions(+), 126 deletions(-)
