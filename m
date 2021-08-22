Return-Path: <SRS0=1QWa=NN=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA8C4338F
	for <linux-rockchip@archiver.kernel.org>; Sun, 22 Aug 2021 10:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E79C61214
	for <linux-rockchip@archiver.kernel.org>; Sun, 22 Aug 2021 10:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E79C61214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4R8o7+CzraELNY8siLirnF1jr5t4hCYGSZ0TAOEdS7A=; b=My33k6z2IO5xn7
	447G3j65zpaJr0rjDfsv1/ld+vhIN+Gpd0bjh0jSx8l9tXyoJHXhnQDOa3jEUj/g+7x5nDMKc9IL5
	6ha96DBL+NqPS24NrzwLzm4cUCzHbWbGQWKNmdRc6MiGGJlVI9Y2/KdklS3lq+GeJ6mAo4C06cq0h
	/uwwpmVNpfhCItGIPQBHo8zrbwvWOueOgF5tKjCZLe8NQtmkl2G1hRHSz+odl7zMLedq2E1aTmhy7
	ZA86+37BcrVjbFlamloQeEmTEUWbuvLgX/AGAtibXquj5OsuE9D6qhbrWbnbrk+Jip18TWwPUl0/G
	sblGxaMhWBQJXvyuzDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHkYN-00DpOV-KQ; Sun, 22 Aug 2021 10:18:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHkYK-00DpMr-CQ; Sun, 22 Aug 2021 10:18:10 +0000
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mHkYJ-0003qs-7l; Sun, 22 Aug 2021 12:18:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.15
Date: Sun, 22 Aug 2021 12:18:06 +0200
Message-ID: <4327460.usQuhbGJ8B@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_031808_504726_745F964D 
X-CRM114-Status: GOOD (  15.42  )
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210822101806.0h8b289DZ8-zeaQfi5N4WOwZp1Y3PmCnhi6wj0s2qe8@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts64-1

for you to fetch changes up to 9a35fd01f4abc3974e12539448038307acf27f16:

  arm64: dts: rockchip: add RK3399 Gru gpio-line-names (2021-08-21 18:18:50 +0200)

----------------------------------------------------------------
New boards: Firefly roc-rk3399-pc-pls and rk3328-pc; Scarlet-Dumo
tablet variant; Rock Pi 4 A+, B+; Pine64 Quartz64-A (rk3566-based)

Big additions for the rk3568: tsadc; saradc; gpio-support; gmac 1+2;
watchdog; pmu; io-domains and enabling these new things on the
rk3568-evb.

Addition of the rk3566 - a variant of the rk3568 with slightly less
peripherals.

SFC (serial flash controller) for rk3308 and px30 (including the
Odroid Go2)

Support for the rk3399's second image signal processor and vpu on px30
A number of smaller additions to multiple boards (Rock Pi 4, Pinebook Pro
and helios64) and cleanups in some parts.

----------------------------------------------------------------
Alex Bee (5):
      dt-bindings: Add doc for ROCK Pi 4 A+ and B+
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4A+ board
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4B+ board
      arm64: dts: rockchip: add ES8316 codec for ROCK Pi 4
      arm64: dts: rockchip: add SPDIF node for ROCK Pi 4

Brian Norris (1):
      arm64: dts: rockchip: add RK3399 Gru gpio-line-names

Chen-Yu Tsai (2):
      dt-bindings: arm: rockchip: Add gru-scarlet-dumo board
      arm64: dts: rockchip: Add gru-scarlet-dumo board

Chris Morgan (3):
      arm64: dts: rockchip: Add SFC to PX30
      arm64: dts: rockchip: Add SFC to RK3308
      arm64: dts: rockchip: Enable SFC for Odroid Go Advance

Dan Johansen (1):
      arm64: dts: rockchip: Setup USB typec port as datarole on for Pinebook Pro

Dennis Gilmore (3):
      arm64: dts: rockchip: set stdout-path on helios64
      arm64: dts: rockchip: add SPI support to helios64
      arm64: dts: rockchip: enable tsadc on helios64

Heiko Stuebner (4):
      arm64: dts: rockchip: add csi-dphy to px30
      arm64: dts: rockchip: add #phy-cells to mipi-dsi1 on rk3399
      arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
      arm64: dts: rockchip: add isp1 node on rk3399

Johan Jonker (4):
      arm64: dts: rockchip: remove interrupt-names from iommu nodes
      arm64: dts: rockchip: rename flash nodenames
      arm64: dts: rockchip: remove clock_in_out from gmac2phy node in rk3318-a95x-z2.dts
      arm64: dts: rockchip: remove ddc-i2c-scl-* properties from rk3318-a95x-z2.dts

Levin Du (4):
      dt-bindings: add doc for Firefly ROC-RK3328-PC
      arm64: dts: rockchip: add support for Firefly ROC-RK3328-PC
      dt-bindings: add doc for Firefly ROC-RK3399-PC-PLUS
      arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS

Liang Chen (3):
      dt-bindings: arm: rockchip: add rk3568 compatible string to pmu.yaml
      arm64: dts: rockchip: add pmu and qos nodes for rk3568
      arm64: dts: rockchip: add watchdog to rk3568

Matthias Brugger (1):
      arm64: dts: rockchip: Disable CDN DP on Pinebook Pro

Michael Riesch (7):
      arm64: dts: rockchip: add gmac0 node to rk3568
      arm64: dts: rockchip: rk3568-evb1-v10: add ethernet support
      arm64: dts: rockchip: add core io domains node for rk356x
      arm64: dts: rockchip: enable io domains on rk3568-evb1-v10
      arm64: dts: rockchip: add regulators of rk809 pmic to rk3568-evb1-v10
      arm64: dts: rockchip: add node for sd card to rk3568-evb1-v10
      arm64: dts: rockchip: add pinctrl and alias to emmc node to rk3568-evb1-v10

Paul Kocialkowski (1):
      arm64: dts: rockchip: Add VPU support for the PX30

Peter Geis (12):
      arm64: dts: rockchip: move rk3568 dtsi to rk356x dtsi
      arm64: dts: rockchip: split rk3568 device tree
      arm64: dts: rockchip: add rk3566 dtsi
      arm64: dts: rockchip: add basic dts for Pine64 Quartz64-A
      arm64: dts: rockchip: fix rk3568 mbi-alias
      arm64: dts: rockchip: add rk356x gmac1 node
      arm64: dts: rockchip: adjust rk3568 pll clocks
      arm64: dts: rockchip: enable gmac node on quartz64-a
      arm64: dts: rockchip: add thermal fan control to rockpro64
      arm64: dts: rockchip: add rk356x gpio debounce clocks
      arm64: dts: rockchip: add rk3568 tsadc nodes
      arm64: dts: rockchip: add thermal support to Quartz64 Model A

Simon Xue (1):
      arm64: dts: rockchip: add saradc node for rk3568

 .../devicetree/bindings/arm/rockchip.yaml          |  48 +-
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  73 ++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  37 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |   3 -
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  16 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     | 110 +++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   5 -
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   5 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   | 176 ++++
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |  41 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      | 180 ++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   2 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  36 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   6 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 218 +++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  54 ++
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |  14 +
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |  47 ++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  29 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  47 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 497 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |  20 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   | 308 +++++++
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   |   9 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 644 ++------------
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 930 +++++++++++++++++++++
 29 files changed, 2966 insertions(+), 599 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk356x.dtsi




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
