Return-Path: <SRS0=I5Nz=I3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B1C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C157461997
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C157461997
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6XHbj3PLqsC9lFDQ9+gr5Fa2nG+o4bBjIYb5BixZEIY=; b=chFilOBNYhHtyAYmVDiwyj1YDT
	JL0AiYhH6YXqTMniQsqbJLnrLskEPIw8TXOUxDMmA/LL7KeQpRSDrIMRPfMDdDraal9hCjNy9S7RE
	EVCuuje0Ddbdk43ce8kfH2kgQvtKF/mqH1T3bPUyzhDpj/bCHIxI1mN68ysEsXE5BBZg/IzuX8owe
	jxnXI1NQTZ9VmKqPNlc5bYEuEyo1DmoqSFSLL7bHy/1xvClDw/+RfegFbPhxb2yrAhG11sGsnQ1DT
	V04aPmEmfSBInKnX9/gm9doQInG2MOvjCyZCqyKrolWdSf5inc+WWw3O30wmp4fqeHJ+P03NtwzVN
	kkFmFB5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv8B-000nQc-GO; Mon, 29 Mar 2021 16:52:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoeG-000YmD-SZ
 for linux-arm-kernel@desiato.infradead.org; Mon, 29 Mar 2021 09:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=UIKxEOf91T0Itg2OZackt2VGaI0ctDxkfkouJnC4s2A=; b=v1VaCkkUfD6uec82mTMiUyzfLP
 M4NAnjJlNIeCCvr9vMTovbG/ffjBPxzdHX+6kIUTVP9BxmBpcQLR7Ljo9mVuSwlQMudGw0KyitJ6g
 jCCka8ZjyREE/kHhWi07lQv+uWJ61Av8valOxZTSpi3KbUfjLx+tbXtWi2bu6R4aD7K+pU4JgLVHm
 eRBUj4QIam5I0IzpO1Xgq3VSOL6qKh/4RkJKeiGTt1ug4yrOB+E4rX4fsopvhk9qmPuqUaYeXNdNA
 i7HG//ZN526Zz7jlriDXiHMDZJTgw3zS5QCQM9YrEe+/BhFs7YzyyCIBKJ3U0YM0pNIeEWolVR8ZP
 2ZHs/NVQ==;
Received: from muru.com ([72.249.23.125])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQmkO-001Cn7-1N
 for linux-arm-kernel@lists.infradead.org; Mon, 29 Mar 2021 07:55:46 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id ABACE80AF;
 Mon, 29 Mar 2021 07:56:32 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 1/3] Driver changes for omaps for genpd support
Date: Mon, 29 Mar 2021 10:55:20 +0300
Message-ID: <pull-1617004205-537424@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_085540_810284_541A90BA 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210329075520.YOB7K9VNPGWXPXboxxjvy67g6TXs9kRVDON-fROVgrs@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
