Return-Path: <SRS0=wInV=KA=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90564C48BC4
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 03:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46B86C433C7; Fri, 23 Feb 2024 03:33:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id DF19BC43390;
	Fri, 23 Feb 2024 03:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF19BC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A11B1650;
	Thu, 22 Feb 2024 19:33:55 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 184893F766;
	Thu, 22 Feb 2024 19:33:15 -0800 (PST)
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
Subject: [GIT PULL] ARM: vexpress: Update for v6.9
Date: Fri, 23 Feb 2024 03:33:06 +0000
Message-ID: <20240223033307.117906-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-update-6.9

for you to fetch changes up to bd2cb11fd765f4acc04fc47a4b2a38686890738a:

  ARM: dts: vexpress: Set stdout-path to serial0 in the chosen node (2024-02-15 11:14:51 +0000)

----------------------------------------------------------------
Arm Vexpress update for v6.9

Just a single update to add stdout-path in the device tree chosen node
so that the system console can be routed to this serial/uart port.

----------------------------------------------------------------
Ole P. Orhagen (1):
      ARM: dts: vexpress: Set stdout-path to serial0 in the chosen node

 arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
