Return-Path: <SRS0=wInV=KA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F52C48BC4
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 03:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A8CBC433F1; Fri, 23 Feb 2024 03:33:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 46ED3C433C7;
	Fri, 23 Feb 2024 03:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46ED3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98F6415DB;
	Thu, 22 Feb 2024 19:33:38 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 354BD3F766;
	Thu, 22 Feb 2024 19:32:59 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Update for v6.9
Date: Fri, 23 Feb 2024 03:32:48 +0000
Message-ID: <20240223033250.117878-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-update-6.9

for you to fetch changes up to 989e8661dc45babf43070d519011dfc1e33c8875:

  firmware: arm_ffa: Make ffa_bus_type const (2024-02-20 06:40:34 +0000)

----------------------------------------------------------------
Arm FF-A update for v6.9

Another single and simple update to just constify the ffa_bus_type
structure similar to other changes done treewide following the driver
core changes to accomodate the same.

----------------------------------------------------------------
Ricardo B. Marliere (1):
      firmware: arm_ffa: Make ffa_bus_type const

 drivers/firmware/arm_ffa/bus.c | 2 +-
 include/linux/arm_ffa.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
