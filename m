Return-Path: <SRS0=4721=L7=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CB6C4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 10:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 531BEC113CE; Fri, 26 Apr 2024 10:50:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 4E997C2BD10;
	Fri, 26 Apr 2024 10:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E997C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99DF1007;
	Fri, 26 Apr 2024 03:51:25 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7B6D3F64C;
	Fri, 26 Apr 2024 03:50:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.10
Date: Fri, 26 Apr 2024 11:50:48 +0100
Message-ID: <20240426105051.1527016-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.10

for you to fetch changes up to 3a3e2b83e8059679e92be4273c601ea21e105a89:

  firmware: arm_ffa: Avoid queuing work when running on the worker queue (2024-04-25 12:27:55 +0100)

----------------------------------------------------------------
Arm FF-A updates for v6.10

1. Support for handling notification pending interrupt(NPI)

   The FF-A uses the notification pending interrupt to inform the receiver
   that it has a pending notification. This is a virtual interrupt and is
   used by the following type of receivers:
   - A guest/VM running under a hypervisor(normal world usecase)
   - An S-EL1 SP running under a S-EL2 SPMC(secure world only usecase)

   Also, when the FF-A driver is running inside a guest VM under an
   hypervisor, the driver/guest VM doesn't have the permission/capability
   to request the creation of notification bitmaps. For a VM, the hypervisor
   reserves memory for its VM and hypervisor framework notification bitmaps
   and the SPMC reserves memory for its SP and SPMC framework notification
   bitmaps before the hypervisor initializes it.

   These changes include skipping of creation of notification bitmaps, some
   refactoring around schedule receiver interrupt(SRI) handling and addition
   of support for NPI.

2. Support for FF-A indirect messaging

   The FFA_MSG_SEND2 can be used to transmit a partition message from
   the Tx buffer of the sender(the driver in this case) endpoint to the Rx
   buffer of the receiver endpoint and inform the scheduler that the
   receiver endpoint must be run.

Apart from these two main features, there is an optimisation to avoid
queuing of a work when already running on the worker queue.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: arm_ffa: Fix memory corruption in ffa_msg_send2()

Jens Wiklander (2):
      firmware: arm_ffa: Skip creation of the notification bitmaps
      firmware: arm_ffa: Add support for handling notification pending interrupt(NPI)

Sudeep Holla (5):
      firmware: arm_ffa: Refactor SRI handling in prepartion to add NPI support
      firmware: arm_ffa: Fix kernel warning about incorrect SRI/NPI
      firmware: arm_ffa: Stash the partition properties for query purposes
      firmware: arm_ffa: Add support for FFA_MSG_SEND2
      firmware: arm_ffa: Avoid queuing work when running on the worker queue

 drivers/firmware/arm_ffa/driver.c | 187 +++++++++++++++++++++++++++++---------
 include/linux/arm_ffa.h           |  27 ++++++
 2 files changed, 169 insertions(+), 45 deletions(-)
