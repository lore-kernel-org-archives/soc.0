Return-Path: <SRS0=AEYO=5R=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD5C25B4E
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 16:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DF73C4339E; Fri, 20 Jan 2023 16:22:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E3494C4339B;
	Fri, 20 Jan 2023 16:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3494C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D4314BF;
	Fri, 20 Jan 2023 08:22:38 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23F203F67D;
	Fri, 20 Jan 2023 08:21:56 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.3
Date: Fri, 20 Jan 2023 16:21:52 +0000
Message-Id: <20230120162152.1438456-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

The majority of the changes are in -next for a week now and all the reported
build related issues are fixed.

Regards,
Sudeep

-->8

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.3

for you to fetch changes up to 32a55bbdd74e2bb76a76979bc4f37e7e7ebe620d:

  firmware: arm_scmi: Clarify raw per-channel ABI documentation (2023-01-20 14:11:38 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.3

The main addition is a unified userspace interface for SCMI irrespective
of the underlying transport and along with some changed to refactor the
SCMI stack probing sequence.

1. SCMI unified userspace interface

   This is to have a unified way of testing an SCMI platform firmware
   implementation for compliance, fuzzing etc., from the perspective of
   the non-secure OSPM irrespective of the underlying transport supporting
   SCMI. It is just for testing/development and not a feature intended fo
   use in production.

   Currently an SCMI Compliance Suite[1] can only work by injecting SCMI
   messages using the mailbox test driver only which makes it transport
   specific and can't be used with any other transport like virtio,
   smc/hvc, optee, etc. Also the shared memory can be transport specific
   and it is better to even abstract/hide those details while providing
   the userspace access. So in order to scale with any transport, we need
   a unified interface for the same.

   In order to achieve that, SCMI "raw mode support" is being added through
   debugfs which is more configurable as well. A userspace application
   can inject bare SCMI binary messages into the SCMI core stack; such
   messages will be routed by the SCMI regular kernel stack to the backend
   platform firmware using the configured transport transparently. This
   eliminates the to know about the specific underlying transport
   internals that will be taken care of by the SCMI core stack itself.
   Further no additional changes needed in the device tree like in the
   mailbox-test driver.

[1] https://gitlab.arm.com/tests/scmi-tests

2. Refactoring of the SCMI stack probing sequence

   On some platforms, SCMI transport can be provide by OPTEE/TEE which
   introduces certain dependency in the probe ordering. In order to address
   the same, the SCMI bus is split into its own module which continues to
   be initialized at subsys_initcall, while the SCMI core stack, including
   its various transport backends (like optee, mailbox, virtio, smc), is
   now moved into a separate module at module_init level.

   This allows the other possibly dependent subsystems to register and/or
   access SCMI bus well before the core SCMI stack and its dependent
   transport backends.

----------------------------------------------------------------
Cristian Marussi (31):
      firmware: arm_scmi: Clear stale xfer->hdr.status
      firmware: arm_scmi: Harden shared memory access in fetch_response
      firmware: arm_scmi: Harden shared memory access in fetch_notification
      firmware: arm_scmi: Fix virtio channels cleanup on shutdown
      firmware: arm_scmi: Simplify chan_available transport operation
      firmware: arm_scmi: Use dedicated devices to initialize channels
      firmware: arm_scmi: Move protocol registration helpers
      firmware: arm_scmi: Add common notifier helpers
      firmware: arm_scmi: Refactor protocol device creation
      firmware: arm_scmi: Move handle get/set helpers
      firmware: arm_scmi: Refactor device create/destroy helpers
      firmware: arm_scmi: Introduce a new lifecycle for protocol devices
      firmware: arm_scmi: Split bus and driver into distinct modules
      firmware: arm_scmi: Refactor xfer in-flight registration routines
      firmware: arm_scmi: Refactor polling helpers
      firmware: arm_scmi: Refactor scmi_wait_for_message_response
      firmware: arm_scmi: Add flags field to xfer
      firmware: arm_scmi: Add xfer helpers to provide raw access
      firmware: arm_scmi: Move errors defs and code to common.h
      firmware: arm_scmi: Add internal platform/channel identifiers
      include: trace: Add platform and channel instance references
      debugfs: Export debugfs_create_str symbol
      firmware: arm_scmi: Populate a common SCMI debugfs root
      firmware: arm_scmi: Add debugfs ABI documentation for common entries
      firmware: arm_scmi: Add core raw transmission support
      firmware: arm_scmi: Add debugfs ABI documentation for raw mode
      firmware: arm_scmi: Reject SCMI drivers when configured in raw mode
      firmware: arm_scmi: Call raw mode hooks from the core stack
      firmware: arm_scmi: Add the raw mode co-existence support
      firmware: arm_scmi: Add per-channel raw injection support
      firmware: arm_scmi: Clarify raw per-channel ABI documentation

 Documentation/ABI/testing/debugfs-scmi     |   70 ++
 Documentation/ABI/testing/debugfs-scmi-raw |  117 +++
 drivers/firmware/arm_scmi/Kconfig          |   32 +
 drivers/firmware/arm_scmi/Makefile         |    9 +-
 drivers/firmware/arm_scmi/bus.c            |  395 ++++++--
 drivers/firmware/arm_scmi/common.h         |  100 +-
 drivers/firmware/arm_scmi/driver.c         | 1225 ++++++++++++++---------
 drivers/firmware/arm_scmi/mailbox.c        |    6 +-
 drivers/firmware/arm_scmi/optee.c          |    6 +-
 drivers/firmware/arm_scmi/protocols.h      |    7 +
 drivers/firmware/arm_scmi/raw_mode.c       | 1443 ++++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/raw_mode.h       |   31 +
 drivers/firmware/arm_scmi/shmem.c          |    9 +-
 drivers/firmware/arm_scmi/smc.c            |    6 +-
 drivers/firmware/arm_scmi/virtio.c         |   11 +-
 fs/debugfs/file.c                          |    1 +
 include/linux/scmi_protocol.h              |    5 -
 include/trace/events/scmi.h                |   18 +-
 18 files changed, 2917 insertions(+), 574 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-scmi
 create mode 100644 Documentation/ABI/testing/debugfs-scmi-raw
 create mode 100644 drivers/firmware/arm_scmi/raw_mode.c
 create mode 100644 drivers/firmware/arm_scmi/raw_mode.h
