Return-Path: <SRS0=5G/g=XL=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39762C43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 11:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04340C341CA; Wed,  6 Jul 2022 11:50:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id B3D08C341C0;
	Wed,  6 Jul 2022 11:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3D08C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D3A106F;
	Wed,  6 Jul 2022 04:50:37 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AB283F66F;
	Wed,  6 Jul 2022 04:50:35 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno: Updates for v5.20
Date: Wed,  6 Jul 2022 12:50:26 +0100
Message-Id: <20220706115026.2272643-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-5.20

for you to fetch changes up to 156c90415b5c96b49a1ce59e48a702445a340229:

  arm64: dts: juno: Add cache-level property to L2 caches (2022-06-29 11:52:09 +0100)

----------------------------------------------------------------
Armv8 Juno/FVP updates for v5.20

Just a small bunch of miscellaneous updates: addition of missing
cache-level property to L2 caches on Juno, whitespace adjustments
and removal of erroneous 'mbox-name' and 'panel-dpi' compatible in
the device tree nodes.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: arm: adjust whitespace around '='

Rob Herring (2):
      arm64: dts: arm/fvp-base-revc: Remove 'panel-dpi' compatible
      arm64: dts: arm/juno: Drop erroneous 'mbox-name' property

Sudeep Holla (1):
      arm64: dts: juno: Add cache-level property to L2 caches

 arch/arm64/boot/dts/arm/fvp-base-revc.dts |  2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi    | 44 +++++++++++++++----------------
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 16 +++++------
 arch/arm64/boot/dts/arm/juno-r1.dts       |  2 ++
 arch/arm64/boot/dts/arm/juno-r2.dts       |  2 ++
 arch/arm64/boot/dts/arm/juno-scmi.dtsi    |  1 -
 arch/arm64/boot/dts/arm/juno.dts          |  2 ++
 7 files changed, 37 insertions(+), 32 deletions(-)
