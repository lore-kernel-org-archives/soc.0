Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66A433B3
	for <soc@lists.linux.dev>; Mon,  6 Apr 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775462593; cv=none; b=sIKZ/yhuTiFfo80IH5YSzmXV5MNxylh+YhjGlaT23H8Qd1aVYNPaRXASCaVyhNPFcgLiG2h71wTbvQitJ0EA6wp1t3mXKSreOGOi612va4TI1g2LzX69V34a8LKWU2ZfnBTy/CEn3CrZy2ta+hiApjqi/hWaCvCqAAlS7zd3iCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775462593; c=relaxed/simple;
	bh=UBbAWCLP+OPvVuBRRyAyxRBi7/x2ZWRCiT2NBEu019I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=XOd9rYZ4OiHT0NHwZNrH9bkevtIG6Ux42xU3SAUFzl1Px8kcQIWbsTm9NTYqENUl7QaG3Rffl/VXzK+54H4q1y82BG0a658p0F2+V3gLOX+qIAX1W+BK0AZYrP+w99E8TQQeY8ucX6ljEq8ftN7WtHta8JXm8thqO9RtmT+1CNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cq2jNlC0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MkRqO+2l; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cq2jNlC0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MkRqO+2l"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 2FE11EC0182;
	Mon,  6 Apr 2026 04:03:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 06 Apr 2026 04:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1775462589; x=1775548989; bh=3c
	meOugMEphXBuwmyGnb+mcI3h3KmzrFdSIkyuCVgGw=; b=cq2jNlC0EeYGO/5H23
	Tx3KoB2q9TA89irBy/8f05s1tnSEQVRHAApMgKbYAUi7xNOh9F7P+nAB1acY7qOa
	72rx0zeI6gtVgqX1KHmVG2eXhaZqB/EnZVRBFJQptWWNZ9WWvLwW4K4mvdw7hW32
	3XVfYf0XknM9sqZr1tZUEaROB99TjEG7zJI72nqOSRQeuiaKfFBHfmnbtQjLkOT+
	sJUSjTpPcus9IDgen+Cj4NaEMEuJ2MnyRtc0JdgyTsXGO8B8PB5a2K6GR1NZ+QmX
	sas7CZX/YT/QGK5jb5l9F+nE4P4uwAYoI02ZqktJjnAJrszXzKUzTlvabHQzUQab
	hXuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1775462589; x=1775548989; bh=3cmeOugMEphXBuwmyGnb+mcI3h3K
	mzrFdSIkyuCVgGw=; b=MkRqO+2l/gMb1QfFGsbbvFi5VYEHvcq453ave/oGxak8
	lERepZlcD3KfmmdpvFuyAkq8qqfHqX67mFn87k9uNWF25MCiblDrH6wD6OAbbffr
	ihCcp6jpaxcwInrPpnVPlHmffIkszsdwpxKUOTPtBBaDZfK9IkhmD3uObUsthU2a
	2sYIttssbASH4vhdGJs3oMZd5ZfVaXq6iBTYfpJDRwXMhiEhgs6PIF85kVkQc7yC
	UKRP2Ie2emhLtVdsO23bQlQYFDv9CYCITmk4Ie0dXnhvp4J/2531tNMMBqAop4yr
	m0848NTVMPBx0tgdyyOk0GPKTFrN7yVgUbAdh4bbJA==
X-ME-Sender: <xms:vGjTaXproQc5NeJ_fAYwY7Fcyqyf1UfuEmHXpAWTzQzw7f3ogMWvcA>
    <xme:vGjTaccyUQKe7cdpkXYX62T8mJpQXcqYVmPHEATVSdaWXQA3rgrcu_S_p7NWffe_c
    cXw-ztJNvkYx6LfFHB5KRHAK2y50TUijX9lO3uOcTbE4xlQ72MurnI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujeduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    dtgeevteevgfeghfdtteehgefghfehhfdvudejheetudejhfektdehleduheehudenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgrnhhkrdhlihdpphgvnhhguhhtrhhonh
    higidruggvpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtth
    hopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhi
    nhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    shhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vGjTaRXL9je3us4yeMc_H9AO0eDGv2bFHt4Z6vCMEvaxPO9dNwwwkQ>
    <xmx:vGjTaYc8EhejjDwg6nOjVOcHdv4DHjblZZoxN9Ex5tJn3-BNrean2A>
    <xmx:vGjTaVuiq7ZZ9EMArwzdJl7P2LtJDihNQKHR5ezcVRAaD7uf22ImqQ>
    <xmx:vGjTaf8Mdxb1_YHTf8V8J2AgVc62CYLUtCuIPMdt-o39QgoCiWqXXA>
    <xmx:vWjTaZ9H3XQKRSyvGB8fWyeTS5yhN2PuMx3Sk15Odfyf9cyA8hb9lJxJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71ABF700065; Mon,  6 Apr 2026 04:03:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:03:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
Subject: [GIT PULL] soc fixes for 7.0, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit df3ef89d7ef8185fa719812e2d175b83112aa315:

  Merge tag 'scmi-fixes-7.0' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2026-03-18 14:06:34 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0-2

for you to fetch changes up to eaad992e3fa8086db47f2cf05498af518ca5edda:

  Merge tag 'at91-fixes-7.0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes (2026-04-04 17:22:39 +0200)

----------------------------------------------------------------
soc fixes for 7.0, part 2

The largest part here are devicetree fixes for Qualcomm, and NXP i.MX,
addressing a few regressions and incorrect settings in board and
SoC pecific dts files. The largest single commits are a revert of
a cleanup patch for i.MX that caused regressions for the NAND
flash controller and a fixup for an incomplete cleanup of the PCIe
controller on Qualcomm platforms that broke because the state was
left incompatible with both the old and new behavior.

On the Rockchips, Hisilicon, Renesas, Allwinner and AT91 platforms,
only a single simple dts bugfix each was added since the last round
of fixes.

On the SoC specific device drivers, everything is relatively harmless:
three reset controller driver fixes, a compatibility for fix ASpeed
soc ID, and error handling fixes for Qualcomm and Microchip. One
regression fix on Qualcomm addresses a problem with a previous fix
for DisplayPort alt mode.

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'renesas-fixes-for-v7.0-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes
      Merge tag 'sunxi-fixes-for-7.0' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-7.0-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Biju Das (1):
      reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string

Chen-Yu Tsai (1):
      arm64: dts: allwinner: sun55i: Fix r-spi DMA

Conor Dooley (1):
      firmware: microchip: fail auto-update probe if no flash found

Daniel J Blueman (1):
      arm64: dts: qcom: hamoa/x1: fix idle exit latency

Felix Gu (2):
      soc: microchip: mpfs-control-scb: Fix resource leak on driver unbind
      soc: microchip: mpfs-mss-top-sysreg: Fix resource leak on driver unbind

Guangshuo Li (1):
      reset: gpio: fix double free in reset_add_gpio_aux_device() error path

Heiko Stuebner (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"

Konrad Dybcio (2):
      soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected edge case
      soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition

Krzysztof Kozlowski (9):
      dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
      Merge tag 'imx-fixes-7.0' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'v7.0-rockchip-dtsfixes1-v2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'reset-fixes-for-v7.0-2' of https://git.pengutronix.de/git/pza/linux into arm/fixes
      Merge tag 'aspeed-7.0-fixes-0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'riscv-soc-fixes-for-v7.0-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'qcom-drivers-fixes-for-7.0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'hisi-dts-fixes-for-7.0' of https://github.com/hisilicon/linux-hisi into arm/fixes
      Merge tag 'at91-fixes-7.0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes

Loic Poulain (2):
      arm64: dts: qcom: monaco: Fix UART10 pinconf
      arm64: dts: qcom: monaco: Reserve full Gunyah metadata region

Luke Wang (1):
      arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD

Marek Vasut (1):
      arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM

Markus Niebel (2):
      arm64: dts: imx91-tqma9131: improve eMMC pad configuration
      arm64: dts: imx93-tqma9352: improve eMMC pad configuration

Max Krummenacher (1):
      Revert "ARM: dts: imx: move nand related property under nand@0"

Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB

Mukesh Ojha (1):
      soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei

Potin Lai (1):
      soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching

Ravi Hothi (1):
      arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity

Sebastian Krzyszkowiak (3):
      arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

Shawn Guo (2):
      arm64: dts: hisilicon: poplar: Correct PCIe reset GPIO polarity
      arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges

Sumit Garg (3):
      dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
      dt-bindings: media: venus: Fix iommus property
      arm64: dts: qcom: agatti: Fix IOMMU DT properties

Yixun Lan (1):
      reset: spacemit: k3: Decouple composite reset lines

Ziyue Zhang (1):
      arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  5 +-
 .../bindings/media/qcom,qcm2290-venus.yaml         |  7 +--
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |  6 +--
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  6 +--
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  6 +--
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     | 12 ++---
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 12 ++---
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  6 +--
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |  8 +--
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  2 +-
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 +++------
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  | 20 ++++----
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  2 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  | 26 +++++-----
 .../boot/dts/hisilicon/hi3798cv200-poplar.dts      |  2 +-
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |  1 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 11 ++--
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  9 +++-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 16 +++---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 24 +++++----
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        | 14 ++---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 14 ++---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 +--
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 +--
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 15 +++---
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++---
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 11 ++++
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      | 18 -------
 drivers/firmware/microchip/mpfs-auto-update.c      | 10 ++--
 drivers/reset/core.c                               |  1 -
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  2 +-
 drivers/reset/spacemit/reset-spacemit-k3.c         | 60 +++++++++++++---------
 drivers/soc/aspeed/aspeed-socinfo.c                |  2 +-
 drivers/soc/microchip/mpfs-control-scb.c           |  6 ++-
 drivers/soc/microchip/mpfs-mss-top-sysreg.c        |  6 ++-
 drivers/soc/qcom/pdr_internal.h                    |  2 +-
 drivers/soc/qcom/pmic_glink_altmode.c              | 39 ++++++++++----
 drivers/soc/qcom/qcom_pdr_msg.c                    |  2 +-
 include/dt-bindings/reset/spacemit,k3-resets.h     | 48 ++++++++++++-----
 include/linux/soc/qcom/pdr.h                       |  1 +
 53 files changed, 271 insertions(+), 271 deletions(-)
