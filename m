Return-Path: <SRS0=HFMi=OM=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B6FC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Sep 2021 17:59:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5035E611F2; Wed, 22 Sep 2021 17:59:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id C02436115A;
	Wed, 22 Sep 2021 17:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C02436115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6E711B3;
	Wed, 22 Sep 2021 10:59:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C97C53F719;
	Wed, 22 Sep 2021 10:59:19 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64/ARM: dts: juno/vexpress: Fixes for v5.15
Date: Wed, 22 Sep 2021 18:59:10 +0100
Message-Id: <20210922175910.2682172-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fixes-5.15

for you to fetch changes up to 078fb7aa6a8305bce09cdfbe77b4c987934442ba:

  arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes (2021-09-17 10:23:41 +0100)

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

Rob Herring (3):
      arm: dts: vexpress: Drop unused properties from motherboard node
      arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
      arm: dts: vexpress: Fix addressing issues with 'motherboard-bus' nodes

Robin Murphy (1):
      arm64: dts: fvp: Remove panel timings

 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi            | 20 ++++++++++++-------
 arch/arm/boot/dts/vexpress-v2m.dtsi                | 18 ++++++++++++-----
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts        | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts         | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca5s.dts            | 11 +----------
 arch/arm/boot/dts/vexpress-v2p-ca9.dts             | 12 +----------
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |  1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          | 23 ----------------------
 arch/arm64/boot/dts/arm/juno-base.dtsi             | 12 -----------
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi      | 21 +++++++++++++-------
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         | 11 -----------
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi      |  2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi   | 20 +++++++++++++------
 .../boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts      | 12 +----------
 14 files changed, 60 insertions(+), 125 deletions(-)
