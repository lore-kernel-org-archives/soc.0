Return-Path: <SRS0=eJr4=JD=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DC8C43462
	for <soc@archiver.kernel.org>; Tue,  6 Apr 2021 10:11:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3BF2C613E0; Tue,  6 Apr 2021 10:11:09 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by mail.kernel.org (Postfix) with ESMTP id 074FC613D0;
	Tue,  6 Apr 2021 10:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 074FC613D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=tony@atomide.com
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 2EBC88128;
	Tue,  6 Apr 2021 10:12:17 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 3/3] 
Date: Tue,  6 Apr 2021 13:11:00 +0300
Message-Id: <pull-1617703816-65652@atomide.com-3>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <pull-1617703816-65652@atomide.com>
References: <pull-1617703816-65652@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/defconfig-signed

for you to fetch changes up to f6a7ea04ad2044e8f05b55f3bdd3133f468f60d1:

  ARM: omap2plus_defconfig: Add AT25 EEPROM module (2021-03-24 13:46:55 +0200)

----------------------------------------------------------------
Defconfig changes for omaps for v5.13

Update defconfig to have nefilter available as loadable modules
to make the defconfig more usable for networked devices. And we now
select SIMPLE_PM_BUS so it can be dropped. And some devices use
EEPROM_AT25 so let's add it as a loadable module.

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Add AT25 EEPROM module

Ivan Jelincic (2):
      ARM: omap2plus_defconfig: Update for dropped simple-pm-bus
      ARM: omap2plus_defconfig: Enable Netfilter components as modules

 arch/arm/configs/omap2plus_defconfig | 151 ++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)
