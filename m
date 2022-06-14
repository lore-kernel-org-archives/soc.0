Return-Path: <SRS0=ynot=WV=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25222C43334
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 10:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E47C7C3411E; Tue, 14 Jun 2022 10:00:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 225B2C3411B;
	Tue, 14 Jun 2022 10:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 225B2C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2974923A;
	Tue, 14 Jun 2022 03:00:18 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 118A83F792;
	Tue, 14 Jun 2022 03:00:16 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.19
Date: Tue, 14 Jun 2022 11:00:07 +0100
Message-Id: <20220614100007.1029881-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.19

for you to fetch changes up to 44dbdf3bb3f44bf08897ed5f22eb262edcf3d926:

  firmware: arm_scmi: Fix incorrect error propagation in scmi_voltage_descriptors_get (2022-06-12 19:59:55 +0100)

----------------------------------------------------------------
Arm SCMI firmware driver fixes for v5.19

Bunch of fixes to address:
1. Issues reported on RK3568 EVB1 and BPI-R2 pro platforms using SCMI.
   More checks were added to validate the firmware response but that
   resulted in breaking above platforms, so the checks are relaxed when
   for cases where there is no potential memory corruption issues.

2. Possible data leak by reading more than required length from the firmware.
   Recent addition of support for v3.1 extended names used larger buffers
   in the kernel and used their size to read response from the firmware even
   for cases where shorter formats are used. While that is mostly harmless
   except when firmware sends malformed non-NULL terminated buffers.

3. Possible issues sending unsupported commands to the firmware.
   SENSOR_AXIS_NAME_GET added in v3.1 needs to be used only if the firmware
   supports it. While the firmware conformant to the spec must return not
   supported error for any unsupported features, it is always safer to
   avoid issuing commands that are known to be unsupported.

4. Incorrect error propagation in scmi_voltage_descriptors_get.
   Since the return value is not reset for each iteration of the loop, the
   error value in the previous iteration will be carried for the current one.
   Fix that by not saving the return values into local variable.

5. Some warnings reported by cppcheck

----------------------------------------------------------------
Cristian Marussi (4):
      firmware: arm_scmi: Relax base protocol sanity checks on the protocol list
      firmware: arm_scmi: Remove all the unused local variables
      firmware: arm_scmi: Fix SENSOR_AXIS_NAME_GET behaviour when unsupported
      firmware: arm_scmi: Avoid using extended string-buffers sizes if not necessary

Ludvig Pärsson (1):
      firmware: arm_scmi: Fix incorrect error propagation in scmi_voltage_descriptors_get

 drivers/firmware/arm_scmi/base.c      | 24 ++++++++-----
 drivers/firmware/arm_scmi/clock.c     |  7 ++--
 drivers/firmware/arm_scmi/perf.c      |  6 ++--
 drivers/firmware/arm_scmi/power.c     |  2 +-
 drivers/firmware/arm_scmi/protocols.h |  2 --
 drivers/firmware/arm_scmi/reset.c     |  2 +-
 drivers/firmware/arm_scmi/sensors.c   | 68 ++++++++++++++++++++++++++---------
 drivers/firmware/arm_scmi/voltage.c   | 15 +++-----
 include/linux/scmi_protocol.h         |  9 ++---
 9 files changed, 85 insertions(+), 50 deletions(-)
