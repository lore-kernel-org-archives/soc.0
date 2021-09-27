Return-Path: <SRS0=7oAA=OR=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2468C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 10:52:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7368A60F12; Mon, 27 Sep 2021 10:52:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 3B88660EE5;
	Mon, 27 Sep 2021 10:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B88660EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD1CE1063;
	Mon, 27 Sep 2021 03:52:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E92D3F70D;
	Mon, 27 Sep 2021 03:52:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL v2] arm64: dts: juno: fixes for v5.15-rc1
Date: Mon, 27 Sep 2021 11:52:49 +0100
Message-Id: <20210927105249.3583380-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922175910.2682172-1-sudeep.holla@arm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

v1->v2:
	- Added the fix for motherboard bus 'interrupt-map' which fixes
	  the boot regression reported by kernel CI.

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-5.15

for you to fetch changes up to 319aeaf69c85dc39768b3754c1786225e38e2871:

  arm: dts: vexpress: Fix motherboard bus 'interrupt-map' (2021-09-26 15:33:30 +0100)

----------------------------------------------------------------
 Juno/Vexpress fixes for v5.15

Bunch of DTS fixes to resolve addressing issues with some of the device
nodes, dropping unused/undocumented properties in various nodes, and
aligning node names with dtschema.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: arm: align watchdog and mmc node names with dtschema
      ARM: dts: arm: align watchdog and mmc node names with dtschema
      arm64: dts: arm: drop unused interrupt-names in MHU

Rob Herring (4):
      arm: dts: vexpress: Drop unused properties from motherboard node
      arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
      arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes
      arm: dts: vexpress: Fix motherboard bus 'interrupt-map'

Robin Murphy (1):
      arm64: dts: fvp: Remove panel timings

 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi            | 67 +++++++++++++++++++---
 arch/arm/boot/dts/vexpress-v2m.dtsi                | 65 +++++++++++++++++++--
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts        | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts         | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts            | 57 +-----------------
 arch/arm/boot/dts/vexpress-v2p-ca9.dts             | 58 -------------------
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          | 23 --------
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 12 ----
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      | 21 ++++---
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         | 11 ----
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |  2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   | 20 +++++--
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      | 57 +-----------------
 14 files changed, 153 insertions(+), 355 deletions(-)
