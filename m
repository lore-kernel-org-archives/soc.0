Return-Path: <SRS0=YjQ7=HI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BF4C433DB
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 10:18:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CA664D73
	for <linux-rockchip@archiver.kernel.org>; Sat,  6 Feb 2021 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80CA664D73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tnwmzHTq3WDH1HANbdAeH69T6nF9nXLODT1l2uSfkWY=; b=egE9DVwfsod+8C+7wPH5z/pCee
	CHoI6ytZ5OgGv9SjSPhnqfUmanIs1MVWHViIdz77HkoyPDbr2pUuhGdq1IBy3sffYdG4ZWqWPBXNv
	cdul0PAV+feFcSE+rKLQURGylUcdsIft1jRJI/KwDt0N7UTfriu5PaqTVibPtVfyygCb28CHP9/4b
	eynmdX06FyxKwCXP1QgDbBMPkv6z94u1wTo+J3zhWWRSJ/E28t83EtWqxX6pncQBOYBagxc2Q+/yH
	Sbn2bk2RQ9MKPYUGczth+y6xgcWeEtGJ0845sK411wLM4Pls5WdfISbWRDfnZRjREba2+NmPO8yJ4
	W/dcCcjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8KfY-0000Nh-UA; Sat, 06 Feb 2021 10:18:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8KfW-0000Mp-9z; Sat, 06 Feb 2021 10:18:23 +0000
Received: from p508fcd06.dip0.t-ipconnect.de ([80.143.205.6]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l8KfT-00074K-PN; Sat, 06 Feb 2021 11:18:19 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL RESEND] Rockchip dts64 changes for 5.12
Date: Sat, 06 Feb 2021 11:18:18 +0100
Message-ID: <12699743.uLZWGnKmhe@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_051822_375170_A7D352D2 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206101818.cJyWY_qngKuq_3OefIzRHc1XWn8bkMeipnN8hHsT6PU@z>

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

----------------------------------------------------------------
New boards: Radxa Rock Pi E, NanoPi M4B
More fixed indices for mmc nodes; removal of obsolete amba bus nodes;
nand-flash-controller nodes for px30 and rk3308; rk3399 pcie ranges fix;
board-level fixes for Helios64, NanoPi and Rock960; more sound support
for rock64 and rockpro64 and cleanups to make dt-bindings happier.

----------------------------------------------------------------
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




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
