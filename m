Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F91FDA8C
	for <soc@lists.linux.dev>; Wed,  9 Jul 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064153; cv=none; b=tEt8FkzAWl08odkWaVpy1IJalYWWCZcQrUsuhEK3mKve9UdvybTqA3/kH2wq4eut7joJyuXQ2MO2m2WcfpCIGpmfaKn2pCUcPgW7RCxjOYLgtSNgA4PtdDs3A/zCXzRdA+IgZ3qHjjD1zKmrTWDHSaNLdX6S29gsBvZHJI0EDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064153; c=relaxed/simple;
	bh=s7+KeLSw1Xzx1gEJv7HHmXLpVuvLWDViGU38eeCOjTA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F+LvyqEvHfVzzZImvHi0m8JPC498+ZTH4Cwoi1Q2Mh7+66tH53uTY4IpAEtyHVomU2u8Pk7gd0ue6x6gCKlCgJooTYG1obRGrOrAFLZkaSxzfJ/tbX4i5yiHTYIDFIi7BsUD8BBYvO1cyCVoL5PEHWfFyX47wqs55l0QGNt96+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 52A09C4CEF6; Wed,  9 Jul 2025 12:29:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 68B82C4CEEF;
	Wed,  9 Jul 2025 12:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68B82C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9506152B;
	Wed,  9 Jul 2025 05:28:59 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 554063F694;
	Wed,  9 Jul 2025 05:29:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.17
Date: Wed,  9 Jul 2025 13:29:07 +0100
Message-Id: <20250709122907.1171913-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.17

for you to fetch changes up to 62d6b81e8bd207ad44eff39d1a0fe17f0df510a5:

  firmware: arm_scmi: Convert to SYSTEM_SLEEP_PM_OPS (2025-07-09 10:49:58 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.17

1. A fix is introduced to correct turbo frequency marking for 64-bit
   devices with sustained frequencies over 4GHz, ensuring accurate turbo
   frequency identification.

2. Debug capabilities are being improved by introducing in-flight transfer
   tracking using debug counters, which help diagnose transfer congestion
   and behavior. Additional tracepoints are added to log in-flight counts
   at transfer begin and end, offering better runtime insight. The debug
   counters now support decrement operations using a newly added
   scmi_dec_count helper, making counter tracking symmetric and more robust.

3. A race condition in suspend-resume logic is being resolved by ensuring
   SCMI_SYSPOWER_IDLE state is set early during resume, improving suspend
   reliability under certain conditions. New suspend and resume operations
   are added to the scmi_bus_type to enable finer power management control
   for SCMI-based devices.

4. Finally enhancements are also made to avoid registering notifiers for
   events that a platform does not support, reducing unnecessary overhead
   by checking for unsupported event types during protocolinitialization.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Convert to SYSTEM_SLEEP_PM_OPS

Cristian Marussi (1):
      firmware: arm_scmi: Avoid notifier registration for unsupported events

Peng Fan (2):
      firmware: arm_scmi: Add power management operations to SCMI bus
      firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume

Philip Radford (3):
      firmware: arm_scmi: Add support for debug counter decrement
      firmware: arm_scmi: Track number of inflight SCMI transfers
      include: trace:  Add tracepoint support for inflight xfer count

Sibi Sankar (1):
      firmware: arm_scmi: Fix up turbo frequencies selection

 drivers/firmware/arm_scmi/bus.c                | 26 +++++++++++++++++
 drivers/firmware/arm_scmi/common.h             |  8 ++++++
 drivers/firmware/arm_scmi/driver.c             | 28 ++++++++++++++++--
 drivers/firmware/arm_scmi/notify.c             | 39 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/perf.c               |  2 +-
 drivers/firmware/arm_scmi/raw_mode.c           |  6 ++--
 drivers/firmware/arm_scmi/scmi_power_control.c | 22 +++++++++++----
 include/trace/events/scmi.h                    | 24 +++++++++-------
 8 files changed, 126 insertions(+), 29 deletions(-)
