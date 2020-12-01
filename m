Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF6AC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39022085B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9ZQmRcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F39022085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=whkyK5tqsoDWqez78b9TEhm91GSY6zUqvih8YN71hNQ=; b=N9ZQmRcddv447/0Ud93vwOk/E
	YMkKWKVlIli6HAN4WFSUL3E+9PznVB3DpMjjz0ca6OZZR6cu9NJT0V1L4KqXUfWSx4ONJ4OXAXNjY
	KJOoSyaTmSSX+p0wKUEM/wj+2/0xuebS/aql4crSPFS+oArpxYFzF8gSRD3UxAlvnvCyQtoQSKo4J
	XlJg31vjsAfZBEX0IRxD15QJVw6WMvxsiY7XoVSYxZbbOfGTNUZ+5vRMuUe3xmxLIa2Vz0igG1PkZ
	jAD0PE3Ab9+5CtoBp8GcN2DI7p/u4jd3W62Xbrvw40KUylLsDOeY4xVa+azWI3L0vGgWN+Xvy4fFG
	YSqfQ0tOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzwY-0003Mk-U5; Tue, 01 Dec 2020 07:19:22 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzwW-0003LT-0d
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 07:19:20 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id DD8598167;
 Tue,  1 Dec 2020 07:19:23 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/4] Update am335x to boot without platform data
Date: Tue,  1 Dec 2020 09:18:47 +0200
Message-ID: <pull-1606806458-694517@atomide.com-2>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_021920_127035_A1BC64CA 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Tero Kristo <t-kristo@ti.com>,
 Tony Lindgren <tony@atomide.com>, arm@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201071847.4GG_IgOlb_x1-uiYok3o1wAYcHtetPeq0ULyIkDaAlw@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 57df7e370d2ab83a64c07acd157acfed4169f114:

  remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am335x-signed

for you to fetch changes up to 133ad7ab7005dc951fb66d3de9e29a8259fe9744:

  ARM: OMAP2+: Build hwmod related code as needed (2020-11-16 12:58:21 +0200)

----------------------------------------------------------------
Update am335x to boot without platform data

With the driver updates done for genpd support, we can now update
am335x dts files to boot with genpd and simple-pm-bus, and drop
the related platform data.

To do that, we need to do the following changes for am335x:

- Add the remaining power domain and reset controller instances

- Configure interconnect clocks for system timers as those are
  now managed separately by the drivers/clocksource drivers

- Update control module, RTC, gpmc, debugss, emif, ocmcram,
  instr, and mpuss for device tree data and drop the legacy
  platform data

- Update the interconnect instances to boot with gendp and
  simple-pm-bus

- Drop the remaining platform data for am335x

- Add kconfig option for OMAP_HWMOD to build it only for the
  SoCs that need it

----------------------------------------------------------------
Tero Kristo (1):
      ARM: dts: am33xx: add remaining PRM instances

Tony Lindgren (17):
      ARM: dts: Configure also interconnect clocks for am4 system timer
      ARM: OMAP2+: Drop legacy platform data for am3 control module
      ARM: dts: Configure RTC powerdomain for am3
      ARM: dts: Configure interconnect target module for am3 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am3 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpmc
      ARM: OMAP2+: Drop legacy platform data for am3 debugss
      ARM: OMAP2+: Drop legacy platform data for am3 emif
      ARM: OMAP2+: Drop legacy platform data for am3 ocmcram
      ARM: OMAP2+: Drop legacy platform data for am3 instr
      ARM: OMAP2+: Drop legacy platform data for am3 mpuss
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_fast
      ARM: dts: Use simple-pm-bus for genpd for am3 l4_per
      ARM: dts: Use simple-pm-bus for genpd for am3 l3
      ARM: OMAP2+: Drop legacy remaining legacy platform data for am3
      ARM: OMAP2+: Build hwmod related code as needed

 arch/arm/boot/dts/am335x-nano.dts                  |   1 -
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  75 ++++--
 arch/arm/boot/dts/am33xx.dtsi                      | 185 ++++++++-----
 arch/arm/boot/dts/am4372.dtsi                      |  49 ++--
 arch/arm/mach-omap2/Kconfig                        |   9 +
 arch/arm/mach-omap2/Makefile                       |  14 +-
 arch/arm/mach-omap2/io.c                           |   2 -
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |   8 -
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c |  36 ---
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c         | 294 ---------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         |   1 -
 arch/arm/mach-omap2/pdata-quirks.c                 |  12 +-
 13 files changed, 236 insertions(+), 452 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_data.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
