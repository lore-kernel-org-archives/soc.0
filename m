Return-Path: <SRS0=Gnea=RH=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562D9C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F26AC36AEB; Wed, 22 Dec 2021 14:13:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 02F9CC36AE5;
	Wed, 22 Dec 2021 14:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02F9CC36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 873C7D6E;
	Wed, 22 Dec 2021 06:13:55 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 827973F774;
	Wed, 22 Dec 2021 06:13:54 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.17
Date: Wed, 22 Dec 2021 14:13:42 +0000
Message-Id: <20211222141342.56395-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 026d9835b62bba34b7e657a0bfb76717822f9319:

  firmware: arm_scmi: Fix type error assignment in voltage protocol (2021-11-17 11:24:50 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.17

for you to fetch changes up to 94d0cd1da14af0042c8ee7c2cf401dfc321c575c:

  firmware: arm_scmi: Add new parameter to mark_txdone (2021-12-21 10:59:38 +0000)

----------------------------------------------------------------
Arm SCMI firmware interface updates for v5.17

Couple of main additions:
- Support for OPTEE based SCMI transport to enable using SCMI service
  provided by OPTEE on some platforms
- Support for atomic SCMI transports which enables few SCMI transactions
  to be completed in atomic context. This involves other refactoring work
  associated with it. It also marks SMC and OPTEE as atomic transport as
  the commands are completed once the return

Other changes involves some trace and log enhancements and a miscellaneous
bug fix.

----------------------------------------------------------------
Cristian Marussi (15):
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

Etienne Carriere (2):
      dt-bindings: arm: Add OP-TEE transport for SCMI
      firmware: arm_scmi: Add optee transport

Sudeep Holla (1):
      firmware: arm_scmi: optee: Drop the support for the OPTEE shared dynamic buffer

Wei Yongjun (1):
      firmware: arm_scmi: optee: Fix missing mutex_init()

 .../devicetree/bindings/firmware/arm,scmi.yaml     |  65 +++
 drivers/firmware/arm_scmi/Kconfig                  |  41 ++
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/common.h                 |  26 +-
 drivers/firmware/arm_scmi/driver.c                 | 207 ++++++--
 drivers/firmware/arm_scmi/mailbox.c                |   3 +-
 drivers/firmware/arm_scmi/optee.c                  | 567 +++++++++++++++++++++
 drivers/firmware/arm_scmi/smc.c                    |  98 +++-
 drivers/firmware/arm_scmi/virtio.c                 |  22 +-
 include/linux/scmi_protocol.h                      |   8 +
 include/trace/events/scmi.h                        |  28 +
 11 files changed, 986 insertions(+), 80 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/optee.c
