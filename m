Return-Path: <SRS0=wInV=KA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19B9C54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 03:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4B6FC43394; Fri, 23 Feb 2024 03:34:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 5877DC43390;
	Fri, 23 Feb 2024 03:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5877DC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEDF15DB;
	Thu, 22 Feb 2024 19:35:19 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D63033F766;
	Thu, 22 Feb 2024 19:34:39 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.9
Date: Fri, 23 Feb 2024 03:34:33 +0000
Message-ID: <20240223033435.118028-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Sorry for the delayed pull request, was waiting for Ack from clk
maintainers for some trivial changes but Stephen had some comments/
discussion on one of them, so dropped all clk changes due to dependencies.
All the other changes are in -next for a while now.

Regards,
Sudeep

-->8

The following changes since commit 6bd1b3fede83d8ba5314886062a9bfdada5102a9:

  firmware: arm_scmi: Fix the clock protocol supported version (2024-01-22 10:01:17 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.9

for you to fetch changes up to c2f0961a45c4a973437285871540c155bed18ccb:

  MAINTAINERS: Update SCMI entry with HWMON driver (2024-02-23 02:01:13 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.9

Quite a few changes to extend support to SCMI v3.2 specification,
to enhance notification handling and other miscellaneous updates.

1. Enhancements to notification handling

   Until now, trying to register a notifier for an unsuppported
   notification returned an error genrating unneeded message exchanges
   with the SCMI platform. This can be avoided by looking up in advance
   the specific protocol and resources available.

   With these changes SCMI driver user will fail to register a notifier
   if the related command or resource is not supported (like before)
   without the need of exchanging any message.

   Perf notifications are also extended to provide the pre-calculated
   frequencies corresponding to the level or index carried by the

2. More SCMI v3.2 related updates

   One of the main addition includes a centralized support to the SCMI
   core to handle v3.2 optional protocol version negotiation, so that
   at protocol initialization time, if the platform advertised version
   is newer than supported by the kernel and protocol version negotiation
   is supported, the SCMI core will attempt to negotiate an older protocol
   version.

   It also includes the clock get permissions which indicates if any of
   the clock operations are forbidden by the platform for the OSPM agent.
   It can be used in the clock driver to avoid unnecessary message
   exchanges between the kernel and the platform which will always end
   up with the failure. It also includes other missing bits of clock
   v3.2 protocol so that the supported protocol version can be bumped
   to 0x30000 (v3.2).

3. Miscellaneous updates

   This includes addition of warning if the domain frequency multiplier
   is 0 or rounded off to indicate the actual frequencies are either
   wrong ot rounded off, hardening of clock domain info lookups, addition
   of multiple protocols registration support within a SCMI driver,
   update to SCMI entry in MAINTAINERS to include HWMON driver and
   constifying the scmi_bus_type structure.

   This also includes couple for fixes to minor issues: double free in
   SMC transport cleanup path and struct kernel-doc warnings in optee
   transport.

----------------------------------------------------------------
Andre Przywara (1):
      firmware: arm_scmi: Fix double free in SMC transport cleanup path

Cristian Marussi (17):
      firmware: arm_scmi: Rework clock domain info lookups
      firmware: arm_scmi: Add multiple protocols registration support
      firmware: arm_scmi: Check for notification support
      firmware: arm_scmi: Add a common helper to check if a message is supported
      firmware: arm_scmi: Implement is_notify_supported callback in perf protocol
      firmware: arm_scmi: Implement is_notify_supported callback in power protocol
      firmware: arm_scmi: Implement is_notify_supported callback in system power protocol
      firmware: arm_scmi: Implement is_notify_supported callback in clock protocol
      firmware: arm_scmi: Implement is_notify_supported callback in sensor protocol
      firmware: arm_scmi: Implement is_notify_supported callback in reset protocol
      firmware: arm_scmi: Implement is_notify_supported callback in powercap protocol
      firmware: arm_scmi: Use opps_by_lvl to store opps
      firmware: arm_scmi: Report frequencies in the perf notifications
      firmware: arm_scmi: Add support for v3.2 NEGOTIATE_PROTOCOL_VERSION
      firmware: arm_scmi: Add clock check for extended config support
      firmware: arm_scmi: Add standard clock OEM definitions
      firmware: arm_scmi: Update the supported clock protocol version

Florian Fainelli (1):
      MAINTAINERS: Update SCMI entry with HWMON driver

Peng Fan (1):
      firmware: arm_scmi: Implement clock get permissions

Randy Dunlap (1):
      firmware: arm_scmi: Fix struct kernel-doc warnings in optee transport

Ricardo B. Marliere (1):
      firmware: arm_scmi: Make scmi_bus_type const

Sudeep Holla (1):
      firmware: arm_scmi: Warn if domain frequency multiplier is 0 or rounded off

 MAINTAINERS                           |   1 +
 drivers/firmware/arm_scmi/bus.c       |  26 ++++-
 drivers/firmware/arm_scmi/clock.c     | 194 +++++++++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h    |   2 +-
 drivers/firmware/arm_scmi/driver.c    |  99 ++++++++++++++++-
 drivers/firmware/arm_scmi/notify.c    |  17 ++-
 drivers/firmware/arm_scmi/notify.h    |   4 +
 drivers/firmware/arm_scmi/optee.c     |   6 +-
 drivers/firmware/arm_scmi/perf.c      | 163 +++++++++++++++++++++++++---
 drivers/firmware/arm_scmi/power.c     |  30 +++++-
 drivers/firmware/arm_scmi/powercap.c  |  45 +++++++-
 drivers/firmware/arm_scmi/protocols.h |   5 +
 drivers/firmware/arm_scmi/reset.c     |  37 +++++--
 drivers/firmware/arm_scmi/sensors.c   |  37 ++++++-
 drivers/firmware/arm_scmi/smc.c       |   7 ++
 drivers/firmware/arm_scmi/system.c    |  16 +++
 include/linux/scmi_protocol.h         |  21 +++-
 17 files changed, 635 insertions(+), 75 deletions(-)
