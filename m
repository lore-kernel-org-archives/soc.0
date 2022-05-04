Return-Path: <SRS0=YTjD=VM=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE59FC433EF
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 11:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B19DFC385AE; Wed,  4 May 2022 11:29:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 83B18C385B8;
	Wed,  4 May 2022 11:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83B18C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD9761042;
	Wed,  4 May 2022 04:28:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4E653FA50;
	Wed,  4 May 2022 04:28:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v5.19
Date: Wed,  4 May 2022 12:28:53 +0100
Message-Id: <20220504112853.3491961-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-5.19

for you to fetch changes up to f3f3bdbd58cea4fdd088075fdc8864fc47ecd419:

  tee: optee: Use ffa_dev_get_drvdata to fetch driver_data (2022-04-29 14:51:46 +0100)

----------------------------------------------------------------
Arm FF-A firmware driver updates/fixes for v5.19

Couple of fixes to handle fragmented memory descriptors and incorrect
UUID parameter passed to ffa_partition_probe. Another fix deals with
the incorrect use of ffa_device's driver_data by the core driver.
Apart from these fixes, there is an addition of ffa_dev_get_drvdata helper
function and its use in optee driver.

----------------------------------------------------------------
Marc Bonnici (1):
      firmware: arm_ffa: Fix handling of fragmented memory descriptors

Sudeep Holla (4):
      firmware: arm_ffa: Fix uuid parameter to ffa_partition_probe
      firmware: arm_ffa: Remove incorrect assignment of driver_data
      firmware: arm_ffa: Add ffa_dev_get_drvdata helper function
      tee: optee: Use ffa_dev_get_drvdata to fetch driver_data

 drivers/firmware/arm_ffa/driver.c | 24 ++++++++++++++----------
 drivers/tee/optee/ffa_abi.c       |  2 +-
 include/linux/arm_ffa.h           |  7 ++++++-
 3 files changed, 21 insertions(+), 12 deletions(-)
