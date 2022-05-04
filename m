Return-Path: <SRS0=YTjD=VM=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C36FC433EF
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 11:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB6A0C385CE; Wed,  4 May 2022 11:29:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 09171C385AE;
	Wed,  4 May 2022 11:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09171C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 519721042;
	Wed,  4 May 2022 04:29:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3035C3FA50;
	Wed,  4 May 2022 04:29:20 -0700 (PDT)
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
Subject: [GIT PULL] arm64: dts: juno: Updates for v5.19
Date: Wed,  4 May 2022 12:29:17 +0100
Message-Id: <20220504112917.3492009-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-5.19

for you to fetch changes up to b30ae5638dac6c5e640c47f59707d5b1e2c493e2:

  arm64: dts: juno: Drop useless 'dma-channels/requests' properties (2022-04-30 20:11:01 +0100)

----------------------------------------------------------------
Arm FVP/Juno device tree updates for v5.19

The main and bulk of the change is the addition of new platform
Arm corstone1000(both FVP and FPGA versions). Also, there are
addition of Coresight Cross Trigger Interface(CTI) support on Juno,
fix for incorrect SCMI power domain IDs, addition of virtio-rng
on FVP which is default disabled as it works only on latest versions
of the FVP model.

Other miscellanous changes include dropping of useless
'dma-channels/requests' properties and updating virtio device
node names as per dtschema.

----------------------------------------------------------------
Diego Sueiro (1):
      arm64: dts: fvp: Add virtio-rng support

Krzysztof Kozlowski (1):
      arm64: dts: juno: Drop useless 'dma-channels/requests' properties

Mike Leach (1):
      arm64: dts: juno: add CTI entries to device tree

Rui Miguel Silva (2):
      dt-bindings: Add Arm corstone1000 platform
      arm64: dts: Add Arm corstone1000 platform support

Sudeep Holla (2):
      arm64: dts: juno: Fix SCMI power domain IDs for ETF and CS funnel
      arm64: dts: fvp: Align virtio device node names with dtschema

 .../devicetree/bindings/arm/arm,corstone1000.yaml  |  45 ++++++
 arch/arm64/boot/dts/arm/Makefile                   |   1 +
 arch/arm64/boot/dts/arm/corstone1000-fvp.dts       |  51 +++++++
 arch/arm64/boot/dts/arm/corstone1000-mps3.dts      |  32 ++++
 arch/arm64/boot/dts/arm/corstone1000.dtsi          | 164 +++++++++++++++++++++
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |   2 +-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |   3 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 164 ++++++++++++++++++++-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi          |  37 ++++-
 arch/arm64/boot/dts/arm/juno-r1-scmi.dts           |   8 +-
 arch/arm64/boot/dts/arm/juno-r1.dts                |  25 ++++
 arch/arm64/boot/dts/arm/juno-r2-scmi.dts           |   8 +-
 arch/arm64/boot/dts/arm/juno-r2.dts                |  25 ++++
 arch/arm64/boot/dts/arm/juno-scmi.dtsi             |  25 ++++
 arch/arm64/boot/dts/arm/juno.dts                   |  25 ++++
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |  11 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   |   4 +-
 17 files changed, 613 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,corstone1000.yaml
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-fvp.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000-mps3.dts
 create mode 100644 arch/arm64/boot/dts/arm/corstone1000.dtsi
