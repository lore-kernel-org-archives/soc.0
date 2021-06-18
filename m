Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24123C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:00:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1FA86101A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1FA86101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2VmV49iMUlhVNJB4fvGVTGBUjndXaTSDsfbbqaJyPc=; b=MrZYVLr3Zk6zU8
	zII/of4dHxW1OS/C1165R/PAjKod0AnM+h6XfK6d9wB+sCIrJx/yz97EwOZV4SBftGQ9iktuNKKJ3
	Z0Je2Q72LPmeduwYTnW5SPb6tHsah4HpnI0xOiWSEUMGBbXzLcwjKnStkIKHTJH4+nBiN3+AEb7FQ
	NGfnWKYI5sUJk05aWDodLIz4V+7V/wYeaqVqrzo7nM+tPwSZucX6P5hmN8pVjQWW3Y49wzXH+Rtdo
	4d4DgQWglmbuFgjlLcaZ7g4tAhekKcnnZZ9mR86Pgpq8ypGt2ca7vVb/ssSxIbAM0Uml7NkfeFiGo
	fxhjqtXC28q4iJC8+sbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9OH-00DBY3-Qo; Fri, 18 Jun 2021 07:58:14 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9L0-00D9pa-Bx
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 07:54:52 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 620BF807E;
 Fri, 18 Jun 2021 07:54:59 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] Non-urgent fixes for omaps for v5.14
Date: Fri, 18 Jun 2021 10:54:45 +0300
Message-ID: <pull-1624002812-396117@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005450_516243_093FF34E 
X-CRM114-Status: UNSURE (   7.64  )
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
Message-ID: <20210618075445.5zBooV8NqSGQAcj-xCMzD7OE97-zvYqOTqd--zYXMYs@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 78b4b165280d3d70e7a217599f0c06a4c0bb11f9:

  ARM: dts: dra7: Fix duplicate USB4 target module node (2021-06-11 08:30:42 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-not-urgent-signed

for you to fetch changes up to 093a474ce10d8ea3db3ef2922aca5a38f34bab1b:

  ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured (2021-06-11 10:43:08 +0300)

----------------------------------------------------------------
Non-urgent fixes for omaps for v5.14 merge window

Warn and block suspend for am335x unless the PM related modules and
firmware are loaded and warn otherwise. Otherwise we easily end up
with a suspended system with nothing capable of waking it up.

We also drop a duplicated prototype for am33xx_init_early().

----------------------------------------------------------------
Alejandro Lucero (1):
      ARM: OMAP2+: remove duplicated prototype

Tony Lindgren (1):
      ARM: OMAP2+: Block suspend for am3 and am4 if PM is not configured

 arch/arm/mach-omap2/common.h      |  1 -
 arch/arm/mach-omap2/pm33xx-core.c | 40 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
