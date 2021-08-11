Return-Path: <SRS0=cIcV=NC=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8120AC4338F
	for <soc@archiver.kernel.org>; Wed, 11 Aug 2021 07:58:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 534EE60FC0; Wed, 11 Aug 2021 07:58:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 943C460F38;
	Wed, 11 Aug 2021 07:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 943C460F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C10EB6D;
	Wed, 11 Aug 2021 00:58:04 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A51CC3F70D;
	Wed, 11 Aug 2021 00:58:03 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.15
Date: Wed, 11 Aug 2021 08:57:43 +0100
Message-Id: <20210811075743.707961-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit bdb8742dc6f7c599c3d61959234fe4c23638727b:

  firmware: arm_scmi: Fix range check for the maximum number of pending messages (2021-07-13 11:42:20 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.15

for you to fetch changes up to c0397c85b53d0bc6b081ff22d0d07e8eae149bba:

  firmware: arm_scmi: Use WARN_ON() to check configured transports (2021-08-09 11:43:32 +0100)

----------------------------------------------------------------
SCMI Updates for v5.15

The bulk of the addition this time is mainly refactoring to add support
for Virtio transport for SCMI and the addition of the support itself.
The refactoring includes allowing transport specific init/exit calls,
making each transport as compile time configurable, supporting
monotonically increasing tokens instead of using the next available
free buffer index as the token for scmi messages which eases handling
concurrent and out-of-order messages which is a must have for virtio
transport.

Virtio support itself is conformant to the virtio SCMI device spec [1].
Virtio device id 32 has been reserved for the SCMI device [2].

Other than the virtio support, there is one bug fix in the probe failure
clean up path.

[1] https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-scmi.tex
[2] https://www.oasis-open.org/committees/ballot.php?id=3496

----------------------------------------------------------------
Cristian Marussi (10):
      firmware: arm_scmi: Add support for type handling in common functions
      firmware: arm_scmi: Remove scmi_dump_header_dbg() helper
      firmware: arm_scmi: Add optional transport_init/exit support
      firmware: arm_scmi: Introduce monotonically increasing tokens
      firmware: arm_scmi: Handle concurrent and out-of-order messages
      firmware: arm_scmi: Make .clear_channel optional
      firmware: arm_scmi: Make polling mode optional
      firmware: arm_scmi: Make SCMI transports configurable
      firmware: arm_scmi: Add priv parameter to scmi_rx_callback
      firmware: arm_scmi: Use WARN_ON() to check configured transports

Igor Skalkin (4):
      firmware: arm_scmi: Make shmem support optional for transports
      firmware: arm_scmi: Add method to override max message number
      dt-bindings: arm: Add virtio transport for SCMI
      firmware: arm_scmi: Add virtio transport

Peter Hilber (2):
      firmware: arm_scmi: Add message passing abstractions for transports
      firmware: arm_scmi: Add optional link_supplier() transport op

Rishabh Bhatnagar (1):
      firmware: arm_scmi: Free mailbox channels if probe fails

kernel test robot (1):
      firmware: arm_scmi: Fix boolconv.cocci warnings

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   8 +-
 MAINTAINERS                                        |   1 +
 drivers/firmware/Kconfig                           |  34 +-
 drivers/firmware/arm_scmi/Kconfig                  |  95 +++
 drivers/firmware/arm_scmi/Makefile                 |   8 +-
 drivers/firmware/arm_scmi/common.h                 | 113 +++-
 drivers/firmware/arm_scmi/driver.c                 | 686 +++++++++++++++++----
 drivers/firmware/arm_scmi/mailbox.c                |   2 +-
 drivers/firmware/arm_scmi/msg.c                    | 111 ++++
 drivers/firmware/arm_scmi/smc.c                    |   3 +-
 drivers/firmware/arm_scmi/virtio.c                 | 491 +++++++++++++++
 include/uapi/linux/virtio_ids.h                    |   1 +
 include/uapi/linux/virtio_scmi.h                   |  24 +
 13 files changed, 1429 insertions(+), 148 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/msg.c
 create mode 100644 drivers/firmware/arm_scmi/virtio.c
 create mode 100644 include/uapi/linux/virtio_scmi.h
