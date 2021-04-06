Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27E9C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB3B613C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 10:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB3B613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VzxlBYp/KbL8brAv7WU1VvfwM3ElWUggSlch940JP8A=; b=HUaNLGP8imZpb8v5991MG/aJVb
	kFwaiWkMbtlN8r4A/0FJQZax6hQgk2o1pXABxY9GY5iGAdNe68RmeC/EvTz3eubJ+yX/aTNCtH7Zw
	aJctEGaOX91x8aH/cvNWlpEDgH1GjOtP+xT2QuleJmSAjaym68a5wprGmsfMJJHEYA/7MfMWX5WR/
	KpjKKGNPJakBnMX8CMfzVyets2cakujddxZCPhumBibqR5N13bSbJoE8PQ/RO2EfBug8kw4A6h2DN
	m1KakfgPzi/9TNBgVs5XJED0sM+ZGHn1A2bj+s8RBAMQTVu+1pkE4VaZf1l9e1rlbFggDEyiQzchs
	1E18vuDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTifv-0027qQ-JL; Tue, 06 Apr 2021 10:11:11 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lTifq-0027pY-Mt
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 10:11:08 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 6162D80A4;
 Tue,  6 Apr 2021 10:12:14 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] 
Date: Tue,  6 Apr 2021 13:10:58 +0300
Message-ID: <pull-1617703816-65652@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_111106_965774_D11B7E71 
X-CRM114-Status: UNSURE (   8.76  )
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
Message-ID: <20210406101058.JKyj2ENrzfvF_SQoexPHk84NioJUzWXJrY5z598o4sI@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/soc-signed

for you to fetch changes up to 206fa766ca2151d728a0894bdb03688d48564aa0:

  ARM: OMAP1: fix incorrect kernel-doc comment syntax in file (2021-03-31 09:05:42 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.13

Minor non-urgent fixes for issues found by robots and few typo fixes:

- Use DEFINE_DEBUGFS_ATTRIBUTE

- Add missing of_node_put()

- Use true and false for bool variable

- Use DEFINE_SPINLOCK

- Fix incorrect kerneldoc usage

----------------------------------------------------------------
Aditya Srivastava (2):
      ARM: OMAP2+: fix incorrect kernel-doc comment syntax in file
      ARM: OMAP1: fix incorrect kernel-doc comment syntax in file

Jiapeng Chong (1):
      ARM: OMAP2+: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

Lifu Chen (1):
      ARM: OMAP2+: Use DEFINE_SPINLOCK() for spinlock

Yang Li (2):
      ARM: OMAP2+: add missing call to of_node_put()
      ARM: OMAP2+: use true and false for bool variable

 arch/arm/mach-omap1/timer.c       |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c  |  1 +
 arch/arm/mach-omap2/omap_twl.c    |  2 +-
 arch/arm/mach-omap2/pm-debug.c    |  4 ++--
 arch/arm/mach-omap2/powerdomain.c | 12 ++++++------
 arch/arm/plat-omap/dma.c          |  3 +--
 6 files changed, 12 insertions(+), 12 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
