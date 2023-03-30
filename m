Return-Path: <SRS0=FmMO=7W=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910AEC6FD1D
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 12:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78366C433D2; Thu, 30 Mar 2023 12:46:17 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 4943AC4339B;
	Thu, 30 Mar 2023 12:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4943AC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id BC8EA80FE;
	Thu, 30 Mar 2023 12:46:14 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver clean-up for ti-sysc for v6.4
Date: Thu, 30 Mar 2023 15:46:10 +0300
Message-Id: <pull-1680180355-69164@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.4/ti-sysc-signed

for you to fetch changes up to b79ad2307a1dfd9cba3cfce6445fa0be74a757a0:

  bus: ti-sysc: Fix comment typo (2023-03-27 11:23:23 +0300)

----------------------------------------------------------------
Clean-up for ti-sysc driver for v6.4

Clean-up for ti-sysc interconnect target module driver mostly to remove
open coded ranges property parsing, to use of_property_present(), and
to use list_for_each_entry(). Also included is one comment typo change.

----------------------------------------------------------------
Jason Wang (1):
      bus: ti-sysc: Fix comment typo

Rob Herring (2):
      bus: ti-sysc: Remove open coded "ranges" parsing
      bus: ti-sysc: Use of_property_present() for testing DT property presence

Yang Yingliang (1):
      bus: ti-sysc: Use list_for_each_entry() helper

 drivers/bus/ti-sysc.c | 53 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 40 deletions(-)
