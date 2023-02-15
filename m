Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA1C6379F
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 05:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0A11C4339E; Wed, 15 Feb 2023 05:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CAAC4339B;
	Wed, 15 Feb 2023 05:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676438006;
	bh=m2mnVqPCE7YePC1131x6oIBVu20oy3BOPMgBgwn8yJk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=RzvCaU5WiWiezGT7ozvKYCZPA9MG9FHBGL4eSIVfa4GXufXZ9tYc1WULQcf2G1IRZ
	 sorLXO22Cl1KWpefI+5ZQzQCUH5gca7qTSvbI/1s2KST30xVpBJGazO1fWl4wJxenf
	 dM3hT9wKmZQJgdQKtenpz+yzgaYjPVMLXE6Sy3wfDUZDkPhqU4gVtJbknaP6WpUirY
	 F+ekx7aIzWcHpXY3ReVUenFz7dxDLmY0NU2qNZLORmFAITh0tx2sJ2hwyulsdpm4PI
	 gL30BIiSlZd0TEPzJhiK/k9nDNgTL4YZwzZ1n6fausbulj1kdfkUOS4poHh/0qjN8N
	 xWaSzGLACP0Vg==
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
	Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Owen Yang <ecs.taipeikernel@gmail.com>
Subject: [GIT PULL] Last set of Qualcomm ARM64 DTS updates for v6.3
Date: Tue, 14 Feb 2023 21:15:30 -0800
Message-Id: <20230215051530.1165953-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit f069ede81ef438d99e76112d8738c4dc3d1766f9:

  arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS rail more properly (2023-02-08 20:09:36 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.3-3

for you to fetch changes up to 407ef897bd0275e38ae33d410857e71c092679bd:

  arm64: dts: qcom: msm8996: align RPM G-Link clock-controller node with bindings (2023-02-13 14:20:54 -0800)

----------------------------------------------------------------
Last set of Qualcomm ARM64 DTS updates for v6.3

This introduces additional DisplayPort controllers and pmic_glink on
SC8280XP (8cx Gen3), which provides support for USB Type-C-based
displays on the the Lenovo ThinkPad X13s and the compute reference
device. The pmic_glink also provides battery and power supply status.

Interrupt-parents are corrected across the SC8280XP PMICs, to allow
non-Linux OSs to properly handle interrupts in the various blocks
therein.

It cleans up the SM8350 base dtsi and introduces GPU support on this
platform, as well as enable this for the Hardware Development Kit (HDK).
It enables i2c busses on the Fairphone FP4

Lastly it aligns glink node names with bindings across a few platforms,
and corrects the compatible for the PON block in the pmk8350 PMIC.

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: dts: qcom: sc8280xp: Add USB-C-related DP blocks
      arm64: dts: qcom: sc8280xp-crd: Introduce pmic_glink
      arm64: dts: qcom: sc8280xp-x13s: Enable external display

Dmitry Baryshkov (5):
      arm64: dts: qcom: sm8350: reorder device nodes
      arm64: dts: qcom: sm8350: move more nodes to correct place
      arm64: dts: qcom: sm8350: finish reordering nodes
      arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
      arm64: dts: qcom: sm8350-hdk: enable GPU

Konrad Dybcio (1):
      arm64: dts: qcom: pmk8350: Use the correct PON compatible

Krzysztof Kozlowski (3):
      arm64: dts: qcom: ipq6018: align RPM G-Link node with bindings
      arm64: dts: qcom: qcs404: align RPM G-Link node with bindings
      arm64: dts: qcom: msm8996: align RPM G-Link clock-controller node with bindings

Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: move status property down
      arm64: dts: qcom: sm7225-fairphone-fp4: enable remaining i2c busses

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly

Neil Armstrong (1):
      arm64: dts: qcom: sm8550: remove invalid interconnect property from cryptobam

Owen Yang (1):
      arm64: dts: qcom: sc7280: Adjust zombie PWM frequency

 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    2 +-
 .../boot/dts/qcom/sc7280-herobrine-zombie.dtsi     |    4 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  196 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  180 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  189 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   67 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 2512 +++++++++++---------
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |    2 -
 13 files changed, 1972 insertions(+), 1206 deletions(-)
