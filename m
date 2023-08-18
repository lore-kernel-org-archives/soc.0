Return-Path: <SRS0=mKyh=ED=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA043C3DA6F
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 03:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0577C433C9; Fri, 18 Aug 2023 03:03:39 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 5F047C433C8;
	Fri, 18 Aug 2023 03:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F047C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id D5BA480B0;
	Fri, 18 Aug 2023 03:03:29 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver changes for omaps for v6.6
Date: Fri, 18 Aug 2023 06:03:27 +0300
Message-ID: <pull-1692158857-597450@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.6/ti-sysc-signed

for you to fetch changes up to de44bf2f7683347f75690ef6cf61a1d5ba8f0891:

  bus: ti-sysc: Fix cast to enum warning (2023-08-15 08:52:01 +0300)

----------------------------------------------------------------
Driver changes for omaps for v6.6

Driver changes for ti-sysc interconnect target module driver and for
l3 interconnect error handler. The ti-sysc driver changes just enable
using it for 64-bit systems like TI am62 that have wake-up capability
for the wkup domain devices. The l3 error handling improves the code
to show the error source if an unrecoverable timeout error occurs.

----------------------------------------------------------------
Sicelo A. Mhlongo (1):
      bus: omap_l3_smx: identify timeout cause before rebooting

Tony Lindgren (5):
      bus: ti-sysc: Fix build warning for 64-bit build
      bus: ti-sysc: Build driver for TI K3 SoCs
      bus: ti-sysc: Configure uart quirks for k3 SoC
      bus: ti-sysc: Fix a build warning with W=1 for sysconfig
      bus: ti-sysc: Fix cast to enum warning

 drivers/bus/Kconfig       |  3 ++-
 drivers/bus/omap_l3_smx.c | 21 ++++++++++-----------
 drivers/bus/ti-sysc.c     |  5 ++++-
 3 files changed, 16 insertions(+), 13 deletions(-)
