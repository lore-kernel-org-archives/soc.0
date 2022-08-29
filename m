Return-Path: <SRS0=H8vK=ZB=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7618ECAAA4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 17:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A765DC433D6; Mon, 29 Aug 2022 17:44:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 33408C433D7;
	Mon, 29 Aug 2022 17:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33408C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E54723A;
	Mon, 29 Aug 2022 10:44:35 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C8FC3F71A;
	Mon, 29 Aug 2022 10:44:28 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno: fixes for v6.0-rc1
Date: Mon, 29 Aug 2022 18:44:20 +0100
Message-Id: <20220829174420.207880-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-6.0

for you to fetch changes up to 422ab8fe15e30066d4c8e236b747c77069bfca45:

  arm64: dts: juno: Add missing MHU secure-irq (2022-08-15 14:54:22 +0100)

----------------------------------------------------------------
Armv8 Juno fixes for v6.0

Couple of fixes to add missing MHU secure-irq and remove the legacy
coresight 'slave-mode' property.

----------------------------------------------------------------
Jassi Brar (1):
      arm64: dts: juno: Add missing MHU secure-irq

Rob Herring (1):
      arm64: dts: arm: juno: Remove legacy Coresight 'slave-mode' property

 arch/arm64/boot/dts/arm/juno-base.dtsi    | 3 ++-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)
