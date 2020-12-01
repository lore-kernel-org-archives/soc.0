Return-Path: <SRS0=O5mf=FF=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB133C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 07:19:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA9B921D46; Tue,  1 Dec 2020 07:19:23 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 44BA42085B;
	Tue,  1 Dec 2020 07:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BA42085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 25B6981CB;
	Tue,  1 Dec 2020 07:19:28 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tero Kristo <t-kristo@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] Remaining genpd changes for omaps for v5.11
Date: Tue,  1 Dec 2020 09:18:49 +0200
Message-Id: <pull-1606806458-694517@atomide.com-4>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
