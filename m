Return-Path: <SRS0=nhxC=AJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF71C6FD18
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D216FC4339C; Tue, 18 Apr 2023 15:21:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD991C433EF
	for <soc@kernel.org>; Tue, 18 Apr 2023 15:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD991C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B2F165C0038;
	Tue, 18 Apr 2023 11:21:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 18 Apr 2023 11:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1681831260; x=1681917660; bh=HBwXZ4le8QfZFyKH909+R6NwS
	d4X3N60Ze2MtxIZhGM=; b=ZBs79K+m4tKxaUOUbVkn9ifoiJu3JGUeXoHFnPIuu
	XIwqBJ3IX2Qfh9KNldMXPbIPK+v+1Ys6/LZ1nuyslENltP1hSOciObP5WH4+2ovn
	1CZwAZcL+Li5iT9K0kFpM5MRuPXo7qIUGbDhtQVMUGbr6luG/mA7TE65+wwQpqzF
	VV1a1o78M9kuX2TIaMmQVGXSEhSrjt2Cvru5RjgvuBSU11i9zYQCB/lY++Izke4s
	IqOWR9ngr2mQpnET0UAe0j07ynOIcUxNDjmJCeMUKkhYNKxDy+JnnKD8/ZB2ACVc
	LBxGUtEVbNGO3eCpNm3RrxnCvtAfRzybziKdE1t741lyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681831260; x=1681917660; bh=HBwXZ4le8QfZFyKH909+R6NwSd4X3N60Ze2
	MtxIZhGM=; b=iU6buSCtWjGwcrAOw+O1jbwGFiBQB/+4yv4MKo0yzD4xjSR/l6l
	n8Qg975+gOksNbysMXpp7oPIKluZAkqWIXmRyZBF7RgVBC+YHL10dQ6xeXHi1EuA
	Mc5aAjB1H3lDa4c+L7lD0q4FhMGAssg05dKpNVVWDHeXaunyv2fg1ZivFAJSpuUB
	Zjv7ojSxX+rS+lCOcGEcrMvSdJ7tUbPUp2HgeAvNojqeGvILZHzXgYQnLwXVkDnE
	Dyk90UIh6SQgeMAAcZ4QGEGpvPDP25EZahishusBq7ezJLHBUtjfbCMo8QTMHtSk
	wE9OcQ4M1VfccBvit4oifoQ3qLfXV8qjSdQ==
X-ME-Sender: <xms:XLU-ZCqWeNmgwIb4HsRU8d-Ny6ya8OMuA6bwZa5xcQ5lUcAKcphQ7Q>
    <xme:XLU-ZArI7xFET4UwDwpF4mt7eLcGT_47l5UV54SrrpEKB9kbInK5hEAOGosOHVi1-
    staUr3uAa8cy_lFUw0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelkedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnheptdelhfekvddvtefhueetkeehtedtvdevledtfffhjeduffehleeileehveejjeek
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhhinhgrrhhordhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvg
X-ME-Proxy: <xmx:XLU-ZHOAaR1dXejnktZeo5X44o-iNcHsUOKcZUUHX_Lm526B1DznZg>
    <xmx:XLU-ZB5vOrjWCWNl6BW-wamrgSQ3-JPiIVWdLNE9m3g_h7KRrpefVQ>
    <xmx:XLU-ZB4IoqBa3SFjEPrJHn08ab4U6cgPJ4-xWuxRifUeB3E4G7YpzQ>
    <xmx:XLU-ZDQAOdesU8S8FScWR-BoKllrOl7Cwi3xUMCG31h-30aHmfkqwQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 711AFB60086; Tue, 18 Apr 2023 11:21:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <bf8a1e1d-c8d0-4082-a262-6e6dc75c47a7@app.fastmail.com>
Date: Tue, 18 Apr 2023 17:20:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: SoC fixes for 6.3, part 3
Content-Type: text/plain

The following changes since commit 7e364e56293bb98cae1b55fd835f5991c4e96e7d:

  Linux 6.3-rc5 (2023-04-02 14:29:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-3

for you to fetch changes up to d75eecc3d170d8963ae554a774b8af1f4e1246da:

  Merge tag 'qcom-arm64-fixes-for-6.3-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2023-04-14 13:52:48 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 6.3, part 3

There are a number of updates for devicetree files for Qualcomm,
Rockchips, and NXP i.MX platforms, addressing mistakes in the DT
contents:

 - Wrong GPIO polarity on some boards

 - Lower SD card interface speed for better stability

 - Incorrect power supply, clock, pmic, cache properties

 - Disable broken hbr3 on sc7280-herobrine

 - Devicetree warning fixes

The only other changes are:

 - A regression fix for the Amlogic performance monitoring unit driver,
   along with two related DT changes.

 - imx_v6_v7_defconfig enables PCI support again.

 - Trivial fixes for tee, optee and psci firmware drivers, addressing
   compiler warning and error output

----------------------------------------------------------------
Abhinav Kumar (1):
      arm64: dts: qcom: sc7280: remove hbr3 support on herobrine boards

Alexander Stein (1):
      arm64: dts: imx8mp: fix address length for LCDIF2

Arnd Bergmann (7):
      Merge tag 'optee-fix-for-v6.3' of https://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'amlogic-fixes-v6.3-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into arm/fixes
      Merge tag 'tee-fix-for-v6.3' of https://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes
      Merge tag 'imx-fixes-6.3-2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes
      Merge tag 'riscv-dt-fixes-for-v6.3-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'v6.3-rockchip-dtsfixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-6.3-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Chris Morgan (1):
      arm64: dts: rockchip: Add clk_rtc_32k to Anbernic xx3 Devices

Dan Johansen (2):
      arm64: dts: rockchip: Lower sd speed on rk3566-soquartz
      arm64: dts: rockchip: Lower SD card speed on rk3399 Pinebook Pro

Dmitry Baryshkov (2):
      arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
      arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node

Fabio Estevam (3):
      ARM: dts: imx7d-remarkable2: Remove unnecessary #address-cells/#size-cells
      ARM: dts: imx6ull-colibri: Remove unnecessary #address-cells/#size-cells
      ARM: imx_v6_v7_defconfig: Fix unintentional disablement of PCI

Javier Martinez Canillas (1):
      arm64: dts: rockchip: Remove non-existing pwm-delay-us property

Jianqun Xu (1):
      ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers
      firmware/psci: demote suspend-mode warning to info level

Jules Maselbas (1):
      tee: optee: Fix typo Unuspported -> Unsupported

Krzysztof Kozlowski (8):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sdm850-samsung-w737: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: sm8250-mtp: Use proper WSA881x shutdown GPIO polarity
      arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO polarity
      riscv: dts: canaan: drop invalid spi-max-frequency
      arm64: dts: rockchip: use just "port" in panel on Pinebook Pro
      arm64: dts: rockchip: use just "port" in panel on RockPro64
      arm64: dts: rockchip: correct panel supplies on some rk3326 boards

Linus Walleij (1):
      tee: Pass a pointer to virt_to_page()

Marc Gonzalez (3):
      arm64: dts: meson-g12-common: specify full DMC range
      arm64: dts: meson-g12-common: resolve conflict between canvas & pmu
      perf/amlogic: adjust register offsets

Peng Fan (3):
      arm64: dts: imx8mm-evk: correct pmic clock source
      arm64: dts: imx8mm-verdin: correct off-on-delay
      arm64: dts: imx8mp-verdin: correct off-on-delay

Rob Herring (1):
      arm64: dts: rockchip: Fix rk3399 GICv3 ITS node name

Sebastian Reichel (1):
      arm64: dts: rockchip: add rk3588 cache level information

 arch/arm/boot/dts/imx6ull-colibri.dtsi             | 12 ++------
 arch/arm/boot/dts/imx7d-remarkable2.dts            |  2 --
 arch/arm/boot/dts/rk3288.dtsi                      |  2 +-
 arch/arm/configs/imx_v6_v7_defconfig               |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 15 +++++-----
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  4 +--
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  4 +--
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |  4 +--
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         |  4 +--
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  4 +--
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |  5 ++--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +--
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |  4 +--
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dts   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi |  2 --
 .../boot/dts/rockchip/rk3326-odroid-go2-v11.dts    |  2 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  2 ++
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |  1 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  1 -
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  1 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      | 18 +++---------
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 12 ++------
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi  |  6 ++--
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |  6 ++--
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |  9 ++++++
 arch/riscv/boot/dts/canaan/k210.dtsi               |  1 -
 drivers/firmware/psci/psci.c                       |  3 +-
 drivers/perf/amlogic/meson_g12_ddr_pmu.c           | 34 +++++++++++-----------
 drivers/tee/optee/call.c                           |  2 +-
 drivers/tee/tee_shm.c                              |  2 +-
 37 files changed, 88 insertions(+), 98 deletions(-)
