Return-Path: <SRS0=EFfK=E6=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC24BC2D0E4
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 12:24:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F6A62076B; Tue, 24 Nov 2020 12:24:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 47796206B5;
	Tue, 24 Nov 2020 12:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47796206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A94E101E;
	Tue, 24 Nov 2020 04:24:19 -0800 (PST)
Received: from usa.arm.com (unknown [10.57.54.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B663F70D;
	Tue, 24 Nov 2020 04:24:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	ARM SoC Team <arm@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.11
Date: Tue, 24 Nov 2020 12:24:12 +0000
Message-Id: <20201124122412.22386-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1

Hi ARM SoC Team,

Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
the fixes that got merged in -rc2.

Note the hwmon is acked by Guenter to take the changes together.
Also note that the SCMI regulator driver itself is getting queued by
Mark Brown separately and hence I have sent him pull request with
'scmi-voltage-5.11' tag which I have also merged here.

Regards,
Sudeep

-->8

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.11

for you to fetch changes up to f83eb664cdb45169338b9633f22eaafc23764f05:

  Merge tag 'scmi-voltage-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-next/scmi (2020-11-23 16:37:27 +0000)

----------------------------------------------------------------
ARM SCMI updates for v5.11

Two main additions this time:
1. Support for SCMI v3.0 sensor extensions
2. Support for voltage domain management protocol added newly to SCMI v3.0

----------------------------------------------------------------
Cristian Marussi (10):
      firmware: arm_scmi: Rework scmi_sensors_protocol_init
      firmware: arm_scmi: Add SCMI v3.0 sensors descriptors extensions
      dt-bindings: arm: Add support for SCMI Regulators
      firmware: arm_scmi: Add voltage domain management protocol support
      firmware: arm_scmi: Add support to enumerated SCMI voltage domain device
      hwmon: (scmi) Update hwmon internal scale data type
      firmware: arm_scmi: Add SCMI v3.0 sensors timestamped reads
      firmware: arm_scmi: Add SCMI v3.0 sensor configuration support
      firmware: arm_scmi: Add SCMI v3.0 sensor notifications
      firmware: arm_scmi: Remove residual _le structs naming

Qinglang Miao (1):
      firmware: arm_scmi: Fix missing destroy_workqueue()

Sudeep Holla (2):
      firmware: arm_scmi: Add full list of sensor type enumeration
      Merge tag 'scmi-voltage-5.11' of git://git.kernel.org/.../sudeep.holla/linux into for-next/scmi

 Documentation/devicetree/bindings/arm/arm,scmi.txt |  43 ++
 drivers/firmware/arm_scmi/Makefile                 |   2 +-
 drivers/firmware/arm_scmi/common.h                 |   1 +
 drivers/firmware/arm_scmi/driver.c                 |   3 +
 drivers/firmware/arm_scmi/notify.c                 |  10 +-
 drivers/firmware/arm_scmi/sensors.c                | 720 +++++++++++++++++++--
 drivers/firmware/arm_scmi/voltage.c                | 380 +++++++++++
 drivers/hwmon/scmi-hwmon.c                         |   2 +-
 include/linux/scmi_protocol.h                      | 352 +++++++++-
 9 files changed, 1450 insertions(+), 63 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/voltage.c
