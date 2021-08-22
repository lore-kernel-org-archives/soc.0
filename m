Return-Path: <SRS0=1QWa=NN=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA10C4338F
	for <linux-rockchip@archiver.kernel.org>; Sun, 22 Aug 2021 10:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396DC61283
	for <linux-rockchip@archiver.kernel.org>; Sun, 22 Aug 2021 10:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 396DC61283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZgSPUj2FPRrKhpvfr5FE3feShDvZTYOk7VpjwqXsdg0=; b=Sp+X+Z1MdDoXkc
	SEmWT2rTTFPis7smlDfLv8Y1LPVROt1VVjCBJKyU6bLbIVfLmVeFNh44sFkm+3MWeBcV9J1r5YfxM
	Csgg2ShgqWPsivA6n1/oqmKiIiU1jFIVH/VJ0K/EBTgN90CgTHT3VgQHPl9j+UaCddsEr9qbxM3mA
	Y8X5cpMuiJnpJGCkIuJDIeGpxQzPxHxe98IPW8oRs6IgDd5c0o+ewsffOOcYBTzGBEp5DuOTECo4x
	FHxt+Gf7uxPTKmJoMVzaEp+ea8qGTYEr1mP0nquJZHp0JdGlZw0Z2cPUwIYBaKzx09JZ7eTOY6+I+
	Pao/xZQSqLyWXE5Qxjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHkXs-00DpC6-7s; Sun, 22 Aug 2021 10:17:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHkXp-00DpAt-R1; Sun, 22 Aug 2021 10:17:39 +0000
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mHkXo-0003qc-OD; Sun, 22 Aug 2021 12:17:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.15
Date: Sun, 22 Aug 2021 12:17:36 +0200
Message-ID: <4142796.VLH7GnMWUR@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_031737_907195_22EE70DD 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210822101736.I4t895eEHr9sv_4WnhPqiTRYhpp_9E82eVGVV73Y6g4@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts32-1

for you to fetch changes up to 9d508827c7939242e8ed6b06f66aa87d9f7ea832:

  ARM: dts: rockchip: Add SFC to RV1108 (2021-08-18 23:48:35 +0200)

----------------------------------------------------------------
io-domains for rk3188 and rv1108, sfc (flash) support fpr rv1108
and some cleanups.

----------------------------------------------------------------
Chris Morgan (1):
      ARM: dts: rockchip: Add SFC to RV1108

Johan Jonker (6):
      ARM: dts: rockchip: rename pcfg_* nodenames for rk3066/rk3188
      ARM: dts: rockchip: add space after &grf on rk3188
      ARM: dts: rockchip: rename timer compatible strings for rk3066a
      ARM: dts: rockchip: remove interrupt-names from iommu nodes
      ARM: dts: rockchip: add io-domains node to rk3188.dtsi
      ARM: dts: rockchip: add io-domains nodes to rv1108.dtsi

 arch/arm/boot/dts/rk3066a.dtsi | 10 ++++-----
 arch/arm/boot/dts/rk3188.dtsi  | 13 +++++++----
 arch/arm/boot/dts/rk3288.dtsi  |  6 ------
 arch/arm/boot/dts/rv1108.dtsi  | 49 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 62 insertions(+), 16 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
