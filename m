Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB832E757
	for <soc@lists.linux.dev>; Mon, 12 Jan 2026 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218644; cv=none; b=R3paI90nAxNIgA5qeD+1PcIr/3heqswiFceR+dPh4FaVzpKbk72O7hVatV/ElbacHMJzUHiX81fGgxn6IvTF1ocHePpF0KrhJ0SOLzLMks3eXaa0fS9iH8cOvqjJGkm+rfnYrVI5HssrgE0OVB8SX/vzqg9Dlrif6vclSJhgVCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218644; c=relaxed/simple;
	bh=2bd7TI9wtx4wQMxm8Kf94vegFIi6+EfhJC6fJ65b65I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSSjNyae8r2DWiix4w7X4gsG0gMhwko5JMwcrIcZHqUZIU5z2pRKDx+cwM3P4GsYgy7Tx5/mC0SDUFxMaJ97NvsuHdjR/hCzhfikJLIfqefD7Ud5zPf9xVBzmwMch6Z5I2MqSBenFDPByqhZBJS6iC+l086Sb8zhoXDrRoB73WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 39386C19421; Mon, 12 Jan 2026 11:50:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 0E8A0C19424;
	Mon, 12 Jan 2026 11:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E8A0C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A578B497;
	Mon, 12 Jan 2026 03:50:35 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A8AA3F694;
	Mon, 12 Jan 2026 03:50:41 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.20/v7.0
Date: Mon, 12 Jan 2026 11:50:18 +0000
Message-ID: <20260112115021.2551442-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112115021.2551442-2-sudeep.holla@arm.com>
References: <20260112115021.2551442-1-sudeep.holla@arm.com>
 <20260112115021.2551442-2-sudeep.holla@arm.com>
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.0

for you to fetch changes up to 24a0ffefe3f097aa8fe6997a731a71487dd0721f:

  firmware: arm_scmi: Remove legacy protocol versioning logic (2025-12-27 20:09:30 +0000)

----------------------------------------------------------------
Arm SCMI updates for v7.0

A set of cleanups, refactoring, and fixes to the Arm SCMI stack:

1. Rework protocol version negotiation by moving version discovery and
   downgrade handling into the SCMI core and performing negotiation early,
   before protocol initialization. Remove legacy per-protocol versioning
   logic now made redundant by centralized SCMI handling.

2. Increase the internal MAX_OPPS limit in the SCMI performance protocol
   to 64, allowing platforms with larger OPP tables to be fully supported.

3. Reduce duplicated boilerplate in pinctrl and related protocols by
   consolidating validation and lookup logic in protocol get info helpers.

4. Refactor reset protocol domain handling by introducing a shared lookup
   helper, ensuring consistent validation and error reporting.

5. Fix potential undefined behaviour by properly initializing pointers
   annotated with the __free attribute.

----------------------------------------------------------------
Ally Heev (1):
      firmware: arm_scmi: Fix uninitialized pointers with __free attr

Artem Shimko (1):
      firmware: arm_scmi: Refactor reset domain handling

Cristian Marussi (2):
      firmware: arm_scmi: Rework protocol version negotiation logic
      firmware: arm_scmi: Remove legacy protocol versioning logic

Dan Carpenter (1):
      firmware: arm_scmi: Move boiler plate code into the get info functions

Vivek Aknurwar (1):
      firmware: arm_scmi: Increase performance MAX_OPPS limit to 64

 drivers/firmware/arm_scmi/base.c                   |  11 +-
 drivers/firmware/arm_scmi/clock.c                  |  24 ++---
 drivers/firmware/arm_scmi/driver.c                 |  98 +++++++++++++----
 drivers/firmware/arm_scmi/perf.c                   |  59 ++++------
 drivers/firmware/arm_scmi/pinctrl.c                | 120 +++++++++------------
 drivers/firmware/arm_scmi/power.c                  |  18 +---
 drivers/firmware/arm_scmi/powercap.c               |  21 ++--
 drivers/firmware/arm_scmi/protocols.h              |   9 +-
 drivers/firmware/arm_scmi/reset.c                  |  68 ++++++------
 drivers/firmware/arm_scmi/sensors.c                |  22 ++--
 drivers/firmware/arm_scmi/shmem.c                  |   5 +-
 drivers/firmware/arm_scmi/system.c                 |  14 +--
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  10 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |   9 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |   9 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  10 +-
 drivers/firmware/arm_scmi/voltage.c                |  13 +--
 17 files changed, 238 insertions(+), 282 deletions(-)
