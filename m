Return-Path: <SRS0=Yn5P=LF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E6C4743D
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 07:57:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 290D7613BA; Fri, 11 Jun 2021 07:57:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 911AF61263;
	Fri, 11 Jun 2021 07:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911AF61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18DA5106F;
	Fri, 11 Jun 2021 00:57:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFCF83F719;
	Fri, 11 Jun 2021 00:57:32 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: updates for v5.14
Date: Fri, 11 Jun 2021 08:57:22 +0100
Message-Id: <20210611075722.2813550-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.14

for you to fetch changes up to 61832b35b4d953b2b4f6c668a3ad2a3013f40532:

  firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id (2021-06-08 16:06:12 +0100)

----------------------------------------------------------------
ARM SCMI updates for v5.14

- Support for SCMI clocks from the SCMI power domains
- Addition of checks for correct compatibles for shmem devicetree nodes
  that were found missing in the process of YAML schema conversion
- Kconfig and associated build fix found when optee transport are being
  worked on
- Couple of fixes and cleanups found as with work-in-progress virtio
  transport support

The new transports(optee and virtio) themselves are still being worked on
with ongoing reviews, they are not part of this yet

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Reset Rx buffer to max size during async commands
      firmware: arm_scmi: Add delayed response status check
      firmware: arm_scmi: Move reinit_completion from scmi_xfer_get to do_xfer

Etienne Carriere (1):
      firmware: arm_scmi: Add SMCCC discovery dependency in Kconfig

Nicolas Pitre (1):
      firmware: arm_scmi: Add clock management to the SCMI power domain

Sudeep Holla (4):
      firmware: arm_scmi: Fix the build when CONFIG_MAILBOX is not selected
      firmware: arm_scpi: Add compatibility checks for shmem node
      firmware: arm_scmi: Add compatibility checks for shmem node
      firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id

 drivers/firmware/Kconfig                   |  2 +-
 drivers/firmware/arm_scmi/common.h         |  2 +-
 drivers/firmware/arm_scmi/driver.c         | 24 +++++++++++++++---------
 drivers/firmware/arm_scmi/mailbox.c        |  3 +++
 drivers/firmware/arm_scmi/scmi_pm_domain.c | 26 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/smc.c            |  3 +++
 drivers/firmware/arm_scpi.c                | 11 +++++++++++
 7 files changed, 60 insertions(+), 11 deletions(-)
