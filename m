Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C816AC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:41:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AD922228
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZYTrMV7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AD922228
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZgqfvUXM6F/YWHifEUtVyafi/OvPmOrE17AF+j138Co=; b=kZYTrMV7Lf5HzgwKS0io5tiH5s
	z876R61DexjD8zaMEIYYMbrF26JVBzmMlrqlURRrl8LI5DTkx8um4EUehf79aY0My0QTCKlnxZxIX
	vzbSs6bHgSTgg6uk2aAANrobm4Sz/OZLz+sct8ZYH7y7Mt2Mfdhae5VR+Wli6leD4vZHMDMecWEUP
	khrgM/pYPmOBHoYt4ZMEIYvlBAjBaJ8D4xzVFjW8OprGpUXttDoql97qN4suOZPNO7altA78TCs12
	1o9RnkKDXUtmeCMrMunf0WbjTnHq+ZzZp3SQ6RUdqO+xiWyCA85WQ8zmIaHUaSyb6/5q5NH5Zttfg
	eJBxw5Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiYL3-0000Db-Js; Fri, 27 Nov 2020 07:38:42 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiYKr-00009q-No
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 07:38:33 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id B8FD68063;
 Fri, 27 Nov 2020 07:38:34 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.11 merge window
Date: Fri, 27 Nov 2020 09:38:19 +0200
Message-ID: <pull-1606462656-588116@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_023831_412302_950F969C 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20201127073819.rRli8T7YtD_voc107FvgiboMkMEgFlgbfi70duEMw4A@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/soc-signed

for you to fetch changes up to 2e023b938048c9857af09b96ce672e9a31dbfb38:

  ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code (2020-11-19 11:45:42 +0200)

----------------------------------------------------------------
SoC changes for omaps for v5.11 merge window:

Several non-urgent fixes for various issues found by automated tests.
So far we have not been hitting any of these so these can wait for the
merge window no problem.

----------------------------------------------------------------
Jing Xiangfeng (1):
      ARM: OMAP2+: Remove redundant assignment to variable ret

Tang Bin (1):
      ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code

Xu Wang (1):
      ARM: OMAP2+: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare

Youling Tang (2):
      ARM: OMAP2+: Fix memleak in omap2xxx_clkt_vps_init
      ARM: OMAP2+: Fix kfree NULL pointer in omap2xxx_clkt_vps_init

 arch/arm/mach-omap1/clock.c                  | 14 +++++++-------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 11 +++++++----
 arch/arm/mach-omap2/display.c                |  6 ++----
 arch/arm/mach-omap2/omap_device.c            |  5 ++---
 4 files changed, 18 insertions(+), 18 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
