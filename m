Return-Path: <SRS0=8gLa=VF=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3B6C433FE
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 12:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B32E4C385AF; Wed, 27 Apr 2022 12:08:42 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 31A0BC385AC;
	Wed, 27 Apr 2022 12:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31A0BC385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 0AA9380E4;
	Wed, 27 Apr 2022 12:05:36 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 4/4] Drivers changes for ti-sysc
Date: Wed, 27 Apr 2022 15:08:28 +0300
Message-Id: <pull-1651061256-836848@atomide.com-4>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <pull-1651061256-836848@atomide.com>
References: <pull-1651061256-836848@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8:

  iommu/omap: Fix regression in probe for NULL pointer dereference (2022-04-08 11:16:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.19/ti-sysc-signed

for you to fetch changes up to b6cd9be3d288249f52a1bcb10f7dbd445747ee59:

  bus: ti-sysc: Drop commas after SoC match table sentinels (2022-04-21 15:07:24 +0300)

----------------------------------------------------------------
Driver changes for omaps

One patch to remove commas from sentinels for ti-sysc.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      bus: ti-sysc: Drop commas after SoC match table sentinels

 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
