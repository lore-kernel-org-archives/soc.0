Return-Path: <SRS0=I5Nz=I3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D300BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0BB61927
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Mar 2021 16:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0BB61927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kRvmrxNHst3zMFvoPpcEMghqACowRy5erWeGp3ygb8I=; b=SLYv+3tdcBTQexCrz/lK63p5H
	fT5LDu6pPLnbMGrv0vFP25mKQUw8GB1Z3iQESz1C3vu8sQ7Fd2KIoRCQfylxF4JAmG5E+5Tz5kZkO
	Z1hM5gH4CaQqye6/wBGckv0zgJ+r6PHD7RMRopZGtHxEBYRr+P1hYIZIJ8RwEFK3T2xis9FLnzu9Q
	NdIDpZEobkKaoPiE7d8skLMLQuHzzR6fP2XAgg/L5CT44fGj05vvxAhnl4Jga0AzJ7/8puRqlpXVy
	coi+4mONq1S9gWKuM9iMWx6RBKEjxsacKSQk9PnUdWlDPE+66KOGOJo3WnfKbx+6T/2L51Lv5Dqc1
	JYRsaB/nQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQv7t-000nMj-G9; Mon, 29 Mar 2021 16:52:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoe9-000Yld-7l
 for linux-arm-kernel@desiato.infradead.org; Mon, 29 Mar 2021 09:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=1M7/ajl573SLsHcDYMUpMXC8OemHaY/Y7u6UIeIQz8g=; b=Loln9peKtzkP63YivMxacejOHQ
 jnPRCL/gVCSatU8qhKB5VIsXKJM8JBmtmVpeOTZ4x/cIZyMHP836K9iXTgcORB1G6+7o1htoW1TDW
 TxQijRDoLQz+5qvqUpOY0fK+TPTRZgGC2uUek0A/Xm3edIaRhDS+Fs40KJ+/qA8djJp5ZWPKr/O5+
 hvN3VJXA0WuZNwcXWWJOClA5a5E7Knn3X8y0tyvdsMwiyoRy+ngAAHSmpVuHyeS6i2WNCOLLfgEpm
 QEl6Ra46b/NhwVTS0fpTiG1V/2U7ZyHogd0OXLIrX+0t9INXf81e12OzehkKpZH79yC8pu2Q8dcX2
 fMnUos5g==;
Received: from muru.com ([72.249.23.125])
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQmkO-001Cn9-Os
 for linux-arm-kernel@lists.infradead.org; Mon, 29 Mar 2021 07:55:52 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 2D7418111;
 Mon, 29 Mar 2021 07:56:37 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Devicetree changes for omaps for genpd support
Date: Mon, 29 Mar 2021 10:55:21 +0300
Message-ID: <pull-1617004205-537424@atomide.com-2>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <pull-1617004205-537424@atomide.com>
References: <pull-1617004205-537424@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_085541_862111_D2DD3E07 
X-CRM114-Status: GOOD (  10.20  )
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
Message-ID: <20210329075521.HQklcr94qzJqUjwMtZDroOKvu7WcwYRMZL9TwlD_MkI@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e259c2926c016dd815e5547412356d378fc1f589:

  PCI: pci-dra7xx: Prepare for deferred probe with module_platform_driver (2021-03-10 14:01:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/dts-genpd-signed

for you to fetch changes up to 083516ad540a1104a0ae5ae7e83f2a2d8e39d2bc:

  Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd (2021-03-10 14:16:34 +0200)

----------------------------------------------------------------
Devicetree changes for omaps for genpd support for v5.13

In order to move omap4/5 and dra7 to probe with devicetree data and genpd,
we need to add the missing interconnect target module configuration for
the drivers that do not still have it. This is similar to what we have
already done earlier for am3 and 4 earlier.

These patches are very much similar for all the three SoCs here. The dra7
changes were already available for v5.12 merge window, but were considered
too late to add for v5.12. The patches for omap4 and 5 follow the same
pattern, except for PCIe that is available only on dra7.

We do the changes one driver at a time, and still keep the legacy property
for "ti,hwmods" mostly around, except for cases when already not needed.
We will be dropping the custom property and related legacy data in a
follow-up series.

----------------------------------------------------------------
Tony Lindgren (38):
      ARM: dts: Update pcie ranges for dra7
      ARM: dts: Configure interconnect target module for dra7 pcie
      ARM: dts: Properly configure dra7 edma sysconfig registers
      ARM: dts: Move dra7 l3 noc to a separate node
      ARM: dts: Configure interconnect target module for dra7 qspi
      ARM: dts: Configure interconnect target module for dra7 sata
      ARM: dts: Configure interconnect target module for dra7 mpu
      ARM: dts: Configure interconnect target module for dra7 dmm
      ARM: dts: Configure simple-pm-bus for dra7 l4_wkup
      ARM: dts: Configure simple-pm-bus for dra7 l4_per1
      ARM: dts: Configure simple-pm-bus for dra7 l4_per2
      ARM: dts: Configure simple-pm-bus for dra7 l4_per3
      ARM: dts: Configure simple-pm-bus for dra7 l4_cfg
      ARM: dts: Configure simple-pm-bus for dra7 l3
      ARM: dts: Configure power-domain for omap4 gfx
      ARM: dts: Configure power-domain for omap4 dts iss
      ARM: dts: Configure interconnect target module for omap4 dmm
      ARM: dts: Configure interconnect target module for omap4 emif
      ARM: dts: Configure interconnect target module for omap4 debugss
      ARM: dts: Configure interconnect target module for omap4 mpu
      ARM: dts: Move omap4 mmio-sram out of l3 interconnect
      ARM: dts: Move omap4 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap4 l4_per
      ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
      ARM: dts: Prepare for simple-pm-bus for omap4 l3
      ARM: dts: Configure interconnect target module for omap5 dmm
      ARM: dts: Configure interconnect target module for omap5 emif
      ARM: dts: Configure interconnect target module for omap5 mpu
      ARM: dts: Configure interconnect target module for omap5 gpmc
      ARM: dts: Configure interconnect target module for omap5 sata
      ARM: dts: Move omap5 mmio-sram out of l3 interconnect
      ARM: dts: Move omap5 l3-noc to a separate node
      ARM: dts: Configure simple-pm-bus for omap5 l4_wkup
      ARM: dts: Configure simple-pm-bus for omap5 l4_per
      ARM: dts: Configure simple-pm-bus for omap5 l4_cfg
      ARM: dts: Configure simple-pm-bus for omap5 l3
      Merge tags 'genpd-dts-dra7', 'genpd-dts-omap4' and 'genpd-dts-omap5' into omap-for-v5.13/dts-genpd

 arch/arm/boot/dts/dra7-l4.dtsi  |  76 ++++++++++----
 arch/arm/boot/dts/dra7.dtsi     | 215 +++++++++++++++++++++++++++-------------
 arch/arm/boot/dts/omap4-l4.dtsi |  39 +++++---
 arch/arm/boot/dts/omap4.dtsi    | 165 ++++++++++++++++++++----------
 arch/arm/boot/dts/omap4460.dtsi |  13 ++-
 arch/arm/boot/dts/omap5-l4.dtsi |  67 +++++++++----
 arch/arm/boot/dts/omap5.dtsi    | 204 ++++++++++++++++++++++++--------------
 7 files changed, 526 insertions(+), 253 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
