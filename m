Return-Path: <SRS0=LCXL=A6=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8BEC7EE22
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 14:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D19DC4339E; Tue,  9 May 2023 14:35:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id A302BC4339B;
	Tue,  9 May 2023 14:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A302BC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 816D3FEC;
	Tue,  9 May 2023 07:36:17 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09FDC3F663;
	Tue,  9 May 2023 07:35:31 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.4
Date: Tue,  9 May 2023 15:35:29 +0100
Message-Id: <20230509143529.1188812-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.4

for you to fetch changes up to 44e8d5ad2dc01529eb1316b1521f24ac4aac8eaf:

  firmware: arm_scmi: Fix incorrect alloc_workqueue() invocation (2023-05-08 20:40:25 +0100)

----------------------------------------------------------------
Arm SCMI fix for v6.4

Single fix for incorrect invocation of alloc_workqueue() where WQ_SYSFS
flag is passed as @max_active parameter instead of OR'ing with the other
flags in the @flags parameter.

----------------------------------------------------------------
Tejun Heo (1):
      firmware: arm_scmi: Fix incorrect alloc_workqueue() invocation

 drivers/firmware/arm_scmi/raw_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
