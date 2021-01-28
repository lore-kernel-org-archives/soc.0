Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E63C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 07:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47FB764DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 07:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47FB764DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=831hWL336dVBhGK476QhVc/raBwcseks2N3NrjQmU+Q=; b=HVCC0Zy88ljZCHNypzBtCJFxWb
	6scxh2bulbWdW7uYSlz8qtYjMnVNTyQhhr38qKQWD1jI6j21FbbZpwFpGmLGE2XouY9KJcX+PT9tC
	nQn33JRYWchHIel9VtcruUcMpPzkMs7M48Uk3x1BRgxddZTwG1IYD9vxnHjbMKcc7j9oAHG7y0Vbw
	/8XIsw3rbT8n3PS+8AXZAXxLiF1FH/jSE3nzz7D5DuAnjkTm/qktc1wMRsBVYENpjC7LNwl/AogB6
	oKdmFUMgMcI+RXmaO5sWbQT4gc+jw1kQ8HEd1T8Ruz0vX1pbxLNe50LHJ14h17u1b9G/NtUupujfH
	qZRlyUyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51yF-00030E-Pm; Thu, 28 Jan 2021 07:44:03 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51yD-0002yj-J6
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 07:44:02 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 22A2180A9;
 Thu, 28 Jan 2021 07:44:01 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] Fixes for omaps for v5.11-rc cycle
Date: Thu, 28 Jan 2021 09:43:50 +0200
Message-ID: <pull-1611818709-243493@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_024401_720566_4EAD1B68 
X-CRM114-Status: GOOD (  12.47  )
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
Message-ID: <20210128074350.9CShAaDf4ruJfTdGEeackJ4MDK-cQONGFcFhsAofmio@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/fixes-rc5

for you to fetch changes up to 177d8f1f7f47fe7c18ceb1d87893890d7e9c95a7:

  ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4 (2021-01-25 10:24:26 +0200)

----------------------------------------------------------------
Fixes for omaps for v5.11-rc cycle

The recent changes to switch SoCs to boot with ti-sysc interconnect
target module driver and genpd caused few regressions:

- The omap_prm reset driver needs to clear any reset bits deasserted by
  the bootloader or kexec boot for the three reset bit cases. Otherwise
  we can have an oops with accelerators starting to boot with potentially
  unconfigured MMU for example

- Custom kernel configs are not automatically selecting simple-pm-bus
  driver that we now need to probe interconnects so we need to select it
  always

- We are not passing legacy platform data in auxdata with simple-pm-bus
  like we do for simple-bus. We need to pass auxdata to simple-pm-bus so
  it can pass it to of_platform_populate()

Then recent RCU changes started causing splats for cpuidle44xx that now
need RCU_NONIDLE added to the calls in several places

And then we have few device specific fixes:

- We need to remove legacy spi-cs-hig for gta04 display to work, and
  set the gpio to active low

- Omap1 specific ohci-omap needs to call gpio_free()

- Droid4 needs to use padconf interrupt for the slider as the edge
  gpio interrupts may be lost for deeper idle states

----------------------------------------------------------------
H. Nikolaus Schaller (2):
      DTS: ARM: gta04: remove legacy spi-cs-high to make display work again
      ARM: dts; gta04: SPI panel chip select is active low

Linus Walleij (1):
      ARM: OMAP1: OSK: fix ohci-omap breakage

Tony Lindgren (7):
      Merge branch 'fixes-omap3' into fixes
      soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1
      ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
      Merge branch 'cpuidle-fix' into fixes
      ARM: OMAP2+: Fix booting for am335x after moving to simple-pm-bus
      drivers: bus: simple-pm-bus: Fix compatibility with simple-bus for auxdata
      ARM: dts: omap4-droid4: Fix lost keypad slide interrupts for droid4

 arch/arm/boot/dts/omap3-gta04.dtsi       |  3 +--
 arch/arm/boot/dts/omap3-n950-n9.dtsi     |  8 ++++++++
 arch/arm/boot/dts/omap4-droid4-xt894.dts |  5 +++++
 arch/arm/mach-omap1/board-osk.c          |  2 ++
 arch/arm/mach-omap2/Kconfig              | 28 ++++++++++++++--------------
 arch/arm/mach-omap2/cpuidle44xx.c        | 16 ++++++++--------
 arch/arm/mach-omap2/omap_device.c        |  8 +++++---
 arch/arm/mach-omap2/pdata-quirks.c       |  1 +
 arch/arm/mach-omap2/pmic-cpcap.c         |  2 +-
 drivers/bus/simple-pm-bus.c              |  3 ++-
 drivers/soc/ti/omap_prm.c                | 11 +++++++++++
 11 files changed, 58 insertions(+), 29 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
