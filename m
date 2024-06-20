Return-Path: <SRS0=6E+6=NW=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AD2C27C79
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 09:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7979DC4AF07; Thu, 20 Jun 2024 09:39:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 42D98C2BD10;
	Thu, 20 Jun 2024 09:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42D98C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6096ADA7;
	Thu, 20 Jun 2024 02:40:12 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75A0C3F6A8;
	Thu, 20 Jun 2024 02:39:46 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.11
Date: Thu, 20 Jun 2024 10:39:19 +0100
Message-ID: <20240620093924.375244-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620093924.375244-2-sudeep.holla@arm.com>
References: <20240620093924.375244-1-sudeep.holla@arm.com>
 <20240620093924.375244-2-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.11

for you to fetch changes up to fa8b28ba22d95be4d2dd3c37fbdbdc066af82941:

  firmware: arm_scmi: Add support for platform to agent channel completion (2024-06-14 12:14:19 +0100)

----------------------------------------------------------------
Arm SCMI driver updates for v6.11

The main addition this time is the support for platform to agent(p2a
also referred sometimes as notification or Rx) channel completion via
interrupt driven method. Currently, the OSPM agent clears or
acknowledge the receipt of the norification or delayed response by
updating the flags in the shared memory region which the platform is
expected to poll.

On some platforms that are completely interrupt driven, the OSPM
agent is expected to send a response message instead. This change
adds the support for the same.

Other changes include addition of a separate mailing list specific to
SCMI to allow open discussions about the interface itself in addition
to the kernel driver updates and support for system suspend via the
platform noification used on some systems.

----------------------------------------------------------------
Dan Carpenter (1):
      MAINTAINERS: Add mailing list for SCMI drivers

Peng Fan (3):
      firmware: arm_scmi: Add support for system suspend in power control driver
      dt-bindings: firmware: arm,scmi: Add support for notification completion channel
      firmware: arm_scmi: Add support for platform to agent channel completion

 .../devicetree/bindings/firmware/arm,scmi.yaml     | 12 +++--
 MAINTAINERS                                        |  1 +
 drivers/firmware/arm_scmi/common.h                 |  1 +
 drivers/firmware/arm_scmi/mailbox.c                | 57 +++++++++++++++++++---
 drivers/firmware/arm_scmi/scmi_power_control.c     | 21 +++++++-
 drivers/firmware/arm_scmi/shmem.c                  |  5 ++
 6 files changed, 86 insertions(+), 11 deletions(-)
