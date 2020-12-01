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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D603AC64E8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3FD2087C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hbdyxa0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3FD2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ufPcWnKLKxFGrzM9zU86NLmEpbBGViPgM8lokdCA0Vo=; b=Hbdyxa0bmt1y1O5gwotsEOoUo
	UU6xvojsQXbOzehbOpwcFEMXpAzLCCkWnPcxx2TxJXoevK+qKfVUalD/v8StySOKRyWArZTI5cgs6
	Ic8B2w13DgcVE8M23a50M80QcSoT/x3x/2Z6MSGgxP3w+8z91R8bGoVBmwX8SpHhxvnIQ0tFz8WYD
	Fl4QJaJzKnotU2EMQOvIE2edHR4oEL/R1m/b8QrQE1TTqjosp/tI/CbW6u5+FvoRvboiqDQOh+yNw
	GTMylv8gLPiX51960BhhfJYuIbAE1/3nTZ/IPnZrqJcMQPlHkoRHionOlc4XOgCe+prPhR5ZQvaOP
	P7KcPoKtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzwc-0003Nl-EJ; Tue, 01 Dec 2020 07:19:26 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzwW-0003M5-GI
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 07:19:21 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 83CAA81A8;
 Tue,  1 Dec 2020 07:19:26 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 3/4] Update am437x to boot without platform data
Date: Tue,  1 Dec 2020 09:18:48 +0200
Message-ID: <pull-1606806458-694517@atomide.com-3>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_021920_600025_6300B2DA 
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
Message-ID: <20201201071848.tLJPzVLLvpnJJvJ5Cij-T_eQ2E0xeztkV-zREkxxuGo@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 133ad7ab7005dc951fb66d3de9e29a8259fe9744:

  ARM: OMAP2+: Build hwmod related code as needed (2020-11-16 12:58:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am437x-signed

for you to fetch changes up to df6c2ec872a62cf81dff86ef62818dea89cc9d98:

  ARM: OMAP2+: Drop legacy remaining legacy platform data for am4 (2020-11-16 13:11:17 +0200)

----------------------------------------------------------------
Update am473x to boot without platform data

Similar to am335x, we can now update am437x dts files to boot
with genpd and simple-pm-bus, and drop the related platform data.

To do that, we need to do the following changes for am437x:

- Update the clock driver to keep the l3_main clock always on for
  suspend and resume to work

- Add power domain and reset controller data to omap-prm driver

- Configure interconnect clocks for system timers as those are
  now managed separately by the drivers/clocksource drivers

- Update control module, wkup_m3, emif, ocmcram, mpuss and l3_noc
  for device tree data and drop the legacy platform data

- Update the interconnect instances to boot with gendp and
  simple-pm-bus

- Drop the remaining platform data for am437x

----------------------------------------------------------------
Tero Kristo (2):
      soc: ti: omap-prm: am4: add genpd support for remaining PRM instances
      ARM: dts: am43xx: add remaining PRM instances

Tony Lindgren (15):
      clk: ti: am437x: Keep am4 l3 main clock always on for genpd
      ARM: dts: Configure also interconnect clocks for am4 system timer
      ARM: OMAP2+: Drop legacy platform data for am4 control module
      ARM: dts: Configure RTC powerdomain for am4
      ARM: dts: Configure interconnect target module for am4 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am4 wkup_m3
      ARM: OMAP2+: Drop legacy platform data for am4 emif
      ARM: OMAP2+: Drop legacy platform data for am4 ocmcram
      ARM: OMAP2+: Drop legacy platform data for am4 mpuss
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_wkup
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_fast
      ARM: dts: Use simple-pm-bus for genpd for am4 l4_per
      ARM: dts: Move am4 l3 noc to a separate node
      ARM: dts: Use simple-pm-bus for genpd for am4 l3
      ARM: OMAP2+: Drop legacy remaining legacy platform data for am4

 arch/arm/boot/dts/am4372.dtsi                      | 124 ++++++----
 arch/arm/boot/dts/am437x-l4.dtsi                   |  79 +++++--
 arch/arm/mach-omap2/Kconfig                        |   1 -
 arch/arm/mach-omap2/Makefile                       |   5 +-
 arch/arm/mach-omap2/io.c                           |   1 -
 .../mach-omap2/omap_hwmod_33xx_43xx_common_data.h  |  55 -----
 .../omap_hwmod_33xx_43xx_interconnect_data.c       |  82 -------
 .../mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c | 254 ---------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c         | 166 --------------
 drivers/clk/ti/clk-43xx.c                          |   8 +
 drivers/soc/ti/omap_prm.c                          |  36 ++-
 11 files changed, 184 insertions(+), 627 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
 delete mode 100644 arch/arm/mach-omap2/omap_hwmod_43xx_data.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
