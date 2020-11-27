Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD22C63777
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E5D21D81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ed9RLKXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E5D21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zajL1DnIskx6w0uMs/3cX9GT+5UhF2lTGY9wzWTRBuY=; b=Ed9RLKXwB/JzJdCDswzTzOdf1S
	6Prrljkdr0Vag1t8vUXXxBkyubg9lGeVEYTSfCzp1NRmlmJB9wK1asRm17FmR2ugC66Egf4MzzQFj
	QBvXVYaocHj9QmtfauEiKkWiTuE/ow7AJsYmKwVLBcReUfQpYnkqqr+lc5ag2/VIeU3cmwBWjhZ7c
	dkroaLWb+bPWv8zecDbby85YmtckyWm8BSPQHaz9ScYH4H+aYISeIwKLNHaietRkoXcbZwnt+l8Rt
	mIqMvYmxjfEWzCm0aGc3visq63ZchQ9ZFWLThN/vmQ5myh+9+bb66Q+ny5SS0JaeBELtobp0NWCjY
	J4Lz4vtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiXiK-0003ll-Ro; Fri, 27 Nov 2020 06:58:42 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiXiC-0003k0-7a
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 06:58:33 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 2F21D8063;
 Fri, 27 Nov 2020 06:58:38 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Fixes for omaps for v5.10-rc cycle
Date: Fri, 27 Nov 2020 08:58:21 +0200
Message-ID: <pull-1606460270-864284@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_015832_382535_33DBE5E7 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127065821.c5zSm_E4thRLf98AHCy6r5wRpUAqZQImM81bbhtssSM@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.10/fixes-rc5-signed

for you to fetch changes up to 05d5de6ba7dbe490dd413b5ca11d0875bd2bc006:

  ARM: dts: dra76x: m_can: fix order of clocks (2020-11-19 11:37:57 +0200)

----------------------------------------------------------------
Fixes for omaps for various issues noticed during the -rc cycle:

- Earlier omap4 cpuidle fix was incomplete and needs to use a
  configured idle state instead

- Fix am4 cpsw driver compatible to avoid invalid resource error
  for the legacy driver

- Two kconfig fixes for genpd support that we added for for v5.10
  for proper location of the option and adding missing option

- Fix ti-sysc reset status checking on enabling modules to ignore
  quirky modules with reset status only usable when the quirk is
  activated during reset. Also fix bogus resetdone warning for
  cpsw and modules with no sysst register reset status bit

- Suppress a ti-sysc warning for timers reserved as system timers

- Fix the ordering of clocks for dra7 m_can

----------------------------------------------------------------
Grygorii Strashko (2):
      ARM: dts: am437x-l4: fix compatible for cpsw switch dt node
      bus: ti-sysc: suppress err msg for timers used as clockevent/source

Marc Kleine-Budde (1):
      ARM: dts: dra76x: m_can: fix order of clocks

Tony Lindgren (6):
      ARM: OMAP2+: Fix location for select PM_GENERIC_DOMAINS
      ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
      bus: ti-sysc: Fix reset status check for modules with quirks
      bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
      ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()
      Merge tag 'ti-sysc-fixes' into fixes

 arch/arm/boot/dts/am437x-l4.dtsi      |  2 +-
 arch/arm/boot/dts/dra76x.dtsi         |  4 ++--
 arch/arm/mach-omap2/Kconfig           |  3 ++-
 arch/arm/mach-omap2/cpuidle44xx.c     |  8 +++++---
 drivers/bus/ti-sysc.c                 | 29 +++++++++++++++++++----------
 include/linux/platform_data/ti-sysc.h |  1 +
 6 files changed, 30 insertions(+), 17 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
