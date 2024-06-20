Return-Path: <SRS0=6E+6=NW=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE4DC2BA18
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 09:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C3ECC32781; Thu, 20 Jun 2024 09:39:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id D6A67C2BD10;
	Thu, 20 Jun 2024 09:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6A67C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE20FDA7;
	Thu, 20 Jun 2024 02:40:00 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EDED93F6A8;
	Thu, 20 Jun 2024 02:39:34 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.11
Date: Thu, 20 Jun 2024 10:39:17 +0100
Message-ID: <20240620093924.375244-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! As mentioned in tha tag there is one PSCI fix that kept
missing for few months now, so have included it here.

Regards,
Sudeep

-->8

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.11

for you to fetch changes up to f624c7cbd155ef5787f8bf06c1208f45353d24ec:

  firmware: psci: Fix return value from psci_system_suspend() (2024-06-17 11:02:42 +0100)

----------------------------------------------------------------
Arm FF-A driver updates for  v6.11

The main addition is the split of bus and driver into distinct modules
The FF-A bus module is initialized at subsys_initcall level when builtin.

FF-A drivers initialization is now changed to module_init level so that
pKVM ffa proxy is all setup and running in case pKVM hypervisor needs to
trap and handle FF-A calls.

One of the reason for not having this split from the beginning is the
need to workaround the FF-A v1.0 NULL UUID. The FF-A bus layer called
into FF-A driver and populated the device UUID if it matches with the
driver attempting to match. Moving the workaround away from the FF-A
bus layer to the FF-A core driver as a bus notifier will help to remove
the dependency.

Also, there is one fix to handle the return value from psci_system_suspend()
correctly.

----------------------------------------------------------------
Sudeep Holla (3):
      firmware: arm_ffa: Move the FF-A v1.0 NULL UUID workaround to bus notifier
      firmware: arm_ffa: Split bus and driver into distinct modules
      firmware: psci: Fix return value from psci_system_suspend()

 drivers/firmware/arm_ffa/Makefile |  6 +++--
 drivers/firmware/arm_ffa/bus.c    | 22 ++++++++++-----
 drivers/firmware/arm_ffa/common.h |  2 --
 drivers/firmware/arm_ffa/driver.c | 57 ++++++++++++++++++++++++++-------------
 drivers/firmware/psci/psci.c      |  4 ++-
 5 files changed, 61 insertions(+), 30 deletions(-)
