Return-Path: <SRS0=FXz0=I3=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BBAC433C1
	for <soc@archiver.kernel.org>; Mon, 29 Mar 2021 07:55:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B4A8261959; Mon, 29 Mar 2021 07:55:33 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id C667A6193A;
	Mon, 29 Mar 2021 07:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C667A6193A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id ABACE80AF;
	Mon, 29 Mar 2021 07:56:32 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 1/3] Driver changes for omaps for genpd support
Date: Mon, 29 Mar 2021 10:55:20 +0300
Message-Id: <pull-1617004205-537424@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 4c9f4865f4604744d4f1a43db22ac6ec9dc8e587:

  Merge branch 'fixes-rc2' into fixes (2021-03-08 11:34:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/ti-sysc-signed

for you to fetch changes up to d995d3d025bbd2d89abf12418f20d19bc0cb0130:

  bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)

----------------------------------------------------------------
Driver changes for omaps for genpd support for v5.13

In order to move omap4/5 and dra7 to probe with devicetree data and genpd,
we need to patch the related drivers to prepare.

These are mostly ti-sysc interconnect target module driver changes and soc
init changes. However, there are minor changes to other drivers too. There
are changes for pci-dra7xx probe, omap-prm idle configuration, and a omap5
clock change:

- ti-sysc needs iorange check improved when the interconnect target module
  has no control registers listed

- ti-sysc needs to probe l4_wkup and l4_cfg interconnects first to avoid
  issues with missing resources and unnecessary deferred probe

- ti-sysc debug option can now detect more devices

- ti-sysc now warns if an old incomplete devicetree data is found as we
  now rely on it being complete for am3 and 4

- soc init code needs to check for prcm and prm nodes for omap4/5 and
  dra7

- omap-prm driver needs to enable autoidle retention support for omap4

- omap5 clocks are missing gpmc and ocmc clock registers

- pci-dra7xx now needs to use builtin_platform_driver instead of using
  builtin_platform_driver_probe for deferred probe to work

There are also few minor non-urgent fixes:

- soc init code pdata_quirks_init_clocks should be static

- ti-sysc has few unneeded semiconon typos

- ti-sysc can use kzalloc instead of kcalloc for a single element

----------------------------------------------------------------
Tony Lindgren (8):
      bus: ti-sysc: Fix initializing module_pa for modules without sysc register
      bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
      bus: ti-sysc: Detect more modules for debugging
      bus: ti-sysc: Check for old incomplete dtb
      ARM: OMAP2+: Init both prm and prcm nodes early for clocks
      soc: ti: omap-prm: Allow hardware supported retention when idle
      clk: ti: omap5: Add missing gpmc and ocmc clkctrl
      PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driver

Wei Yongjun (1):
      ARM: OMAP2+: Make symbol 'pdata_quirks_init_clocks' static

Yang Li (1):
      bus: ti-sysc: remove unneeded semicolon

Zheng Yongjun (1):
      bus: ti-sysc: Use kzalloc for allocating only one thing

 arch/arm/mach-omap2/pdata-quirks.c      | 29 ++++++++----
 drivers/bus/ti-sysc.c                   | 84 ++++++++++++++++++++++++++++++---
 drivers/clk/ti/clk-54xx.c               |  2 +
 drivers/pci/controller/dwc/pci-dra7xx.c | 13 ++---
 drivers/soc/ti/omap_prm.c               | 16 +++++--
 include/dt-bindings/clock/omap5.h       |  2 +
 6 files changed, 122 insertions(+), 24 deletions(-)
