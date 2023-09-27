Return-Path: <SRS0=hXAh=FL=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3EDE810D9
	for <soc@archiver.kernel.org>; Wed, 27 Sep 2023 12:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83F1CC433CC; Wed, 27 Sep 2023 12:16:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 0FFD3C433C8;
	Wed, 27 Sep 2023 12:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FFD3C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA5E1FB;
	Wed, 27 Sep 2023 05:16:46 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A6483F5A1;
	Wed, 27 Sep 2023 05:16:07 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.6
Date: Wed, 27 Sep 2023 13:16:04 +0100
Message-ID: <20230927121604.158645-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.6

for you to fetch changes up to c3638b851bc1ca0022dca9d6ca4beaa6ef03a216:

  firmware: arm_scmi: Fixup perf power-cost/microwatt support (2023-09-11 10:34:05 +0100)

----------------------------------------------------------------
Arm SCMI fix for v6.6

A single fix to address scmi_perf_attributes_get() using the protocol
version even before it was populated and ending up with unexpected
bogowatts power scale.

----------------------------------------------------------------
Sibi Sankar (1):
      firmware: arm_scmi: Fixup perf power-cost/microwatt support

 drivers/firmware/arm_scmi/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
