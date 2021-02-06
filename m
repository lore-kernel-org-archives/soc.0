Return-Path: <SRS0=imG5=HI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1546C433E0
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 10:18:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 548D164D73; Sat,  6 Feb 2021 10:18:23 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1CB64E39;
	Sat,  6 Feb 2021 10:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1CB64E39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from p508fcd06.dip0.t-ipconnect.de ([80.143.205.6] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1l8KfT-00074K-PN; Sat, 06 Feb 2021 11:18:19 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL RESEND] Rockchip dts64 changes for 5.12
Date: Sat, 06 Feb 2021 11:18:18 +0100
Message-ID: <12699743.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

sorry I mixed up the versioning in the pull's subject.
The changes are of course meant for 5.12.

Thanks
Heiko


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v5.12-rockchip-dts64-1

for you to fetch changes up to 7582ad63c9bd09a8f0988c46074481ddd4f92e04:

  arm64: dts: rockchip: more user friendly name of sound nodes (2021-02-01 =
19:00:31 +0100)

=2D---------------------------------------------------------------
New boards: Radxa Rock Pi E, NanoPi M4B
More fixed indices for mmc nodes; removal of obsolete amba bus nodes;
nand-flash-controller nodes for px30 and rk3308; rk3399 pcie ranges fix;
board-level fixes for Helios64, NanoPi and Rock960; more sound support
for rock64 and rockpro64 and cleanups to make dt-bindings happier.

=2D---------------------------------------------------------------
Chen-Yu Tsai (5):
      arm64: dts: rockchip: rk3328: Add clock_in_out property to gmac2phy n=
ode
      dt-bindings: arm: rockchip: Add Radxa ROCK Pi E
      arm64: dts: rockchip: rk3328: Add Radxa ROCK Pi E
      arm64: dts: rockchip: Move ep-gpios property to nanopc-t4 from nanopi4
      arm64: dts: rockchip: Add NanoPi M4B board

Johan Jonker (11):
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3328 b=
oards
      arm64: dts: rockchip: add QoS register compatibles for rk3399
      arm64: dts: rockchip: add QoS register compatibles for px30
      arm64: dts: rockchip: rename thermal subnodes for rk3368
      arm64: dts: rockchip: rename thermal subnodes for rk3399
      arm64: dts: rockchip: fix ranges property format for rk3399 pcie node
      arm64: dts: rockchip: cleanup cpu_thermal node of rk3399-rock960.dts
      arm64: dts: rockchip: assign a fixed index to mmc devices on px30 boa=
rds
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3308 b=
oards
      arm64: dts: rockchip: assign a fixed index to mmc devices on rk3368 b=
oards
      arm64: dts: rockchip: rename pinctrl nodename to gmac2io for nanopi-r=
2s board

Katsuhiro Suzuki (3):
      arm64: dts: rockchip: enable HDMI sound nodes for rk3328-rock64
      arm64: dts: rockchip: add SPDIF node for rk3399-rockpro64
      arm64: dts: rockchip: more user friendly name of sound nodes

Robin Murphy (2):
      arm64: dts: rockchip: Light "sys" LED on NanoPi R2S
      arm64: dts: rockchip: Remove bogus "amba" bus nodes

Uwe Kleine-K=F6nig (1):
      arm64: dts: rockchip: Rely on SoC external pull up on pmic-int-l on H=
elios64

Yifeng Zhao (2):
      arm64: dts: rockchip: Add NFC node for RK3308 SoC
      arm64: dts: rockchip: Add NFC node for PX30 SoC

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  83 +++--
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  63 ++--
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |   3 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  | 382 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |  56 ++-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  33 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  62 ++--
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dts  |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts |  52 +++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dts    |  53 +--
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  29 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 109 +++---
 16 files changed, 690 insertions(+), 246 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dts



