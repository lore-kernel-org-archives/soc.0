Return-Path: <SRS0=/d5S=MS=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E7EC25B75
	for <soc@archiver.kernel.org>; Wed, 15 May 2024 09:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7DA9C4AF0A; Wed, 15 May 2024 09:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 1EB4DC116B1;
	Wed, 15 May 2024 09:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EB4DC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9550A1007;
	Wed, 15 May 2024 02:34:05 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D75893F7A6;
	Wed, 15 May 2024 02:33:39 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] ARM: vexpress: Update for v6.10
Date: Wed, 15 May 2024 10:33:34 +0100
Message-ID: <20240515093334.1946888-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

There is no reason to delay this until v6.11, hence the late pull request
for v6.10.

Please pull if there is a plan for another late pull request during the
merge window. Or else it can be deferred for v6.11

Regards,
Sudeep

-->8

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-update-6.10

for you to fetch changes up to 5c47d9a2740369197abc8bf0a52d93cc5861ad96:

  dt-bindings: arm: Remove obsolete RTSM DCSCB binding (2024-05-14 13:48:35 +0100)

----------------------------------------------------------------
Arm Vexpress update for v6.10

Remove obsolete RTSM DCSCB support which was only ever implemented
on a software model which is neither available to download nor
maintained. It predates the very first bL cluster based platforms.

----------------------------------------------------------------
Rob Herring (Arm) (2):
      arm: vexpress: Remove obsolete RTSM DCSCB support
      dt-bindings: arm: Remove obsolete RTSM DCSCB binding

 .../devicetree/bindings/arm/rtsm-dcscb.txt         |  19 ---
 arch/arm/configs/vexpress_defconfig                |   1 -
 arch/arm/mach-versatile/Kconfig                    |   9 --
 arch/arm/mach-versatile/Makefile                   |   3 -
 arch/arm/mach-versatile/dcscb.c                    | 173 ---------------------
 arch/arm/mach-versatile/dcscb_setup.S              |  33 ----
 6 files changed, 238 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/rtsm-dcscb.txt
 delete mode 100644 arch/arm/mach-versatile/dcscb.c
 delete mode 100644 arch/arm/mach-versatile/dcscb_setup.S
