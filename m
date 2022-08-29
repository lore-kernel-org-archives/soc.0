Return-Path: <SRS0=H8vK=ZB=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A100AECAAA4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 17:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8805DC433B5; Mon, 29 Aug 2022 17:44:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id ADDB7C433C1;
	Mon, 29 Aug 2022 17:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADDB7C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 040FA23A;
	Mon, 29 Aug 2022 10:44:45 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB2293F71A;
	Mon, 29 Aug 2022 10:44:37 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.0
Date: Mon, 29 Aug 2022 18:44:35 +0100
Message-Id: <20220829174435.207911-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.0

for you to fetch changes up to 40d30cf680cb735eed479a2fee127a7bc7fa3d4e:

  firmware: arm_scmi: Harmonize SCMI tracing message format (2022-08-23 12:21:37 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.0

Few fixes addressing possible out of bound access violations by
hardening them, incorrect asynchronous resets by restricting them,
incorrect SCMI tracing message format by harmonizing them, missing
kernel-doc in optee transport, missing SCMI PM driver remove
routine by adding it to avoid warning when scmi driver is unloaded
and finally improve checks in the info_get operations.

----------------------------------------------------------------
Cristian Marussi (7):
      firmware: arm_scmi: Fix missing kernel-doc in optee
      firmware: arm_scmi: Improve checks in the info_get operations
      firmware: arm_scmi: Harden accesses to the sensor domains
      firmware: arm_scmi: Harden accesses to the reset domains
      firmware: arm_scmi: Fix the asynchronous reset requests
      firmware: arm_scmi: Add SCMI PM driver remove routine
      firmware: arm_scmi: Harmonize SCMI tracing message format

 drivers/firmware/arm_scmi/clock.c          |  6 +++++-
 drivers/firmware/arm_scmi/optee.c          |  1 +
 drivers/firmware/arm_scmi/reset.c          | 10 +++++++---
 drivers/firmware/arm_scmi/scmi_pm_domain.c | 20 ++++++++++++++++++++
 drivers/firmware/arm_scmi/sensors.c        | 25 +++++++++++++++++++++----
 include/linux/scmi_protocol.h              |  4 ++--
 include/trace/events/scmi.h                | 30 +++++++++++++++---------------
 7 files changed, 71 insertions(+), 25 deletions(-)
