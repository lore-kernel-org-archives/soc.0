Return-Path: <SRS0=6E+6=NW=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9337C2BA1A
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 09:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0F21C4AF09; Thu, 20 Jun 2024 09:39:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 99406C32781;
	Thu, 20 Jun 2024 09:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99406C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A05531042;
	Thu, 20 Jun 2024 02:40:15 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94B533F6A8;
	Thu, 20 Jun 2024 02:39:49 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] ARM: vexpress: Updates for v6.11
Date: Thu, 20 Jun 2024 10:39:20 +0100
Message-ID: <20240620093924.375244-4-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620093924.375244-3-sudeep.holla@arm.com>
References: <20240620093924.375244-1-sudeep.holla@arm.com>
 <20240620093924.375244-2-sudeep.holla@arm.com>
 <20240620093924.375244-3-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-updates-6.11

for you to fetch changes up to 69a6661b6f2f1a4d6dbbc58f7c9acfc84484145b:

  bus: vexpress-config: Add missing MODULE_DESCRIPTION() macro (2024-06-20 09:43:33 +0100)

----------------------------------------------------------------
Arm Vexpress updates for v6.11

Remove obsolete RTSM DCSCB support which was only ever implemented
on a software model which is neither available to download nor
maintained. It predates the very first bL cluster based platforms.

Other change include addition of the missing MODULE_DESCRIPTION
macro in vexpress config bus driver.

----------------------------------------------------------------
Jeff Johnson (1):
      bus: vexpress-config: Add missing MODULE_DESCRIPTION() macro

Rob Herring (Arm) (2):
      arm: vexpress: Remove obsolete RTSM DCSCB support
      dt-bindings: arm: Remove obsolete RTSM DCSCB binding

 .../devicetree/bindings/arm/rtsm-dcscb.txt         |  19 ---
 arch/arm/configs/vexpress_defconfig                |   1 -
 arch/arm/mach-versatile/Kconfig                    |   9 --
 arch/arm/mach-versatile/Makefile                   |   3 -
 arch/arm/mach-versatile/dcscb.c                    | 173 ---------------------
 arch/arm/mach-versatile/dcscb_setup.S              |  33 ----
 drivers/bus/vexpress-config.c                      |   1 +
 7 files changed, 1 insertion(+), 238 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/rtsm-dcscb.txt
 delete mode 100644 arch/arm/mach-versatile/dcscb.c
 delete mode 100644 arch/arm/mach-versatile/dcscb_setup.S
