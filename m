Return-Path: <SRS0=gf/H=LJ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CDACD1292
	for <soc@archiver.kernel.org>; Thu,  4 Apr 2024 14:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D67C9C43390; Thu,  4 Apr 2024 14:03:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 607D7C433C7;
	Thu,  4 Apr 2024 14:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 607D7C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BBF0FEC;
	Thu,  4 Apr 2024 07:04:16 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2FB93F64C;
	Thu,  4 Apr 2024 07:03:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.9
Date: Thu,  4 Apr 2024 15:03:38 +0100
Message-ID: <20240404140339.450509-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.9

for you to fetch changes up to 1a4bd2b128fb5ca62e4d1c5ca298d3d06b9c1e8e:

  firmware: arm_ffa: Fix the partition ID check in ffa_notification_info_get() (2024-03-25 10:14:17 +0000)

----------------------------------------------------------------
Arm FF-A fix for v6.9

A single fix to address the incorrect check of VM ID count for the
global notification in the response received for FFA_NOTIFICATION_INFO_GET()
in the schedule receiver interrupt handler.

----------------------------------------------------------------
Jens Wiklander (1):
      firmware: arm_ffa: Fix the partition ID check in ffa_notification_info_get()

 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
