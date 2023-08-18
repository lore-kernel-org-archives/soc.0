Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DDC71133
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 02:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCD32C433CA; Fri, 18 Aug 2023 02:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E195C433C7;
	Fri, 18 Aug 2023 02:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692326806;
	bh=rrmOz5+jYbfouiFcI8t9QGZjmet3CgzpcllRz3n2ynA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=HSS2WijaOPKgBuaAOUduOmFKpMNnhUsLYojez2n6w5i5KxqHmY6+i2v0sG6Qe3IHU
	 Hsaj/tYzYK/D6auU99kmZ51eWp12pI90UqPdPzyyLWAS6vB95mGMtHNgpOGKyMkRul
	 QQJel9TEFYIaR6u2AOhcEFaEAcDsPNlGKfOtRV4q4SXM6BBYHH0OOJlljAjD9dtOAW
	 FrA7uWeFdDYQs2zigc7wRKCTvW1kFiyTh6mccQRsxfcKuEHGX4E6BpBOK0MojorWpX
	 TEunaLeZx4PYeqb6eLI7+VyV8cvz7XkP4ggssMv3d1fFCL6VwZlF1g+FydUWIxyONt
	 8wsVbokDwlLXg==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Stephan Gerhold <stephan@gerhold.net>,
	David Heidelberg <david@ixit.cz>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.6
Date: Thu, 17 Aug 2023 19:49:27 -0700
Message-ID: <20230818024928.2485173-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.6

for you to fetch changes up to 3cfa5569cedf1e5d125b62e690c1915d6b757a47:

  ARM: dts: qcom: apq8064: add support to gsbi4 uart (2023-08-17 19:40:23 -0700)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree updates for v6.6

GCC and LCC clock controller parent clocks are introduced on MDM9615.

The newly introduced RPM representation is introduced across multiple
platforms.

Voltage ADC channel names are corrected across multiple platforms.

APQ8064 gains a definition for GSBI4.

The XO clock for SDHCI is corrected, as is the USB node name, on
IPQ4019. USB node name is also corrected for SDX55.

The correct PMIC is included on SDX65 MTP.

The incorrect spi-max-frequency property is removed from controllers on
IPQ8064 and MSM8960.

OCMEM and the display subsystem are added to MSM8226.

Reset line is added to the PM8941 and the APQ8074 Dragonboard, while a
few properties of the Sony Xperia Z2 Tablet touchscreen are corrected.

----------------------------------------------------------------
David Heidelberg (1):
      ARM: dts: qcom: apq8064: add support to gsbi4 uart

Dmitry Baryshkov (4):
      ARM: dts: qcom-pm8941: add resin support
      ARM: dts: qcom: apq8074-dragonboard: add resin
      ARM: dts: qcom-mdm9615: specify clocks for the lcc device
      ARM: dts: qcom-mdm9615: specify gcc clocks

Krzysztof Kozlowski (8):
      ARM: dts: qcom: ipq4019: use generic node names for USB
      ARM: dts: qcom: sdx55: use generic node names for USB
      ARM: dts: qcom: ipq8064: drop spi-max-frequency from controller
      ARM: dts: qcom: msm8960: drop spi-max-frequency from controller
      ARM: dts: qcom: minor whitespace cleanup around '='
      ARM: dts: qcom: msm8974pro-castor: correct inverted X of touchscreen
      ARM: dts: qcom: msm8974pro-castor: correct touchscreen function names
      ARM: dts: qcom: msm8974pro-castor: correct touchscreen syna,nosleep-mode

Luca Weiss (2):
      ARM: dts: qcom: msm8226: Add mdss nodes
      ARM: dts: qcom: msm8226: Add ocmem

Marijn Suijten (1):
      ARM: dts: qcom: Use labels with generic node names for ADC channels

Robert Marko (1):
      ARM: dts: qcom: ipq4019: correct SDHCI XO clock

Rohit Agarwal (1):
      ARM: dts: qcom: sdx65-mtp: Update the pmic used in sdx65

Stephan Gerhold (2):
      ARM: dts: qcom: Add rpm-proc node for SMD platforms
      ARM: dts: qcom: apq8064: Drop redundant /smd node

 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |  16 ++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  52 ++----
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |   5 +
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |   7 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  43 ++---
 arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts     |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi      |   1 -
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |  19 ++-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 182 ++++++++++++++++++---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |   1 -
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  44 ++---
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |   2 +-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |   8 +-
 arch/arm/boot/dts/qcom/qcom-pm8226.dtsi            |  12 +-
 arch/arm/boot/dts/qcom/qcom-pm8941.dtsi            |  36 ++--
 arch/arm/boot/dts/qcom/qcom-pma8084.dtsi           |  12 +-
 arch/arm/boot/dts/qcom/qcom-pmx55.dtsi             |   8 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |   2 +-
 20 files changed, 313 insertions(+), 146 deletions(-)
