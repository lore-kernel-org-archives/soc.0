Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94460C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A9C61078
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53A9C61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ScdwZRJSQkNFG+/26FXtS5bznvcVZ6A/KZbf8EOW390=; b=WB/XvAXv5Z1P4+
	DIyuik5+PAgFPY3cK4ngyNTXijF9u+OUNc0q3GSpf/xPAEV4YSZ7f/EIoUK5gFPMfP75tGHpGCy78
	IyBFIrzGWcKiwr1DUgflFF/oblfgmXKdZXtkebIN3hHnykP0VPzRcFtMCh30plpuB7Lw39X+eYIJe
	JnPq1rUBAhEDU5r15/vW2uWkZHZK7khEPpGZN4BBfYvp40P2nbZYj7shud9+kCz4FnVsvRtZBXP69
	gt0w7qt5mk5NAXGkP/fnUaeeTz6h96FANWSE/9+Xgi9P2xe9jlVPvyBNLxweiIPIKF1nU8pWe8w2/
	MzQuSweZAIGd9HtSiP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZ1l-008haU-Lc; Thu, 05 Aug 2021 08:46:57 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZ1h-008hYn-VY
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 08:46:55 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 38B088061;
 Thu,  5 Aug 2021 08:47:08 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.15
Date: Thu,  5 Aug 2021 11:46:42 +0300
Message-ID: <pull-1628153040-834155@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_014654_103542_32A25DB3 
X-CRM114-Status: UNSURE (   7.66  )
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
Message-ID: <20210805084642.I_MdEc2dtLVLMZQveAV3iUVLr6uB3uvAlWE5JevITsk@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-signed

for you to fetch changes up to 8d5a937f10ed091e14fc57a4158f59983e2934cf:

  MAINTAINERS: Adopt SanCloud dts files as supported (2021-07-27 11:54:52 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.15

Update MAINTAINERS for SanCloud devices and drop unused old Kconfig

----------------------------------------------------------------
Paul Barker (1):
      MAINTAINERS: Adopt SanCloud dts files as supported

Peter Robinson (1):
      arm: omap2: Drop MACH_OMAP3517EVM entry

 MAINTAINERS                 | 6 ++++++
 arch/arm/mach-omap2/Kconfig | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
