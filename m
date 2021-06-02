Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C12C4708F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 06:21:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDDFC60234
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 06:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDDFC60234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+aEFO0RZ4BGo9PbRLkfzEMYDjqU3Kflw7KDtaBP9J5o=; b=cM+nfLf7vFBFRA
	Cswl+jL+eO+MFvLCNRYHxbkZg/uOo8o8Yze3GgcdopwWTHXiIf/n4zJeEXo9H7rxaPQIl5Q/VoN9L
	wvwnMzPo8+YO7PQAmorjg37BgQLhSFkis8gLU20OXPe3zQJTkQP3WOOD+1QNOs/J/eS2pCT2mCMVm
	7jygHbu3fQShQH2vXm2SsYIBgZBKuTlc2uiN667K50Kx5CaGWOtIomcNVnnThfdj8z4QenYTIcRwT
	rdaj0Lpo/XIdwe6nDjsWU91Z0LRqbFP+Yz1rayQtdBRnxtingTDlxy6VseHP10rlBHAq5ruBfEaO7
	WuQgvOsQae/4GXw3MzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKEr-0020Hg-E8; Wed, 02 Jun 2021 06:20:25 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKEo-0020H8-6c
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 06:20:23 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 5737A80E0;
 Wed,  2 Jun 2021 06:20:28 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] PM and build warning fixes for omaps
Date: Wed,  2 Jun 2021 09:20:17 +0300
Message-ID: <pull-1622614772-543196@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_232022_308657_D6DE309D 
X-CRM114-Status: GOOD (  13.05  )
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
Message-ID: <20210602062017.Bbx03ot5AN_RgXAhmiYLUl5YCY1WXr6l9gyqezTX0HA@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-pm

for you to fetch changes up to bae989c4bc53f861cc1b706aab0194703e9907a8:

  ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power (2021-05-26 14:01:27 +0300)

----------------------------------------------------------------
PM and build warning fixes for omaps

While chasing system suspend related regressions, I noticed few other
issues related to PM would be good to have fixed:

- UART idling does not always work for hardware autoidle features
- am335x resume works only the first time unless musb module is loaded

Then there are three patches for omap1 related warnings caused by the gpio
changes, and one build warning fix for legacy mmc platform code when mmc
is built as a loadable module.

These can all be merged whenever suitable naturally. I've sent the more
urgent SATA regression fix separately although it appears in this pull
request too because of the branches merged.

----------------------------------------------------------------
Maciej Falkowski (3):
      ARM: OMAP1: Fix use of possibly uninitialized irq variable
      ARM: OMAP1: isp1301-omap: Add missing gpiod_add_lookup_table function
      ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power

Tony Lindgren (5):
      bus: ti-sysc: Fix missing quirk flags for sata
      Merge branch 'omap-for-v5.13/ti-sysc' into fixes
      Merge branch 'fixes-rc1' into fixes
      bus: ti-sysc: Fix am335x resume hang for usb otg module
      bus: ti-sysc: Fix flakey idling of uarts and stop using swsup_sidle_act

Yongqiang Liu (1):
      ARM: OMAP2+: Fix build warning when mmc_omap is not built

 arch/arm/mach-omap1/board-ams-delta.c | 14 --------
 arch/arm/mach-omap1/board-h2.c        |  4 ++-
 arch/arm/mach-omap1/pm.c              | 10 ++++--
 arch/arm/mach-omap2/board-n8x0.c      |  2 +-
 drivers/bus/ti-sysc.c                 | 60 +++++++++++++++++++++++++++++++----
 include/linux/platform_data/ti-sysc.h |  1 +
 6 files changed, 66 insertions(+), 25 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
