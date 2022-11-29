Return-Path: <SRS0=GJiW=35=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD26C4321E
	for <soc@archiver.kernel.org>; Tue, 29 Nov 2022 11:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C109C433D7; Tue, 29 Nov 2022 11:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 860A1C433C1;
	Tue, 29 Nov 2022 11:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 860A1C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 669C6D6E;
	Tue, 29 Nov 2022 03:51:21 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B15AE3F73D;
	Tue, 29 Nov 2022 03:51:13 -0800 (PST)
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
Subject: [GIT PULL] arm64: dts: juno: Updates for v6.2
Date: Tue, 29 Nov 2022 11:51:11 +0000
Message-Id: <20221129115111.2464233-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit c4a7b9b587ca1bb4678d48d8be7132492b23a81c:

  arm64: dts: juno: Add thermal critical trip points (2022-11-01 12:03:07 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-6.2

for you to fetch changes up to e15031539490733279c41ba87f4ef2b440a685f5:

  ARM: dts: vexpress: align LED node names with dtschema (2022-11-25 15:48:48 +0000)

----------------------------------------------------------------
Armv8 Juno/FVP updates for v6.2

Just few addtions including updates to cache information on various
platforms to align well with the bindings, addition of cache information
on FVP Rev C model, addition of SPE to Foundation model and updates to
LED node names.

----------------------------------------------------------------
James Clark (1):
      arm64: dts: fvp: Add SPE to Foundation FVP

Krzysztof Kozlowski (1):
      ARM: dts: vexpress: align LED node names with dtschema

Pierre Gondois (1):
      arm64: dts: Update cache properties for Arm Ltd platforms

Sudeep Holla (1):
      arm64: dts: fvp: Add information about L1 and L2 caches

 arch/arm/boot/dts/vexpress-v2m.dtsi                | 16 ++---
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |  1 +
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  6 ++
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          | 73 ++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts                |  2 +
 arch/arm64/boot/dts/arm/juno-r2.dts                |  2 +
 arch/arm64/boot/dts/arm/juno.dts                   |  2 +
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         |  1 +
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      |  1 +
 9 files changed, 96 insertions(+), 8 deletions(-)
