Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B74C76196
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 15:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED229C4339C; Mon, 10 Apr 2023 15:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB012C433EF;
	Mon, 10 Apr 2023 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681141722;
	bh=B++WbvrlRoCfc8mxbKi6AkTn6UUs3uDBJq6WLXCFnC0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DR9ADSw/ypxwg81zjgx9knCKsq1VNjwA9jgjNWz4F0h6/zekE6E2u3urt43/TXUX4
	 Ma2NpgaEyBdHLSG89PkzJM8DjYv7aGSssyEoTF9D+DHvRlsc0wpe89D0f9QNtBMC8P
	 56gqh/1atT5VFHl9flqs+6anpmFQsUEpUv0gidx8UcChoB4KImwdtLPCCBIAf38LBY
	 REZ/E14MURZ9vDQCVupCLWkT7oDvSNRVFtc8F+wi1XMyFF8m76GJ6fczzO4puboGmS
	 QYSoyis6nSExmNj/5uYwZluVEIbrcp5arbNzz7oaPkxT8T+eV3T6k4EyUhT0ZuFNwz
	 wQDhDBXp4K/yA==
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
	Robert Marko <robert.marko@sartura.hr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.4
Date: Mon, 10 Apr 2023 08:52:26 -0700
Message-Id: <20230410155226.5127-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.4

for you to fetch changes up to 26c56dbddc304cf7304346df4b25b3be0c086e36:

  dt-bindings: arm: qcom: Add Yiming LTE dongle uz801-v3.0 (yiming-uz801v3) (2023-04-04 12:23:04 -0700)

----------------------------------------------------------------
Qualcomm ARM32 DeviceTree updates for v6.4

stdout-path is defined for the ALFA Network AP120C-AC, to avoid the need
to pass this information on the kernel commandline. Ath10k is wired up
to read calibration data from the "ART" partition.

PCI I/O port ranges are fixed on IPQ4019 and IPQ8064.

Supply clocks are defined for KPSS L2CC and ACC clock controllers.

Supply clocks for the global clock controller are being specified on
IPQ4019, MSM8974 and MSM8226.

PCIe RC support is enabled on the SDX55 T55 development board, IPA is
defined for the SDX55 and a number of cleanup patches are introduced.

Compatibles for QRB2210/QCM2290, IPQ9574, QRD8550 and IPQ5332 platforms
are added, and the RB1, Yiming LTE dongle, Xiaomi Mi A3, MI01.2 and
MI01.6 boards.

----------------------------------------------------------------
Christian Marangi (4):
      ARM: dts: qcom: add per SoC compatible for qcom,kpss-gcc nodes
      ARM: dts: qcom: add and fix clock configuration for kpss-gcc nodes
      ARM: dts: qcom: add missing clock configuration for kpss-acc-v1
      ARM: dts: qcom: rename kpss-acc-v2 nodes to power-manager nodes

Devi Priya (1):
      dt-bindings: arm: qcom: Add ipq9574 compatible

Kathiravan T (1):
      dt-bindings: qcom: add ipq5332 boards

Konrad Dybcio (1):
      ARM: dts: qcom-apq8064: Fix opp table child name

Krzysztof Kozlowski (2):
      dt-bindings: arm: qcom: add QRD8550
      ARM: dts: qcom: sdx55: add dedicated SDX55 TCSR compatible

Manivannan Sadhasivam (9):
      ARM: dts: qcom: apq8064: Use 0x prefix for the PCI I/O and MEM ranges
      ARM: dts: qcom: ipq4019: Fix the PCI I/O port range
      ARM: dts: qcom: ipq8064: Fix the PCI I/O port range
      ARM: dts: qcom: sdx55: Fix the unit address of PCIe EP node
      ARM: dts: qcom: sdx55: Rename pcie0_{phy/lane} to pcie_{phy/lane}
      ARM: dts: qcom: sdx55: Add support for PCIe RC controller
      ARM: dts: qcom: sdx55: List the property values vertically
      ARM: dts: qcom: sdx55-t55: Enable PCIe RC support
      ARM: dts: qcom: sdx55-t55: Move "status" property down

Rayyan Ansari (2):
      ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
      ARM: dts: qcom: msm8974: add correct XO clock source to GCC node

Robert Marko (6):
      ARM: dts: qcom: ipq4018-ap120c-ac: setup serial console
      ARM: dts: qcom: ipq4018-ap120c-ac: align GPIO hog with DT schema
      ARM: dts: qcom: ipq4018-ap120c-ac: align SPI-NAND with DT schema
      ARM: dts: qcom: ipq4018-ap120c-ac: use NVMEM for ath10k caldata
      ARM: dts: qcom: ipq4019: pass XO and sleep clocks to GCC
      ARM: dts: qcom: ipq4019: remove clk-output-names for sleep clock

Yang Xiwen (2):
      dt-bindings: vendor-prefixes: Add Henan Yiming Technology Co., Ltd.
      dt-bindings: arm: qcom: Add Yiming LTE dongle uz801-v3.0 (yiming-uz801v3)

 Documentation/devicetree/bindings/arm/qcom.yaml    |  16 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  27 +++-
 arch/arm/boot/dts/qcom-apq8084.dtsi                |   8 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi      |  27 +++-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  15 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  24 ++-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |   6 +
 arch/arm/boot/dts/qcom-msm8660.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi                |  13 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  10 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |  50 +++++-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |   2 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  | 180 ++++++++++++++++-----
 15 files changed, 304 insertions(+), 80 deletions(-)
