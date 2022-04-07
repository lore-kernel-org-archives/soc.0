Return-Path: <SRS0=Xko5=UR=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B57FC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 11:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 300F9C385A4; Thu,  7 Apr 2022 11:08:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id B541CC385A0;
	Thu,  7 Apr 2022 11:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B541CC385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3704012FC;
	Thu,  7 Apr 2022 04:08:33 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12AC43F5A1;
	Thu,  7 Apr 2022 04:08:31 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] ARM: vexpress: Fixes for v5.18
Date: Thu,  7 Apr 2022 12:08:28 +0100
Message-Id: <20220407110828.1436206-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-fixes-5.18

for you to fetch changes up to 42a997f0bde1da0cce14a4768bb190b5030513eb:

  ARM: vexpress/spc: Fix all the kernel-doc build warnings (2022-04-07 10:50:01 +0100)

----------------------------------------------------------------
ARM Vexpress fixes for 5.18

Couple of fixes to address negative array index access and kernel-doc
build warnings.

----------------------------------------------------------------
Kees Cook (1):
      ARM: vexpress/spc: Avoid negative array index when !SMP

Sudeep Holla (2):
      ARM: vexpress/spc: Fix kernel-doc build warning for ve_spc_cpu_in_wfi
      ARM: vexpress/spc: Fix all the kernel-doc build warnings

 arch/arm/mach-vexpress/spc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)
