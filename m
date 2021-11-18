Return-Path: <SRS0=zrrL=QF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A83C433EF
	for <soc@archiver.kernel.org>; Thu, 18 Nov 2021 12:17:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B469C61544; Thu, 18 Nov 2021 12:17:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 6BD226140A;
	Thu, 18 Nov 2021 12:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BD226140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49FF1FB;
	Thu, 18 Nov 2021 04:17:01 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B9753F766;
	Thu, 18 Nov 2021 04:17:00 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.16
Date: Thu, 18 Nov 2021 12:16:56 +0000
Message-Id: <20211118121656.4014764-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.16

for you to fetch changes up to 026d9835b62bba34b7e657a0bfb76717822f9319:

  firmware: arm_scmi: Fix type error assignment in voltage protocol (2021-11-17 11:24:50 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v5.16

Couple of fixes for sparse warnings(type error assignment in voltage and
sensor protocols), add proper propagation of error from scmi_pm_domain_probe
handling agent discovery response in base protocol correctly and a fix
to avoid null pointer de-reference in the error path.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Fix null de-reference on error path
      firmware: arm_scmi: Fix type error in sensor protocol
      firmware: arm_scmi: Fix type error assignment in voltage protocol

Peng Fan (1):
      firmware: arm_scmi: pm: Propagate return value to caller

Vincent Guittot (1):
      firmware: arm_scmi: Fix base agent discover response

 drivers/firmware/arm_scmi/base.c           | 15 ++++++++++++---
 drivers/firmware/arm_scmi/scmi_pm_domain.c |  4 +---
 drivers/firmware/arm_scmi/sensors.c        |  2 +-
 drivers/firmware/arm_scmi/virtio.c         | 10 +++++-----
 drivers/firmware/arm_scmi/voltage.c        |  2 +-
 5 files changed, 20 insertions(+), 13 deletions(-)
