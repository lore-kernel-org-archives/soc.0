Return-Path: <SRS0=k1hu=5D=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E222C5479D
	for <soc@archiver.kernel.org>; Fri,  6 Jan 2023 09:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7C3DC433F1; Fri,  6 Jan 2023 09:39:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 11AC7C433EF;
	Fri,  6 Jan 2023 09:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11AC7C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 213E011FB;
	Fri,  6 Jan 2023 01:40:05 -0800 (PST)
Received: from usa.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DDD43F23F;
	Fri,  6 Jan 2023 01:39:20 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.2
Date: Fri,  6 Jan 2023 09:39:09 +0000
Message-Id: <20230106093909.652657-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.2

for you to fetch changes up to e325285de2cd82fbdcc4df8898e4c6a597674816:

  firmware: arm_scmi: Fix virtio channels cleanup on shutdown (2023-01-03 16:50:44 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.2

Few fixes addressing:
1. Possible compromise with the shorter message size from a misbheaving
   SCMI platform firmware. The shmem accesses are now hardened to handle
   the same in fetch_notification and fetch_response.

2. Possible unsafe locking scenario which is solved by calling
   virtio_break_device() before getting hold of vioch->lock.

3. Possible stale error status reported from a previous message being
   used again as it is not cleared.

----------------------------------------------------------------
Cristian Marussi (4):
      firmware: arm_scmi: Clear stale xfer->hdr.status
      firmware: arm_scmi: Harden shared memory access in fetch_response
      firmware: arm_scmi: Harden shared memory access in fetch_notification
      firmware: arm_scmi: Fix virtio channels cleanup on shutdown

 drivers/firmware/arm_scmi/driver.c | 2 ++
 drivers/firmware/arm_scmi/shmem.c  | 9 ++++++---
 drivers/firmware/arm_scmi/virtio.c | 7 ++++++-
 3 files changed, 14 insertions(+), 4 deletions(-)
