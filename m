Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED1C5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 03:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9C99C43399; Mon,  4 Mar 2024 03:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23BC433C7;
	Mon,  4 Mar 2024 03:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709523309;
	bh=wiS4o8btETqECDF8hJjrN4lEs83+Ox2XTTzoCe1lReg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=WnCkEuvfEHDRGjGNaH8p45noD42nZLb4d5ZBXuiCqzKhqIwWtUnrTh2gP/Z7uflSt
	 Ujxv7yA6yx5Jh6RIImb4CeuV51RmiIVZmQbs31VmuxmdcuSpi4A2/ul++YuvXqJGuw
	 czvZw0SQBGvGcPweLbPVtDDdYBCkqbFxNL2SMqJnyNonywMoIRw+TOZbQkmxdzq7vA
	 E24ONO2Yi1Lxx2siZ0mTPPEr9YOXeKcz0sEL9pQL3AL+g5fbpkGggQA/f8gzctiPfj
	 DlXJXYjqH8jeM5ZYV5BeQZcap/9wnQ0JGSS7qmLJZpKJI2cyUTiR4OVWrjfhoq2SDc
	 0bEyCWIM4JrJA==
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Robert Marko <robimarko@gmail.com>,
	Craig Tatlor <ctatlor97@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree changes for v6.9
Date: Sun,  3 Mar 2024 21:35:03 -0600
Message-ID: <20240304033507.89751-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.9

for you to fetch changes up to 450e178facd62b23bb7638f20a3c99436ee80640:

  ARM: dts: qcom: samsung-matisse-common: Add UART (2024-02-18 23:00:31 -0600)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree changes for v6.9

Support for the Samsung Galaxy Tab 4 10.1 LTE is added.

On MSM8226 CPU, SAW and ACC nodes are introduced to enable SMP support.
Watchdog definition is also added, and all nodes are sorted and cleaned
up.
rmtfs memory is defined on HTC One Mini 2, vibrator support is addedto
LG G Watch R, touch keycodes are defined for Samsung Galaxy Tab 4.
The Samsung Galaxy Tab 4 DeviceTree is refactored to allow more variants
to be introduced easily.

The SAW nodes across APQ8064, IPQ8064, MSM8960 and MSM8974 are updated
based on recent work on the binding and driver.

On IPQ8064 SAW nodes are cleaned up, and unused reset-names is dropped
from DWC3.

On MSM8960 GSBI3 and the I2C bus therein is introduced, in order to
introduce touchscreen support on the Samsung Galaxy Express SGH-I437.
gpio-keys are introduced on the same.

On MSM8974 the QFPROM register size is corrected. The order of the
clocks in the SDX65 DWC3 node is corrected to match the binding.

For a variety of platforms interrupt-related constants are replaced
with defined.

The mach-qcom Kconfig options are cleaned up, to avoid unnecessary
per-platform options.

----------------------------------------------------------------
Craig Tatlor (1):
      ARM: dts: qcom: msm8974: correct qfprom node size

David Heidelberg (1):
      ARM: dts: qcom: msm8960: drop 2nd clock frequency from timer

Dmitry Baryshkov (20):
      iommu/msm-iommu: don't limit the driver too much
      ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
      ARM: qcom: merge remaining subplatforms into sensible Kconfig entry
      ARM: dts: qcom: apq8084: use new compat string for L2 SAW2 unit
      ARM: dts: qcom: msm8974: use new compat string for L2 SAW2 unit
      ARM: dts: qcom: msm8960: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: ipq4019: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: ipq8064: use SoC-specific compatibles for SAW2 devices
      ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
      ARM: dts: qcom: apq8084: rename SAW nodes to power-manager
      ARM: dts: qcom: msm8960: rename SAW nodes to power-manager
      ARM: dts: qcom: msm8974: rename SAW nodes to power-manager
      ARM: dts: qcom: ipq4019: rename SAW nodes to power-manager
      ARM: dts: qcom: ipq8064: rename SAW nodes to power-manager
      ARM: dts: qcom: apq8064: declare SAW2 regulators
      ARM: dts: qcom: msm8960: declare SAW2 regulators
      ARM: dts: qcom: apq8084: drop 'regulator' property from SAW2 device
      ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
      ARM: dts: qcom: ipq4019: drop 'regulator' property from SAW2 devices
      ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices

Ivaylo Ivanov (1):
      ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes

Krzysztof Kozlowski (4):
      ARM: dts: qcom: ipq8064: drop unused reset-names from DWC3 node
      ARM: dts: qcom: sdx65: correct clock order in DWC3 node
      ARM: dts: qcom: ipq4019: correct clock order in DWC3 node
      ARM: dts: qcom: use defines for interrupts

Luca Weiss (2):
      ARM: dts: qcom: msm8926-htc-memul: Add rmtfs memory node
      ARM: dts: qcom: apq8026-lg-lenok: Add vibrator support

Matti Lehtimäki (3):
      ARM: dts: qcom: apq8026-samsung-matissewifi: Configure touch keys
      ARM: dts: qcom: msm8226: Sort and clean up nodes
      ARM: dts: qcom: msm8226: Add watchdog node

Robert Marko (2):
      ARM: dts: qcom: ipq4019-ap.dk01.1: use existing labels for nodes
      ARM: dts: qcom: ipq4019-ap.dk01.1: align flash node with bindings

Rudraksha Gupta (3):
      ARM: dts: qcom: msm8960: expressatt: Add gpio-keys
      ARM: dts: qcom: msm8960: Add gsbi3 node
      ARM: dts: qcom: msm8960: expressatt: Add mXT224S touchscreen

Stefan Hansson (3):
      ARM: dts: qcom: samsung-matisse-common: Add initial common device tree
      ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 10.1 LTE (SM-T535)
      ARM: dts: qcom: samsung-matisse-common: Add UART

 arch/arm/Makefile                                  |   4 +-
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  38 ++
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts | 452 +------------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  70 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |  13 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi | 138 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  35 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  12 +-
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  | 457 +++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 736 ++++++++++++---------
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  17 +-
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  15 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |  37 ++
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  21 +
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  71 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  48 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  33 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |  18 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |  34 +-
 arch/arm/mach-qcom/Kconfig                         |  41 +-
 drivers/iommu/Kconfig                              |   2 +-
 22 files changed, 1307 insertions(+), 986 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
