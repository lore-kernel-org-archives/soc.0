Return-Path: <SRS0=2RLa=CA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFCC7EE25
	for <soc@archiver.kernel.org>; Mon, 12 Jun 2023 12:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1D97C4339C; Mon, 12 Jun 2023 12:10:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 7EF34C433D2;
	Mon, 12 Jun 2023 12:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7EF34C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBEA21FB;
	Mon, 12 Jun 2023 05:11:07 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7A083F587;
	Mon, 12 Jun 2023 05:10:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.5
Date: Mon, 12 Jun 2023 13:10:17 +0100
Message-Id: <20230612121017.4108104-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! The powercap driver related changes that have dependency
on the firmware driver part are acked-by Rafael and agreed to merge the
changes via SoC tree. All the changes are in -next for a while now.

Regards,
Sudeep

-->8

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.5

for you to fetch changes up to aaffb4cacd4c5546778a6e3b4bb2deef2dde4bd1:

  powercap: arm_scmi: Add support for disabling powercaps on a zone (2023-06-06 14:05:10 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.5

Couple of main additions :-

1. Support for multiple SMC/HVC transports for SCMI:

   Some platforms need to support multiple SCMI instances within
   a platform(more commonly in a VM). The same SMC/HVC FID is used with
   all the instances. The platform or the hypervisor needs a way to
   distinguish among SMC/HVC calls made from different instances.

   This change adds support for passing shmem channel address as the
   parameters in the SMC/HVC call. The address is split into 4KB-page
   and offset for simiplicity.

2. Addition od SCMI v3.2 explicit powercap enable/disable support:

   SCMI v3.2 specification introduces support to disable powercapping
   as a whole on the desired zones.

   This change adds the needed support to the core SCMI powercap protocol,
   exposing enable/disable protocol operations and then wiring up the new
   operartions in the related powercap framework helpers.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Refactor the internal powercap get/set helpers
      firmware: arm_scmi: Add Powercap protocol enable support
      powercap: arm_scmi: Add support for disabling powercaps on a zone

Nikunj Kela (2):
      dt-bindings: firmware: arm,scmi: support for parameter in smc/hvc call
      firmware: arm_scmi: Augment SMC/HVC to allow optional parameters

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   8 +-
 drivers/firmware/arm_scmi/driver.c                 |   1 +
 drivers/firmware/arm_scmi/powercap.c               | 173 ++++++++++++++++++---
 drivers/firmware/arm_scmi/smc.c                    |  30 +++-
 drivers/powercap/arm_scmi_powercap.c               |  16 ++
 include/linux/scmi_protocol.h                      |  18 +++
 6 files changed, 219 insertions(+), 27 deletions(-)
