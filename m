Return-Path: <SRS0=5G/g=XL=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B0BC43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 11:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D2A1C341CA; Wed,  6 Jul 2022 11:50:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 6CB26C3411C;
	Wed,  6 Jul 2022 11:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CB26C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1751E106F;
	Wed,  6 Jul 2022 04:50:52 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8807D3F66F;
	Wed,  6 Jul 2022 04:50:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.20
Date: Wed,  6 Jul 2022 12:50:45 +0100
Message-Id: <20220706115045.2272678-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 4ce7e51dc712f8a006ce6abcc49f788c79287c03:

  firmware: arm_scmi: Remove usage of the deprecated ida_simple_xxx API (2022-06-27 16:58:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.20

for you to fetch changes up to b27d04d5a51c28322cadb18d8d2ff5d0fb892fff:

  firmware: arm_scmi: Use fast channel tracing (2022-07-04 14:28:43 +0100)

----------------------------------------------------------------
Arm SCMI updates for v5.20

The main additions this time around are:

1. The capability to trace full SCMI message headers and payloads.
   The recent unearthing of chain of old firmware issues motivated
   this effort so that it is easier to trace them and debug quicker
   than it took this time around in absence of such tracing.

2. SCMI System power control driver to handle platform's requests for a
   graceful shutdown. Though the system power control protocol has been
   around since the begining of SCMI, it lacked the timeout information
   that was added in SCMI v3.1 that enables kernel to take appropriate
   action within the timeout and doesn't have to rely on any other
   user inputs(which was blocking factor for addition of this driver
   earlier)

3. Support for SCMI Power Capping protocol that was introduced in SCMI v3.1
   This protocol is intended for controlling and monitoring the power
   consumption of power capping domains. The firmware also provides the
   hierarchy of powercap domains by providing parent domain information.

It also contains a bug fix in the old SCPI driver addressing possible
user-after-free issues.

----------------------------------------------------------------
Cristian Marussi (12):
      include: trace: Add SCMI full message tracing
      firmware: arm_scmi: Use new SCMI full message tracing
      firmware: arm_scmi: Support only one single system power device
      firmware: arm_scmi: Add SCMI v3.1 System Power extensions
      firmware: arm_scmi: Add devm_protocol_acquire helper
      firmware: arm_scmi: Add SCMI System Power Control driver
      dt-bindings: firmware: arm,scmi: Add support for powercap protocol
      firmware: arm_scmi: Add SCMI v3.1 powercap protocol basic support
      firmware: arm_scmi: Generalize the fast channel support
      firmware: arm_scmi: Add SCMI v3.1 powercap fast channels support
      include: trace: Add SCMI fast channel tracing
      firmware: arm_scmi: Use fast channel tracing

Sudeep Holla (1):
      firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails

 .../devicetree/bindings/firmware/arm,scmi.yaml     |  10 +
 drivers/firmware/arm_scmi/Kconfig                  |  12 +
 drivers/firmware/arm_scmi/Makefile                 |   3 +-
 drivers/firmware/arm_scmi/driver.c                 | 281 ++++++-
 drivers/firmware/arm_scmi/perf.c                   | 225 ++----
 drivers/firmware/arm_scmi/powercap.c               | 866 +++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h              |  23 +
 drivers/firmware/arm_scmi/scmi_power_control.c     | 362 +++++++++
 drivers/firmware/arm_scmi/system.c                 |  17 +-
 drivers/firmware/arm_scpi.c                        |  61 +-
 include/linux/scmi_protocol.h                      | 134 ++++
 include/trace/events/scmi.h                        |  56 ++
 12 files changed, 1836 insertions(+), 214 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/powercap.c
 create mode 100644 drivers/firmware/arm_scmi/scmi_power_control.c
