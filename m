Return-Path: <SRS0=14fJ=LF=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7DBC48BE0
	for <linux-rockchip@archiver.kernel.org>; Fri, 11 Jun 2021 22:23:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E40613D3
	for <linux-rockchip@archiver.kernel.org>; Fri, 11 Jun 2021 22:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E40613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lC+xISLTE/rl077oE6ebTjNCBNQZ41IZ/sgydl5yEjk=; b=G8V8KaTPh2v5H7
	vaN4EsAZuKENPSc0SyoVnLOfHuvBMj745UZ5uCEuol7VRfiIzNt+K+03qhByZwdhkj/SryZGHnucR
	4y3t3a4PBQBpeHVq3spPjjjzdEgRBoS2yys9FkU35IqlicXJId/zlW+njg93pipmJMhqSynvr3j11
	uOzhWQvmHaOyzthiTULGnzhXGDHU8vvAYoRs9FqP54DRAw1yT8YWoOHDK+fig5MPUz3vIdXvAZ+3g
	LqkigLx91Eh/TLAkeFNcEv1imaqdOl5C7gftl7F0tla02bwJAYtH9mEAiX0VJrSB2ZSL98ha8sspj
	V9rr3ZJ8xqwK0QtI+OHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrpWD-007IVW-1j; Fri, 11 Jun 2021 22:20:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrpW6-007IUy-DC; Fri, 11 Jun 2021 22:20:47 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lrpW5-0004pq-89; Sat, 12 Jun 2021 00:20:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.13
Date: Sat, 12 Jun 2021 00:20:40 +0200
Message-ID: <3405741.0S5aU1g85B@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_152042_482017_9F11388C 
X-CRM114-Status: GOOD (  11.61  )
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
Message-ID: <20210611222040.Oai5mVyJdxT9UkL18JkS86GR-m4D0urK1D6BUxeOxGw@z>

Hi Arnd, Kevin, Olof,

please find below a patch that unbreaks the PCIe on rk3399 that
broke in 5.13. As the tag messages states, there are more changes
pending that handle the backward compatiblity but will go through
the PCI subsystem.

Please pull, thanks
Heiko

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dtsfixes1

for you to fetch changes up to 8efe01b4386ab38a36b99cfdc1dc02c38a8898c3:

  arm64: dts: rockchip: Update RK3399 PCI host bridge window to 32-bit address memory (2021-06-11 23:44:00 +0200)

----------------------------------------------------------------
Fix PCIe address ranges that are affected by recent PCI changes.
There are 3 additional patches pending that handle the backward
compatiblity inside the PCI subsystem, but the address ranges
should be fixed anyway.

----------------------------------------------------------------
Punit Agrawal (1):
      arm64: dts: rockchip: Update RK3399 PCI host bridge window to 32-bit address memory

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
