Return-Path: <SRS0=hXAh=FL=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D9CE810DA
	for <soc@archiver.kernel.org>; Wed, 27 Sep 2023 12:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22CA3C433CB; Wed, 27 Sep 2023 12:16:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id A0EB4C433C8;
	Wed, 27 Sep 2023 12:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0EB4C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D511FB;
	Wed, 27 Sep 2023 05:16:36 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AB173F5A1;
	Wed, 27 Sep 2023 05:15:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.6
Date: Wed, 27 Sep 2023 13:15:55 +0100
Message-ID: <20230927121555.158619-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.6

for you to fetch changes up to 9dda1178479aa0a73fe0eaabfe2d9a1c603cfeed:

  firmware: arm_ffa: Don't set the memory region attributes for MEM_LEND (2023-09-25 19:43:49 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.6

It has been reported that the driver sets the memory region attributes
for MEM_LEND operation when the specification clearly states not to. The
fix here addresses the issue by ensuring the memory region attributes are
cleared for the memory lending operation.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Don't set the memory region attributes for MEM_LEND

 drivers/firmware/arm_ffa/driver.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
