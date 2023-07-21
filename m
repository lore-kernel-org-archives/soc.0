Return-Path: <SRS0=bEjc=DH=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93583C001DF
	for <soc@archiver.kernel.org>; Fri, 21 Jul 2023 11:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4879EC433CB; Fri, 21 Jul 2023 11:24:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 7B9DDC433C8;
	Fri, 21 Jul 2023 11:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B9DDC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B877E2F4;
	Fri, 21 Jul 2023 04:24:48 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 139A23F738;
	Fri, 21 Jul 2023 04:24:03 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno/vexpress: Fix for v6.5
Date: Fri, 21 Jul 2023 12:23:59 +0100
Message-ID: <20230721112359.3369716-1-sudeep.holla@arm.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.5

for you to fetch changes up to d088d6b648f47fc63e0f1d429c6eaddb426623a4:

  arm64: dts: arm: Remove the dangling vexpress-v2m-rs1.dtsi symlink (2023-07-13 13:55:10 +0100)

----------------------------------------------------------------
Armv8 Juno/Vexpress DTS fix for v6.5

A single simple fix removing dangling symlink left as part of arm dts
files movement to vendor sub-directories. It is harmless and causes no
issue for the build but scripts copying files see errors/failures.

----------------------------------------------------------------
Sudeep Holla (1):
      arm64: dts: arm: Remove the dangling vexpress-v2m-rs1.dtsi symlink

 arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
