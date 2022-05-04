Return-Path: <SRS0=YTjD=VM=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B25C433F5
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 11:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCB0AC385A4; Wed,  4 May 2022 11:29:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 88151C385AF;
	Wed,  4 May 2022 11:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88151C385AF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3514C1042;
	Wed,  4 May 2022 04:29:11 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2DF143FA50;
	Wed,  4 May 2022 04:29:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.19
Date: Wed,  4 May 2022 12:29:06 +0100
Message-Id: <20220504112906.3491985-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit bf36619a5463fbe6d3ecde37bb13680b532a253b:

  firmware: arm_scmi: Fix sparse warnings in OPTEE transport driver (2022-04-04 23:06:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.19

for you to fetch changes up to c7f8852d4216f7dc061f0bc02dda5af396048861:

  firmware: arm_scmi: Fix late checks on pointer dereference (2022-05-03 14:23:02 +0100)

----------------------------------------------------------------
Arm SCMI firmware driver updates/fixes for v5.19

The main theme for most of the changes this time is around the addition
of the support for SCMI v3.1 specification changes. Though one of the main
addition in the specification is the powercap protocol, that is still
work in progress and this set includes all other changes bit and pieces
scattered all around the different parts of the specification. There are
few bugs discovered during the process and associated fixes and some
refactoring to simplify the addition of v3.1 support. It mainly includes
the support for extended names, few newly added notifications and async
command support.

Apart from v3.1 SCMI changes, OPTEE transport gets support for dynamic
shared memory.

----------------------------------------------------------------
Cristian Marussi (22):
      firmware: arm_scmi: Make protocols initialisation fail on basic errors
      firmware: arm_scmi: Fix list protocols enumeration in the base protocol
      firmware: arm_scmi: Validate BASE_DISCOVER_LIST_PROTOCOLS response
      firmware: arm_scmi: Dynamically allocate implemented protocols array
      firmware: arm_scmi: Make name_get operations return a const
      firmware: arm_scmi: Check CLOCK_RATE_SET_COMPLETE async response
      firmware: arm_scmi: Remove unneeded NULL termination of clk name
      firmware: arm_scmi: Split protocol specific definitions in a dedicated header
      firmware: arm_scmi: Introduce a common SCMI v3.1 .extended_name_get helper
      firmware: arm_scmi: Add SCMI v3.1 protocol extended names support
      firmware: arm_scmi: Parse clock_enable_latency conditionally
      firmware: arm_scmi: Add iterators for multi-part commands
      firmware: arm_scmi: Use common iterators in the sensor protocol
      firmware: arm_scmi: Add SCMI v3.1 SENSOR_AXIS_NAME_GET support
      firmware: arm_scmi: Use common iterators in the clock protocol
      firmware: arm_scmi: Use common iterators in the voltage protocol
      firmware: arm_scmi: Use common iterators in the perf protocol
      firmware: arm_scmi: Add SCMI v3.1 perf power-cost in microwatts
      firmware: arm_scmi: Add checks for min/max limits in PERFORMANCE_LIMITS_SET
      firmware: arm_scmi: Add SCMI v3.1 clock notifications
      firmware: arm_scmi: Add SCMI v3.1 VOLTAGE_LEVEL_SET_COMPLETE
      firmware: arm_scmi: Fix late checks on pointer dereference

Etienne Carriere (1):
      firmware: arm_scmi: Support optee shared memory in the optee transport

Sudeep Holla (1):
      firmware: arm_scmi: Set clock latency to U32_MAX if it is not supported

 drivers/firmware/arm_scmi/Kconfig     |   1 +
 drivers/firmware/arm_scmi/base.c      |  46 ++-
 drivers/firmware/arm_scmi/clock.c     | 343 ++++++++++++++----
 drivers/firmware/arm_scmi/common.h    | 225 +-----------
 drivers/firmware/arm_scmi/driver.c    | 168 ++++++++-
 drivers/firmware/arm_scmi/optee.c     | 144 ++++++--
 drivers/firmware/arm_scmi/perf.c      | 162 ++++++---
 drivers/firmware/arm_scmi/power.c     |  44 ++-
 drivers/firmware/arm_scmi/protocols.h | 318 +++++++++++++++++
 drivers/firmware/arm_scmi/reset.c     |  40 ++-
 drivers/firmware/arm_scmi/sensors.c   | 645 +++++++++++++++++++---------------
 drivers/firmware/arm_scmi/system.c    |   9 +-
 drivers/firmware/arm_scmi/voltage.c   | 218 ++++++++----
 include/linux/scmi_protocol.h         |  31 +-
 14 files changed, 1613 insertions(+), 781 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/protocols.h
