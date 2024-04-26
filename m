Return-Path: <SRS0=4721=L7=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53947C19F4F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 10:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A58FC32782; Fri, 26 Apr 2024 10:50:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id CF48BC2BD10;
	Fri, 26 Apr 2024 10:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF48BC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 280382F4;
	Fri, 26 Apr 2024 03:51:09 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C7A43F64C;
	Fri, 26 Apr 2024 03:50:40 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.10
Date: Fri, 26 Apr 2024 11:50:29 +0100
Message-ID: <20240426105031.1526987-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

The pinctrl changes are acked and agreed to via SoC tree by Linus Walleij
and the dt-bindings are acked by Rob H.

Regards,
Sudeep

-->8

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.10

for you to fetch changes up to eb524cb651b794f2529e36deb6b18523adc9ecaa:

  pinctrl: Implementation of the generic scmi-pinctrl driver (2024-04-19 15:17:37 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.10

1. Basic support for SCMI v3.2 pincontrol protocol

   SCMI v3.2 introduces pincontrol protocol which is intended for
   controlling pins and their configuration. The pin control protocol
   provides commands to:
   - List the pins, groups of pins, available functions, and their
     association with each other.
   - Set the parameter configuration and multiplexing of the pins or
     groups of pins
   - Optionally request exclusive access to a pin or group of pins.
   - Optionally configure the permissions of an agent to access a pin
     or group of pins.

  These changes adds basic support for the same in the SCMI core layer
  and an implementation of the generic scmi-pinctrl driver with associated
  DT bindings.

2. Framework support for multiple vendors custom protocols

   With the fixed space for vendor protocols, the possibility of having
   multiple vendors implementing distinct SCMI vendor protocols with
   the same overlapping protocol number is very high and with the need
   to support them all in a single kernel image or a module is also high.

   In order to implement the same we assume:
   - vendor protocols has to be tagged at build time with a vendor_id
   - vendor protocols could also optionally be tagged at build time with
     sub_vendor_id and implementation version

  At the initialisation all the built vendor protocols are registered
  with the SCMI core using a key derived from the above tags

3. Logging and tracing improvements

   This includes using dev_err_probe() to bail out from probe, adding
   message dump traces for bad and unexpected replies and widening of
   the tag buffer in trace_scmi_dump_msg to allow diverse tag names

4. Miscellaneous updates or improvements

   This includes adding the accessor function get_max_msg_size() used
   in pinctl protocol, updation of dt-bindings examples for protocol@13
   to promote new bindings and simplification of scmi_devm_notifier_unregister

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Avoid non-constant printk format strings

Cristian Marussi (6):
      include: trace: Widen the tag buffer in trace_scmi_dump_msg
      firmware: arm_scmi: Add helper to trace bad messages
      firmware: arm_scmi: Add message dump traces for bad and unexpected replies
      firmware: arm_scmi: Simplify scmi_devm_notifier_unregister
      firmware: arm_scmi: Use dev_err_probe to bail out
      firmware: arm_scmi: Add support for multiple vendors custom protocols

Peng Fan (5):
      firmware: arm_scmi: Log the perf domain names in the error paths
      firmware: arm_scmi: Introduce get_max_msg_size() helper/accessor
      dt-bindings: firmware: Support SCMI pinctrl protocol
      firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol
      pinctrl: Implementation of the generic scmi-pinctrl driver

Ulf Hansson (1):
      dt-bindings: firmware: arm,scmi: Update examples for protocol@13

 .../devicetree/bindings/firmware/arm,scmi.yaml     |  54 +-
 MAINTAINERS                                        |   1 +
 drivers/firmware/arm_scmi/Makefile                 |   3 +-
 drivers/firmware/arm_scmi/common.h                 |  11 +
 drivers/firmware/arm_scmi/driver.c                 | 269 +++++-
 drivers/firmware/arm_scmi/mailbox.c                |   3 +
 drivers/firmware/arm_scmi/notify.c                 |  30 +-
 drivers/firmware/arm_scmi/perf.c                   |  15 +-
 drivers/firmware/arm_scmi/pinctrl.c                | 916 +++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h              |  18 +
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-scmi.c                     | 571 +++++++++++++
 include/linux/scmi_protocol.h                      |  86 +-
 include/trace/events/scmi.h                        |   6 +-
 15 files changed, 1925 insertions(+), 70 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/pinctrl.c
 create mode 100644 drivers/pinctrl/pinctrl-scmi.c
