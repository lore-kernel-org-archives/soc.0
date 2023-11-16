Return-Path: <SRS0=vOdD=G5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC63BC47071
	for <soc@archiver.kernel.org>; Thu, 16 Nov 2023 19:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB015C43395; Thu, 16 Nov 2023 19:16:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 25240C433C7;
	Thu, 16 Nov 2023 19:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25240C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 716321595;
	Thu, 16 Nov 2023 11:16:54 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7658A3F6C4;
	Thu, 16 Nov 2023 11:16:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.7
Date: Thu, 16 Nov 2023 19:16:03 +0000
Message-ID: <20231116191603.929767-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.7

for you to fetch changes up to f1ed48ef97e2d12dee21e42db4a6ebb895ed3a79:

  firmware: arm_ffa: Fix ffa_notification_info_get() IDs handling (2023-11-13 11:51:26 +0000)

----------------------------------------------------------------
Arm FF-A fixes for v6.7

A bunch of fixes addressing issues around the notification support that
was added this cycle. They address issue in partition IDs handling in
ffa_notification_info_get(), notifications cleanup path and the size of
the allocation in ffa_partitions_cleanup().

It also adds check for the notification enabled state so that the drivers
registering the callbacks can be rejected if not enabled/supported.

It also moves the partitions setup operation after the notification
initialisation so that the driver has the correct state for notification
enabled/supported before the partitions are initialised/setup.

It also now allows FF-A initialisation to complete successfully even
when the notification initialisation fails as it is an optional support
in the specification. Initial support just allowed it only if the
firmware didn't support notifications.

Finally, it also adds a fix for smatch warning by declaring ffa_bus_type
structure in the header.

----------------------------------------------------------------
Lorenzo Pieralisi (1):
      firmware: arm_ffa: Fix ffa_notification_info_get() IDs handling

Sudeep Holla (6):
      firmware: arm_ffa: Declare ffa_bus_type structure in the header
      firmware: arm_ffa: Allow FF-A initialisation even when notification fails
      firmware: arm_ffa: Setup the partitions after the notification initialisation
      firmware: arm_ffa: Add checks for the notification enabled state
      firmware: arm_ffa: Fix FFA notifications cleanup path
      firmware: arm_ffa: Fix the size of the allocation in ffa_partitions_cleanup()

 drivers/firmware/arm_ffa/driver.c | 70 +++++++++++++++++++++++++--------------
 include/linux/arm_ffa.h           |  2 ++
 2 files changed, 48 insertions(+), 24 deletions(-)
