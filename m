Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0C5C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:04:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CC3E60EB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CC3E60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X765wbDOY9ZoP+hQ72oSJuDdchYWRqmrJ7SY5jPuNPk=; b=syomyzsNKNitCK
	2D+oKiEleg7l72uCPBoiedFbAzwx0OCLOn18B3uP8yAuK6hOK4Fu7x0zXks+oO51aXKvBTYg/scW9
	xgAyVka26mkZN+dBmmEcDYRMw2q6Qgr15kodK/IeZlJeMkx9puu4ZiKRISwmRZLDu4pf4a3a7UTWd
	2kSbrFVemtobCqISzdKMXV0aEDUV06fj4uD3cmCyKH6xDTqxA2wtWJjnBickBF7ZUQjE1+L6MnQ+G
	FRaY6MyAlQr1tzLkDoR30q6dNNBut9EJEcac/gS/pGcUbn86a+4Ct+A5bqWsAm9s/ZIUgQHgjb0Bn
	/SgYSgSCQpjDxG11NMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZt5K-008yXu-DD; Mon, 11 Oct 2021 11:03:10 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZt4z-008ySD-OD
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 11:02:51 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id AD9BD8061;
 Mon, 11 Oct 2021 11:03:19 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] SoC changes for omaps for v5.16
Date: Mon, 11 Oct 2021 14:02:42 +0300
Message-ID: <pull-1633950030-501948@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_040249_854620_3FAF9425 
X-CRM114-Status: UNSURE (   8.81  )
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
Message-ID: <20211011110242.pObvJcHdK7pJhN26VtdvdFMU2FwQMc4v4IEFJ9eRPHg@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/soc-signed

for you to fetch changes up to e60150de94ef1508e77cbf5956ecc0ca84c4fc9b:

  ARM: OMAP2+: Drop unused CM defines for am3 (2021-10-06 12:36:23 +0300)

----------------------------------------------------------------
SoC changes for omaps for v5.16

Few non-urgent comment typo fixes and few changes to drop unused auxdata.
Then a series of changes to drop some a pile of old unused defines. These
can be now dropped for the SoCs that have been updated to use devicetree
data with drivers/clock and drivers/soc device drivers.

----------------------------------------------------------------
Jason Wang (2):
      ARM: OMAP2+: Fix typo in some comments
      ARM: OMAP2+: Fix comment typo

Tony Lindgren (11):
      ARM: OMAP2+: Drop old unused omap5_uevm_legacy_init()
      ARM: OMAP2+: Drop unused old auxdata for dra7x_evm_mmc_quirk()
      ARM: OMAP2+: Drop unused PRM defines for dra7
      ARM: OMAP2+: Drop unused PRM defines for omap5
      ARM: OMAP2+: Drop unused PRM defines for omap4
      ARM: OMAP2+: Drop unused PRM defines for am4
      ARM: OMAP2+: Drop unused PRM defines for am3
      ARM: OMAP2+: Drop unused CM defines for dra7
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap5
      ARM: OMAP2+: Drop unused CM and SCRM defines for omap4
      ARM: OMAP2+: Drop unused CM defines for am3

 arch/arm/mach-omap2/cm-regbits-44xx.h | 101 ------
 arch/arm/mach-omap2/cm1_44xx.h        | 174 ----------
 arch/arm/mach-omap2/cm1_54xx.h        | 168 ---------
 arch/arm/mach-omap2/cm1_7xx.h         | 263 --------------
 arch/arm/mach-omap2/cm2_44xx.h        | 386 ---------------------
 arch/arm/mach-omap2/cm2_54xx.h        | 325 ------------------
 arch/arm/mach-omap2/cm2_7xx.h         | 449 ------------------------
 arch/arm/mach-omap2/cm33xx.h          | 280 ---------------
 arch/arm/mach-omap2/omap_hwmod.c      |   6 +-
 arch/arm/mach-omap2/pdata-quirks.c    |  36 --
 arch/arm/mach-omap2/powerdomain.c     |   6 +-
 arch/arm/mach-omap2/prcm43xx.h        |  94 -----
 arch/arm/mach-omap2/prm33xx.h         |  40 ---
 arch/arm/mach-omap2/prm44xx.h         | 630 ----------------------------------
 arch/arm/mach-omap2/prm54xx.h         | 358 -------------------
 arch/arm/mach-omap2/prm7xx.h          | 613 ---------------------------------
 arch/arm/mach-omap2/scrm44xx.h        | 141 --------
 arch/arm/mach-omap2/scrm54xx.h        | 228 ------------
 18 files changed, 6 insertions(+), 4292 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/scrm54xx.h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
