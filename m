Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7ADC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 09:55:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8D3613C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 09:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8D3613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pf3J6NouD7YKsrG9+ZXFSchd4mnDeAtALHYIbg/87pY=; b=RKgyFzs0b8f9TlXis7LYvON4Vy
	3A2Fk8fP0wPmqul4oU4SkFZCbXE+Qbem6MNwZOfSRmfxXmz8e47CxHM2mJYmWZhuf3oV5a+uwoH3T
	ypQv0dO4KMm4HVjqx/cMdaU+IrhmOkVS596iq02IVqdLZIzb2xGvW9FRQTy+79dbcMwxTsm0kZG6j
	88mV0GC+oG34Q/eEOPdqO1vWcbYSjSKPnrJobHOCH1dzwYCwhiCg44/HGiBp+o4Wo/GcUFLPOJu3W
	GRbXQTHwQTK2zxdJOqWCPI/IMzDR23WOh3h79pu6D39vBnMYkarec5Rs/y/zrg0ufBXpuYGvMsK7Q
	S4hpwx2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTiPL-0025bz-7Y; Tue, 06 Apr 2021 09:54:03 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lTiPG-0025bg-Gh
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 09:54:00 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 138C780A4;
 Tue,  6 Apr 2021 09:55:01 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Few more fixes for omaps for v5.12-rc cycle
Date: Tue,  6 Apr 2021 12:53:49 +0300
Message-ID: <pull-1617702755-711306@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_105358_718059_0020064B 
X-CRM114-Status: UNSURE (   9.50  )
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
Message-ID: <20210406095349.Mo9iSTC7bgFsOMNEcW_eYzIbMQnC-w8XD0Mo6NOoRMY@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b3d09a06d89f474cb52664e016849315a97e09d9:

  ARM: OMAP4: PM: update ROM return address for OSWR and OFF (2021-03-17 15:15:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc6-signed

for you to fetch changes up to fc85dc42a38405099f97aa2af709fe9504a82508:

  ARM: OMAP2+: Fix uninitialized sr_inst (2021-03-31 09:27:41 +0300)

----------------------------------------------------------------
Fixes for omaps for v5.12-rc cycle

Fix swapped mmc device order also for omap3 that got changed with the
recent PROBE_PREFER_ASYNCHRONOUS changes. While eventually the aliases
should be board specific, all the mmc device instances are all there in
the SoC, and we do probe them by default so that PM runtime can idle the
devices if left enabled from the bootloader.

Also included are two compiler warning fixes.

----------------------------------------------------------------
Tony Lindgren (3):
      ARM: OMAP2+: Fix warning for omap_init_time_of()
      ARM: dts: Fix swapped mmc order for omap3
      ARM: OMAP2+: Fix uninitialized sr_inst

 arch/arm/boot/dts/omap3.dtsi        | 3 +++
 arch/arm/mach-omap2/board-generic.c | 2 +-
 arch/arm/mach-omap2/sr_device.c     | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
