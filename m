Return-Path: <SRS0=scLn=JI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4028FC433B4
	for <linux-rockchip@archiver.kernel.org>; Sun, 11 Apr 2021 09:44:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6D560FDB
	for <linux-rockchip@archiver.kernel.org>; Sun, 11 Apr 2021 09:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6D560FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VG59DTMR4jHoW3DIQoxbdmLAPoL4jQteh2D/w6yd2Bo=; b=JCl8wLqHglAiLSHaI3SM5EbHDE
	q8ezThsrZfYHbLqQP/ng8INb3QQaCHEJP5J9IgLMbdI8lsu3DQ2fNsSQxflDEizFZ/I0dGKkd/bGK
	hoBmeC93qFvOWveVivQpom9yixk9ilWKWh87SPSnur5LNJ19JTsUM6JyfL0E5tlo7NOf4nwr2Rhi6
	p6ZGxemFepLLjB8Hj05cM4DiON25pbCNGKMOYbY1GPa87Cikt43PHdDa8stx/GYYtJKDhPfz5QXPG
	5KTVJSERb4mzpGoHIMRQO9xfxKK0fx3rp41/APcgz6luTM3+rtxKP4NskU6R0oW6GuCEKwwmeWpp3
	x3D0Qr1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVWdP-004Gae-NS; Sun, 11 Apr 2021 09:44:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWdO-004GaS-36; Sun, 11 Apr 2021 09:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=0wnHs2MIEkqrV1sHCkQV0cZ327SZf8ijCn32HqlTUEE=; b=w9PISVqABpOoLr+RVsveFS37jE
 Nh4KzyyN1sZEE9VcCV+R5jS2bWVALcDKp6qC1AxbjOGKKU1jV3qUxkb4O/jcJYcoo33FaQlMGKpQs
 PoxfR4XfvqZFErwjxZMxO1GC+RrLQDVaW00VnE0U42NH52ruYWnwMSKLQEbw1H13WXoBcz1fm+WYV
 BYwspF3HMkF51MosvtNFTyBkH3UoIAz6vUljUDq1kpUPSaUGpdA2jYJm4wOH17Iz2JsjxDOXBAMBo
 QI10bzQ858FFpwUo8U60MC/WpPgmMzmAamqhWrhKFcFkjZhCova4WrM6UTjQ9Lc9wkxrYUkkcXZNq
 f+A79R2A==;
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWdL-005RNo-NL; Sun, 11 Apr 2021 09:44:00 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lVWdK-00047c-K1; Sun, 11 Apr 2021 11:43:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.13
Date: Sun, 11 Apr 2021 11:43:57 +0200
Message-ID: <4638723.31r3eYUQgx@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_024359_786240_AAB021D5 
X-CRM114-Status: UNSURE (   8.83  )
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
Message-ID: <20210411094357.i5zFiuqKO8ztk0-5quy2g64ha-zS2xS2YdcOXMrk3Lo@z>

Hi Arnd, Kevin, Olof,

please find below (and in the next mail) dts changes for
Rockchip platforms for 5.13.

Please pull

Thanks
Heiko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dts32

for you to fetch changes up to e89db2b4c706b9ca1293e7025ef5e8730b5d1b5b:

  ARM: dts: rockchip: move rv1108 mmcx aliases to board dts files (2021-04-11 11:11:42 +0200)

----------------------------------------------------------------
MMC aliases fixups and some property/compatible cleanups.

----------------------------------------------------------------
Heiko Stuebner (2):
      ARM: dts: rockchip: move rk322x mmcx aliases to board dts files
      ARM: dts: rockchip: move rv1108 mmcx aliases to board dts files

Johan Jonker (3):
      ARM: dts: rockchip: add new watchdog compatible to rv1108.dtsi
      ARM: dts: rockchip: add new watchdog compatible to rk322x.dtsi
      ARM: dts: rockchip: remove clock-names property from watchdog node in rv1108.dtsi

 arch/arm/boot/dts/rk3228-evb.dts      | 4 ++++
 arch/arm/boot/dts/rk3229-evb.dts      | 4 ++++
 arch/arm/boot/dts/rk3229-xms6.dts     | 6 ++++++
 arch/arm/boot/dts/rk322x.dtsi         | 5 +----
 arch/arm/boot/dts/rv1108-elgin-r1.dts | 4 ++++
 arch/arm/boot/dts/rv1108-evb.dts      | 4 ++++
 arch/arm/boot/dts/rv1108.dtsi         | 6 +-----
 7 files changed, 24 insertions(+), 9 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
