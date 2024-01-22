Return-Path: <SRS0=25LG=JA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D21C47DAF
	for <soc@archiver.kernel.org>; Mon, 22 Jan 2024 16:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB11FC433A6; Mon, 22 Jan 2024 16:16:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 85856C433C7;
	Mon, 22 Jan 2024 16:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85856C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC43C1FB;
	Mon, 22 Jan 2024 08:17:29 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B55833F5A1;
	Mon, 22 Jan 2024 08:16:42 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.8
Date: Mon, 22 Jan 2024 16:16:39 +0000
Message-ID: <20240122161640.3551085-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.8

for you to fetch changes up to 6bd1b3fede83d8ba5314886062a9bfdada5102a9:

  firmware: arm_scmi: Fix the clock protocol supported version (2024-01-22 10:01:17 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.8

Few fixes addressing the below issues:

1. A spurious IRQ related to the late reply can get wrongly associated
   with the new enqueued request resulting in misinterpretation of data
   in shared memory. This race-condition can be detected by looking at
   the channel status bits which the platform must set to the channel
   free before triggering the completion IRQ. Adding a consistency check
   to validate such condition will fix the issue.
2. Incorrect use of asm-generic/bug.h instead of generic linux/bUg.h
3. xa_store() can't check for possible duplication insertion, use
   xa_insert() instead
4. Fix the SCMI clock protocol version in the v3.2 SCMI specification
5. Incorrect upgrade of highest supported clock protocol version from
   v2.0 to v3.0

----------------------------------------------------------------
Cristian Marussi (5):
      firmware: arm_scmi: Check mailbox/SMT channel for consistency
      firmware: arm_scmi: Use xa_insert() to store opps
      firmware: arm_scmi: Use xa_insert() when saving raw queues
      firmware: arm_scmi: Fix the clock protocol version for v3.2
      firmware: arm_scmi: Fix the clock protocol supported version

Tanzir Hasan (1):
      firmware: arm_scmi: Replace asm-generic/bug.h with linux/bug.h

 drivers/firmware/arm_scmi/clock.c    |  5 ++---
 drivers/firmware/arm_scmi/common.h   |  1 +
 drivers/firmware/arm_scmi/mailbox.c  | 14 ++++++++++++++
 drivers/firmware/arm_scmi/perf.c     | 23 ++++++++++++++++++-----
 drivers/firmware/arm_scmi/raw_mode.c | 12 ++++++++----
 drivers/firmware/arm_scmi/shmem.c    |  8 +++++++-
 6 files changed, 50 insertions(+), 13 deletions(-)
