Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F864C6FD1C
	for <soc@archiver.kernel.org>; Thu, 23 Mar 2023 14:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3817C4339C; Thu, 23 Mar 2023 14:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51FCC433EF;
	Thu, 23 Mar 2023 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679580811;
	bh=Q8t3icB7lnVvCbiyhbXI2z95wN35owRguD2sbUk/Fkg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gxBXEFgtEMCThk8ElEdUWGNis/bPLSAciARCcjM5wBF8vK75iCYAZ39h6xX7eMBo0
	 UARsPHQ30sDxNGD1wEHNWXzHgU12LuDMpH912RdNNTu4+7ravlVVIMckLSzEh1im5e
	 JLjMoy72R5eNH2ENU9fxJAIyC0m2XUmWOZlvXZiEbD4qIMpXY3uw2rQPooO35o0wOJ
	 FPeRgVg4Xgpd9+6CStvNv1ocveK/oSzdfE5ROQ2DJOlUzusaRWV7LbP2q98Pm3Ivus
	 fTBJ+BHhUZZwpUOWwHN7nLPTY8HXlw+BpGU0aZ2l4+QyaV7g6WyoAdja262fN/Y9PN
	 /+acJAO9sU50g==
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Yang Xiwen <forbidden405@foxmail.com>
Subject: [GIT PULL] Qualcomm ARM64 Devicetree fixes for v6.3
Date: Thu, 23 Mar 2023 07:16:42 -0700
Message-Id: <20230323141642.1085684-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.3

for you to fetch changes up to 07b0883e1f09416d07d25a2158f8cd35b732b686:

  arm64: dts: qcom: sc8280xp-x13s: mark bob regulator as always-on (2023-03-22 07:44:01 -0700)

----------------------------------------------------------------
Qualcomm ARM64 Devicetree fixes for v6.3

This correct SIM card selection on the two newly introduced
MSM8916-based USB modems.

The firmware-name for the first CDSP is corrected on the SA8540P Ride
board.

The PCIe controller in SC7280 is marked cache-coherent, which resolves
seen data corruption issues.

Labels are added to the vadc channel nodes on SC8280XP, as the Linux
driver was updated to not include the unit address when generating
device names and collisions thereby prevented registration of the
channels. Audio clocks and routing is corrected and a few regulators are
marked always-on for the Lenovo Thinkpad X13s, as their clients are not
fully described at this point.

SPI5 was accidentally enabled by default on SM6115, and is disabled
again.

CDSP on SM6375 is provided its power-domains, to appropriately vote for
during power up for the DSP.

The iommu mask for the PCIe controllers in SM8150 is updated, to match
what the hypervisor expects.

Th Venus firmware path is corrected on Xiaomi Mi Pad 5 Pro.

The UFS controller is marked cache coherent on SM8350 and SM8450.

The clocks for the second WSA macro on SM8450 is corrected, and given
its own clocks.

The bias-pull-up value for I2C pins are corrected on SM8550, to trigger
the selection of the strong pull. CPU compatibles and the base address
of the LPASS TLMM block are corrected.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: sm8550: Add bias pull up value to tlmm i2c data clk states

Brian Masney (1):
      arm64: dts: qcom: sa8540p-ride: correct name of remoteproc_nsp0 firmware

Jianhua Lu (1):
      arm64: dts: qcom: sm8250-xiaomi-elish: Correct venus firmware path

Johan Hovold (4):
      arm64: dts: qcom: sc8280xp-x13s: mark s11b regulator as always-on
      arm64: dts: qcom: sc8280xp-x13s: mark s10b regulator as always-on
      arm64: dts: qcom: sc8280xp-x13s: mark s12b regulator as always-on
      arm64: dts: qcom: sc8280xp-x13s: mark bob regulator as always-on

Konrad Dybcio (3):
      arm64: dts: qcom: sm6115: Un-enable SPI5 by default
      arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP
      arm64: dts: qcom: sm8550: Use correct CPU compatibles

Krishna chaitanya chundru (1):
      arm64: dts: qcom: sc7280: Mark PCIe controller as cache coherent

Krzysztof Kozlowski (2):
      arm64: dts: qcom: sm8450: correct WSA2 assigned clocks
      arm64: dts: qcom: sm8550: fix LPASS pinctrl slew base address

Manivannan Sadhasivam (5):
      arm64: dts: qcom: sm8150: Fix the iommu mask used for PCIe controllers
      arm64: dts: qcom: sc8280xp: Add label property to vadc channel nodes
      arm64: dts: qcom: sm8350: Mark UFS controller as cache coherent
      arm64: dts: qcom: sm8450: Mark UFS controller as cache coherent
      arm64: dts: qcom: sm8550: Mark UFS controller as cache coherent

Srinivas Kandagatla (4):
      arm64: dts: qcom: sc8280xp: fix rx frame shapping info
      arm64: dts: qcom: sc8280xp: fix lpass tx macro clocks
      arm64: dts: qcom: sc8280xp-x13s: fix dmic sample rate
      arm64: dts: qcom: sc8280xp-x13s: fix va dmic dai links and routing

Yang Xiwen (1):
      arm64: dts: qcom: msm8916-ufi: Fix sim card selection pinctrl

 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |  4 --
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  | 28 ++++++++++++-
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          | 10 -----
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 27 +++++++++---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 18 ++++----
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  4 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts   |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  5 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 49 +++++++++++-----------
 14 files changed, 94 insertions(+), 60 deletions(-)
