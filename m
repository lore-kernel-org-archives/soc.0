Return-Path: <SRS0=P5IO=DV=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC4C001DF
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 12:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C45A2C433C9; Fri,  4 Aug 2023 12:32:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 393C5C433C8;
	Fri,  4 Aug 2023 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 393C5C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BEBD1007;
	Fri,  4 Aug 2023 05:33:01 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FA293F5A1;
	Fri,  4 Aug 2023 05:32:16 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] ARM: vexpress: Updates for v6.6
Date: Fri,  4 Aug 2023 13:32:14 +0100
Message-ID: <20230804123214.3258032-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-updates-6.6

for you to fetch changes up to ebd4f6102fbc2c5a7560ad5256a71696ab136ce6:

  MAINTAINERS: Simplify entries for Arm Vexpress platform and related drivers (2023-08-04 11:34:35 +0100)

----------------------------------------------------------------
Arm Vexpress updates for v6.6

Couple of minor updates: Code simplification in the vexpress config bus
driver with the use of devm_platform_ioremap_resource() and simplification
of Arm Vexpress platform and related drivers entries in MAINTAINERS file.

----------------------------------------------------------------
Sudeep Holla (1):
      MAINTAINERS: Simplify entries for Arm Vexpress platform and related drivers

Yangtao Li (1):
      bus: vexpress-config: Convert to devm_platform_ioremap_resource()

 MAINTAINERS                   | 9 ++++-----
 drivers/bus/vexpress-config.c | 4 +---
 2 files changed, 5 insertions(+), 8 deletions(-)
