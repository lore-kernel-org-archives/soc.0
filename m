Return-Path: <SRS0=VEGh=ZQ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76184C54EE9
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 10:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41ADBC4347C; Tue, 13 Sep 2022 10:06:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 09ED6C433D6;
	Tue, 13 Sep 2022 10:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09ED6C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F8051063;
	Tue, 13 Sep 2022 03:06:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C4043F71A;
	Tue, 13 Sep 2022 03:06:14 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.1
Date: Tue, 13 Sep 2022 11:06:12 +0100
Message-Id: <20220913100612.2924643-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

There are minor changes in the dependent OPTEE FF-A which are reviewed
by the corresponding maintainers/reviewers.

Regards,
Sudeep

-->8

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.1

for you to fetch changes up to 5b0c6328e47dccf552996ca711005ca3f44034e9:

  firmware: arm_ffa: Split up ffa_ops into info, message and memory operations (2022-09-08 11:34:04 +0100)

----------------------------------------------------------------
Arm FF-A firmware driver updates for v6.1

Small set of changes in preparation to add support for FF-A v1.1
specification later. It mainly contains:

1. Splitting up ffa_ops into different categories namely information,
   message and memory. It helps to make info and memory operations
   independent from ffa_device so thata generic memory management
   module can use it without specific ffa_dev.
2. Adds support for querying FF-A features and use the same to detect
   the support for 64-bit operations.
3. Adds v1.1 get_partition_info support and use the same to set up
   32-bit execution mode flag automatically.
4. Adds pointer to the ffa_dev_ops in struct ffa_dev and drop
   ffa_dev_ops_get() which enables to drop ffa_ops in optee_ffa
   structure using ffa_dev->ops directly. Additionally ffa_dev_ops is
   renamed as ffa_ops.

----------------------------------------------------------------
Sudeep Holla (10):
      firmware: arm_ffa: Add pointer to the ffa_dev_ops in struct ffa_dev
      tee: optee: Drop ffa_ops in optee_ffa structure using ffa_dev->ops directly
      firmware: arm_ffa: Remove ffa_dev_ops_get()
      firmware: arm_ffa: Add support for querying FF-A features
      firmware: arm_ffa: Use FFA_FEATURES to detect if native versions are supported
      firmware: arm_ffa: Make memory apis ffa_device independent
      firmware: arm_ffa: Rename ffa_dev_ops as ffa_ops
      firmware: arm_ffa: Add v1.1 get_partition_info support
      firmware: arm_ffa: Set up 32bit execution mode flag using partiion property
      firmware: arm_ffa: Split up ffa_ops into info, message and memory operations

 drivers/firmware/arm_ffa/bus.c    |   4 +-
 drivers/firmware/arm_ffa/driver.c | 132 ++++++++++++++++++++++++++++++--------
 drivers/tee/optee/ffa_abi.c       |  46 +++++++------
 drivers/tee/optee/optee_private.h |   1 -
 include/linux/arm_ffa.h           |  36 +++++++----
 5 files changed, 152 insertions(+), 67 deletions(-)
