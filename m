Return-Path: <SRS0=LCXL=A6=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27913C77B75
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 14:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECE48C4339C; Tue,  9 May 2023 14:35:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id F1D61C433EF;
	Tue,  9 May 2023 14:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1D61C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC308FEC;
	Tue,  9 May 2023 07:35:42 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86A763F663;
	Tue,  9 May 2023 07:34:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.4
Date: Tue,  9 May 2023 15:34:53 +0100
Message-Id: <20230509143453.1188753-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.4

for you to fetch changes up to 111a833dc5cbef3d05b2a796a7e23cb7f6ff2192:

  firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors (2023-05-08 20:40:46 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v6.4

Quite a few fixes to address set of assorted issues:
1. NULL pointer dereference if the ffa driver doesn't provide remove()
   callback as it is currently executed unconditionally
2. FF-A core probe failure on systems with v1.0 firmware as the new
   partition info get count flag is used unconditionally
3. Failure to register more than one logical partition or service within
   the same physical partition as the device name contains only VM ID
   which will be same for all but each will have unique UUID.
4. Rejection of certain memory interface transmissions by the receivers
   (secure partitions) as few MBZ fields are non-zero due to lack of
   explicit re-initialization of those fields

----------------------------------------------------------------
Sudeep Holla (4):
      firmware: arm_ffa: Check if ffa_driver remove is present before executing
      firmware: arm_ffa: Fix usage of partition info get count flag
      firmware: arm_ffa: Fix FFA device names for logical partitions
      firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors

 drivers/firmware/arm_ffa/bus.c    | 19 +++++++++++++++----
 drivers/firmware/arm_ffa/driver.c |  9 ++++++++-
 include/linux/arm_ffa.h           |  1 +
 3 files changed, 24 insertions(+), 5 deletions(-)
