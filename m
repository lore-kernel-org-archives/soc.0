Return-Path: <SRS0=gf/H=LJ=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61795CD1284
	for <soc@archiver.kernel.org>; Thu,  4 Apr 2024 14:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23092C43399; Thu,  4 Apr 2024 14:03:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 05D86C433F1;
	Thu,  4 Apr 2024 14:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05D86C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9EAFEC;
	Thu,  4 Apr 2024 07:03:43 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB2E83F64C;
	Thu,  4 Apr 2024 07:03:11 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.9
Date: Thu,  4 Apr 2024 15:03:05 +0100
Message-ID: <20240404140306.450330-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.9

for you to fetch changes up to b70c7996d4ffb2e02895132e8a79a37cee66504f:

  firmware: arm_scmi: Make raw debugfs entries non-seekable (2024-03-25 10:14:28 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.9

Couple of fixes to address wrong fastchannel initialization in powercap
protocol and disable seeking support for SCMI raw debugfs entries.

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Make raw debugfs entries non-seekable

Pierre Gondois (1):
      firmware: arm_scmi: Fix wrong fastchannel initialization

 drivers/firmware/arm_scmi/powercap.c | 2 +-
 drivers/firmware/arm_scmi/raw_mode.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
