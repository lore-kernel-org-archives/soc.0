Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FDCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 08:33:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC40264D9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 08:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC40264D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5NlS94D2/jbyrnfPPKj5ja+pWe7RKda9TpuG/OwIJAY=; b=Xw1gTVTJG8IkBw5n2dYgz9t3SQ
	y8ZlpTA6Oi6mDDWF2di5yIDt/vIMYbsBkUXr1w2xrX5pBJ0XhzlF/drpKfY/quMLWP5UaBialRNOa
	r04fCkEu0DNfqXYnzKyBtZ7XT8MSBO6xKBUxiOcW/7WjAR8j5zEykO1ugtjn00IjWYuMjpE4jdOCu
	4NjTmp/0KG5BthudxEzaHjFa7zVYsWkYz6jaYJUxM8C5mmZWvQ8MgWBghqgnDV5Z2gLjz3/YcIkAU
	v/33x7Z4wnYQCKhnFA3QslAynBsIz8ZTiMqpjLi0j3m7ihdQmfZwYkwQGZ359D8pjh5oAd12XNF7g
	blVFFUeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52is-00034i-5e; Thu, 28 Jan 2021 08:32:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52io-00033j-Hi; Thu, 28 Jan 2021 08:32:11 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l52ik-0007ad-0O; Thu, 28 Jan 2021 09:32:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Subject: [GIT PULL] Rockchip dts fixes for 5.11
Date: Thu, 28 Jan 2021 09:32:05 +0100
Message-ID: <5429065.DvuYhMxLoT@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_033210_622875_0DF0B808 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210128083205.OEdUqiVKsKW3OtjKlPkY0rTVtLRsTZJYQkxWSHUScEQ@z>

Hi Arnd, Kevin, Olof,

please find below some Rockchip devicetree fixes for the 5.11 cycle.
Please pull!

Thanks
Heiko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dtsfixes1

for you to fetch changes up to 74532de460ec664e5a725507d1b59aa9e4d40776:

  arm64: dts: rockchip: Disable display for NanoPi R2S (2021-01-26 00:10:21 +0100)

----------------------------------------------------------------
Wrong irq number on px30 and cleanups of stuff on rk3399 regarding
wrongly used dt properties and parts that shouldn't be enabled.

----------------------------------------------------------------
Johan Jonker (1):
      arm64: dts: rockchip: remove interrupt-names property from rk3399 vdec node

Marc Zyngier (1):
      arm64: dts: rockchip: Fix PCIe DT properties on rk3399

Robin Murphy (1):
      arm64: dts: rockchip: Disable display for NanoPi R2S

Sandy Huang (1):
      arm64: dts: rockchip: fix vopl iommu irq on px30

Simon South (1):
      arm64: dts: rockchip: Use only supported PCIe link speed on Pinebook Pro

 arch/arm64/boot/dts/rockchip/px30.dtsi               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts   | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 -
 arch/arm64/boot/dts/rockchip/rk3399.dtsi             | 3 +--
 4 files changed, 6 insertions(+), 4 deletions(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
