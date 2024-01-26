Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07757C47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 18:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98BD7C43390; Fri, 26 Jan 2024 18:22:28 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD4DCC433F1
	for <soc@kernel.org>; Fri, 26 Jan 2024 18:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD4DCC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 52AC63200B16;
	Fri, 26 Jan 2024 13:22:25 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 13:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1706293344; x=1706379744; bh=QMPmaKyxvSEr5qcv2uqrMQvVfbkeAOpf
	YJLC3w8JdPs=; b=NAgWPxYqN9rNuKlwjJGgRgtTofVW9UotWFXjm5NK9dThpeBT
	UJJ18uc/QER5yZ/1nYX5ibHjkkaeT496FpS1FH1nD7m69p9VCn2aOYac1H9GlZ1n
	55QISON9KZhAFG5BqEyD76S2CBsYSWwTc5yCPxWgPlku+HdC4gFj/fT1R31xa+Lu
	wfrslTEacuMdGw9Popgik+x3ar7rbvA/SSNhFLqpZzzP3x+JvaBVK+gLAvbpffuX
	AkvtFTGo9nm8YmMDpHk8Zeuy4tuT+G/3IVFPXmpEwXsPUq0c0KxDdUQSn9IzVYqn
	KrSrlWDu1c6v9pAdLZ7/7lkpeOTpl9MMuuD5VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1706293344; x=1706379744; bh=QMPmaKyxvSEr5qcv2uqrMQvVfbkeAOpfYJL
	C3w8JdPs=; b=hvQittG39kwJzPBOsTke5fQAHTlVuPM2A/n13NP2KakWLhUlJQJ
	SKgr871gL/w0eXDdqGrz0v5tBH0OkpWhFtgWTgcZedbgLFqxWf35ml7qSvLPlMX0
	pFI0HXDNPegSRFJj0s3yCyWvm6uv8EuGNbNnOFj3wnkZOSHMVQ8Zvu1iakDuucPF
	AZuIDEQwB0fLGvYDyE9hwc4jJ3w3PkGd8dXdqGjl9xbemRcP4xRmfbSSpi2oH7iU
	2Awj4cXaHZSiWQu94fW147mw0uMcOJ/Lq95uCcbHxWFz2LdQ9LL2sxZBVuyxqsr+
	x7h5WZnilbj85nYs+545aqUjXpvVxOfNfWg==
X-ME-Sender: <xms:YPizZTgzkb13Izv0uBPfRWve166gbhLkF8nZLOn9DWkMaK_YEf0-dg>
    <xme:YPizZQA7bTpkRitieoeDsu77OIEwMqNL7m0K0F9D2bJ1JYIfY32f1OM1IXyz9rRAV
    QoH0cBDk_oxQtYUU5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeljedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeeffeeuhfekjeevtddvtdelledttddtjeegvdfhtdduvdfhueekudeihfejtefg
    ieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YPizZTF35F5-Pei1QQADnzTMMVGOaYlrWLhW0gPkjW-9nFxsKTp-eg>
    <xmx:YPizZQQybE41rHZAq42DnXjOjuBq2RHsY109CouRABu7pt8PreGxrA>
    <xmx:YPizZQyo9GgonHOKTZbD3DfpHLNJhN7V4JhyH2Fnea8A9mYERUwKCg>
    <xmx:YPizZdr57SBBMnvS2mnfRqP_wqAAmFpZbDogyFFHJaHY3HHErkjb0A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8171FB6008D; Fri, 26 Jan 2024 13:22:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <26b37af5-7611-4a96-a324-427927cc6ad3@app.fastmail.com>
Date: Fri, 26 Jan 2024 19:22:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [GIT PULL] Arm SoC fixes for 6.8, part 1
Content-Type: text/plain

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.8-1

for you to fetch changes up to 1f4a994be2c3d13852fd5c1054f292bd303352cc:

  riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint format (2024-01-26 13:33:52 +0100)

----------------------------------------------------------------
Arm SoC fixes for 6.8, part 1

There are a couple of devicetree fixes for samsung, riscv/sophgo, and for
TPM device nodes on a couple of platforms.

Both the Arm FF-A and the SCMI firmware drivers get a number of code fixes,
addressing minor implementation bugs and compatibility with firmware
implementations. Most of these bugs relate to the usage of xarray and
rwlock structures and are fixed by Cristian Marussi.

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'scmi-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'ffa-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes
      Merge tag 'samsung-fixes-6.8' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into arm/fixes

Artur Weber (1):
      ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd

Cristian Marussi (11):
      firmware: arm_scmi: Check mailbox/SMT channel for consistency
      firmware: arm_scmi: Use xa_insert() to store opps
      firmware: arm_scmi: Use xa_insert() when saving raw queues
      firmware: arm_scmi: Fix the clock protocol version for v3.2
      firmware: arm_scmi: Fix the clock protocol supported version
      firmware: arm_ffa: Add missing rwlock_init() in ffa_setup_partitions()
      firmware: arm_ffa: Add missing rwlock_init() for the driver partition
      firmware: arm_ffa: Check xa_load() return value
      firmware: arm_ffa: Simplify ffa_partitions_cleanup()
      firmware: arm_ffa: Use xa_insert() and check for result
      firmware: arm_ffa: Handle partitions setup failures

Inochi Amaoto (1):
      riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint format

Lukas Wunner (2):
      ARM: dts: Fix TPM schema violations
      arm64: dts: Fix TPM schema violations

Tanzir Hasan (1):
      firmware: arm_scmi: Replace asm-generic/bug.h with linux/bug.h

Tudor Ambarus (1):
      arm64: dts: exynos: gs101: comply with the new cmu_misc clock names

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts   |  4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts    |  4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts           |  2 +-
 arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts        |  2 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi               |  1 +
 arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi    |  2 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                 |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts     |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts       |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi               |  2 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi             |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts              |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi         |  2 +-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi                       | 80 +++++++++++++++++++++++++++++++++++++++--------------------------
 drivers/firmware/arm_ffa/driver.c                            | 85 +++++++++++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/firmware/arm_scmi/clock.c                            |  5 ++---
 drivers/firmware/arm_scmi/common.h                           |  1 +
 drivers/firmware/arm_scmi/mailbox.c                          | 14 ++++++++++++
 drivers/firmware/arm_scmi/perf.c                             | 23 ++++++++++++++-----
 drivers/firmware/arm_scmi/raw_mode.c                         | 12 ++++++----
 drivers/firmware/arm_scmi/shmem.c                            |  8 ++++++-
 29 files changed, 179 insertions(+), 96 deletions(-)
