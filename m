Return-Path: <SRS0=bxq6=IW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6972BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Mar 2021 11:22:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95FB6191F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Mar 2021 11:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95FB6191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KbCSqXqkG5M/SkA/c8S73p/wPv7b4sVcE4qhoC5Jvvg=; b=Sv5YoDXTRf79tev+RwumZUD+2F
	KRldppNtfNyQzt1TeKBXDerWJJoDvilrG9NUvpST3a7RoYmuOVLNYYbDnhs/xVDvb6wpl/DHrkRWB
	CU4EBSf/2/0ZQWO4h61tlrTzLDp7x2CJdsUNxpLWeosBM3gE9f0gGqXy0luYxJ2+Wjjb7TQBpGqDY
	Xr3Fee3DzbbkedA4YmWym7OUWd9Dx95Y8yLiVad+AVgZoFPTGlYOiVNDiyAft52rOhSLFKHZC2afD
	RFN+C7VQid3Nsd0UMZ6LR2EagZEMELKdIu4bssi0aAE4Yqc/9Ge7isqZ9C3uaY5yMe4AqERap5Tw6
	+g/XdV5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP1ZC-00Gyie-8M; Wed, 24 Mar 2021 11:20:50 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lP1Z8-00Gyi3-CD
 for linux-arm-kernel@lists.infradead.org; Wed, 24 Mar 2021 11:20:48 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 82F9B8057;
 Wed, 24 Mar 2021 11:21:39 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] More fixes for omaps for v5.12-rc cycle
Date: Wed, 24 Mar 2021 13:20:39 +0200
Message-ID: <pull-1616584662-702939@atomide.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_112046_738830_A840AE0D 
X-CRM114-Status: GOOD (  11.97  )
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
Message-ID: <20210324112039.Ff-9vh7ZLzWEewfcm-4VxQwIb7x7Egs2tN23qDW3AA0@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc4-signed

for you to fetch changes up to b3d09a06d89f474cb52664e016849315a97e09d9:

  ARM: OMAP4: PM: update ROM return address for OSWR and OFF (2021-03-17 15:15:52 +0200)

----------------------------------------------------------------
More fixes for omaps for v5.12-rc cycle

Two fixes for hangs, mmc slot order fix, and a voltage typo fix:

- Remove unused duplicate sha2md5_fck clock node that can race with the
  OMAP4_SHA2MD5_CLKCTRL clock node for disable for unused clocks

- Add aliases for omap4/5 mmc to put the slots back into the right
  order again

- Fix typo for bionic voltage controllers that accidentally use mpu
  for all instances instead of mpu, core and iva

- Fix random hangs for droid4 caused by missing fix from TI Android
  kernel tree to do a dummy smc call on cpuidle wakeup path

----------------------------------------------------------------

Note that the stats below also include my earlier pull request as the pull
request is generated against v5.12-rc2.

Carlos Leija (1):
      ARM: OMAP4: PM: update ROM return address for OSWR and OFF

Grygorii Strashko (1):
      bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD

Mans Rullgard (1):
      ARM: dts: am33xx: add aliases for mmc interfaces

Tony Lindgren (9):
      soc: ti: omap-prm: Fix reboot issue with invalid pcie reset map for dra7
      ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data
      Merge branch 'fixes-v5.11' into fixes
      bus: ti-sysc: Fix warning on unbind if reset is not deasserted
      soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva
      ARM: dts: Drop duplicate sha2md5_fck to fix clk_disable race
      ARM: dts: Fix moving mmc devices with aliases for omap4 & 5
      Merge branch 'fixes-rc2' into fixes
      ARM: OMAP4: Fix PMIC voltage domains for bionic

 arch/arm/boot/dts/am33xx.dtsi          |  3 ++
 arch/arm/boot/dts/omap4.dtsi           |  5 +++
 arch/arm/boot/dts/omap44xx-clocks.dtsi |  8 ----
 arch/arm/boot/dts/omap5.dtsi           |  5 +++
 arch/arm/mach-omap2/omap-secure.c      | 39 ++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h      |  1 +
 arch/arm/mach-omap2/pmic-cpcap.c       |  4 +-
 arch/arm/mach-omap2/sr_device.c        | 75 ++++++++++++++++++++++++++--------
 drivers/bus/omap_l3_noc.c              |  4 +-
 drivers/bus/ti-sysc.c                  |  4 +-
 drivers/soc/ti/omap_prm.c              |  8 +++-
 11 files changed, 124 insertions(+), 32 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
