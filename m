Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDDFC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:17:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B83660EB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B83660EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k5+gYP04rFIK7hH+/3qdjzBzeunVbEEHbnrsbC+lBfA=; b=LAETkX1I+TTgas
	4KXmCdwuSsOmFbOni4GPhclfZMxeequ/728iu3L0Yxu4YrgxpMVd9BIbXQ7lT1B9b21Gj8f8cqDdH
	yVX9jOf+cUPsgZJYU/EzNyfQd4r8YiIJF/lorP+4+GfpQr6jxWRHbcYV8N4hsYsfqL/6puVaGAM0N
	I4bk0yQcNLPSrfkqqnqUig5CpIK2cThhgpRXCwhiMc/4LWnzk1azN2Qzref+siTcnr52/J12qrE/f
	qGljfNsc7rt74xnAfzf59RrKE0V1TJnjipwgoptLHEhrw1JKchj5Zzzn/+VinBhCUyWdJZmvcUtts
	m9q/n0Ij1JiwK/5kN1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAuGv-002veX-UV; Tue, 03 Aug 2021 13:15:54 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAu6w-002qdM-BC
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 13:05:35 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id DFFB28050;
 Tue,  3 Aug 2021 13:05:51 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.14-rc series
Date: Tue,  3 Aug 2021 16:05:29 +0300
Message-ID: <pull-1627995895-406133@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_060534_491725_18B240F1 
X-CRM114-Status: UNSURE (   9.28  )
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
Message-ID: <20210803130529.TMlMoqiN9zpf6CK7zodc-sx3vMRiSOUfEnxOSkBIBzY@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/fixes-rc5-signed

for you to fetch changes up to 353b7a55dcaf5fb8758e09ebe2ddf5f3adbac7c5:

  Merge branch 'fixes-v5.14' into fixes (2021-07-27 11:25:08 +0300)

----------------------------------------------------------------
Fixes for omaps for v5.14-rc series

Some fixes for regressions and boot issues for various devices:

- Fix gpt12 system timer regression on earlier beagleboard revisions

- Fix potential NULL pointer access for omap_hwmod_get_pwrdm()

- Disable RNG on secure am335x variants as it's not accessible

- Fix flakey DCDC2 voltage causing hangs on am43x-epos-evm by reducing
  i2c0 bus speed for tps65218

- Fix typo for am437x-l4 can@0 node

- Fix omap5 regression caused by vdds_1v8_main fixed-regulator

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: dts: am437x-l4: fix typo in can@0 node

Dave Gerlach (1):
      ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218

H. Nikolaus Schaller (1):
      omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator

Kevin Hilman (1):
      bus: ti-sysc: AM3: RNG is GP only

Tero Kristo (1):
      ARM: omap2+: hwmod: fix potential NULL pointer access

Tony Lindgren (2):
      bus: ti-sysc: Fix gpt12 system timer issue with reserved status
      Merge branch 'fixes-v5.14' into fixes

 arch/arm/boot/dts/am437x-l4.dtsi          |  2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts      |  2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi |  9 +--------
 arch/arm/mach-omap2/omap_hwmod.c          | 10 +++++++++-
 drivers/bus/ti-sysc.c                     | 22 +++++++++++++++-------
 5 files changed, 27 insertions(+), 18 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
