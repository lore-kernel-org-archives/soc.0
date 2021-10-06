Return-Path: <SRS0=FE4S=O2=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD2C433FE
	for <soc@archiver.kernel.org>; Wed,  6 Oct 2021 15:32:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED485610C9; Wed,  6 Oct 2021 15:32:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 8A3196103D;
	Wed,  6 Oct 2021 15:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A3196103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26ABF6D;
	Wed,  6 Oct 2021 08:32:40 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37B1B3F7D7;
	Wed,  6 Oct 2021 08:32:39 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
Date: Wed,  6 Oct 2021 16:32:31 +0100
Message-Id: <20211006153231.4061789-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-5.15

for you to fetch changes up to eb7b52e6db7c21400b9b2d539f9343fb6e94bd94:

  firmware: arm_ffa: Fix __ffa_devices_unregister (2021-10-05 10:39:47 +0100)

----------------------------------------------------------------
Arm FF-A driver fixes for v5.15

Couple of fixes addressing issues when FFA driver is build as a module.
One adds the device unregistration which was missing and causes issue
when loading the module second time after unloading once. Another one
adds the missing remove callback on the ffa bus which was missing due
to which modules depending on FFA(e.g. OPTEE) will fail to remove the
device and faults next time that module is loaded again.

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_ffa: Add missing remove callback to ffa_bus_type
      firmware: arm_ffa: Fix __ffa_devices_unregister

 drivers/firmware/arm_ffa/bus.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
