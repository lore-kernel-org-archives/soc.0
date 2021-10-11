Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C618C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:05:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3C360EB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B3C360EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAjWVbPhNK/6PUrmPhLWsRBAUGYS+bAxGl6+B4di0Eg=; b=EUfGgP1zxu2JI8
	g3ir2OTvfti0jqO7abcz6STAU8m+ewYE6shiYK/6F+KBa61It0Ixs3EzU2c4TLl08nKOVQz5oj0Qx
	KAB2JqHk18Ftg4KVuMJKXsT/tJ/u4n/iP1GEmSrlDhT1OR9IxRUx6Rmgm4qvU2QkWCRoVNRGMSzi6
	pOo0mgV5UlBC9hzb1ehFR+PFMS+tDbMqwOKzhd5dAyUKBYakRFNUYXVxKYP6yVoxoviPZ7suIeBkW
	+rkZEPcntxeZULhl9x/zGi/ExRzcz4sgzbFg4I/PKlx2Ft+k+H56loso5AphASu0B007EYwTpcUyD
	FQK4dZjsZX5oOkJXzJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZt64-008ynY-6u; Mon, 11 Oct 2021 11:03:56 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZt55-008yUK-4U
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 11:02:56 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 470E28061;
 Mon, 11 Oct 2021 11:03:25 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] Devicetree changes for omaps for v5.16
Date: Mon, 11 Oct 2021 14:02:44 +0300
Message-ID: <pull-1633950030-501948@atomide.com-3>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_040255_266531_9FB1219B 
X-CRM114-Status: UNSURE (   9.14  )
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
Message-ID: <20211011110244.lTZonVnpPChJD2eX2LsaNLX0YEB_q9aHYfPh8cAUPZI@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/dt-signed

for you to fetch changes up to 02794dbdc892a20479995cb9083a69a2ff213d96:

  ARM: dts: dra7: add entry for bb2d module (2021-10-06 10:46:44 +0300)

----------------------------------------------------------------
Devicetree changes for omaps for v5.16

These changes configure devices for am335x and dra7, and fixes
various devicetree check warnings for gta04:

- Update am335x-pocketbeagle to use pinconf-single

- A series of devicetree warning fixes for omap3 and gta04

- Configure bb2d Vivante GC 2D Accelerator for dra7

----------------------------------------------------------------
Andreas Kemnade (6):
      ARM: dts: omap3: fix cpu thermal label name
      arm: dts: omap3-gta04: cleanup LCD definition
      arm: dts: omap3-gta04: fix missing sensor supply
      arm: dts: omap3-gta04a5: fix missing sensor supply
      arm: dts: omap3-gta04a4: accelerometer irq fix
      arm: dts: omap3-gta04: cleanup led node names

Drew Fustini (1):
      ARM: dts: am335x-pocketbeagle: switch to pinconf-single

Gowtham Tammana (1):
      ARM: dts: dra7: add entry for bb2d module

 arch/arm/boot/dts/am335x-pocketbeagle.dts |  1 +
 arch/arm/boot/dts/dra7.dtsi               | 19 +++++++++++++++++++
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi  |  2 +-
 arch/arm/boot/dts/omap3-gta04.dtsi        | 23 +++++++++++++----------
 arch/arm/boot/dts/omap3-gta04a5.dts       |  2 ++
 5 files changed, 36 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
