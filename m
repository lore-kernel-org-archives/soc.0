Return-Path: <SRS0=8MIz=B2=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C1C77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 12:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A88BC433EF; Tue,  6 Jun 2023 12:57:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id ED977C433D2;
	Tue,  6 Jun 2023 12:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED977C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E84E2F4;
	Tue,  6 Jun 2023 05:58:17 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 058E73F793;
	Tue,  6 Jun 2023 05:57:30 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.4(part 2)
Date: Tue,  6 Jun 2023 13:57:20 +0100
Message-Id: <20230606125720.2816923-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 111a833dc5cbef3d05b2a796a7e23cb7f6ff2192:

  firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors (2023-05-08 20:40:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.4-2

for you to fetch changes up to 3aa0519a4780f1b8e11966bd879d4a2934ba455f:

  firmware: arm_ffa: Set handle field to zero in memory descriptor (2023-06-06 13:41:56 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.4

A single fix addressing another MBZ field being non-zero and non-compliant
resulting in the rejection of certain memory interface transmissions by
the receivers(secure partitions). The issue was addressed before but missed
to address this one field which is part of this change.

----------------------------------------------------------------
Balint Dobszay (1):
      firmware: arm_ffa: Set handle field to zero in memory descriptor

 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)
