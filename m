Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D0DEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB0FFC433CB; Thu, 15 Jun 2023 16:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6C3C433C8;
	Thu, 15 Jun 2023 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686846965;
	bh=W2QYDb6SPxAuiZNX2P/7RG3UEgyVXnuNZuJbH9nmvPo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=FJg70vbjFvEguxiX0DsJrZO5hAwWYkk28FS4ul17rLvR3b3YaRXjtS5VSojakfa8X
	 ZcI8d9uPhyoXis78DPDT/cpoUZFa4rPueuSoDCpYUuxS5j/GjioQFj/iSJp/Mw7ysm
	 lR39O9IvHhcjsvlFEWhtvNkGV40NQnuZ1LRLsTAAlMimEsdDDYIjxYWQSTyUX0x9S1
	 4M2op97s+Ijfamjy8Ft29wu19o2D/cwXNrGQYqBw0tTs+lwHNra2/cJ4S6ERq9C6WH
	 oMtmm+iFOVn7qEH1W4TfFbpX1gNEuFaAEsQyhFBle2NpZD1uGpClXdhfHLk6PXVtaN
	 pxaPUIAQ9lhPA==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [GIT PULL] More Qualcomm ARM32 DeviceTree updates for v6.5
Date: Thu, 15 Jun 2023 09:39:26 -0700
Message-Id: <20230615163926.1462225-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 925bac3caa46c5790d21ee236869b017090aad2d:

  ARM: dts: qcom: apq8074-dragonboard: enable DSI panel (2023-05-30 07:54:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.5-2

for you to fetch changes up to 831b802a7727ba6e67c5ed585c54f610d9db1316:

  arm: dts: qcom: sdx55: Add interconnect path (2023-06-14 08:07:21 -0700)

----------------------------------------------------------------
More Qualcomm ARM32 DeviceTree updates for v6.5

On MSM8960, support for USB is added and the Samsung Galaxy Express is
added.

GPIO keys and on-board LEDs are described for the APQ8074 Dragonboard.

On MSM8226, QFPROM, tsens and thermal zones are defined, and the
description of the clock hierarchy is improved.

The PCIe endpoint controller on SDX55 gains a interconnect path to DDR
defined.

Sony Xperia X2 Tablet and Samsung Galaxy Tab 4 are updated following
changes in the LP855X DeviceTree binding.

----------------------------------------------------------------
Artur Weber (1):
      ARM: dts: qcom: adapt to LP855X bindings changes

Dmitry Baryshkov (3):
      ARM: dts: qcom: apq8074-dragonboard: add onboard leds
      ARM: dts: qcom: apq8074-dragonboard: add gpio keys
      ARM: dts: qcom: msm8974: rename labels for DSI nodes

Krishna chaitanya chundru (1):
      arm: dts: qcom: sdx55: Add interconnect path

Luca Weiss (2):
      ARM: dts: qcom: msm8226: Use XO from rpmcc where possible
      ARM: dts: qcom: msm8226: Provide clocks to mmcc node

Matti Lehtimäki (6):
      ARM: dts: qcom: pm8226: Add thermal sensor and thermal zone config
      ARM: dts: qcom: pm8841: Add thermal zone config
      ARM: dts: qcom: pm8941: Add thermal zone config
      ARM: dts: qcom: msm8226: Add qfprom node
      ARM: dts: qcom: msm8226: Add tsens node and related nvmem cells
      ARM: dts: qcom: msm8226: Add thermal zones node

Rudraksha Gupta (2):
      ARM: dts: qcom: msm8960: Add USB node
      ARM: dts: qcom: Add Samsung Galaxy Express support

 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/qcom-apq8026-samsung-matisse-wifi.dts |   1 -
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts     |  74 ++++-
 arch/arm/boot/dts/qcom-msm8226.dtsi                | 190 +++++++++++-
 .../boot/dts/qcom-msm8960-samsung-expressatt.dts   | 331 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  34 ++-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  16 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  36 +--
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |  24 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  23 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |  39 +++
 arch/arm/boot/dts/qcom-pm8841.dtsi                 |  33 +-
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |  31 ++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |   4 +
 14 files changed, 776 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts
