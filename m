Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C154C47083
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA93A613CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA93A613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYHjVIcQU3woFs0eMgsqZeLxvrpS368ya57QDM43IRE=; b=AYc22V9fMXoPbJ
	FB9/JZyjQTdWwXaER4dLOzJNne4OerlsR51CN18j16B5abu6lPDT5s9Cbu1MoBQyCrQ2huGkWzvtZ
	jYdR958fUtrK0JLe+6yIR6gIYTD5G42v3qYsQybrXLiGAkzHT5UF2ql3Hi25uzbLrSgyH8wTEXWZV
	hIhSHJYmBi6BN3YQ8ohH5zlv9bVCOLmVEcDoJr5Qu/zi4AQyR1Z7WWD+2SZw+Au8R28naMk4sfSmq
	nI2Fi3Tf4X7I8SAgGni8Utg5kvz3p2BCNz12eAOz5AP1A2n+9QbbuXmkvDagni3GmHg0QFDszRNG5
	HeflRGwTvvCG4fLLfilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLpn-002TLX-4Q; Wed, 02 Jun 2021 08:02:39 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loL9z-002GKW-CQ
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 07:19:28 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 98B9D8027;
 Wed,  2 Jun 2021 07:19:32 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Cleanup for omaps for v5.14
Date: Wed,  2 Jun 2021 10:19:09 +0300
Message-ID: <pull-1622618286-677305@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_001927_508814_E83A07D1 
X-CRM114-Status: GOOD (  10.03  )
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
Message-ID: <20210602071909.5cVNP3WsOmeMq4IiawWgNDaowxh_f_2nofDbdY1na0k@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/cleanup-signed

for you to fetch changes up to d61f263495d75cd0e45a50a2dc44ebc286db52b7:

  Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup (2021-05-21 12:42:41 +0300)

----------------------------------------------------------------
Clean up changes for omaps for v5.14 merge window

With the recent changes to drop legacy platform data for
am3/4, omap4/5, and dra7, we can drop the related unused
code. There is also a patch to remove leading spaces from
the Kconfig file.

----------------------------------------------------------------
Dario Binacchi (2):
      ARM: OMAP2+: CM: remove omap2_set_globals_cm()
      ARM: OMAP2+: remove omap2_set_globals_control()

Juerg Haefliger (1):
      ARM: OMAP1: Remove leading spaces in Kconfig

Lukas Bulwahn (1):
      MAINTAINERS: remove obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES

Tony Lindgren (1):
      Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup

 MAINTAINERS                     |  6 ------
 arch/arm/mach-omap1/Kconfig     | 12 ++++++------
 arch/arm/mach-omap2/cm.h        |  1 -
 arch/arm/mach-omap2/cm_common.c | 13 -------------
 arch/arm/mach-omap2/control.c   |  5 -----
 arch/arm/mach-omap2/control.h   |  1 -
 6 files changed, 6 insertions(+), 32 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
