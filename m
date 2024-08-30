Return-Path: <SRS0=Qlal=P5=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D6ACA0FF3
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 13:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA3FEC4AF0E; Fri, 30 Aug 2024 13:58:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 96378C4CEC2;
	Fri, 30 Aug 2024 13:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96378C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B7F1063;
	Fri, 30 Aug 2024 06:59:11 -0700 (PDT)
Received: from usa.arm.com (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9377B3F762;
	Fri, 30 Aug 2024 06:58:43 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno/fvp: Update for v6.12
Date: Fri, 30 Aug 2024 14:58:36 +0100
Message-ID: <20240830135837.2383557-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-update-6.12

for you to fetch changes up to 9d4a984a53be22a52bdc505b474f819a699193d8:

  arm64: dts: fvp: Set stdout-path to serial0 in the chosen node (2024-07-31 16:06:34 +0100)

----------------------------------------------------------------
Armv8 Juno/FVP update for v6.12

Just a single update adding stdout-path to the fast models(FVP and
Foundation) which eliminates the need to specify any platform-specific
kernel command line parameters to get working earlycon or console.

----------------------------------------------------------------
Debbie Martin (1):
      arm64: dts: fvp: Set stdout-path to serial0 in the chosen node

 arch/arm64/boot/dts/arm/foundation-v8.dtsi | 4 +++-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts  | 4 +++-
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)
