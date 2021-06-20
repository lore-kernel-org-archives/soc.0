Return-Path: <SRS0=Ogrm=LO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2FFC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 22:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC7A60725
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 22:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC7A60725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kqXngPD3txo6R4PFVi8LIsJOUpAfjAbBldeFBPpKbMo=; b=hGfBTuFZp2HxNL
	YZ+KSBdJHycf+W+Ds6iXvcLyfGiFfPkM9h6uzCZ9ocy51Etpn5YEYTLqO/RQqbGxJhzKOuR5yBidS
	V42QIQhXcKnepMy4T1SVh5J6h4W5wJDe6AcisPnWWH14rNhcedJP7CPZCw5JWvpI2t9WierkOW7eO
	Dhc/+4NR/omUeYs14m0H/2CJUA8pNHMaoN6M7h0QWSmDjWu/UYMFJQY0/cT1AtpoUz0P1D1p6ms95
	dSLDKxyaIEHHvK3uPapPFrxG2wcfLxfoaMYln21smY72cSpoHDvu1DaFSPLGjtnrqo5PxQVsVM5ZT
	JS7ThaOf0lpDpe3yPJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lv60K-001gqa-KK; Sun, 20 Jun 2021 22:33:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lv60G-001gpE-OT; Sun, 20 Jun 2021 22:33:22 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lv60F-0005W3-L6; Mon, 21 Jun 2021 00:33:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.14
Date: Mon, 21 Jun 2021 00:33:18 +0200
Message-ID: <2084346.irdbgypaU6@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_153320_849585_B492682E 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210620223318.oU7G8Go--tEVKlw4ATDm3j1gaL0wCVFQ3vfyyyy2CQ0@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts32-1

for you to fetch changes up to 623ba75a5d6b8e196a21f3ed36d26a5f6db459ce:

  ARM: dts: rockchip: add power controller for RK322x (2021-06-13 18:25:07 +0200)

----------------------------------------------------------------
A lot of fixes related to the dt-binding yaml conversion,
power-domain additions for rk322x and rk3036 and the missing
mmc aliases move to board files on rk3066/rk3188.

----------------------------------------------------------------
Alex Bee (2):
      ARM: dts: rockchip: add power controller for RK3036
      ARM: dts: rockchip: add power controller for RK322x

Benjamin Gaignard (2):
      ARM: dts: rockchip: Fix IOMMU nodes properties on rk322x
      ARM: dts: rockchip: Remove useless interrupt-names on IOMMU node on rk3036

Elaine Zhang (3):
      ARM: dts: rockchip: Fix power-controller node names for rk3066a
      ARM: dts: rockchip: Fix power-controller node names for rk3188
      ARM: dts: rockchip: Fix power-controller node names for rk3288

Ezequiel Garcia (2):
      ARM: dts: rockchip: Fix thermal sensor cells o rk322x
      ARM: dts: rockchip: Fix the timer clocks order

Johan Jonker (10):
      ARM: dts: rockchip: fix pinctrl sleep nodename for rk3036-kylin and rk3288
      ARM: dts: rockchip: add #power-domain-cells to power domain nodes
      ARM: dts: rockchip: Remove more clock-names from PWM nodes
      ARM: dts: rockchip: rename vcc_stdby node name for rk3066a-rayeager.dts
      ARM: dts: rockchip: move and restyle grf nodes rk3066/rk3188
      ARM: dts: rockchip: move mmc aliases to board dts on rk3066/rk3188
      ARM: dts: rockchip: rename nodename for phy-rockchip-inno-usb2
      ARM: dts: rockchip: remove #phy-cells from usbphy node rk3066/rk3188
      ARM: dts: rockchip: fix supply properties in io-domains nodes
      ARM: dts: rockchip: add labels to the timer nodes on rk3066a

 arch/arm/boot/dts/rk3036-kylin.dts       |   2 +-
 arch/arm/boot/dts/rk3036.dtsi            |  51 +++++++++++-
 arch/arm/boot/dts/rk3066a-bqcurie2.dts   |   5 ++
 arch/arm/boot/dts/rk3066a-marsboard.dts  |   4 +
 arch/arm/boot/dts/rk3066a-mk808.dts      |   5 ++
 arch/arm/boot/dts/rk3066a-rayeager.dts   |   8 +-
 arch/arm/boot/dts/rk3066a.dtsi           |  67 +++++++++-------
 arch/arm/boot/dts/rk3188-bqedison2qc.dts |   6 ++
 arch/arm/boot/dts/rk3188-px3-evb.dts     |   5 ++
 arch/arm/boot/dts/rk3188-radxarock.dts   |   4 +
 arch/arm/boot/dts/rk3188.dtsi            |  69 ++++++++--------
 arch/arm/boot/dts/rk322x.dtsi            | 131 +++++++++++++++++++++++++++----
 arch/arm/boot/dts/rk3288-rock2-som.dtsi  |   2 +-
 arch/arm/boot/dts/rk3288-vyasa.dts       |   4 +-
 arch/arm/boot/dts/rk3288.dtsi            |  18 +++--
 arch/arm/boot/dts/rk3xxx.dtsi            |   5 +-
 arch/arm/boot/dts/rv1108.dtsi            |   2 +-
 17 files changed, 295 insertions(+), 93 deletions(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
