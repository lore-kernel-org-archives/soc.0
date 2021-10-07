Return-Path: <SRS0=TgmK=O3=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48285C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 10:28:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 13A0360C4C; Thu,  7 Oct 2021 10:28:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id B870E61090;
	Thu,  7 Oct 2021 10:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B870E61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8386D;
	Thu,  7 Oct 2021 03:28:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B6913F766;
	Thu,  7 Oct 2021 03:28:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.15
Date: Thu,  7 Oct 2021 11:28:22 +0100
Message-Id: <20211007102822.27886-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.15

for you to fetch changes up to bf1acf809d5694a942e113dfca6ef076d3904bb4:

  firmware: arm_scmi: Add proper barriers to scmi virtio device (2021-10-06 11:12:45 +0100)

----------------------------------------------------------------
SCMI fixes for v5.15

A few fixes addressing:
- Kconfig dependency between VIRTIO and ARM_SCMI_PROTOCOL
- Link-time error with __exit annotation for virtio_scmi_exit
- Unnecessary nested irqsave/irqrestore spinlocks in virtio transport
- Missing SMP barriers to protect accesses to SCMI virtio device

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Remove __exit annotation

Cristian Marussi (3):
      firmware: arm_scmi: Fix virtio transport Kconfig dependency
      firmware: arm_scmi: Simplify spinlocks in virtio transport
      firmware: arm_scmi: Add proper barriers to scmi virtio device

 drivers/firmware/arm_scmi/Kconfig  |  2 +-
 drivers/firmware/arm_scmi/virtio.c | 44 +++++++++++++++++++++++++++-----------
 2 files changed, 32 insertions(+), 14 deletions(-)
