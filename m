Return-Path: <SRS0=Qlal=P5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1CCCA0FF6
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 13:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19935C4AF0C; Fri, 30 Aug 2024 13:58:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E987DC4CEC2;
	Fri, 30 Aug 2024 13:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E987DC4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B6061063;
	Fri, 30 Aug 2024 06:58:45 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AB673F762;
	Fri, 30 Aug 2024 06:58:18 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.12
Date: Fri, 30 Aug 2024 14:57:57 +0100
Message-ID: <20240830135759.2383431-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.12

for you to fetch changes up to 61824feae5c07987f70519b1235e50baa138b3c2:

  firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features() (2024-08-20 15:40:45 +0100)

----------------------------------------------------------------
Arm FF-A updates for v6.12

The main addition this time is the basic support for FF-A v1.2
specification which includes support for newly added:
1. FFA_MSG_SEND_DIRECT_{REQ,RESP}2
2. FFA_PARTITION_INFO_GET_REGS
3. FFA_YIELD support in direct messaging

Apart from these, the changes include support to fetch the Rx/Tx buffer
size using FFA_FEATURES, addition of the FF-A FIDs for v1.2 and some
coding style cleanups.

----------------------------------------------------------------
Sudeep Holla (7):
      firmware: arm_ffa: Some coding style fixes
      firmware: arm_ffa: Update the FF-A command list with v1.2 additions
      firmware: arm_ffa: Move the function ffa_features() earlier
      firmware: arm_ffa: Add support for FFA_PARTITION_INFO_GET_REGS
      firmware: arm_ffa: Add support for FFA_MSG_SEND_DIRECT_{REQ,RESP}2
      firmware: arm_ffa: Add support for FFA_YIELD in direct messaging
      firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features()

 drivers/firmware/arm_ffa/driver.c | 240 +++++++++++++++++++++++++++++---------
 include/linux/arm_ffa.h           |  12 ++
 2 files changed, 195 insertions(+), 57 deletions(-)
