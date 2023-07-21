Return-Path: <SRS0=bEjc=DH=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE05EB64DD
	for <soc@archiver.kernel.org>; Fri, 21 Jul 2023 11:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9A48C433CB; Fri, 21 Jul 2023 11:40:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 6DCA5C433CA;
	Fri, 21 Jul 2023 11:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6DCA5C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40A42F4;
	Fri, 21 Jul 2023 04:41:38 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6ECB23F738;
	Fri, 21 Jul 2023 04:40:54 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi/smccc: Fixes for v6.5
Date: Fri, 21 Jul 2023 12:40:52 +0100
Message-ID: <20230721114052.3371923-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! Please note I have included one SMCCC fix as part of my
normal SCMI pull request as SMCCC is extremely low traffic normally.

Regards,
Sudeep

-->8

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-smccc-fixes-6.5

for you to fetch changes up to d1ff11d7ad8704f8d615f6446041c221b2d2ec4d:

  firmware: arm_scmi: Fix chan_free cleanup on SMC (2023-07-20 13:31:58 +0100)

----------------------------------------------------------------
Arm SCMI and SMCCC fixes for v6.5

Set of fixes addressing issues:
1. Possible use of uninitialised results structure in the SMCCC SOC_ID
   driver if the driver fails to complete the initialisation
2. Missed signed error return value handling from simple_write_to_buffer()
   used in scmi_dbg_raw_mode_common_write()
3. The OF node reference obtained is not dropped if node is incompatible
   with "arm,scmi-shmem" in the mailbox as well as SMC transport channel
   setup
4. The possibility of a late response to an in-flight pending transaction
   that could end up triggering the interrupt handler after the SCMI core
   has cleaned up the transport channel as part of core driver remove

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Fix chan_free cleanup on SMC

Krzysztof Kozlowski (1):
      firmware: arm_scmi: Drop OF node reference in the transport channel setup

Punit Agrawal (1):
      firmware: smccc: Fix use of uninitialised results structure

Sukrut Bellary (1):
      firmware: arm_scmi: Fix signed error return values handling

 drivers/firmware/arm_scmi/mailbox.c  |  4 +++-
 drivers/firmware/arm_scmi/raw_mode.c |  5 ++++-
 drivers/firmware/arm_scmi/smc.c      | 21 ++++++++++++++-------
 drivers/firmware/smccc/soc_id.c      |  5 ++---
 4 files changed, 23 insertions(+), 12 deletions(-)
