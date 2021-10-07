Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB7DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 12:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD7761038
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 12:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FD7761038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4buPi23jyvxuygCMgzKY+PbEYTe19qu5fgTU3eyr6Q=; b=lTwqhiHWri7bIw
	6NV+kdxTYTuWb6cYCDsyiAhhQ0x9kS2zUv2WCc0/Osrdzap5O4vahaVE4AlZIYqn2dHW3Hc+9Kl1d
	y9vb2fc4VF5uJ+8ITPSu1HwEJTnUO1DfJhaGLMaRw5oBb+QkTeM1LDXi2rVoadzX1klDjo0bO7Int
	4G3ggu0ThE51b3u/0li1H5bF9pEeN4kt386f6lRzA+kqREP28KVLP2ABSrYyO5Yk3VqV0sPiDCHIU
	CD90+sI02JFHiM5Iskl5lSbyRpcv2mVbUQayDqkrKqUk2DD2oKPDBMcRx/Xzn/S2i5VIgNZ+WgpwI
	nZG//2Ot46YmeUUOkmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSU3-00HFuL-66; Thu, 07 Oct 2021 12:26:47 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSTs-00HFsg-US
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 12:26:38 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 3C03C80C7;
 Thu,  7 Oct 2021 12:27:04 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fix for omaps for v5.15-rc cycle
Date: Thu,  7 Oct 2021 15:26:31 +0300
Message-ID: <pull-1633609552-789682@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_052637_100400_1E96C50E 
X-CRM114-Status: UNSURE (   8.79  )
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
Message-ID: <20211007122631.JyutSOy8OJO_w43jivuuNW0exs1CEQh7YYrkwUfBkus@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/fixes-rc4

for you to fetch changes up to 80d680fdccba214e8106dc1aa33de5207ad75394:

  ARM: dts: omap3430-sdp: Fix NAND device node (2021-10-06 08:05:08 +0300)

----------------------------------------------------------------
Fixes for omaps for v5.15

Few regression fixes for omaps for the v5.15-rc cycle. There is a fix
for boot time hangs that can happen on some am335x devices that started
when the pruss devicetree nodes were added. The other fixes are less
critical:

- Fix compiler warning for sysc_init_soc() that got recently introduced

- Fix external abort for am335x pruss as otherwise some am335x will hang

- Use CLKDM_NOAUTO quirk also for dra7 dcan1

- Fix older NAND device node regression for omap3-sdp

----------------------------------------------------------------
Nathan Chancellor (1):
      bus: ti-sysc: Add break in switch statement in sysc_init_soc()

Roger Quadros (1):
      ARM: dts: omap3430-sdp: Fix NAND device node

Tony Lindgren (3):
      soc: ti: omap-prm: Fix external abort for am335x pruss
      Merge branch 'pruss-fix' into fixes
      bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893

 arch/arm/boot/dts/omap3430-sdp.dts |  2 +-
 arch/arm/mach-omap2/omap_hwmod.c   |  2 ++
 drivers/bus/ti-sysc.c              |  4 ++++
 drivers/soc/ti/omap_prm.c          | 27 +++++++++++++++------------
 4 files changed, 22 insertions(+), 13 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
