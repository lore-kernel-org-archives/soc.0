Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4549EC52D11
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 17:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05270C433A0; Thu, 26 Jan 2023 17:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581F7C433D2;
	Thu, 26 Jan 2023 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674755247;
	bh=E0oo64CBISGpJLz5gle7Xev2MqAzkrNO8Hwf11jMJv0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hsA0LcA8KHXIDu1xA3jfnS98y3c9g2evO0cvbJb6BhV9sdg2ETQglx8I8fFKiR2oB
	 9ez3JX7kbmUApW6WP/MEBzKa7+tg4Iebp4sfbj6nbWIFzX24x4eRlWpRLPgNzJ/cEg
	 tctNnPAhrYla0Vkusrve8PfODNQtiqMhWVE9PHH5sZvUS0TPeJlrA9vG5H6JDRMNRK
	 Byf5S67alItfxxGJQwXWQQIZv1nLkNevl1C7GnlZog0APxXHT6suZJzySfynV6vfad
	 F4K+VxAhpZs56KxKOWuK8jkCwUIhhmBEWdXc7dzGriwhSZKNhw4BX1dVAvRALsqcsm
	 tRbIcwFSXoG0Q==
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
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Julian Weigt <juw@posteo.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Owen Yang <ecs.taipeikernel@gmail.com>
Subject: [GIT PULL] Qualcomm ARM DT updates for v6.3
Date: Thu, 26 Jan 2023 11:47:25 -0600
Message-Id: <20230126174725.3681745-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0154252a3b87f77db1e44516d1ed2e82e2d29c30:

  ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI (2022-12-28 10:46:34 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.3

for you to fetch changes up to 34d50b12d67795454139a1cfc7ca3add8efa3612:

  ARM: dts: qcom: msm8226: add RPMCC node (2023-01-18 20:20:18 -0600)

----------------------------------------------------------------
Qualcomm ARM DT updates for v6.3

This introduces support for Acer Iconia Talk S A1-724

The Samsung Galaxy Tab 4 10.1 gains ADSP and backlight support.

The Xperia Z2 Tablet gets charging enabled and the touchscreen is given
a little bit more time to start up.

APQ8064 and MSM8974 gains improvements in clock hierarchy. APQ8064
thermal sensor (tsens) driver gains per-censor calibration data.

Lastly a set of patches that improves DT binding compliance.

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: arm: qcom: Document SM8550 SoC and boards

Alex Elder (1):
      ARM: dts: qcom: use qcom,gsi-loader for IPA

Bjorn Andersson (2):
      ARM: dts: msm8974: castor: Define pm8841 regulators
      Merge tag 'qcom-dts-fixes-for-6.2' into dts-for-6.3

Bryan O'Donoghue (3):
      ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
      ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
      dt-bindings: arm: qcom: Document MSM8939 SoC binding

Dmitry Baryshkov (11):
      ARM: dts: qcom: msm8974: add second DSI host and PHY
      ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
      ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
      ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl to dsi1
      ARM: dts: qcom: msm8974: add xo clock to rpm clock controller
      ARM: dts: qcom-msm8974: specify per-sensor calibration cells
      ARM: dts: qcom-apq8084: specify per-sensor calibration cells
      ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
      ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
      ARM: dts: qcom: rename mdp nodes to display-controller
      ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device

Julian Weigt (1):
      ARM: dts: qcom: msm8974-castor: Enable charging over USB

Konrad Dybcio (1):
      dt-bindings: arm: qcom: Add SM6115(P) and Lenovo Tab P11

Krzysztof Kozlowski (12):
      ARM: dts: qcom: sdx55-mtp: add MPSS remoteproc memory-region
      ARM: dts: qcom: sdx55: add specific compatible for USB HS PHY
      ARM: dts: qcom: sdx65: add specific compatible for USB HS PHY
      ARM: dts: qcom: reverse compatibles to match bindings
      ARM: dts: qcom: apq8064: drop second clock frequency from timer
      ARM: dts: qcom: ipq8064: drop second clock frequency from timer
      ARM: dts: qcom: mdm9615: drop second clock frequency from timer
      ARM: dts: qcom: msm8960: drop second clock frequency from timer
      ARM: dts: qcom: msm8960: add qcom,kpss-wdt-mdm9615
      dt-bindings: arm: qcom: add board-id/msm-id for MSM8956, SDM636 and SM4250
      ARM: dts: qcom: add missing space before {
      ARM: dts: qcom: align OPP table node name with DT schema

Lin, Meng-Bo (7):
      dt-bindings: qcom: Document msm8916-acer-a1-724
      arm64: dts: qcom: msm8916-acer-a1-724: Add initial device tree
      arm64: dts: qcom: msm8916-acer-a1-724: Add accelerometer/magnetometer
      arm64: dts: qcom: msm8916-acer-a1-724: Add touchscreen
      dt-bindings: vendor-prefixes: Add GPLUS
      dt-bindings: qcom: Document msm8916-gplus-fl8005a
      dt-bindings: qcom: Document bindings for msm8916-samsung-j5x

Luca Weiss (3):
      ARM: dts: qcom: msm8974-*: re-add remoteproc supplies
      ARM: dts: qcom: msm8974-castor: Fix touchscreen init
      dt-bindings: arm: qcom: document new msm8953-family devices

Matti Lehtimäki (2):
      ARM: dts: qcom: apq8026-samsung-matisse-wifi: Enable ADSP
      ARM: dts: qcom: apq8026-samsung-matisse-wifi: Add display backlight

Nikita Travkin (1):
      dt-bindings: qcom: Document samsung,gt58 and gt510

Owen Yang (1):
      dt-bindings: arm: qcom: Add zombie with NVMe

Rayyan Ansari (4):
      ARM: dts: qcom: pm8226: sort includes alphabetically and nodes by address
      ARM: dts: qcom: pm8226: add PON device node along with resin sub-node
      ARM: dts: qcom: pm8226: add IADC node
      ARM: dts: qcom: msm8226: add RPMCC node

 Documentation/devicetree/bindings/arm/qcom.yaml    |  63 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../boot/dts/qcom-apq8026-samsung-matisse-wifi.dts |  71 +++-
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  18 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi                | 331 +++++++++++++++-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |   2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   7 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi                |  10 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi                |   7 +
 arch/arm/boot/dts/qcom-msm8960.dtsi                |   7 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  11 +
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  11 +
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 435 ++++++++++++++++++++-
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  38 +-
 arch/arm/boot/dts/qcom-pm8226.dtsi                 |  46 ++-
 arch/arm/boot/dts/qcom-sdx55-mtp.dts               |   4 +
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |   4 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |   4 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  17 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  29 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   | 295 ++++++++++++++
 23 files changed, 1331 insertions(+), 84 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
