Return-Path: <SRS0=05KK=7H=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF228C7618A
	for <soc@archiver.kernel.org>; Wed, 15 Mar 2023 19:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8313DC4339E; Wed, 15 Mar 2023 19:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BBEA9C433D2;
	Wed, 15 Mar 2023 19:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBEA9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1E62F4;
	Wed, 15 Mar 2023 12:36:55 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B152E3F64C;
	Wed, 15 Mar 2023 12:36:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.3
Date: Wed, 15 Mar 2023 19:35:57 +0000
Message-Id: <20230315193557.1709241-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.3

for you to fetch changes up to d617808e3b8324eacebabefec49dc75536ee39cc:

  firmware: arm_scmi: Use the bitmap API to allocate bitmaps (2023-03-08 15:24:15 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.3

Few fixes addressing issues around validation of device tree SCMI node,
allowing raw SCMI access even on systems which fail to probe the normal
driver stack, duplicate header inclusion, clean up return statement using
literal values instead of variable to simplify and use of devm_bitmap_zalloc
instead of devm_kcalloc to improve semantic.

----------------------------------------------------------------
Christophe JAILLET (1):
      firmware: arm_scmi: Use the bitmap API to allocate bitmaps

Cristian Marussi (2):
      firmware: arm_scmi: Fix raw coexistence mode behaviour on failure path
      firmware: arm_scmi: Fix device node validation for mailbox transport

Dan Carpenter (2):
      firmware: arm_scmi: Clean up a return statement in scmi_probe
      firmware: arm_scmi: Return a literal instead of a variable

Ye Xingchen (1):
      firmware: arm_scmi: Remove duplicate include header inclusion

 drivers/firmware/arm_scmi/bus.c     |  3 +--
 drivers/firmware/arm_scmi/driver.c  | 14 +++++++-------
 drivers/firmware/arm_scmi/mailbox.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 9 deletions(-)
