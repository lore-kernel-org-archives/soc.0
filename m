Return-Path: <SRS0=GbX+=LO=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247D4C48BDF
	for <linux-rockchip@archiver.kernel.org>; Sun, 20 Jun 2021 22:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A037960725
	for <linux-rockchip@archiver.kernel.org>; Sun, 20 Jun 2021 22:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A037960725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EJoL4oKuOmV3fHSKwB2WCKmky2j/ni7e38GtVACQTz8=; b=qlprgH3PG7WKHD
	JXIM+5AZz7YpHGd9kHvrx8h5+ODQhA3pEVX6btR99Ru4jkVO4YcpDYwYQMnrYzlVHHAbU4KlDXbr4
	sXCzkwiJDAIflXicFq1edxxDjkXABEr6orXh0G2LGj2d3WLyfRvpuguwfo96W61Z2H38EVMFtVTuG
	+J/j3AwWYySD0jV59QOnchU0uGartuLVqr6pBp/lXDXYVH4ikbMsERa63tiuVHgbNLjC+bF9LGOJE
	TNjFKgmp06BBZJnGrDoZA/C43CAWVySFu6/IqGbbzKun+1d4RS+jzzdtyVWDEjN8hFWpcNxl+e2tQ
	QROTW2eqSRIyH5Pe0jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lv612-001h7x-DL; Sun, 20 Jun 2021 22:34:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lv610-001h6n-0c; Sun, 20 Jun 2021 22:34:07 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lv60y-0005WU-TP; Mon, 21 Jun 2021 00:34:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.14
Date: Mon, 21 Jun 2021 00:34:04 +0200
Message-ID: <2796982.e9J7NaK4W3@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_153406_103309_6379ECD6 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210620223404.JVVxGo5LideUCJCFmrjbwBY2q6uDNr0c3KwO67JM7Jw@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v5.14-rockchip-dts64-1

for you to fetch changes up to eb607cd4957fb0ef97beb2a8293478be6a54240a:

  arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3399-=
roc-pc (2021-06-19 23:55:10 +0200)

----------------------------------------------------------------
A lot of dt-yaml related fixes; PCIe, USB and pwm-fans for Helios64;
Display rotation and audio codec for the Odroid Go Advance;
IR, spdif and usb-c support for rk3399-firefly;
USB support for rk3308 and some rk3328 boards and setting
the PCIe link speed to actually only supported speed on rk3399.

----------------------------------------------------------------
Alex Bee (3):
      arm64: dts: rockchip: add ir-receiver for rk3399-roc-pc
      arm64: dts: rockchip: Re-add regulator-boot-on, regulator-always-on f=
or vdd_gpu on rk3399-roc-pc
      arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3=
399-roc-pc

Benjamin Gaignard (1):
      arm64: dts: rockchip: Remove useless interrupt-names properties from =
px30 IOMMU nodes

Cameron Nemo (1):
      arm64: dts: rockchip: Enable USB3 for rk3328 Rock64

Chen-Yu Tsai (4):
      arm64: dts: rockchip: Enable USB3 for rk3328 ROC-RK3328-CC
      arm64: dts: rockchip: Enable USB3 for rk3328 Rock Pi E
      arm64: dts: rockchip: Enable USB3 Ethernet on rk3328 NanoPi R2S
      arm64: dts: rockchip: Drop fephy pinctrl from gmac2phy on rk3328 rock=
-pi-e

Chris Morgan (2):
      arm64: dts: rockchip: add rk817 codec to Odroid Go
      arm64: dts: rockchip: Add Rotation Property for OGA Panel

Elaine Zhang (3):
      arm64: dts: rockchip: Fix power-controller node names for px30
      arm64: dts: rockchip: Fix power-controller node names for rk3328
      arm64: dts: rockchip: Fix power-controller node names for rk3399

Ezequiel Garcia (1):
      arm64: dts: rockchip: add timer0 clocks on rk3368

Johan Jonker (5):
      arm64: dts: rockchip: fix pinctrl sleep nodename for rk3399.dtsi
      arm64: dts: rockchip: add #power-domain-cells to power domain nodes
      arm64: dts: rockchip: fix regulator-gpio states array
      arm64: dts: rename grf-gpio nodename in rk3328.dtsi
      arm64: dts: rockchip: rename nodename for phy-rockchip-inno-usb2

Peter Robinson (5):
      arm64: dts: rockchip: Use only supported PCIe link speed on rk3399
      arm64: dts: rockchip: add SPDIF node for rk3399-firefly
      arm64: dts: rockchip: add infrared receiver node to RK3399 Firefly
      arm64: dts: rockchip: Sort rk3399 firefly pinmux entries
      arm64: dts: rockchip: Add USB-C port details for rk3399 Firefly

Tianling Shen (1):
      arm64: dts: rockchip: rename LED label for NanoPi R4S

Tobias Schramm (1):
      arm64: dts: rockchip: add USB support to rk3308.dtsi

Uwe Kleine-K=F6nig (3):
      arm64: dts: rockchip: Add support for two PWM fans on helios64
      arm64: dts: rockchip: Add support for PCIe on helios64
      arm64: dts: rockchip: Add support for USB on helios64

 arch/arm64/boot/dts/rockchip/px30.dtsi             |  28 ++--
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |   4 +-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  74 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  37 ++++-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |  36 ++++-
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |   9 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   7 +-
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   5 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  13 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   2 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    | 162 +++++++++++++++++=
+---
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   4 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 121 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   1 -
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |  16 ++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  66 ++++++---
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   1 -
 20 files changed, 515 insertions(+), 76 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
