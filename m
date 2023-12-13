Return-Path: <SRS0=rOi0=HY=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A90C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 12:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD17EC433CA; Wed, 13 Dec 2023 12:00:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BE2FFC433C7;
	Wed, 13 Dec 2023 12:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE2FFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 034C3C15;
	Wed, 13 Dec 2023 04:00:48 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E79353F762;
	Wed, 13 Dec 2023 04:00:00 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.8
Date: Wed, 13 Dec 2023 11:59:52 +0000
Message-ID: <20231213115953.3578115-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.8

for you to fetch changes up to b5efc28a754d2e90b9d52ba5aaa051cc24a5c85d:

  firmware: arm_scmi: Add protocol versioning checks (2023-12-01 16:46:10 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.8

Few minor updates:

1. Addition of protocol versioning checks to warn if the firmware version
   is newer or greater than the version supported by the kernel driver

2. Increment of the maximum OPP count in the perf protocol from 16 to 32
   as needed by a few recent/future qualcomm platforms

3. Optimisation of set performance operations by returning error
   immediately and avoiding to send the command to the platform(which
   would return error eventually) if the domain doesn't support perf
   operations. Similarly, the fastchannel handling is also optimised by
   avoiding to initialise the corresponding set operations fastchannels.

4. Extension of extended names helper to accomodate recently added new
   flags parameter to be able to properly configure the command used to
   query the extended name of a resource.

----------------------------------------------------------------
Cristian Marussi (2):
      firmware: arm_scmi: Add optional flags to extended names helper
      firmware: arm_scmi: Add protocol versioning checks

Sibi Sankar (2):
      firmware: arm_scmi: Fix NULL pointer dereference during fastchannel init
      firmware: arm_scmi: Increase the maximum opp count in the perf protocol

Sudeep Holla (1):
      firmware: arm_scmi: Populate fastchannel info only if set operations are allowed

xinglong.yang (1):
      firmware: arm_scmi: Check beforehand if the perf domain set operations are allowed

 drivers/firmware/arm_scmi/base.c      |  6 ++++-
 drivers/firmware/arm_scmi/clock.c     |  8 ++++--
 drivers/firmware/arm_scmi/driver.c    | 24 ++++++++++++++----
 drivers/firmware/arm_scmi/perf.c      | 48 ++++++++++++++++++++++-------------
 drivers/firmware/arm_scmi/power.c     |  8 ++++--
 drivers/firmware/arm_scmi/powercap.c  |  8 ++++--
 drivers/firmware/arm_scmi/protocols.h | 11 ++++++--
 drivers/firmware/arm_scmi/reset.c     |  9 +++++--
 drivers/firmware/arm_scmi/sensors.c   |  8 ++++--
 drivers/firmware/arm_scmi/system.c    |  6 ++++-
 drivers/firmware/arm_scmi/voltage.c   |  8 ++++--
 11 files changed, 105 insertions(+), 39 deletions(-)
