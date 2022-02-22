Return-Path: <SRS0=HxAm=TF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD8BC433F5
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 20:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E591C340EF; Tue, 22 Feb 2022 20:18:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D010BC340E8;
	Tue, 22 Feb 2022 20:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D010BC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14222139F;
	Tue, 22 Feb 2022 12:18:01 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1312F3F70D;
	Tue, 22 Feb 2022 12:17:59 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.18
Date: Tue, 22 Feb 2022 20:17:42 +0000
Message-Id: <20220222201742.3338589-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.18

for you to fetch changes up to 38a0e5b735d6152d334d2f94b925a1c8a93bd7eb:

  clk: scmi: Support atomic clock enable/disable API (2022-02-21 10:37:00 +0000)

----------------------------------------------------------------
Arm SCMI firmware interface updates for v5.18

Few main additions include:
- Support for OPTEE based SCMI transport to enable using SCMI service
  provided by OPTEE on some platforms
- Support for atomic SCMI transports which enables few SCMI transactions
  to be completed in atomic context. This involves other refactoring work
  associated with it. It also marks SMC and OPTEE as atomic transport as
  the commands are completed once the return.
- Support for polling mode in SCMI VirtIO transport in order to support
  atomic operations
- Support for atomic clock operations based on availability of atomic
  capability in the underlying SCMI transport

Other changes involves some trace and log enhancements and miscellaneous
bug fixes.

----------------------------------------------------------------
Ard Biesheuvel (1):
      firmware: arm_scmi: Disable ftrace for Clang Thumb2 builds

Cristian Marussi (23):
      firmware: arm_scmi: Review some virtio log messages
      firmware: arm_scmi: Make virtio Version_1 compliance optional
      firmware: arm_scmi: Perform earlier cinfo lookup call in do_xfer
      firmware: arm_scmi: Set polling timeout to max_rx_timeout_ms
      firmware: arm_scmi: Refactor message response path
      include: trace: Add new scmi_xfer_response_wait event
      firmware: arm_scmi: Use new trace event scmi_xfer_response_wait
      firmware: arm_scmi: Add configurable polling mode for transports
      firmware: arm_scmi: Make smc transport use common completions
      firmware: arm_scmi: Add sync_cmds_completed_on_ret transport flag
      firmware: arm_scmi: Make smc support sync_cmds_completed_on_ret
      firmware: arm_scmi: Make optee support sync_cmds_completed_on_ret
      firmware: arm_scmi: Add support for atomic transports
      firmware: arm_scmi: Add atomic mode support to smc transport
      firmware: arm_scmi: Add new parameter to mark_txdone
      firmware: arm_scmi: Add a virtio channel refcount
      firmware: arm_scmi: Review virtio free_list handling
      firmware: arm_scmi: Add atomic mode support to virtio transport
      dt-bindings: firmware: arm,scmi: Add atomic-threshold-us optional property
      firmware: arm_scmi: Support optional system wide atomic-threshold-us
      firmware: arm_scmi: Add atomic support to clock protocol
      firmware: arm_scmi: Add support for clock_enable_latency
      clk: scmi: Support atomic clock enable/disable API

Etienne Carriere (2):
      dt-bindings: arm: Add OP-TEE transport for SCMI
      firmware: arm_scmi: Add optee transport

Sudeep Holla (2):
      firmware: arm_scmi: optee: Drop the support for the OPTEE shared dynamic buffer
      Merge tag 'scmi-updates-5.17' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-next/scmi

Wei Yongjun (1):
      firmware: arm_scmi: optee: Fix missing mutex_init()

 .../devicetree/bindings/firmware/arm,scmi.yaml     |  75 +++
 drivers/clk/clk-scmi.c                             |  71 ++-
 drivers/firmware/arm_scmi/Kconfig                  |  56 ++
 drivers/firmware/arm_scmi/Makefile                 |   8 +
 drivers/firmware/arm_scmi/clock.c                  |  34 +-
 drivers/firmware/arm_scmi/common.h                 |  26 +-
 drivers/firmware/arm_scmi/driver.c                 | 234 ++++++--
 drivers/firmware/arm_scmi/mailbox.c                |   3 +-
 drivers/firmware/arm_scmi/optee.c                  | 567 +++++++++++++++++++
 drivers/firmware/arm_scmi/smc.c                    |  98 +++-
 drivers/firmware/arm_scmi/virtio.c                 | 613 +++++++++++++++++----
 include/linux/scmi_protocol.h                      |  15 +
 include/trace/events/scmi.h                        |  28 +
 13 files changed, 1644 insertions(+), 184 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/optee.c
