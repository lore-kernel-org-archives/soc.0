Return-Path: <SRS0=xlGL=K4=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB48C4708F
	for <soc@archiver.kernel.org>; Wed,  2 Jun 2021 07:19:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0DFF661363; Wed,  2 Jun 2021 07:19:27 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 9D78661361;
	Wed,  2 Jun 2021 07:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D78661361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 98B9D8027;
	Wed,  2 Jun 2021 07:19:32 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Cleanup for omaps for v5.14
Date: Wed,  2 Jun 2021 10:19:09 +0300
Message-Id: <pull-1622618286-677305@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.14/cleanup-signed

for you to fetch changes up to d61f263495d75cd0e45a50a2dc44ebc286db52b7:

  Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup (2021-05-21 12:42:41 +0300)

----------------------------------------------------------------
Clean up changes for omaps for v5.14 merge window

With the recent changes to drop legacy platform data for
am3/4, omap4/5, and dra7, we can drop the related unused
code. There is also a patch to remove leading spaces from
the Kconfig file.

----------------------------------------------------------------
Dario Binacchi (2):
      ARM: OMAP2+: CM: remove omap2_set_globals_cm()
      ARM: OMAP2+: remove omap2_set_globals_control()

Juerg Haefliger (1):
      ARM: OMAP1: Remove leading spaces in Kconfig

Lukas Bulwahn (1):
      MAINTAINERS: remove obsolete OMAP HWMOD DATA FOR OMAP4-BASED DEVICES

Tony Lindgren (1):
      Merge branch 'omap-for-v5.13/genpd-cleanup' into omap-for-v5.14/cleanup

 MAINTAINERS                     |  6 ------
 arch/arm/mach-omap1/Kconfig     | 12 ++++++------
 arch/arm/mach-omap2/cm.h        |  1 -
 arch/arm/mach-omap2/cm_common.c | 13 -------------
 arch/arm/mach-omap2/control.c   |  5 -----
 arch/arm/mach-omap2/control.h   |  1 -
 6 files changed, 6 insertions(+), 32 deletions(-)
