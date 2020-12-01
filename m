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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CABC64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5391B2085B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 07:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dQNRF/6b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5391B2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sdwjMQXCt3F1kcOgkXHyn6eV4ItvlpbpWXNDR5d80Yk=; b=dQNRF/6byLUj2GThrqR9mu2pd
	HtevD238SxJQnZdi8k6TuC8CFs1SxFLuZe8XAoP5QtXJ443Q4pzinyLFYr8QrCwLwywCB5TI37OY/
	HzBeMCYQiJVz3GwApQ7QitTR2dvhd8i3ybxcx2jvcP1b07dXrZxXLQGmTe1ET9588emCpbY0TCzqo
	sqHgyOJ2GusYDvFbsh3eH52y1JdljLJt2RVfah0FB2LGDX6pukcg6A/ay0B65l75CspSnj0o0RnQt
	kWCbmzKymMhEQNhjpXGU48YM2ad2AgYeW3r34Zb2ft6qKc/ef3ovKM9B62WdFndHrLLFyhh8gecDj
	RYXMKCtGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzwe-0003OI-C5; Tue, 01 Dec 2020 07:19:28 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzwZ-0003Mt-4y
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 07:19:24 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 25B6981CB;
 Tue,  1 Dec 2020 07:19:28 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 4/4] Remaining genpd changes for omaps for v5.11
Date: Tue,  1 Dec 2020 09:18:49 +0200
Message-ID: <pull-1606806458-694517@atomide.com-4>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_021923_328468_B55B96A3 
X-CRM114-Status: GOOD (  16.57  )
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
Message-ID: <20201201071849.i9nERJ2OhQRxmcIVnBEyvlviTGQWTKiTdsWUrNBAbQM@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit df6c2ec872a62cf81dff86ef62818dea89cc9d98:

  ARM: OMAP2+: Drop legacy remaining legacy platform data for am4 (2020-11-16 13:11:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-rest-signed

for you to fetch changes up to b62168e516dab1b7cb7bb90976755b08d273cc3a:

  ARM: OMAP2+: Fix am4 only build after genpd changes (2020-11-27 08:13:25 +0200)

----------------------------------------------------------------
Remaining genpd changes for omaps for v5.11

This series contains the remaining genpd changes for omap4/5,
and dra7 to add the power domain and reset control data to
omap-prm driver. We also update several devices to probe without
platform data to get us closer to booting omap4/5, and dra7
without platform data.

There is also a build fix for the earlier am437x series that
I should have applied into a separate branch on top of the
am437x breaking commit. It ended here as I was originally
planning to send out a single pull request for all the genpd
changes, but then decided to break it down to smaller chunks.
It's all really a larger single git branch though, so this
should be OK and I really did not want to start reorganizing
the branch after testing it and having it sit in Linux next.

The changes done here are:

- Clock driver needs idlest check dropped for IVA for omap4
  and dra7

- Add remaining power domain and reset control data to
  omap-prm driver for omap4/5 and dra7

- Add device tree data for remaining power domains and
  reset control for omap4/5 and dra7 dts files

- Update dss, dsp, iva and gpmc dts files to use genpd
  and to drop the remaining platform data

- Update dss for omap5 to use genpd

- Update dra7 iva to to use genpd and to drop the remaining
  platform data

----------------------------------------------------------------
Tero Kristo (6):
      soc: ti: omap-prm: omap4: add genpd support for remaining PRM instances
      ARM: dts: omap4: add remaining PRM instances
      soc: ti: omap-prm: dra7: add genpd support for remaining PRM instances
      ARM: dts: dra7: add remaining PRM instances
      soc: ti: omap-prm: omap5: add genpd support for remaining PRM instances
      ARM: dts: omap5: add remaining PRM instances

Tony Lindgren (10):
      clk: ti: omap4: Drop idlest polling from IVA clkctrl clocks
      ARM: dts: Configure power domain for omap4 dss
      ARM: dts: Configure power domain for omap4 dsp
      ARM: OMAP2+: Drop legacy platform data for omap4 iva
      ARM: OMAP2+: Drop legacy platform data for omap4 gpmc
      clk: ti: dra7: Drop idlest polling from IVA clkctrl clocks
      ARM: dts: Configure interconnect target module for dra7 iva
      ARM: OMAP2+: Drop legacy platform data for dra7 gpmc
      ARM: dts: Configure power domain for omap5 dss
      ARM: OMAP2+: Fix am4 only build after genpd changes

 arch/arm/boot/dts/dra7.dtsi                | 151 ++++++++++++++++--
 arch/arm/boot/dts/dra7xx-clocks.dtsi       |  14 ++
 arch/arm/boot/dts/omap4-l4.dtsi            |   1 +
 arch/arm/boot/dts/omap4.dtsi               | 150 +++++++++++++++---
 arch/arm/boot/dts/omap5.dtsi               |  58 +++++++
 arch/arm/mach-omap2/io.c                   |   1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 114 --------------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c  |  49 ------
 arch/arm/mach-omap2/pdata-quirks.c         |  12 --
 drivers/clk/ti/clk-44xx.c                  |   2 +-
 drivers/clk/ti/clk-7xx.c                   |   7 +
 drivers/soc/ti/omap_prm.c                  | 238 ++++++++++++++++++++++++++---
 include/dt-bindings/clock/dra7.h           |   4 +
 13 files changed, 571 insertions(+), 230 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
