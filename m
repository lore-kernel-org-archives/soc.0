Return-Path: <SRS0=25LG=JA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D958BC47DAF
	for <soc@archiver.kernel.org>; Mon, 22 Jan 2024 16:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEC7FC43394; Mon, 22 Jan 2024 16:16:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E158EC433F1;
	Mon, 22 Jan 2024 16:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E158EC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29DB51FB;
	Mon, 22 Jan 2024 08:17:43 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2D5353F5A1;
	Mon, 22 Jan 2024 08:16:56 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.8
Date: Mon, 22 Jan 2024 16:16:50 +0000
Message-ID: <20240122161652.3551159-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.8

for you to fetch changes up to 0c565d16b80074e57e3e56240d13fc6cd6ed0334:

  firmware: arm_ffa: Handle partitions setup failures (2024-01-22 10:07:12 +0000)

----------------------------------------------------------------
Arm FF-A fixes for v6.8

Quite a few fixes addressing issues around missing RW lock initialisation
in ffa_setup_partitions(), missing check for xa_load() return value,
use of xa_insert instead of xa_store to flag case of duplicate insertion.
It also simplifies ffa_partitions_cleanup() with xa_for_each() and xa_erase()
instead of xa_extract() and kfree(). Finally it includes fixes around
handling of partitions setup failures during initialisation.

----------------------------------------------------------------
Cristian Marussi (6):
      firmware: arm_ffa: Add missing rwlock_init() in ffa_setup_partitions()
      firmware: arm_ffa: Add missing rwlock_init() for the driver partition
      firmware: arm_ffa: Check xa_load() return value
      firmware: arm_ffa: Simplify ffa_partitions_cleanup()
      firmware: arm_ffa: Use xa_insert() and check for result
      firmware: arm_ffa: Handle partitions setup failures

 drivers/firmware/arm_ffa/driver.c | 85 ++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 28 deletions(-)
