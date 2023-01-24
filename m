Return-Path: <SRS0=M/nb=5V=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B8C25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 13:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 633DEC4339E; Tue, 24 Jan 2023 13:22:44 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id 781EFC433EF;
	Tue, 24 Jan 2023 13:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 781EFC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id CE2BF809F;
	Tue, 24 Jan 2023 13:22:41 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] One clean-up for omap1 for v6.3
Date: Tue, 24 Jan 2023 15:22:39 +0200
Message-Id: <pull-1674566532-427457@atomide.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.3/omap1-signed

for you to fetch changes up to 0414a100d6ab32721efa70ab55524540fdfe0ede:

  ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init() (2023-01-19 11:57:57 +0200)

----------------------------------------------------------------
One clean-up for omap1 for v6.3

One non-urgent change to use platform_device_put() instead of
platform_device_unregister().

----------------------------------------------------------------
Yang Yingliang (1):
      ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()

 arch/arm/mach-omap1/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
