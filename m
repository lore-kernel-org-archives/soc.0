Return-Path: <SRS0=FeCC=G7=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AFBC433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:45:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BA11964DEF; Thu, 28 Jan 2021 14:45:09 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 285BE64DEC;
	Thu, 28 Jan 2021 14:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285BE64DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 6F24A80A9;
	Thu, 28 Jan 2021 14:45:13 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/2] SoC changes for omaps for v5.12
Date: Thu, 28 Jan 2021 16:45:01 +0200
Message-Id: <pull-1611845066-809577@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/soc-signed

for you to fetch changes up to 320f6f90cbe4818cf0d0f9441772d23aa441c506:

  ARM: OMAP2+: fix spellint typo (2021-01-26 13:43:17 +0200)

----------------------------------------------------------------
SoC changes for omaps for v5.12 merge window

Update email address for Roger and fix a typo

----------------------------------------------------------------
Roger Quadros (1):
      MAINTAINERS: Update address for OMAP GPMC driver

Wang Qing (1):
      ARM: OMAP2+: fix spellint typo

 MAINTAINERS                       | 2 +-
 arch/arm/mach-omap2/clockdomain.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
