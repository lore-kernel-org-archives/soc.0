Return-Path: <SRS0=scLn=JI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829B1C433ED
	for <linux-rockchip@archiver.kernel.org>; Sun, 11 Apr 2021 09:44:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E6660FDB
	for <linux-rockchip@archiver.kernel.org>; Sun, 11 Apr 2021 09:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E6660FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55bJEnJ7/4Q60iPprj1Ih8EfmFQLpS3XgxusNB/IwBM=; b=dEqcY6705+f4B65vJ+GvJ1grH8
	4OHpqcqJPDqVC0myzxEs5DgwJHbHq/5tUL6PzVrjzQZwVTyr59SZu2WhhCv1/itzMNAXCJIgNfRww
	1En2CHH8WNzZ8/m7fj7Vhk8bD9y9LZT9hLQ0BmLu9ae/3TFLIIlcklR79Cpwff7cfGPPy0kx//spn
	l2RIyK+3H/gu06zoUDCme81EE88xWfpPn3RZ1YRnXz0hkqswk5bx9S5xorNYnBbWS+gJhWzNKed9i
	fI2g0XTvHU5qhG6CARhGQBBIeAU+QG7B268aI3wpZTmyafRPKchCkIpoL1ok1QwRnz988Fxu5X5Dg
	HgCRbISQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVWdt-004Ggo-6H; Sun, 11 Apr 2021 09:44:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWds-004GgO-1B; Sun, 11 Apr 2021 09:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=5Jz+mdgzRlIBXUazOmXrhm+iuqFLHvkyFdBFTtnyo6Y=; b=TMUVLUNBt9u0I06WATTI72hkSM
 LDRx0aKuPd0yzbcZyNJxcYJpusXv9vkm45IkvmOFGlOXhq+cQPNgHYN/A3usgQmQ/68t9+hMI2Yb+
 m6+ciqWK0LjCC+BxzdQ4AwJl/0jd3PwYQBhv9WHCSIpvxTROANGIVVz9eytGh0emhaMNd9WzFLoBD
 qabuzbeykzNTxQGUNk8L4UsYcsqQMvJszlVQ5SUM/PFFFHMWYVESbtHHIsR3VFoHtUyXP/y3Im9NN
 cISwOW7QNn2Gdw9h69zh9/wFl1315+ZHSVLJ1cRRRaPx96Uqh05cSTRwSJIzq9Pqgj/z1/ZUVJktA
 szYaZZGg==;
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWdp-005ROm-Dj; Sun, 11 Apr 2021 09:44:30 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lVWdo-000480-AN; Sun, 11 Apr 2021 11:44:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.13
Date: Sun, 11 Apr 2021 11:44:27 +0200
Message-ID: <2191862.ElGaqSPkdT@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_024429_494999_BF8C3F93 
X-CRM114-Status: GOOD (  10.72  )
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
Message-ID: <20210411094427.X1Hjyt1d6_X7MhH6pVkoEr8A7Gx9EZqqgsI8kh-lxqA@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dts64

for you to fetch changes up to 5dcbe7e3862dfc89d219f37a9ed5e53944fa13c2:

  arm64: dts: rockchip: move mmc aliases to board dts on rk3399 (2021-04-11 11:13:07 +0200)

----------------------------------------------------------------
New board the NanoPi R4S, OPP adjustments on rk3399 (sync with vendor
and using ranged values to allow better compatibility with regulator
steps), gpu opps on px30, infrared receiver on rockpro64,
USB3 support on rk3328, MMC alias fixups, dt-compatible fixes.

----------------------------------------------------------------
Cameron Nemo (1):
      arm64: dts: rockchip: add rk3328 dwc3 usb controller node

Heiko Stuebner (9):
      arm64: dts: rockchip: synchronize rk3399 opps with vendor kernel
      arm64: dts: rockchip: used range'd gpu opps on rk3399
      arm64: dts: rockchip: drop separate opp table on rk3399-puma
      arm64: dts: rockchip: add phandle to timer0 on rk3368
      arm64: dts: rockchip: move mmc aliases to board dts on px30
      arm64: dts: rockchip: move mmc aliases to board dts on rk3308
      arm64: dts: rockchip: move mmc aliases to board dts on rk3328
      arm64: dts: rockchip: move mmc aliases to board dts on rk3368
      arm64: dts: rockchip: move mmc aliases to board dts on rk3399

Johan Jonker (5):
      arm64: dts: rockchip: enable dwc3 usb for A95X Z2
      arm64: dts: rockchip: add new watchdog compatible to px30.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3308.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3328.dtsi
      arm64: dts: rockchip: add new watchdog compatible to rk3399.dtsi

Maciej Matuszczyk (1):
      arm64: dts: rockchip: Add gpu opp nodes to px30 dtsi

Thomas Schneider (1):
      arm64: dts: rockchip: add infrared receiver node to rockpro64

Tianling Shen (2):
      dt-bindings: Add doc for FriendlyARM NanoPi R4S
      rockchip: rk3399: Add support for FriendlyARM NanoPi R4S

 .../devicetree/bindings/arm/rockchip.yaml          |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |   5 +
 .../boot/dts/rockchip/px30-engicam-px30-core.dtsi  |   4 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   6 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  27 ++++-
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |   6 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   5 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |  11 ++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |   5 +
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |   6 +
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |   5 +
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   5 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   5 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   4 +
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |   4 +
 .../arm64/boot/dts/rockchip/rk3368-lion-haikou.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |   4 +
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |   5 +
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |   5 +
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |   5 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   5 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   5 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |   6 +
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |   6 +
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   5 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       |  40 +++----
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   6 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   6 +
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  55 +--------
 .../boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts  |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   5 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   5 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  19 +++
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |   5 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   5 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   5 +
 50 files changed, 423 insertions(+), 91 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
