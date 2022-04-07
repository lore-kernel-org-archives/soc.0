Return-Path: <SRS0=Xko5=UR=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04317C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 11:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC539C385A8; Thu,  7 Apr 2022 11:08:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 2E9FFC385A4;
	Thu,  7 Apr 2022 11:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E9FFC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7DF812FC;
	Thu,  7 Apr 2022 04:08:22 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B745B3F5A1;
	Thu,  7 Apr 2022 04:08:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.18
Date: Thu,  7 Apr 2022 12:08:18 +0100
Message-Id: <20220407110818.1436181-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.18

for you to fetch changes up to bf36619a5463fbe6d3ecde37bb13680b532a253b:

  firmware: arm_scmi: Fix sparse warnings in OPTEE transport driver (2022-04-04 23:06:37 +0100)

----------------------------------------------------------------
Arm SCMI firmware interface fixes for v5.18

Few fixes to address assorted set of issues:
- Erroneous clearing of Tx channel which only platform firmware must do
- Invalid point access pass as parameter to sort() in clock support
- Sparse build warnings in OPTEE transport driver
- Use of deprecated zero-length arrays

----------------------------------------------------------------
Cristian Marussi (2):
      firmware: arm_scmi: Remove clear channel call on the TX channel
      firmware: arm_scmi: Fix sorting of retrieved clock rates

Lv Ruyi (1):
      firmware: arm_scmi: Replace zero-length array with flexible-array member

Sudeep Holla (1):
      firmware: arm_scmi: Fix sparse warnings in OPTEE transport driver

 drivers/firmware/arm_scmi/clock.c  | 5 +++--
 drivers/firmware/arm_scmi/driver.c | 3 ++-
 drivers/firmware/arm_scmi/optee.c  | 8 ++++----
 3 files changed, 9 insertions(+), 7 deletions(-)
