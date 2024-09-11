Return-Path: <SRS0=kYkH=QJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E68CEE49BC
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 15:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8507C4CECF; Wed, 11 Sep 2024 15:09:03 +0000 (UTC)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 902CCC4CEC0
	for <soc@kernel.org>; Wed, 11 Sep 2024 15:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 902CCC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A90D138027C;
	Wed, 11 Sep 2024 11:09:01 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 11 Sep 2024 11:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1726067341; x=1726153741; bh=gG
	gTa6/ZGmF9skvhNmSke6xE7EdaGiXfSGIXx036khY=; b=AzZZzPwgnqx09RqrP8
	Ge31BKd9iMHOivS8g9uh0LDE41u2HMgPYEeq43Q2MA0VnPGhu+lWwdmvluoj0Eo7
	ut5mBfvUKga6MhiLmgQMJGbIIyM1r5AENyqC+QTAVkyoISR4ic5pqlSftD6a7GFB
	XqwwSqH8aTIcLPUgKx7of2E84QyURmttQOY0BqVJ1ZC9O81YMgPJ2XBd0bERwGxo
	sm3qePBP+1Hz65/JtGnXaOw1GU7cu8toSD9uq3T0OpGfVLqtWHbdyN9HN2Q/dALR
	vsrepYFnpJgyDysmSvXA6SK+K/UoyRD5olhn+UaSIcoV+uUBcAqkOmmAZoBHZrO2
	f/Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1726067341; x=1726153741; bh=gGgTa6/ZGmF9s
	kvhNmSke6xE7EdaGiXfSGIXx036khY=; b=rpkV2IIdsWM9YjI4WkNMDGz5FXQsU
	mJm9QLIK8D+/tymB2bDqPbPMsWcQSfPccgI5ZI4vNz3OhYcuqmCG67MMneosU/WG
	IXymFPOOm3zDCro6LzZqATi+n69aQXR5LJ3Un6KWTyOBrT0wu6Wmaw3Ytceo2wer
	00kA6s3WUdvFYudSgKjCkEdDH+4twhBH+3okFOm1OZP9AYcePmXMZTgu4iNUC1wB
	UEh2tRYkJJevt0qXSd4OZ6LQiUr8U5RUI4CiIexj1iwh6VLy0zSK/5rsYnxU6e8j
	H16j5iGyZqT4BJX/q0zPk2cNintzngw2Ecvaa8nc6uU0Cm9plXXPpuVqA==
X-ME-Sender: <xms:jbLhZlYkfUvSL3dNPRRYIayPHOC_KjMmB9hmQxi_TQwPRvRymsS8dQ>
    <xme:jbLhZsbYK-5jJauNcw88tiDjvho5HtC-QePaY2O4_wNO4nGNLsAqWvCNYRGPTr3yn
    v5w321IZTSEkqi6VP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejuddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecu
    hfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvg
    eqnecuggftrfgrthhtvghrnhepudelieegkeevueegtedtjedttdelgeehhfdvhfeuheet
    hfduleffuddvueelveetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhi
    nhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jbLhZn-IVU-qkuMY_s5PykRy_5tdQrpxCkr5XtDaqJ-uGwWuyKb-9w>
    <xmx:jbLhZjqkBNySkfH2z_2lMeIRDWa5ui-qW-8sj-DJ8NLFC7goFhHkhg>
    <xmx:jbLhZgrNQcf9R8CHDhwDvyvOduKfVQW-BYnP8z4aQoFPtxrN2hSvLg>
    <xmx:jbLhZpTlWSeeDa3fdOQHgDxHH7acATWZZFfDnlg5tKlErPt1SSF8nQ>
    <xmx:jbLhZrXpOeh6ayZrVo6EiUP7EkwnKFnfwMui2WIR39wAEUBnT9Yf8-OE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B540222006F; Wed, 11 Sep 2024 11:09:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 11 Sep 2024 15:08:02 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <58c9776e-0e3a-4b00-bea8-47a7bcf2af37@app.fastmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 6.11, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 9cc7b1705141d1a077493dc107ed626e8dc84681:

  Merge tag 'at91-fixes-6.11' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes (2024-08-30 19:52:28 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-3

for you to fetch changes up to 0e7af99aef5f58b4bae00e45fd1c2626a987f7bb:

  Merge tag 'riscv-soc-fixes-for-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes (2024-09-11 08:54:37 +0000)

----------------------------------------------------------------
ARM: SoC fixes for 6.11, part 3

The bulk of the changes this time are for device tree files in the
rockchips platform, addressing correctness issues on individual
boards, plus one change in the rk356x SoC file to make it match
the binding.

The only other changes that came in are

 - a CPU frequencey scaling fix for JH7110 (RISC-V)
 - a build fix for the cznic hwrandom driver
 - a fix for a deadlock in qualcomm uefi secure
   application firmware driver

----------------------------------------------------------------
Alexander Shiyan (1):
      arm64: dts: rockchip: Remove broken tsadc pinctrl binding for rk356x

Arnd Bergmann (4):
      Merge tag 'qcom-drivers-fixes-for-6.11-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'v6.11-rockchip-dtsfixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      platform: cznic: turris-omnia-mcu: fix HW_RANDOM dependency
      Merge tag 'riscv-soc-fixes-for-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes

Cristian Ciocaltea (2):
      dt-bindings: soc: rockchip: Fix compatibles for RK3588 VO{0,1}_GRF
      arm64: dts: rockchip: Fix compatibles for RK3588 VO{0,1}_GRF

Dan Carpenter (1):
      firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()

FUKAUMI Naoki (1):
      arm64: dts: rockchip: fix PMIC interrupt pin in pinctrl for ROCK Pi E

Quentin Schulz (2):
      arm64: dts: rockchip: fix eMMC/SPI corruption when audio has been used on RK3399 Puma
      arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma

Xingyu Wu (1):
      riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz

 .../devicetree/bindings/soc/rockchip/grf.yaml      | 10 +++++-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 36 ++++++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  7 ++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  6 ++--
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  6 ++++
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    |  4 +++
 drivers/platform/cznic/Kconfig                     |  2 +-
 8 files changed, 60 insertions(+), 13 deletions(-)
