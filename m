Return-Path: <SRS0=m6+P=MG=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C76C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 16:58:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C91B613C5; Wed, 14 Jul 2021 16:58:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 14B8561289;
	Wed, 14 Jul 2021 16:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B8561289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA985D6E;
	Wed, 14 Jul 2021 09:58:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C91C53F774;
	Wed, 14 Jul 2021 09:58:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: fixes for v5.14
Date: Wed, 14 Jul 2021 17:58:31 +0100
Message-Id: <20210714165831.2617437-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.14

for you to fetch changes up to bdb8742dc6f7c599c3d61959234fe4c23638727b:

  firmware: arm_scmi: Fix range check for the maximum number of pending messages (2021-07-13 11:42:20 +0100)

----------------------------------------------------------------
ARM SCMI fixes for v5.14

A small set of fixes:
- adding check for presence of probe while registering the driver to
  prevent NULL pointer access
- dropping the duplicate check as the driver core already takes care of it
- fix for possible scmi_linux_errmap buffer overflow
- fix to avoid sensor message structure padding
- fix the range check for the maximum number of pending SCMI messages
- fix for various kernel-doc warnings

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Fix kernel doc warnings about return values
      firmware: arm_scmi: Avoid padding in sensor message structure
      firmware: arm_scmi: Fix range check for the maximum number of pending messages

Sudeep Holla (5):
      firmware: arm_scmi: Simplify device probe function on the bus
      firmware: arm_scmi: Ensure drivers provide a probe function
      firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
      firmware: arm_scmi: Fix kernel doc warnings
      firmware: arm_scpi: Fix kernel doc warnings

 drivers/firmware/arm_scmi/bus.c     |  8 +++-----
 drivers/firmware/arm_scmi/driver.c  | 14 +++++++++-----
 drivers/firmware/arm_scmi/notify.c  |  4 ++++
 drivers/firmware/arm_scmi/sensors.c |  6 ++++--
 include/linux/scmi_protocol.h       | 14 +++++++++-----
 include/linux/scpi_protocol.h       |  8 ++++++++
 6 files changed, 37 insertions(+), 17 deletions(-)
