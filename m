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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E7BC64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3D92085B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J54coXD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3D92085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DO0a52sBfqyAYVFVF/IUg6j8c9oKPdLk1J1V8uQ08Ro=; b=J54coXD5DBp992k/BGWjSUijZJ
	sKBnRqfFF95PdtgmmLhjlykgYBfM0g3kbY3vHHIHbmpT/LRbpirlZVr8TlJuxov0RDCmazJWwLiGS
	LmPLcB9hOUkfUrFtihP2oUFPbcvFJoA54SNK4GpYdpoIzlFbCuNSYbi2bwrBVeaer6F4RP347FAUf
	b/SF0yJrnEAXJrzrZDmPau/KsP02nVxqiuwQ3SxvmTBTeQk6mTqIL7pX7F8nwkTfa12KorifYdtgq
	kIDB9LViiKNjx2GkwSAIRIQ3Sb5eQh3tnVblhUTxqwkquwxCNQ16tjoyhBAVSgizOs4w/6iTUUr9q
	Vjq5VqUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzwa-0003NI-KL; Tue, 01 Dec 2020 07:19:24 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzwV-0003LQ-WF
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 07:19:21 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 60AC780A9;
 Tue,  1 Dec 2020 07:19:21 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/4] Driver changes for omaps for genpd support
Date: Tue,  1 Dec 2020 09:18:46 +0200
Message-ID: <pull-1606806458-694517@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_021920_093670_7C7D6D75 
X-CRM114-Status: GOOD (  15.96  )
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
Message-ID: <20201201071846.jeJ87IsXhA5DJP5aGN3yR4G7dfuBfKEL9zpqautblO8@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e7ae08d398e094e1305dee823435b1f996d39106:

  bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw (2020-10-26 10:08:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-drivers-signed

for you to fetch changes up to 57df7e370d2ab83a64c07acd157acfed4169f114:

  remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)

----------------------------------------------------------------
Driver changes for omaps for genpd for v5.11 merge window

This series of changes allows booting am335x with genpd and
device tree data without the legacy platform data. Also at
least am437x can be booted with gendp with power domain and
dts data. The SoC specific dts changes will be a separate
pull request.

We need the following driver changes merged before the dts
changes can be done:

- platform code needs a few improvments to probe l4_wkup first
  for clocks, and to bail out when there is no platform data

- ti-sysc driver needs a non-urgent fix for asserting rstctrl
  reset only after disabling the clocks, to probe modules with
  no known control registers, and added quirk handling for gpmc
  devices

- omap-prm driver needs a non-urgent fix for reset status bit,
  support added for pm_clk, and then we add the rest of am335x
  power domain data

- clock driver for am335x needs to keep l3_main clock enabled
  with genpd for suspend and resume to work

- wkup_m3 remoteproc driver needs support added for reset
  control if available instead of the legacy pdata callbacks

- pm33xx driver needs PM runtime support added for genpd

The am335x specific driver changes for the clock, wkup_m3,
pm33xx and remoteproc drivers are quite trivial and have not
caused merge conflicts in Linux next. I did not get acks for
these changes except from Santosh but had already pushed out
the branch already at that point. So I've added the related
driver maintainers to Cc.

----------------------------------------------------------------
Tero Kristo (1):
      soc: ti: omap-prm: am3: add genpd support for remaining PRM instances

Tony Lindgren (10):
      soc: ti: omap-prm: Do not check rstst bit on deassert if already deasserted
      bus: ti-sysc: Assert reset only after disabling clocks
      ARM: OMAP2+: Check for inited flag
      ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
      bus: ti-sysc: Support modules without control registers
      bus: ti-sysc: Implement GPMC debug quirk to drop platform data
      clk: ti: am33xx: Keep am3 l3 main clock always on for genpd
      soc: ti: omap-prm: Add pm_clk for genpd
      soc: ti: pm33xx: Enable basic PM runtime support for genpd
      remoteproc/wkup_m3: Use reset control driver if available

 arch/arm/mach-omap2/omap_hwmod.c      |  6 +++
 arch/arm/mach-omap2/pdata-quirks.c    | 11 +++++
 drivers/bus/ti-sysc.c                 | 41 ++++++++++++-----
 drivers/clk/ti/clk-33xx.c             |  2 +
 drivers/remoteproc/wkup_m3_rproc.c    | 41 +++++++++++------
 drivers/soc/ti/omap_prm.c             | 84 +++++++++++++++++++++++++++++++++--
 drivers/soc/ti/pm33xx.c               | 17 ++++++-
 include/linux/platform_data/ti-sysc.h |  1 +
 8 files changed, 174 insertions(+), 29 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
