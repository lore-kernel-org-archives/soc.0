Return-Path: <SRS0=FrRY=QO=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97481C3ABA2
	for <soc@archiver.kernel.org>; Mon, 16 Sep 2024 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C0A9C4CEC5; Mon, 16 Sep 2024 16:34:17 +0000 (UTC)
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E01CC4CEC4
	for <soc@kernel.org>; Mon, 16 Sep 2024 16:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E01CC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 7D46D138034D;
	Mon, 16 Sep 2024 12:34:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 16 Sep 2024 12:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726504455;
	 x=1726590855; bh=MF6OSe4OwxwiUUdXA8NPrvTTf2EYnLfaKG5OwH1xAXc=; b=
	dkbxMGvJMJ3CO4NhUdTwPhJ7yt9CGT4CqtGwCFOYASyN60ujHSaWNIu8lqlLYu+v
	W+gMxGZYQYR8Eih2PBi1vDq8lfqp4F+tJiQpsxQd8k7876C3NC6/vVPfcseQlq4x
	YTFegMqhGKbIAtgDlhWcq7++QEFKyAxrJfcrCPoeW6QUfDSpNBh/QyCmCBXd9ooX
	k6xhCN7DpYGYhAuylUVcCL1wNb5g/RXK348Fr4SrqpOesGbQMVGS2yYxtOqCZZFr
	Au3vw44TlWRoWMkadb3l+NaRhI12jav968vnanVlYsveBcTqpvmGGiEaZV0nJPCP
	O0RLX349HesUMks3ROdk1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726504455; x=
	1726590855; bh=MF6OSe4OwxwiUUdXA8NPrvTTf2EYnLfaKG5OwH1xAXc=; b=I
	OvOIvuQ/uVTxf51kB0pkXdSKSHPRAZcYx6xisURTJj6f9AumC5EXi8WXCoPdUXTA
	6DoFpPKxxD/AXWMH55cnBlYuE9Q0Kf1NUQJkKWP/Tk6pkeSWiMhPjoF4TTquEZ1X
	x1zBdmOFjhkXjBDWiFtyd7TAQR90a2T7RQ3FqM4K5+ThEhwapQxorbbNi7o1FMkC
	tOMPvndQEaJLVF3foLO4lBb8cb3+LNuJ1kqOdqfV4zELVOM5nIS0gJZu7WMgZk9f
	gli21lfU38ZSL8yW6BPcjR+b1Nap+z6iOiATSXfBTydGEcWHq66R6dNQWtR5D16P
	yFyhcfFgvFM9NSLB+05dQ==
X-ME-Sender: <xms:B17oZsJzaNJi7OOl9jUZ5OyZdfb-S6tu2RRZDLBbsMGfYYxnEuqCTg>
    <xme:B17oZsKxR6mkgf-HXpd39uIownsjz6949p4FemUeoLVinpEuqBLv9i9FbcsMYWQR-
    Eao1MBXzAPoahmiOuU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekhedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefueegkeffveeugeehieehiedukeegfefhffeu
    tdettdffteeluefhheetkeekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:B17oZstTc4-LGaQEwQlDSlVVSB_ilnxeNi9cqsfq12lxVkTBLZX_Wg>
    <xmx:B17oZpZ7aj-pSSJrXAV3X5rUpn48OGWItxnHFYO2FfrZhwaqTO3XCQ>
    <xmx:B17oZjYn6-nyPl2G-vw_ok2EIQCXgXtDjSGifkCsM1nwUvZ-mSYD7A>
    <xmx:B17oZlDSCFkjpQA8wDW1gUPvIj6pXY7QSUvoeBaaC0Op2UzRdQ1a3Q>
    <xmx:B17oZvEx--8IxqFFBLmMY2LzTPeOla5CLdWCKx7iY4hb3u3xZwQOW4X7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4101D222006F; Mon, 16 Sep 2024 12:34:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 16 Sep 2024 16:33:54 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <4c6e42ce-7919-4031-b2ac-ffa3a10cbaaa@app.fastmail.com>
In-Reply-To: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com>
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: arm platform updates for 6.12
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208=
399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-a=
rm-6.12

for you to fetch changes up to 46d2efc4efc00e09a47e41f753af69a9fe169ec4:

  Merge tag 'arm-soc/for-6.12/soc' of https://github.com/Broadcom/stblin=
ux into soc/arm (2024-09-10 16:39:45 +0000)

----------------------------------------------------------------
soc: arm platform updates for 6.12

Most of these updates are for removing dead code on the Samsung S3C,
NXP i.MX, TI OMAP and  TI DaVinci platforms, though this appears to be
a coincidence. There are also cleanups for the Marvell Orion family and
the Arm integrator series and a Kconfig change for Broadcom.

----------------------------------------------------------------
Andrew Davis (1):
      ARM: orion5x: Switch to new sys-off handler API

Andy Shevchenko (1):
      ARM: omap2: Switch to use kmemdup_array()

Arnd Bergmann (7):
      Merge tag 'integrator-v6.12' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/linusw/linux-integrator into soc/arm
      Merge tag 'omap-for-v6.12/soc-signed' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'davinci-updates-for-v6.12-rc1' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/brgl/linux into soc/arm
      Merge tag 'imx-soc-6.12' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/shawnguo/linux into soc/arm
      Merge tag 'samsung-soc-6.12' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux into soc/arm
      Merge tag 'mvebu-arm-6.12-1' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/gclement/mvebu into soc/arm
      Merge tag 'arm-soc/for-6.12/soc' of https://github.com/Broadcom/st=
blinux into soc/arm

Bartosz Golaszewski (1):
      ARM: davinci: remove unused cpuidle code

Dr. David Alan Gilbert (1):
      ARM: omap1: Remove unused struct 'dma_link_info'

Fabio Estevam (1):
      ARM: mach-imx: imx6sx: Remove Ethernet refclock setting

Florian Fainelli (1):
      ARM: bcm: Select ARM_GIC_V3 for ARCH_BRCMSTB

Gaosheng Cui (6):
      ARM: davinci: remove unused davinci_cfg_reg_list() declaration
      ARM: davinci: remove unused davinci_init_ide() declaration
      ARM: s3c: Remove unused s3c_init_uart_irqs() declaration
      ARM: s3c: remove unused declarations for s3c6400
      ARM: s3c: remove unused s3c2410_cpu_suspend() declaration
      ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h

Krzysztof Kozlowski (2):
      ARM: versatile: fix OF node leak in CPUs prepare
      bus: integrator-lm: fix OF node leak in probe()

Nathan Chancellor (1):
      ARM: imx: Annotate imx7d_enet_init() as __init

Sam Protsenko (1):
      MAINTAINERS: Add entry for Samsung Exynos850 SoC

Uwe Kleine-K=C3=B6nig (3):
      ARM: s3c: Drop explicit initialization of struct i2c_device_id::dr=
iver_data to 0
      ARM: mvebu: Warn about memory chunks too small for DDR training
      ARM: dove: Drop a write-only variable

 MAINTAINERS                                    | 10 +++
 arch/arm/mach-bcm/Kconfig                      |  1 +
 arch/arm/mach-davinci/Makefile                 |  1 -
 arch/arm/mach-davinci/common.h                 |  1 -
 arch/arm/mach-davinci/cpuidle.c                | 99 -------------------=
-------
 arch/arm/mach-davinci/cpuidle.h                | 15 ----
 arch/arm/mach-davinci/devices-da8xx.c          |  1 -
 arch/arm/mach-davinci/mux.h                    |  5 --
 arch/arm/mach-dove/common.c                    |  4 +-
 arch/arm/mach-imx/mach-imx6sx.c                | 22 ------
 arch/arm/mach-imx/mach-imx7d.c                 |  2 +-
 arch/arm/mach-mvebu/board-v7.c                 |  3 +
 arch/arm/mach-omap1/omap-dma.c                 | 13 ----
 arch/arm/mach-omap1/pm.h                       |  4 --
 arch/arm/mach-omap2/omap_device.c              |  2 +-
 arch/arm/mach-orion5x/board-mss2.c             |  2 +-
 arch/arm/mach-orion5x/dns323-setup.c           |  6 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c      |  2 +-
 arch/arm/mach-orion5x/mv2120-setup.c           |  2 +-
 arch/arm/mach-orion5x/net2big-setup.c          |  2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c |  2 +-
 arch/arm/mach-orion5x/ts209-setup.c            |  2 +-
 arch/arm/mach-orion5x/ts409-setup.c            |  2 +-
 arch/arm/mach-s3c/irq-uart-s3c64xx.h           |  2 -
 arch/arm/mach-s3c/mach-crag6410-module.c       |  2 +-
 arch/arm/mach-s3c/pm.h                         |  2 -
 arch/arm/mach-s3c/s3c64xx.h                    | 11 ---
 arch/arm/mach-versatile/platsmp-realview.c     |  1 +
 drivers/bus/arm-integrator-lm.c                |  1 +
 29 files changed, 31 insertions(+), 191 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/cpuidle.c
 delete mode 100644 arch/arm/mach-davinci/cpuidle.h
