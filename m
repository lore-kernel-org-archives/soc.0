Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E4C54EAA
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 20:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 504A5C433A1; Thu, 26 Jan 2023 20:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC980C433D2;
	Thu, 26 Jan 2023 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674764734;
	bh=xhz/QEdHXTNa5ma9j6+KvuNueDZmXeJdVJDDLFbraeg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mrjNT9bI8SPTqiv+vYFJrZ0R64riDhzJNJlTPbTAAwz4IyMEXPLTo1+kT3ne4J+oS
	 71Lj5l6Ni6uU+Uh9wDaTU0C/6HJRtQIBbHQcMfWn1pd6IAOrzXXB4+7pfIfYATxr0n
	 /TLx0QIFZCQUDKXIILyduxwxJSEduwRjkMfKoDHDRA2xB/l82E7x/bkodhK4v1xeNG
	 IoSRbrG80nT4iVaybyU2OhS91jDJ29PlKga/JmGDFgEfu8z1vYN3fG/vESW1QzG+dQ
	 KB5pqhuI9l18aaKJaOVRxWGrRaO9IzvmIewLyp4S8+wL7r3pfky6iPX2cWD51XBAug
	 fVG2sYuVK/RWQ==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	Robert Marko <robimarko@gmail.com>,
	Lin,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Robert Foss <robert.foss@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Eric Chanudet <echanude@redhat.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Martin Botka <martin.botka@somainline.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Petr Vorel <petr.vorel@gmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Adam Skladowski <a39.skl@gmail.com>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Danila Tikhonov <JIaxyga@protonmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Eugene Lepshy <fekz115@gmail.com>,
	Gabriela David <ultracoolguy@disroot.org>,
	Jasper Korten <jja2000@gmail.com>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Julian Braha <julianbraha@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Markuss Broks <markuss.broks@gmail.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Owen Yang <ecs.taipeikernel@gmail.com>,
	Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Rob Herring <robh@kernel.org>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Siddharth Manthan <siddharth.manthan@gmail.com>,
	Sireesh Kodali <sireeshkodali1@gmail.com>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	Yunlong Jia <ecs.beijing2022@gmail.com>
Subject: [GIT PULL] Qualcomm ARM64 Devicetree updates for v6.3
Date: Thu, 26 Jan 2023 14:25:28 -0600
Message-Id: <20230126202528.3691539-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 69876bc6fd4de3ad2dc7826fe269e91fa2c1807f:

  arm64: dts: qcom: msm8992-libra: Fix the memory map (2023-01-10 09:49:03 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.3

for you to fetch changes up to a63a420d050d47a6afb5e2198181dadd08e71f97:

  arm64: dts: qcom: sc7280: Add a carveout for modem metadata (2023-01-18 21:35:25 -0600)

----------------------------------------------------------------
Qualcomm ARM64 Devicetree updates for v6.3

This introduces support for the new Snapdragon 8 Gen 2 (SM8550)
platform.  In addition to the adding support for the MTP on this
platform, support the following devices is introduced:
 - GPLUS FL8005A
 - Google Zombie with LTE and NVMe
 - Google Zombie with NVMe
 - Lenovo Tab P11
 - Motorola G5 Plus
 - Motorola G7 Power
 - Motorola Moto G6
 - Samsung Galaxy J5 (2016)
 - Samsung Galaxy Tab A 8.0
 - Samsung Galaxy Tab A 9.7
 - Xiaomi Mi A1
 - Xiaomi Mi A2 Lite
 - Xiaomi Redmi 5 Plus
 - Xiaomi Redmi Note 4X

On IPQ8074 the PCIe PHY register regions and PHY clock names are
corrected.

On MSM8916 DMA for the I2C controllers are introduced and blsp_dma is
unconditionally enabled. Per-sensor calibration data is provided for the
thermal sensor (tsens) block. The GPLUS FL8005A device is introduced and
gains support for touchscreen and flash LED. An additional Samsung
Galaxy J5 variant is added, and support is added for hall sensor and
MUIC.

Per-sensor calibration information is introduced for the thermal sensor
on MSM8956 as well.

On MSM8996, GPLL0 is added as a possible Kryo clock controller input, a
carveout is added to get modem metadata out of System RAM. Missing bus
clocks are added for agnoc2.
SDHCI1 is enabled on the Sony Xperia Tone platform and USB is limited to
high-speed, to make USB work.

MSM8998 gains the same modem carveout as other platforms, and the
description of the clock hierarchy is improved.

On QCS404 the clock hierarchy description is improved, the CDSP PAS node
is adjusted to match the binding and the thermal sensor (tsens) gains
per-sensor calibration information.

On SC7180 the Data Capture and Compare block is intorduced, and a
carveout for the modem metadata is introduced, to get this out of System
RAM. Pazquel360 gains touchscreen support, the regulator off-on-time is
adjusted for the Trogdor eDP and touchscreen.
Data lane and frequency properties are introduced for the DisplayPort
links.

SC7280 also gets Data Capture and Compare support, as well as the
dedicated modem metadata region. Herobrine gains DP audio support.
IPA description is updated so that it's only active on boards with a
modem.

On SC8280XP the display subsystem is introduced, currently with support
for most of the DisplayPort controllers. GPR, SoundWire and LPASS is
introduced, for audio support. Missing I2C and SPI controllers are
introduced.
Support for EDP is introduced for the CRD, the Lenovo ThinkPad X13s and
the SA8295P ADP automotive board. The SA8540P Ride platform enables one
i2c and pcie controllers.
A CMA region is defined for the CRD and X13s, to avoid allocation issues
from the NVMe support.

Fairphone FP3 gains NFC support and the Sony Xperia Nile platform gains
a description of simplefb.
SDM670 gains QFPROM definition.

SDM845 gains a carveout for the modem metadata and support for the Data
Capture and Compare block is introduced.  Lenovo Yoga C630 firmware
paths are aligned with all other Qualcomm platforms.

On SM6125 apss SMMU is introduced and streams are defined for USB and
SDHCI controllers. GPI DMA description is introduced, as well as missing
SPI and I2C serial engines.
On Sony Xperia 10 IIa regulator definitions are improved, SDHCI2 is
introduced, and I2C and related GPI DMA blocks are enabled.

On SM6350 IPA is introduced. DDR and L3 scaling is introduced based on
CPUfreq.

Fairphone FP4, on SM7225 also has IPA enabled, and the Flash LED is
enabled as well.

On SM8150 the display subsystem is introduced, with clock controller,
DPU and two DSI controllers. The Data Capture and Compare block is
introduced.
For the Sony Xperia Kumano platform, GPIO keys and NFC support is
introduced.

For SM8350 PCIe is introduced, as is the display subsystem with display
clock controller, DPU and two DSI controllers. #interconnect-cells is
changed to 2, to align with other platforms and allow for active-only
votes. The display is enabled and the LT9611uxc found on the SM8350
Hardware Development Kit board is described, to provide HDMI output.

On SM8450 the display subsystem is introduced, with DPU and two DSI
controllers.  GIC-ITS support is introduced for both PCIe0 and PCIe1.
SPMI bus support is introduced and pmics are wired up across the various
devices.
The display subsystem is enabled and the LT9611uxc is described to
provide HDMI output on the SM8450 Hardware Development Kit.
On Sony Xperia Nagara platform, GPIO keys and GPIO line names are
introduced. As is the SLG51000 PMIC and camera regulators are defined.

Support for SM8550 is introduced, with support for storage, USB,
remoteprocs, PCIe, low-speed buses, crypto and display subsystem. These
blocks are enabled on the MTP.

Lastly, the work continue to align Devicetree source with bindings
across all platforms.

----------------------------------------------------------------
Abel Vesa (12):
      dt-bindings: interconnect: Add Qualcomm SM8550
      interconnect: qcom: Add SM8550 interconnect provider driver
      dt-bindings: clock: Add SM8550 TCSR CC clocks
      arm64: dts: qcom: Add base SM8550 dtsi
      arm64: dts: qcom: Add base SM8550 MTP dts
      arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes
      arm64: dts: qcom: sm8550-mtp: Add UFS host controller and PHY node
      arm64: dts: qcom: sm8550: Add interconnect path to SCM node
      arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes
      arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes
      arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes
      arm64: dts: qcom: sm8550-mtp: Add USB PHYs and HC nodes

Adam Skladowski (1):
      arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi Note 4X

Alejandro Tafalla (1):
      arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite

Alex Elder (2):
      arm64: dts: qcom: sc7280: only enable IPA for boards with a modem
      arm64: dts: qcom: use qcom,gsi-loader for IPA

AngeloGioacchino Del Regno (1):
      arm64: dts: qcom: sm6125: Add IOMMU context to DWC3

Bhupesh Sharma (1):
      arm64: dts: qcom: sm6115: Add debug related nodes

Bjorn Andersson (11):
      Merge branch 'icc-sm8550-immutable' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into arm64-for-6.3
      Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into arm64-for-6.3
      Revert "dt-bindings: arm: qcom: Add SM6115(P) and Lenovo Tab P11"
      arm64: dts: qcom: sc8280xp: Define some of the display blocks
      arm64: dts: qcom: sc8280xp-crd: Enable EDP
      arm64: dts: qcom: sa8295-adp: Enable DP instances
      arm64: dts: qcom: sc8280xp: Vote for CX in USB controllers
      arm64: dts: qcom: sc8280xp: Use MMCX for all DP controllers
      arm64: dts: qcom: sc8280xp: Define CMA region for CRD and X13s
      Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
      Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c572@linaro.org' into HEAD

Brian Masney (8):
      arm64: dts: qcom: sc8280xp: rename qup2_uart17 to uart17
      arm64: dts: qcom: sc8280xp: rename qup2_i2c5 to i2c21
      arm64: dts: qcom: sc8280xp: rename qup0_i2c4 to i2c4
      arm64: dts: qcom: sc8280xp: add missing i2c nodes
      arm64: dts: qcom: sc8280xp: add missing spi nodes
      arm64: dts: qcom: sa8540p-ride: add i2c nodes
      arm64: dts: qcom: sc8280xp: add aliases for i2c4 and i2c21
      arm64: dts: qcom: sc8280xp: add rng device tree node

Bryan O'Donoghue (9):
      arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
      arm64: dts: qcom: msm8953: Add compat qcom,msm8953-dsi-ctrl
      arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
      arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
      arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
      arm64: dts: qcom: sdm630: Add compat qcom,sdm660-dsi-ctrl
      arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
      arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
      arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl

Danila Tikhonov (1):
      arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A1

Dmitry Baryshkov (29):
      arm64: dts: qcom: qcs404: use symbol names for PCIe resets
      arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
      arm64: dts: qcom: qcs404: add clocks to the gcc node
      arm64: dts: qcom: qcs404: add xo clock to rpm clock controller
      arm64: dts: qcom: qcs404: register PCIe PHY as a clock provider
      arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
      arm64: dts: qcom: sm8450: add display hardware devices
      arm64: dts: qcom: sm8450-hdk: enable display hardware
      arm64: dts: qcom: sm8150: Add compat qcom,sm8150-dsi-ctrl
      arm64: dts: qcom: sm8450: Add compat qcom,sm8450-dsi-ctrl
      arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
      arm64: dts: qcom: sm8450-hdk: add missing PMIC includes
      arm64: dts: qcom: msm8998: get rid of test clock
      arm64: dts: qcom: sdm845: make DP node follow the schema
      arm64: dts: qcom: msm8996-oneplus-common: drop vdda-supply from DSI PHY
      arm64: dts: qcom: msm8996: mark apcs as clock provider
      arm64: dts: qcom: sm8150: drop the virtual ipa-virt device
      arm64: dts: qcom: sm8250: drop the virtual ipa-virt device
      arm64: dts: qcom: sm8350: add PCIe devices
      arm64: dts: qcom: sm8350-hdk: enable PCIe devices
      arm64: dts: qcom: use UFS symbol clocks provided by PHY
      arm64: dts: qcom: msm8956: use SoC-specific compat for tsens
      arm64: dts: qcom: msm8916: specify per-sensor calibration cells
      arm64: dts: qcom: msm8976: specify per-sensor calibration cells
      arm64: dts: qcom: qcs404: specify per-sensor calibration cells
      arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
      arm64: dts: qcom: rename mdss nodes to display-subsystem
      arm64: dts: qcom: rename mdp nodes to display-controller
      arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input

Douglas Anderson (4):
      arm64: dts: qcom: sc7180: Bump up trogdor ts_reset_l drive strength
      arm64: dts: qcom: sc7180: Add trogdor eDP/touchscreen regulator off-on-time
      arm64: dts: qcom: sc7180: Start the trogdor eDP/touchscreen regulator on
      arm64: dts: qcom: sc7180: Add pazquel360 touschreen

Dzmitry Sankouski (1):
      arm64: dts: qcom: Re-enable resin on MSM8998 and SDM845 boards

Eric Chanudet (4):
      arm64: dts: qcom: rename pm8450a dtsi to sa8540p-pmics
      arm64: dts: qcom: sa8450p-pmics: add rtc node
      arm64: dts: qcom: sa8295p-adp: use sa8540p-pmics
      arm64: dts: qcom: pm8941-rtc add alarm register

Eugene Lepshy (1):
      arm64: dts: qcom: msm8953: Add device tree for Xiaomi Redmi 5 Plus

Gabriela David (1):
      arm64: dts: qcom: sdm632: Add device tree for Motorola G7 Power

Jasper Korten (1):
      arm64: dts: qcom: Add device tree for Samsung Galaxy Tab A 9.7 (2015)

Johan Hovold (11):
      arm64: dts: qcom: sc8280xp-x13s: move 'thermal-zones' node
      arm64: dts: qcom: sc8280xp-x13s: move 'regulator-vph-pwr' node
      arm64: dts: qcom: sc8280xp-x13s: enable eDP display
      arm64: dts: qcom: sa8540p-pmics: add missing interrupt include
      arm64: dts: qcom: sa8540p-pmics: rename pmic labels
      arm64: dts: qcom: sc8280xp-crd: allow vreg_l3b to be disabled
      arm64: dts: qcom: sc8280xp: disable sound nodes
      arm64: dts: qcom: sc8280xp-x13s: move vamacro node
      arm64: dts: qcom: sc8280xp-x13s: move wcd938x codec node
      arm64: dts: qcom: sm8450-hdk: move wcd938x codec node
      arm64: dts: qcom: sm8250: clean up wcd938x codec node

Judy Hsiao (1):
      arm64: dts: qcom: sc7280: add DP audio to herobrine rt5682 1-mic dtsi

Julian Braha (1):
      arm64: dts: qcom: sdm450: Add device tree for Motorola Moto G6

Konrad Dybcio (63):
      arm64: dts: qcom: sm8350-sagami: Configure SLG51000 PMIC on PDX215
      arm64: dts: qcom: sm8350-sagami: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: msm8996-tone: Fix USB taking 6 minutes to wake up
      arm64: dts: qcom: sm6115: Fix UFS node
      arm64: dts: qcom: sm6115: Provide xo clk to rpmcc
      arm64: dts: qcom: sm6115: Provide real SMD RPM XO to SDC1/2
      dt-bindings: arm: qcom: Add SM6115(P) and Lenovo Tab P11
      arm64: dts: qcom: Add Lenovo Tab P11 (J606F/XiaoXin Pad) dts
      arm64: dts: qcom: sm6115: Add thermal zones
      arm64: dts: qcom: sm6350: Fix up the ramoops node
      arm64: dts: qcom: msm8996-tone: Enable SDHCI1
      arm64: dts: qcom: msm8996-tone: Move status last
      arm64: dts: qcom: sm8150-kumano: Add GPIO keys
      arm64: dts: qcom: sm8150-kumano: Add NXP PN553 NFC
      arm64: dts: qcom: msm8996: Add additional A2NoC clocks
      arm64: dts: qcom: ipq6018: Use lowercase hex
      arm64: dts: qcom: msm8996: Use lowercase hex
      arm64: dts: qcom: msm8998: Use lowercase hex
      arm64: dts: qcom: sdm630: Use lowercase hex
      arm64: dts: qcom: sdm660: Use lowercase hex
      arm64: dts: qcom: sdm845: Use lowercase hex
      arm64: dts: qcom: sm8250: Use lowercase hex
      arm64: dts: qcom: sm8150: Use lowercase hex
      arm64: dts: qcom: sdm845: Fix some whitespace/newlines
      arm64: dts: qcom: sm8350-sagami: Rectify GPIO keys
      arm64: dts: qcom: sm8150: Add DISPCC node
      arm64: dts: qcom: sm8150: Wire up MDSS
      arm64: dts: qcom: sm8450-nagara: Include PMIC DTSIs
      arm64: dts: qcom: sm8450-nagara: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8450-nagara: Add GPIO keys
      arm64: dts: qcom: sm8450-nagara: Set up camera regulators
      arm64: dts: qcom: sm8450-nagara: Enable PMIC RESIN+PON
      arm64: dts: qcom: sm8450-nagara: Configure SLG51000 PMIC
      arm64: dts: qcom: sm8250-edo: Remove misleading comments
      arm64: dts: qcom: sm8350-sagami: Disable empty i2c bus
      arm64: dts: qcom: sm8450-nagara: Disable empty i2c bus
      arm64: dts: qcom: msm8916: Add fallback CCI compatible
      arm64: dts: qcom: sdm845: Add fallback CCI compatible
      arm64: dts: qcom: sm8250: Add fallback CCI compatible
      arm64: dts: qcom: sm8450: Add fallback CCI compatible
      arm64: dts: qcom: sm8350: Drop standalone smem node
      arm64: dts: qcom: msm8998: Use RPM XO
      arm64: dts: qcom: sdm630-nile: Don't use underscores in node names
      arm64: dts: qcom: sdm630-nile: Reserve simplefb memory
      arm64: dts: qcom: sm6350: Add OSM L3 node
      arm64: dts: qcom: sm6350: Set up DDR & L3 scaling
      arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
      arm64: dts: qcom: ipq6018: Fix up indentation
      arm64: dts: qcom: ipq6018: Sort nodes properly
      arm64: dts: qcom: ipq6018: Add/remove some newlines
      arm64: dts: qcom: ipq6018: Use lowercase hex
      arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm8150: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm6350: Pad addresses to 8 hex digits
      arm64: dts: qcom: sdm845: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
      arm64: dts: qcom: sc7180: Pad addresses to 8 hex digits
      arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
      arm64: dts: qcom: msm8994-octagon: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm8450: Pad addresses to 8 hex digits
      arm64: dts: qcom: msm8994-kitakami: Pad addresses to 8 hex digits
      arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits

Krzysztof Kozlowski (48):
      arm64: dts: qcom: msm8996: drop address/size cells from smd-edge
      arm64: dts: qcom: qcs404: align CDSP PAS node with bindings
      arm64: dts: qcom: sc7180: align MPSS PAS node with bindings
      arm64: dts: qcom: sc7280: align MPSS PAS node with bindings
      arm64: dts: qcom: msm8996-xiaomi-gemini: use preferred enable-gpios for LP5562 LED
      arm64: dts: qcom: sdm845: drop 0x from unit address
      arm64: dts: qcom: sc7180: move QUP and QSPI opp tables out of SoC node
      arm64: dts: qcom: sdm845: move DSI/QUP/QSPI opp tables out of SoC node
      arm64: dts: qcom: sdm845: move sound node out of soc
      arm64: dts: qcom: sm8250: move sound and codec nodes out of soc
      arm64: dts: qcom: sm8250: add cache size
      arm64: dts: qcom: sm8350-sony-xperia-sagami: specify which LDO modes are allowed
      arm64: dts: qcom: sm8350: align MMC node names with DT schema
      arm64: dts: qcom: msm8996: align bus node names with DT schema
      arm64: dts: qcom: sm8250: drop unused clock-frequency from va-macro
      arm64: dts: qcom: sm8450: re-order GCC clocks
      arm64: dts: qcom: use generic node name for CS35L41 speaker
      arm64: dts: qcom: sm8450: disable by default Soundwire and VA-macro
      arm64: dts: qcom: sc8280xp: align PSCI domain names with DT schema
      arm64: dts: qcom: sm6375: align PSCI domain names with DT schema
      arm64: dts: qcom: sm8150: align PSCI domain names with DT schema
      arm64: dts: qcom: sm8250: align PSCI domain names with DT schema
      arm64: dts: qcom: sm8350: align PSCI domain names with DT schema
      arm64: dts: qcom: sm8450: align PSCI domain names with DT schema
      arm64: dts: qcom: sdm845-db845c: fix audio codec interrupt pin name
      arm64: dts: qcom: sdm845-xiaomi-beryllium: fix audio codec interrupt pin name
      arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
      arm64: dts: qcom: sdm845: do not customize SPI0 pin drive/bias
      arm64: dts: qcom: sc7180: order top-level nodes alphabetically
      arm64: dts: qcom: sdm845: order top-level nodes alphabetically
      arm64: dts: qcom: sc7180: correct SPMI bus address cells
      arm64: dts: qcom: sc7280: correct SPMI bus address cells
      arm64: dts: qcom: sc8280xp: correct SPMI bus address cells
      arm64: dts: qcom: rename AOSS QMP nodes
      arm64: dts: qcom: replace underscores in node names
      arm64: dts: qcom: sm8450: correct Soundwire wakeup interrupt name
      arm64: dts: qcom: add missing space before {
      arm64: dts: qcom: sm8350: drop unused dispcc power-domain-names
      arm64: dts: qcom: sc7180-trogdor: align DAI children names with DT schema
      arm64: dts: qcom: sm8250: drop unused clock-frequency from rx-macro
      arm64: dts: qcom: sc8280xp: drop bogus clock-controller property
      arm64: dts: qcom: sc8280xp: drop unused properties from tx-macro
      arm64: dts: qcom: msm8916-samsung-a2015: correct motor pinctrl node name
      arm64: dts: qcom: sc7280-idp: add amp pin config function
      arm64: dts: qcom: align OPP table node name with DT schema
      arm64: dts: qcom: sm8250: drop unused clock-frequency from wsa-macro
      arm64: dts: qcom: sm8250: drop unused properties from tx-macro
      arm64: dts: qcom: sdm845-db845c: drop label from I2C controllers

Kuogee Hsieh (1):
      arm64: dts: qcom: add data-lanes and link-freuencies into dp_out endpoint

Lin, Meng-Bo (7):
      arm64: dts: qcom: msm8916-samsung-grandmax: Add properties function and color for keyled
      arm64: dts: qcom: msm8916-gplus-fl8005a: Add initial device tree
      arm64: dts: qcom: msm8916-gplus-fl8005a: Add touchscreen
      arm64: dts: qcom: msm8916-gplus-fl8005a: Add flash LED
      arm64: dts: qcom: msm8916-samsung-j5-common: Add initial common device tree
      arm64: dts: qcom: msm8916-samsung-j5-common: Add new device trees
      arm64: dts: qcom: msm8916-samsung-j5-common: Add Hall sensor

Luca Weiss (8):
      arm64: dts: qcom: sdm632-fairphone-fp3: Add NFC
      arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC
      arm64: dts: qcom: pm6150l: add spmi-flash-led node
      arm64: dts: qcom: sm7225-fairphone-fp4: configure flash LED
      arm64: dts: qcom: msm8953: Adjust reserved-memory nodes
      arm64: dts: qcom: pm7250b: Add BAT_ID vadc channel
      arm64: dts: qcom: sm6350: add IPA node
      arm64: dts: qcom: sm7225-fairphone-fp4: enable IPA

Manivannan Sadhasivam (2):
      arm64: dts: qcom: sm8450: Use GIC-ITS for PCIe0 and PCIe1
      arm64: dts: qcom: sm8450: Allow both GIC-ITS and internal MSI controller

Marijn Suijten (17):
      arm64: dts: qcom: sm8150-kumano: Panel framebuffer is 2.5k instead of 4k
      arm64: dts: qcom: pmi8950: Correct rev_1250v channel label to mv
      arm64: dts: qcom: Use plural _gpios node label for PMIC gpios
      arm64: dts: qcom: sm8150-kumano: Configure resin as volume up key
      arm64: dts: qcom: sm8150: Enable split pagetables for Adreno SMMU
      arm64: dts: qcom: sm6350-lena: Flatten gpio-keys pinctrl state
      arm64: dts: qcom: sm6125-seine: Configure PM6125 regulators
      arm64: dts: qcom: sm6125-seine: Provide regulators to HS USB2 PHY
      arm64: dts: qcom: sm6125-seine: Provide regulators to SDHCI 1
      arm64: dts: qcom: sm6125-seine: Configure SD Card slot on SDHCI 2
      arm64: dts: qcom: sm6125-seine: Lock eMMC and SD Card IDs via aliases
      arm64: dts: qcom: sm6125: Reorder HSUSB PHY clocks to match bindings
      arm64: dts: qcom: sm6125: Add apps_smmu with streamID to SDHCI 1/2 nodes
      arm64: dts: qcom: sm6125-seine: Clean up gpio-keys (volume down)
      arm64: dts: qcom: sm6125: Add QUPs with SPI and I2C Serial Engines
      arm64: dts: qcom: sm6125-seine: Enable GPI DMA 0, QUP 0 and I2C SEs
      arm64: dts: qcom: sdm845-tama: Add volume up and camera GPIO keys

Markuss Broks (1):
      arm64: dts: qcom: msm8916-samsung-j5-common: Add MUIC support

Martin Botka (3):
      arm64: dts: qcom: sm6125: Configure APPS SMMU
      arm64: dts: qcom: sm6125: Add GPI DMA nodes
      arm64: dts: qcom: sm6125: Add pin configs for QUP SPI/I2C Serial Engines

Mukesh Ojha (1):
      arm64: dts: qcom: sm8450: Add TCSR halt register space

Neil Armstrong (15):
      arm64: dts: qcom: Add pm8010 pmic dtsi
      arm64: dts: qcom: Add PM8550 pmic dtsi
      arm64: dts: qcom: Add PM8550b pmic dtsi
      arm64: dts: qcom: Add PM8550ve pmic dtsi
      arm64: dts: qcom: Add PM8550vs pmic dtsi
      arm64: dts: qcom: Add PMK8550 pmic dtsi
      arm64: dts: qcom: Add PMR735d pmic dtsi
      arm64: dts: qcom: sm8550: add I2C Master Hub nodes
      arm64: dts: qcom: sm8550: add QCrypto nodes
      dt-bindings: clock: document SM8550 DISPCC clock controller
      arm64: dts: qcom: sm8550: add display hardware devices
      arm64: dts: qcom: sm8550-mtp: enable display hardware
      arm64: dts: qcom: sm8550-mtp: add DSI panel
      arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes
      arm64: dts: qcom: sm8550-mtp: enable adsp, cdsp & mdss

Owen Yang (1):
      arm64: dts: qcom: sc7280: Add DT for sc7280-herobrine-zombie with NVMe

Pavankumar Kondeti (1):
      arm64: dts: qcom: sm8550: fix xo clock source in cpufreq-hw node

Petr Vorel (2):
      arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
      arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem

Pierre Gondois (1):
      arm64: dts: qcom: Update cache properties

Quentin Schulz (1):
      arm64: dts: qcom: msm8998-fxtec: fix touchscreen reset GPIO polarity

Richard Acayan (3):
      arm64: dts: qcom: sdm670: add qfprom node
      arm64: dts: qcom: sdm670: add missing usb hstx nvmem cell
      arm64: dts: qcom: sdm670-google-sargo: keep pm660 ldo8 on

Rob Herring (1):
      arm64: dts: qcom: sc7280: Fix CPU nodes compatible string

Robert Foss (5):
      arm64: dts: qcom: sm8350: Add display system nodes
      arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
      arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge
      arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
      arm64: dts: qcom: sm8350: Use 2 interconnect cells

Robert Marko (8):
      arm64: dts: qcom: ipq8074: add SoC specific compatible to MDIO
      arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s clock output names
      arm64: dts: qcom: ipq8074: fix Gen2 PCIe QMP PHY
      arm64: dts: qcom: ipq8074: fix Gen3 PCIe QMP PHY
      arm64: dts: qcom: ipq8074: correct Gen2 PCIe ranges
      arm64: dts: qcom: ipq8074: set Gen2 PCIe pcie max-link-speed
      arm64: dts: qcom: ipq8074: fix Gen3 PCIe node
      arm64: dts: qcom: ipq8074: correct PCIe QMP PHY output clock names

Shazad Hussain (1):
      arm64: dts: qcom: sa8540p-ride: enable pcie2a node

Sibi Sankar (5):
      arm64: dts: qcom: msm8996: Add a carveout for modem metadata
      arm64: dts: qcom: msm8998: Add a carveout for modem metadata
      arm64: dts: qcom: sdm845: Add a carveout for modem metadata
      arm64: dts: qcom: sc7180: Add a carveout for modem metadata
      arm64: dts: qcom: sc7280: Add a carveout for modem metadata

Siddharth Manthan (1):
      arm64: dts: qcom: Add device tree for Samsung Galaxy Tab A 8.0 (2015)

Sireesh Kodali (1):
      arm64: dts: qcom: msm8953: Add device tree for Motorola G5 Plus

Souradeep Chowdhury (4):
      arm64: dts: qcom: sm8150: Add Data Capture and Compare(DCC) support node
      arm64: dts: qcom: sc7280: Add Data Capture and Compare(DCC) support node
      arm64: dts: qcom: sc7180: Add Data Capture and Compare(DCC) support node
      arm64: dts: qcom: sdm845: Add Data Capture and Compare(DCC) support node

Srinivas Kandagatla (3):
      arm64: dts: qcom: sc8280xp: add gpr node
      arm64: dts: qcom: sc8280xp: add SoundWire and LPASS
      arm64: dts: qcom: sc8280xp-x13s: Add soundcard support

Srinivasa Rao Mandadapu (1):
      arm64: dts: qcom: sc7180: Set performance state for audio

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: Fix firmware paths

Stephan Gerhold (2):
      arm64: dts: qcom: msm8916: Enable blsp_dma by default
      arm64: dts: qcom: msm8916: Add DMA for all I2C controllers

Vinod Koul (5):
      arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
      arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
      arm64: dts: qcom: sm8450: add spmi node
      arm64: dts: qcom: sm8450-qrd: add pmic files
      arm64: dts: qcom: sm8450-hdk: add pmic files

Youghandhar Chintala (1):
      arm64: dts: qcom: sc7280: Add wifi alias for SC7280-idp

Yunlong Jia (1):
      arm64: dts: qcom: sc7180: set ath10k output power calibration string

 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  105 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   55 +
 .../bindings/interconnect/qcom,sm8550-rpmh.yaml    |  139 +
 arch/arm64/boot/dts/qcom/Makefile                  |   15 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |    4 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  548 ++-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   66 +-
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |  299 ++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |    2 +-
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    6 +-
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |  296 ++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts |  113 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |   75 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |  262 ++
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |  196 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dts   |   19 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  115 +-
 .../boot/dts/qcom/msm8953-motorola-potter.dts      |  305 ++
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  325 ++
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dts   |  329 ++
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts |  325 ++
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  361 ++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   92 +-
 arch/arm64/boot/dts/qcom/msm8956.dtsi              |    4 +
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |  153 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |    7 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |   52 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    1 -
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |   38 +-
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   65 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |   21 +-
 .../boot/dts/qcom/msm8998-oneplus-cheeseburger.dts |    4 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi      |    6 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino-maple.dts |    4 +-
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   27 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   48 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    8 +
 arch/arm64/boot/dts/qcom/pm8005.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pm8010.dtsi               |   84 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   59 +
 arch/arm64/boot/dts/qcom/pm8550b.dtsi              |   59 +
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi             |   59 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |  194 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   55 +
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi          |    2 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pmr735d.dtsi              |  104 +
 arch/arm64/boot/dts/qcom/pms405.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  224 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    2 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  330 +-
 .../dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi}  |   33 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  185 +-
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   30 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   18 +
 .../boot/dts/qcom/sc7180-trogdor-lte-sku.dtsi      |    5 +-
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi     |   20 +
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |   23 +
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |   20 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   50 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  339 +-
 .../dts/qcom/sc7280-herobrine-audio-rt5682.dtsi    |   19 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |   30 +-
 .../boot/dts/qcom/sc7280-herobrine-nvme-sku.dtsi   |   14 +
 .../dts/qcom/sc7280-herobrine-zombie-nvme-lte.dts  |   17 +
 .../boot/dts/qcom/sc7280-herobrine-zombie-nvme.dts |   17 +
 .../boot/dts/qcom/sc7280-herobrine-zombie.dtsi     |   12 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    4 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    7 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi         |    5 -
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  104 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  246 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  554 ++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 2745 +++++++++--
 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts   |  252 ++
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |    5 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   15 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   35 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   15 +
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts |  291 ++
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   19 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |    1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   14 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  403 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |  130 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   77 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   80 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  111 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  169 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   80 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   34 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   37 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 1381 +++---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   67 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |  126 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  995 +++-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |  289 ++
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  214 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  643 ++-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |   18 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  231 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   18 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   49 +
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |   19 +
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |   86 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  426 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   44 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  192 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |  412 ++
 .../dts/qcom/sm8350-microsoft-surface-duo2.dts     |    4 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    4 +-
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts  |   23 +
 .../dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts  |   87 +
 .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  110 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  616 ++-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  181 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    7 +
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts  |   61 +
 .../dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts  |   38 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  188 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  480 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |  568 +++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 4755 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/sm8550.c                 | 2318 ++++++++++
 drivers/interconnect/qcom/sm8550.h                 |  178 +
 include/dt-bindings/clock/qcom,sm8550-dispcc.h     |  101 +
 include/dt-bindings/clock/qcom,sm8550-tcsr.h       |   18 +
 .../dt-bindings/interconnect/qcom,sm8550-rpmh.h    |  189 +
 include/dt-bindings/power/qcom-rpmpd.h             |    1 +
 147 files changed, 23398 insertions(+), 3754 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8550-rpmh.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi
 rename arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} (69%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-nvme-sku.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550.dtsi
 create mode 100644 drivers/interconnect/qcom/sm8550.c
 create mode 100644 drivers/interconnect/qcom/sm8550.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8550-rpmh.h
