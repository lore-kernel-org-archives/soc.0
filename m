Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4247B47A0D5
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007356; cv=none; b=gNrcC/ZmyxoMPRgeCP5v2nl8gVO+rnicfC+AoigYseunasy1pp/pXen5V0qKICRW2SdDS80F+qDBlu/+U5D+iyvhnyxGKK/38atZN5QKcP7lvqZ7W+pe3Rv2MNov4sVqy6OEvtrJgqKD4J9Oahx8Chx7DaHeM7lQ9zNouFZ3PLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007356; c=relaxed/simple;
	bh=2JwymPNTQy0jjs0D55SBYOLNZ+OJOI30HCEvnGLUvG4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=mUpAMXBcxlUVzAhEroVIElrgPg0CgZfkP9sqUWukeOe5Npclq1UVZMjamMf6fpVHn92Fm6dYG26h9KefJ7QWQfPfsdGZbSTgH313CgTVinNG+QUt9JXnFRSHUXD7gBbgLvx7ai0a88WdAp8+v/oiDt1YlP/hRZJmWTkA5W1Jpks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BgsOwEYp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=asRfcDOR; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BgsOwEYp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="asRfcDOR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 561D7EC0223;
	Wed, 21 Jan 2026 09:55:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 21 Jan 2026 09:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1769007353; x=1769093753; bh=yQ
	23YRgS2KiITA/RkEwSXOJ7lbiLq2Dr+pqkiKDbtJY=; b=BgsOwEYpeiSTT3qAl1
	ykpeG1oIXzAHdDrRWKv85WG2VL5enmlkqAUFoOlo7kLL2mwE/8hz6+QSB2UjLWBS
	TWoEQHGIUaStMgakpRpz7jjQOHuUZk60eQyibgRYSUFbup/HEUZihZEx+qVpQY+6
	ixZrOgym4P0SnX91Id4rzO6k0DirBNQQpK+udrEJkRSN0fGSsSQtxYUDHhmfGkLX
	HM2WMObC5HI8b4tw8/FpGyZvVUZjNwPQcoDKbG1226ommejYHWGupninDzxvxr0w
	R/nU6lRxI+E3hNo0G0rLVXkNT998B4gcixu5JPWiQqVtLYser1lme1aevHystFzp
	rC5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1769007353; x=1769093753; bh=yQ23YRgS2KiITA/RkEwSXOJ7lbiL
	q2Dr+pqkiKDbtJY=; b=asRfcDORrFMIiWkH+hq0/RUToZsj2tQtRbqVt4+ZK9Tp
	s8rY6/AG6ylDh1mx4o3pEgQoLVY/7zsWESAMsFakQhHoBLn3dbHN95zpXny/Bw+2
	DEpwqaxttVJvJVdWusKQ+0M5RorFY1thv4vuJ7Ed18NwUTj5vRw6gE7TdFBUDHC9
	fdpgIvNsuQl+NEy2mjBtvvF3ZFXw7jJWlOKQiO2H2Poyv0VicKgKcY039tx3cW88
	9flZbYb1O9g+BZMtauxE9GUCikkgVVQKGZpwBwRV17o1BPVWPKJeVZNUNFbXwsYG
	g9Ia/GdulvSrmBs28fGYJbI0dkUpgulT+0Z75JxMyA==
X-ME-Sender: <xms:-OhwadYt1Cc8YYQpFupMSnpWSyV5xZjRElfn2rFjfLWbVlNNpQL-Cw>
    <xme:-OhwafObXEfPo1ru666Cu3D21yVDh5NXbwABsszAi8a8b0GG1TPWGMk3DMh085C4c
    3rvJ0DO5u9O5-FrR_acctTEJAwQDpm0PKqPkdu_3dQg-R0YaDwoBDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epudelieegkeevueegtedtjedttdelgeehhfdvhfeuheethfduleffuddvueelveetnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-OhwaXHr5e8X1v34KPQFqE9f6YcIuPRYf04skq0PvR3LGhRN1tYYpA>
    <xmx:-OhwabOrxdv_1hHJEN8YcSlsZ_Q7xmSGTZFGb7DP2oWULMMHX1ojJw>
    <xmx:-OhwaReAg1FIBbzOmkAta6X1OQd5DEWmcn9LIakvA_nDWMGKDS-PaQ>
    <xmx:-OhwaQte52YirMWUpie5UbsfL6bWgS8sHWqXlfIVmLyeCX9DtDju6A>
    <xmx:-ehwaSf26qz85C7UEbMb5KVu2DOG6GawJSkS8ZAWTwMQZdncwSuS-3FY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E53B700065; Wed, 21 Jan 2026 09:55:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A8kywoqqtqdw
Date: Wed, 21 Jan 2026 15:55:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <77a55850-bd7c-4525-8ffe-46d9e17dc1e4@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 6.19, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-2

for you to fetch changes up to 0638dc292e54ba0cbcb1ff81af3ca52d3bbfaf54:

  Merge tag 'qcom-arm64-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2026-01-21 09:52:19 +0100)

----------------------------------------------------------------
soc: fixes for 6.19, part 2

The main changes are devicetree updates for qualcomm and rockchips arm64
platforms, fixing minor mistakes in SoC and board specific settings:

 - GPIO settings for Pinephone Pro buttons
 - Register ranges for rk3576 GPU
 - Power domains on sc8280xp
 - Clocks on qcom talos
 - dtc warnings for extraneous properties, nonstandard node names and
   undocument identifiers

The Tegra210 platform gets a single revert for a devicetree change that
caused a 6.19 regression.

On 32-bit Arm, we have trivial fixes for Microchip SAMA7 devicetree
files and NPCM Kconfig, as well as Andrew Jeffery being officially
listed as MAINTAINER for NPCM.

A single driver fix is for Qualcomm RPMHD power domains, bringing the
driver up to date with a devicetree change that added additional power
domains to be enabled.

----------------------------------------------------------------
Abel Vesa (1):
      mailmap: Update email address for Abel Vesa

Alexey Charkov (2):
      arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
      arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5

Andrew Jeffery (1):
      MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM ARCHITECTURE

Arnd Bergmann (4):
      Merge tag 'at91-fixes-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes
      Merge tag 'v6.19-rockchip-dtsfixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes
      Merge tag 'nuvoton-arm-6.19-fixes-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes

Chaoyi Chen (1):
      arm64: dts: rockchip: Fix wrong register range of rk3576 gpu

David Heidelberg (1):
      arm64: dts qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible

Geraldo Nascimento (2):
      arm64: dts: rockchip: remove dangerous max-link-speed from helios64
      arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s

Hari Prasath Gujulan Elango (1):
      ARM: dts: microchip: sama7d65: fix the ranges property for flx9

Horatiu Vultur (1):
      ARM: dts: microchip: lan966x: Fix the access to the PHYs for pcb8290

Jon Hunter (1):
      Revert "arm64: tegra: Add interconnect properties for Tegra210"

Konrad Dybcio (3):
      dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
      pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
      arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links

Krishna Kurapati (2):
      arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
      arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B

Nicolas Ferre (1):
      ARM: dts: microchip: sama7d65: fix size-cells property for i2c3

Ondrej Jirman (1):
      arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro

Pradeep P V K (1):
      arm64: dts: qcom: talos: Correct UFS clocks ordering

Quentin Schulz (1):
      arm64: dts: rockchip: fix unit-address for RK3588 NPU's core1 and core2's IOMMU

Randy Dunlap (1):
      arm: npcm: drop unused Kconfig ERRATA symbol

Rob Herring (Arm) (4):
      arm64: dts: rockchip: Drop "sitronix,st7789v" fallback compatible from rk3568-wolfvision
      arm64: dts: rockchip: Fix pinctrl property typo on rk3326-odroid-go3
      arm64: dts: rockchip: Fix gpio pinctrl node names
      arm64: dts: rockchip: Drop unsupported properties

Yixun Lan (1):
      MAINTAINERS: update email address for Yixun Lan

 .mailmap                                           |  3 +++
 MAINTAINERS                                        |  4 +++-
 arch/arm/boot/dts/microchip/lan966x-pcb8290.dts    |  1 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |  4 ++--
 arch/arm/mach-npcm/Kconfig                         |  1 -
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 24 ----------------------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 16 +++++++++++----
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |  4 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  2 --
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  3 ---
 arch/arm64/boot/dts/qcom/talos.dtsi                |  4 ++--
 .../boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts |  3 ++-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  2 --
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |  1 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  1 -
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  2 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |  4 ++--
 .../rockchip/rk3568-wolfvision-pf5-display-vz.dtso |  3 +--
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  | 12 +++++++----
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  4 ++--
 drivers/pmdomain/qcom/rpmhpd.c                     |  4 ++++
 include/dt-bindings/power/qcom,rpmhpd.h            |  1 +
 25 files changed, 50 insertions(+), 61 deletions(-)
