Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACFC636D7
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 18:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1E2CC4339E; Fri, 10 Feb 2023 18:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07E6C433EF;
	Fri, 10 Feb 2023 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676055396;
	bh=q2d8Q//HpOEU7o/hmfLnG8Xs8ky9lUsem92zvnVCSD8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=oeWMkkPyvzxRJtuP21LI933fAI5zy8g6KnOlwJtHKetyZtd6jBYdX0BhDeLecMLbJ
	 htOKFJYeQPmy2vsYWnNn+qTtXOtpuEfO4U56JwSl75S4ykrbmyT8VIFgqyW5OUP1pq
	 PyiK4VfrH8Te3GdvRblTFucJbUrG5xpL9kam669IOH3B9Zl/V6PQWE+nCEv7wuk0j+
	 IH4fB5x8APyV6TJ4X1FfzRzCsn1GqcRMrKnuRqzY05Q1DDZfJkfWgh8SLq++2QaOoE
	 BXwHjivhZ2i9+5gI2ud7SzjDo656lF6uAVqqCkkBXzvFOBzIh70oMuThtXyp1aBZ+L
	 nQtgJ9hzMmmcQ==
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
	Luca Weiss <luca@z3ntu.xyz>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [GIT PULL] More Qualcomm ARM32 DTS updates for 6.3
Date: Fri, 10 Feb 2023 10:58:46 -0800
Message-Id: <20230210185846.2032601-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 34d50b12d67795454139a1cfc7ca3add8efa3612:

  ARM: dts: qcom: msm8226: add RPMCC node (2023-01-18 20:20:18 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.3-2

for you to fetch changes up to 68e8dd352adc2c279f9608eaecbe2ced2f398b48:

  ARM: dts: qcom: align OPP table names with DT schema (2023-02-08 20:03:17 -0800)

----------------------------------------------------------------
More Qualcomm ARM32 DTS updates for 6.3

This adds backlight, notification LED, vibrator, volume keys and hall
sensor to the OnePlus One, and provides a range of Devicetree validation
fixes across various platforms.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      dt-bindings: arm: qcom: add the sa8775p-ride board

Christian Marangi (1):
      ARM: dts: qcom: ipq8064: move reg-less nodes outside soc node

Dmitry Baryshkov (3):
      ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
      ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
      ARM: dts: qcom: apq8064: add second DSI host and PHY

Jianhua Lu (1):
      dt-bindings: arm: qcom: Add Xiaomi Mi Pad 5 Pro (xiaomi-elish)

Krzysztof Kozlowski (6):
      ARM: dts: qcom: use "okay" for status
      ARM: dts: qcom-sdx55: align RPMh regulator nodes with bindings
      ARM: dts: qcom-sdx65: align RPMh regulator nodes with bindings
      ARM: dts: qcom: apq8060-dragonboard: align MPP pin node names with DT schema
      ARM: dts: qcom: sdx55: correct TLMM gpio-ranges
      ARM: dts: qcom: align OPP table names with DT schema

Luca Weiss (5):
      ARM: dts: qcom: pm8941: Add vibrator node
      ARM: dts: qcom: msm8974-oneplus-bacon: Add vibrator
      ARM: dts: qcom: msm8974-oneplus-bacon: Add volume keys and hall sensor
      ARM: dts: qcom: msm8974-oneplus-bacon: Add backlight
      ARM: dts: qcom: msm8974-oneplus-bacon: Add notification LED

Manivannan Sadhasivam (2):
      ARM: dts: qcom: sdx55: Add Qcom SMMU-500 as the fallback for IOMMU node
      ARM: dts: qcom: sdx65: Add Qcom SMMU-500 as the fallback for IOMMU node

Rajendra Nayak (1):
      dt-bindings: arm: qcom: Document the sc7280 CRD Pro boards

Yang Xiwen (2):
      dt-bindings: vendor-prefixes: add thwc
      dt-bindings: qcom: Document msm8916-thwc-uf896 and ufi001c

 Documentation/devicetree/bindings/arm/qcom.yaml    | 16 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     | 16 ++--
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 81 +++++++++++++++++-
 arch/arm/boot/dts/qcom-ipq4019.dtsi                |  2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 28 +++----
 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |  2 +-
 .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 96 ++++++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |  6 ++
 arch/arm/boot/dts/qcom-sdx55-mtp.dts               |  2 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts               |  8 +-
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts   |  8 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  4 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  2 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  2 +-
 15 files changed, 234 insertions(+), 41 deletions(-)
