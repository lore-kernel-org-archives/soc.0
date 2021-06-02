Return-Path: <SRS0=xlGL=K4=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39404C47083
	for <soc@archiver.kernel.org>; Wed,  2 Jun 2021 06:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0BFB761376; Wed,  2 Jun 2021 06:00:13 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id A946E61360;
	Wed,  2 Jun 2021 06:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A946E61360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 93D1B80E0;
	Wed,  2 Jun 2021 06:00:17 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] SATA regresion fix for TI dra7 for v5.13
Date: Wed,  2 Jun 2021 09:00:05 +0300
Message-Id: <pull-1622613578-121536@atomide.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit d995d3d025bbd2d89abf12418f20d19bc0cb0130:

  bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/fixes-sata

for you to fetch changes up to db8e712e06874e37a1fdb9bb011618811fc96dbd:

  bus: ti-sysc: Fix missing quirk flags for sata (2021-05-07 14:21:32 +0300)

----------------------------------------------------------------
Regression fix for TI dra7 SATA not detecting drives

The SATA quirk flags are no missing With recent removal of legacy
platform data and we need to add the quirk flags to detect drives.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix missing quirk flags for sata

 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
